# Package zip

Package zip provides support for reading and writing ZIP archives. 

See: [https://www.pkware.com/appnote](https://www.pkware.com/appnote) 

This package does not support disk spanning. 

A note about ZIP64: 

To be backwards compatible the FileHeader has both 32 and 64 bit Size fields. The 64 bit fields will always contain the correct value and for normal archives both fields will be the same. For files requiring the ZIP64 format the 32 bit fields will be 0xffffffff and the 64 bit fields must be used instead. 

## Index

* [Constants](#const)
    * [const Deflate](#Deflate)
    * [const Store](#Store)
    * [const creatorFAT](#creatorFAT)
    * [const creatorMacOSX](#creatorMacOSX)
    * [const creatorNTFS](#creatorNTFS)
    * [const creatorUnix](#creatorUnix)
    * [const creatorVFAT](#creatorVFAT)
    * [const dataDescriptor64Len](#dataDescriptor64Len)
    * [const dataDescriptorLen](#dataDescriptorLen)
    * [const dataDescriptorSignature](#dataDescriptorSignature)
    * [const directory64EndLen](#directory64EndLen)
    * [const directory64EndSignature](#directory64EndSignature)
    * [const directory64LocLen](#directory64LocLen)
    * [const directory64LocSignature](#directory64LocSignature)
    * [const directoryEndLen](#directoryEndLen)
    * [const directoryEndSignature](#directoryEndSignature)
    * [const directoryHeaderLen](#directoryHeaderLen)
    * [const directoryHeaderSignature](#directoryHeaderSignature)
    * [const extTimeExtraID](#extTimeExtraID)
    * [const fileHeaderLen](#fileHeaderLen)
    * [const fileHeaderSignature](#fileHeaderSignature)
    * [const infoZipUnixExtraID](#infoZipUnixExtraID)
    * [const msdosDir](#msdosDir)
    * [const msdosReadOnly](#msdosReadOnly)
    * [const ntfsExtraID](#ntfsExtraID)
    * [const s_IFBLK](#s_IFBLK)
    * [const s_IFCHR](#s_IFCHR)
    * [const s_IFDIR](#s_IFDIR)
    * [const s_IFIFO](#s_IFIFO)
    * [const s_IFLNK](#s_IFLNK)
    * [const s_IFMT](#s_IFMT)
    * [const s_IFREG](#s_IFREG)
    * [const s_IFSOCK](#s_IFSOCK)
    * [const s_ISGID](#s_ISGID)
    * [const s_ISUID](#s_ISUID)
    * [const s_ISVTX](#s_ISVTX)
    * [const uint16max](#uint16max)
    * [const uint32max](#uint32max)
    * [const unixExtraID](#unixExtraID)
    * [const zip64ExtraID](#zip64ExtraID)
    * [const zipVersion20](#zipVersion20)
    * [const zipVersion45](#zipVersion45)
* [Variables](#var)
    * [var ErrAlgorithm](#ErrAlgorithm)
    * [var ErrChecksum](#ErrChecksum)
    * [var ErrFormat](#ErrFormat)
    * [var compressors](#compressors)
    * [var decompressors](#decompressors)
    * [var dotFile](#dotFile)
    * [var errDiscardedBytes](#errDiscardedBytes)
    * [var errLongExtra](#errLongExtra)
    * [var errLongName](#errLongName)
    * [var flateReaderPool](#flateReaderPool)
    * [var flateWriterPool](#flateWriterPool)
    * [var tests](#tests)
    * [var writeTests](#writeTests)
* [Types](#type)
    * [type Compressor func(w io.Writer) (io.WriteCloser, error)](#Compressor)
        * [func compressor(method uint16) Compressor](#compressor)
    * [type Decompressor func(r io.Reader) io.ReadCloser](#Decompressor)
        * [func decompressor(method uint16) Decompressor](#decompressor)
    * [type File struct](#File)
        * [func (f *File) DataOffset() (offset int64, err error)](#File.DataOffset)
        * [func (f *File) Open() (io.ReadCloser, error)](#File.Open)
        * [func (f *File) OpenRaw() (io.Reader, error)](#File.OpenRaw)
        * [func (f *File) findBodyOffset() (int64, error)](#File.findBodyOffset)
        * [func (f *File) readDataDescriptor()](#File.readDataDescriptor)
    * [type FileHeader struct](#FileHeader)
        * [func FileInfoHeader(fi fs.FileInfo) (*FileHeader, error)](#FileInfoHeader)
        * [func (h *FileHeader) FileInfo() fs.FileInfo](#FileHeader.FileInfo)
        * [func (h *FileHeader) ModTime() time.Time](#FileHeader.ModTime)
        * [func (h *FileHeader) Mode() (mode fs.FileMode)](#FileHeader.Mode)
        * [func (h *FileHeader) SetModTime(t time.Time)](#FileHeader.SetModTime)
        * [func (h *FileHeader) SetMode(mode fs.FileMode)](#FileHeader.SetMode)
        * [func (f *FileHeader) hasDataDescriptor() bool](#FileHeader.hasDataDescriptor)
        * [func (h *FileHeader) isZip64() bool](#FileHeader.isZip64)
    * [type ReadCloser struct](#ReadCloser)
        * [func OpenReader(name string) (*ReadCloser, error)](#OpenReader)
        * [func (rc *ReadCloser) Close() error](#ReadCloser.Close)
    * [type Reader struct](#Reader)
        * [func NewReader(r io.ReaderAt, size int64) (*Reader, error)](#NewReader)
        * [func (r *Reader) Open(name string) (fs.File, error)](#Reader.Open)
        * [func (z *Reader) RegisterDecompressor(method uint16, dcomp Decompressor)](#Reader.RegisterDecompressor)
        * [func (z *Reader) decompressor(method uint16) Decompressor](#Reader.decompressor)
        * [func (z *Reader) init(r io.ReaderAt, size int64) error](#Reader.init.reader.go)
        * [func (r *Reader) initFileList()](#Reader.initFileList)
        * [func (r *Reader) openLookup(name string) *fileListEntry](#Reader.openLookup)
        * [func (r *Reader) openReadDir(dir string) []fileListEntry](#Reader.openReadDir)
    * [type WriteTest struct](#WriteTest)
    * [type Writer struct](#Writer)
        * [func NewWriter(w io.Writer) *Writer](#NewWriter)
        * [func (w *Writer) Close() error](#Writer.Close)
        * [func (w *Writer) Copy(f *File) error](#Writer.Copy)
        * [func (w *Writer) Create(name string) (io.Writer, error)](#Writer.Create)
        * [func (w *Writer) CreateHeader(fh *FileHeader) (io.Writer, error)](#Writer.CreateHeader)
        * [func (w *Writer) CreateRaw(fh *FileHeader) (io.Writer, error)](#Writer.CreateRaw)
        * [func (w *Writer) Flush() error](#Writer.Flush)
        * [func (w *Writer) RegisterCompressor(method uint16, comp Compressor)](#Writer.RegisterCompressor)
        * [func (w *Writer) SetComment(comment string) error](#Writer.SetComment)
        * [func (w *Writer) SetOffset(n int64)](#Writer.SetOffset)
        * [func (w *Writer) compressor(method uint16) Compressor](#Writer.compressor)
        * [func (w *Writer) prepare(fh *FileHeader) error](#Writer.prepare)
    * [type ZipTest struct](#ZipTest)
    * [type ZipTestFile struct](#ZipTestFile)
    * [type checksumReader struct](#checksumReader)
        * [func (r *checksumReader) Close() error](#checksumReader.Close)
        * [func (r *checksumReader) Read(b []byte) (n int, err error)](#checksumReader.Read)
        * [func (r *checksumReader) Stat() (fs.FileInfo, error)](#checksumReader.Stat)
    * [type countWriter struct](#countWriter)
        * [func (w *countWriter) Write(p []byte) (int, error)](#countWriter.Write)
    * [type dataDescriptor struct](#dataDescriptor)
        * [func readDataDescriptor(r io.Reader, zip64 bool) (*dataDescriptor, error)](#readDataDescriptor)
    * [type dirWriter struct{}](#dirWriter)
        * [func (dirWriter) Write(b []byte) (int, error)](#dirWriter.Write)
    * [type directoryEnd struct](#directoryEnd)
        * [func readDirectoryEnd(r io.ReaderAt, size int64) (dir *directoryEnd, err error)](#readDirectoryEnd)
    * [type fakeHash32 struct](#fakeHash32)
        * [func (fakeHash32) Sum32() uint32](#fakeHash32.Sum32)
        * [func (fakeHash32) Write(p []byte) (int, error)](#fakeHash32.Write)
    * [type fileInfoDirEntry interface](#fileInfoDirEntry)
    * [type fileListEntry struct](#fileListEntry)
        * [func (f *fileListEntry) Info() (fs.FileInfo, error)](#fileListEntry.Info)
        * [func (f *fileListEntry) IsDir() bool](#fileListEntry.IsDir)
        * [func (f *fileListEntry) ModTime() time.Time](#fileListEntry.ModTime)
        * [func (f *fileListEntry) Mode() fs.FileMode](#fileListEntry.Mode)
        * [func (f *fileListEntry) Name() string](#fileListEntry.Name)
        * [func (f *fileListEntry) Size() int64](#fileListEntry.Size)
        * [func (f *fileListEntry) Sys() interface{}](#fileListEntry.Sys)
        * [func (f *fileListEntry) Type() fs.FileMode](#fileListEntry.Type)
        * [func (e *fileListEntry) stat() fileInfoDirEntry](#fileListEntry.stat)
    * [type fileWriter struct](#fileWriter)
        * [func (w *fileWriter) Write(p []byte) (int, error)](#fileWriter.Write)
        * [func (w *fileWriter) close() error](#fileWriter.close)
        * [func (w *fileWriter) writeDataDescriptor() error](#fileWriter.writeDataDescriptor)
    * [type header struct](#header)
    * [type headerFileInfo struct](#headerFileInfo)
        * [func (fi headerFileInfo) Info() (fs.FileInfo, error)](#headerFileInfo.Info)
        * [func (fi headerFileInfo) IsDir() bool](#headerFileInfo.IsDir)
        * [func (fi headerFileInfo) ModTime() time.Time](#headerFileInfo.ModTime)
        * [func (fi headerFileInfo) Mode() fs.FileMode](#headerFileInfo.Mode)
        * [func (fi headerFileInfo) Name() string](#headerFileInfo.Name)
        * [func (fi headerFileInfo) Size() int64](#headerFileInfo.Size)
        * [func (fi headerFileInfo) Sys() interface{}](#headerFileInfo.Sys)
        * [func (fi headerFileInfo) Type() fs.FileMode](#headerFileInfo.Type)
    * [type nopCloser struct](#nopCloser)
        * [func (w nopCloser) Close() error](#nopCloser.Close)
    * [type openDir struct](#openDir)
        * [func (d *openDir) Close() error](#openDir.Close)
        * [func (d *openDir) Read([]byte) (int, error)](#openDir.Read)
        * [func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)](#openDir.ReadDir)
        * [func (d *openDir) Stat() (fs.FileInfo, error)](#openDir.Stat)
    * [type pooledFlateReader struct](#pooledFlateReader)
        * [func (r *pooledFlateReader) Close() error](#pooledFlateReader.Close)
        * [func (r *pooledFlateReader) Read(p []byte) (n int, err error)](#pooledFlateReader.Read)
    * [type pooledFlateWriter struct](#pooledFlateWriter)
        * [func (w *pooledFlateWriter) Close() error](#pooledFlateWriter.Close)
        * [func (w *pooledFlateWriter) Write(p []byte) (n int, err error)](#pooledFlateWriter.Write)
    * [type readBuf []byte](#readBuf)
        * [func (b *readBuf) sub(n int) readBuf](#readBuf.sub)
        * [func (b *readBuf) uint16() uint16](#readBuf.uint16)
        * [func (b *readBuf) uint32() uint32](#readBuf.uint32)
        * [func (b *readBuf) uint64() uint64](#readBuf.uint64)
        * [func (b *readBuf) uint8() uint8](#readBuf.uint8)
    * [type repeatedByte struct](#repeatedByte)
    * [type rleBuffer struct](#rleBuffer)
        * [func testZip64(t testing.TB, size int64) *rleBuffer](#testZip64)
        * [func (r *rleBuffer) ReadAt(p []byte, off int64) (n int, err error)](#rleBuffer.ReadAt)
        * [func (r *rleBuffer) Size() int64](#rleBuffer.Size)
        * [func (r *rleBuffer) Write(p []byte) (n int, err error)](#rleBuffer.Write)
    * [type sizedReaderAt interface](#sizedReaderAt)
    * [type suffixSaver struct](#suffixSaver)
        * [func (ss *suffixSaver) ReadAt(p []byte, off int64) (n int, err error)](#suffixSaver.ReadAt)
        * [func (ss *suffixSaver) Size() int64](#suffixSaver.Size)
        * [func (ss *suffixSaver) Suffix() []byte](#suffixSaver.Suffix)
        * [func (ss *suffixSaver) Write(p []byte) (n int, err error)](#suffixSaver.Write)
    * [type writeBuf []byte](#writeBuf)
        * [func (b *writeBuf) uint16(v uint16)](#writeBuf.uint16)
        * [func (b *writeBuf) uint32(v uint32)](#writeBuf.uint32)
        * [func (b *writeBuf) uint64(v uint64)](#writeBuf.uint64)
        * [func (b *writeBuf) uint8(v uint8)](#writeBuf.uint8)
    * [type zeros struct{}](#zeros)
        * [func (zeros) Read(p []byte) (int, error)](#zeros.Read)
* [Functions](#func)
    * [func BenchmarkCompressedZipGarbage(b *testing.B)](#BenchmarkCompressedZipGarbage)
    * [func BenchmarkZip64Test(b *testing.B)](#BenchmarkZip64Test)
    * [func BenchmarkZip64TestSizes(b *testing.B)](#BenchmarkZip64TestSizes)
    * [func RegisterCompressor(method uint16, comp Compressor)](#RegisterCompressor)
    * [func RegisterDecompressor(method uint16, dcomp Decompressor)](#RegisterDecompressor)
    * [func TestCVE202127919(t *testing.T)](#TestCVE202127919)
    * [func TestCVE202133196(t *testing.T)](#TestCVE202133196)
    * [func TestFS(t *testing.T)](#TestFS)
    * [func TestFSModTime(t *testing.T)](#TestFSModTime)
    * [func TestFileHeaderRoundTrip(t *testing.T)](#TestFileHeaderRoundTrip)
    * [func TestFileHeaderRoundTrip64(t *testing.T)](#TestFileHeaderRoundTrip64)
    * [func TestFileHeaderRoundTripModified(t *testing.T)](#TestFileHeaderRoundTripModified)
    * [func TestFileHeaderRoundTripWithoutModified(t *testing.T)](#TestFileHeaderRoundTripWithoutModified)
    * [func TestHeaderIgnoredSize(t *testing.T)](#TestHeaderIgnoredSize)
    * [func TestHeaderInvalidTagAndSize(t *testing.T)](#TestHeaderInvalidTagAndSize)
    * [func TestHeaderTooLongErr(t *testing.T)](#TestHeaderTooLongErr)
    * [func TestHeaderTooShort(t *testing.T)](#TestHeaderTooShort)
    * [func TestInvalidFiles(t *testing.T)](#TestInvalidFiles)
    * [func TestIssue10956(t *testing.T)](#TestIssue10956)
    * [func TestIssue10957(t *testing.T)](#TestIssue10957)
    * [func TestIssue11146(t *testing.T)](#TestIssue11146)
    * [func TestIssue12449(t *testing.T)](#TestIssue12449)
    * [func TestIssue8186(t *testing.T)](#TestIssue8186)
    * [func TestModTime(t *testing.T)](#TestModTime)
    * [func TestOver65kFiles(t *testing.T)](#TestOver65kFiles)
    * [func TestRLEBuffer(t *testing.T)](#TestRLEBuffer)
    * [func TestReadDataDescriptor(t *testing.T)](#TestReadDataDescriptor)
    * [func TestReader(t *testing.T)](#TestReader)
    * [func TestSuffixSaver(t *testing.T)](#TestSuffixSaver)
    * [func TestWriter(t *testing.T)](#TestWriter)
    * [func TestWriterComment(t *testing.T)](#TestWriterComment)
    * [func TestWriterCopy(t *testing.T)](#TestWriterCopy)
    * [func TestWriterCreateRaw(t *testing.T)](#TestWriterCreateRaw)
    * [func TestWriterDir(t *testing.T)](#TestWriterDir)
    * [func TestWriterDirAttributes(t *testing.T)](#TestWriterDirAttributes)
    * [func TestWriterFlush(t *testing.T)](#TestWriterFlush)
    * [func TestWriterOffset(t *testing.T)](#TestWriterOffset)
    * [func TestWriterTime(t *testing.T)](#TestWriterTime)
    * [func TestWriterUTF8(t *testing.T)](#TestWriterUTF8)
    * [func TestZeroLengthHeader(t *testing.T)](#TestZeroLengthHeader)
    * [func TestZip64(t *testing.T)](#TestZip64)
    * [func TestZip64DirectoryOffset(t *testing.T)](#TestZip64DirectoryOffset)
    * [func TestZip64EdgeCase(t *testing.T)](#TestZip64EdgeCase)
    * [func TestZip64LargeDirectory(t *testing.T)](#TestZip64LargeDirectory)
    * [func TestZip64ManyRecords(t *testing.T)](#TestZip64ManyRecords)
    * [func biggestZipBytes() []byte](#biggestZipBytes)
    * [func detectUTF8(s string) (valid, require bool)](#detectUTF8)
    * [func equalTimeAndZone(t1, t2 time.Time) bool](#equalTimeAndZone)
    * [func fileEntryLess(x, y string) bool](#fileEntryLess)
    * [func fileModeToUnixMode(mode fs.FileMode) uint32](#fileModeToUnixMode)
    * [func findDirectory64End(r io.ReaderAt, directoryEndOffset int64) (int64, error)](#findDirectory64End)
    * [func findSignatureInBlock(b []byte) int](#findSignatureInBlock)
    * [func generatesZip64(t *testing.T, f func(w *Writer)) bool](#generatesZip64)
    * [func init()](#init.register.go)
    * [func memset(a []byte, b byte)](#memset)
    * [func messWith(fileName string, corrupter func(b []byte)) (r io.ReaderAt, size int64)](#messWith)
    * [func min(x, y int64) int64](#min)
    * [func min64(x, y uint64) uint64](#min64)
    * [func msDosTimeToTime(dosDate, dosTime uint16) time.Time](#msDosTimeToTime)
    * [func msdosModeToFileMode(m uint32) (mode fs.FileMode)](#msdosModeToFileMode)
    * [func newFlateReader(r io.Reader) io.ReadCloser](#newFlateReader)
    * [func newFlateWriter(w io.Writer) io.WriteCloser](#newFlateWriter)
    * [func rZipBytes() []byte](#rZipBytes)
    * [func readDirectory64End(r io.ReaderAt, offset int64, d *directoryEnd) (err error)](#readDirectory64End)
    * [func readDirectoryHeader(f *File, r io.Reader) error](#readDirectoryHeader)
    * [func readTestFile(t *testing.T, zt ZipTest, ft ZipTestFile, f *File, raw []byte)](#readTestFile)
    * [func readTestZip(t *testing.T, zt ZipTest)](#readTestZip)
    * [func returnBigZipBytes() (r io.ReaderAt, size int64)](#returnBigZipBytes)
    * [func returnCorruptCRC32Zip() (r io.ReaderAt, size int64)](#returnCorruptCRC32Zip)
    * [func returnCorruptNotStreamedZip() (r io.ReaderAt, size int64)](#returnCorruptNotStreamedZip)
    * [func returnRecursiveZip() (r io.ReaderAt, size int64)](#returnRecursiveZip)
    * [func split(name string) (dir, elem string, isDir bool)](#split)
    * [func suffixIsZip64(t *testing.T, zip sizedReaderAt) bool](#suffixIsZip64)
    * [func testCreate(t *testing.T, w *Writer, wt *WriteTest)](#testCreate)
    * [func testFileMode(t *testing.T, f *File, want fs.FileMode)](#testFileMode)
    * [func testHeaderRoundTrip(fh *FileHeader, wantUncompressedSize uint32, wantUncompressedSize64 uint64, t *testing.T)](#testHeaderRoundTrip)
    * [func testReadFile(t *testing.T, f *File, wt *WriteTest)](#testReadFile)
    * [func testValidHeader(h *FileHeader, t *testing.T)](#testValidHeader)
    * [func testZip64DirectoryRecordLength(buf *rleBuffer, t *testing.T)](#testZip64DirectoryRecordLength)
    * [func timeToMsDosTime(t time.Time) (fDate uint16, fTime uint16)](#timeToMsDosTime)
    * [func timeZone(offset time.Duration) *time.Location](#timeZone)
    * [func toValidName(name string) string](#toValidName)
    * [func unixModeToFileMode(m uint32) fs.FileMode](#unixModeToFileMode)
    * [func writeHeader(w io.Writer, h *header) error](#writeHeader)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="Deflate" href="#Deflate">const Deflate</a>

```
searchKey: zip.Deflate
tags: [constant number]
```

```Go
const Deflate uint16 = 8 // DEFLATE compressed

```

Compression methods. 

### <a id="Store" href="#Store">const Store</a>

```
searchKey: zip.Store
tags: [constant number]
```

```Go
const Store uint16 = 0 // no compression

```

Compression methods. 

### <a id="creatorFAT" href="#creatorFAT">const creatorFAT</a>

```
searchKey: zip.creatorFAT
tags: [constant number private]
```

```Go
const creatorFAT = 0
```

Constants for the first byte in CreatorVersion. 

### <a id="creatorMacOSX" href="#creatorMacOSX">const creatorMacOSX</a>

```
searchKey: zip.creatorMacOSX
tags: [constant number private]
```

```Go
const creatorMacOSX = 19
```

### <a id="creatorNTFS" href="#creatorNTFS">const creatorNTFS</a>

```
searchKey: zip.creatorNTFS
tags: [constant number private]
```

```Go
const creatorNTFS = 11
```

### <a id="creatorUnix" href="#creatorUnix">const creatorUnix</a>

```
searchKey: zip.creatorUnix
tags: [constant number private]
```

```Go
const creatorUnix = 3
```

### <a id="creatorVFAT" href="#creatorVFAT">const creatorVFAT</a>

```
searchKey: zip.creatorVFAT
tags: [constant number private]
```

```Go
const creatorVFAT = 14
```

### <a id="dataDescriptor64Len" href="#dataDescriptor64Len">const dataDescriptor64Len</a>

```
searchKey: zip.dataDescriptor64Len
tags: [constant number private]
```

```Go
const dataDescriptor64Len = 24 // two uint32: signature, crc32 | two uint64: compressed size, size

```

### <a id="dataDescriptorLen" href="#dataDescriptorLen">const dataDescriptorLen</a>

```
searchKey: zip.dataDescriptorLen
tags: [constant number private]
```

```Go
const dataDescriptorLen = 16 // four uint32: descriptor signature, crc32, compressed size, size

```

### <a id="dataDescriptorSignature" href="#dataDescriptorSignature">const dataDescriptorSignature</a>

```
searchKey: zip.dataDescriptorSignature
tags: [constant number private]
```

```Go
const dataDescriptorSignature = 0x08074b50 // de-facto standard; required by OS X Finder

```

### <a id="directory64EndLen" href="#directory64EndLen">const directory64EndLen</a>

```
searchKey: zip.directory64EndLen
tags: [constant number private]
```

```Go
const directory64EndLen = 56 // + extra

```

### <a id="directory64EndSignature" href="#directory64EndSignature">const directory64EndSignature</a>

```
searchKey: zip.directory64EndSignature
tags: [constant number private]
```

```Go
const directory64EndSignature = 0x06064b50
```

### <a id="directory64LocLen" href="#directory64LocLen">const directory64LocLen</a>

```
searchKey: zip.directory64LocLen
tags: [constant number private]
```

```Go
const directory64LocLen = 20 //

```

### <a id="directory64LocSignature" href="#directory64LocSignature">const directory64LocSignature</a>

```
searchKey: zip.directory64LocSignature
tags: [constant number private]
```

```Go
const directory64LocSignature = 0x07064b50
```

### <a id="directoryEndLen" href="#directoryEndLen">const directoryEndLen</a>

```
searchKey: zip.directoryEndLen
tags: [constant number private]
```

```Go
const directoryEndLen = 22 // + comment

```

### <a id="directoryEndSignature" href="#directoryEndSignature">const directoryEndSignature</a>

```
searchKey: zip.directoryEndSignature
tags: [constant number private]
```

```Go
const directoryEndSignature = 0x06054b50
```

### <a id="directoryHeaderLen" href="#directoryHeaderLen">const directoryHeaderLen</a>

```
searchKey: zip.directoryHeaderLen
tags: [constant number private]
```

```Go
const directoryHeaderLen = 46 // + filename + extra + comment

```

### <a id="directoryHeaderSignature" href="#directoryHeaderSignature">const directoryHeaderSignature</a>

```
searchKey: zip.directoryHeaderSignature
tags: [constant number private]
```

```Go
const directoryHeaderSignature = 0x02014b50
```

### <a id="extTimeExtraID" href="#extTimeExtraID">const extTimeExtraID</a>

```
searchKey: zip.extTimeExtraID
tags: [constant number private]
```

```Go
const extTimeExtraID = 0x5455 // Extended timestamp

```

### <a id="fileHeaderLen" href="#fileHeaderLen">const fileHeaderLen</a>

```
searchKey: zip.fileHeaderLen
tags: [constant number private]
```

```Go
const fileHeaderLen = 30 // + filename + extra

```

### <a id="fileHeaderSignature" href="#fileHeaderSignature">const fileHeaderSignature</a>

```
searchKey: zip.fileHeaderSignature
tags: [constant number private]
```

```Go
const fileHeaderSignature = 0x04034b50
```

### <a id="infoZipUnixExtraID" href="#infoZipUnixExtraID">const infoZipUnixExtraID</a>

```
searchKey: zip.infoZipUnixExtraID
tags: [constant number private]
```

```Go
const infoZipUnixExtraID = 0x5855 // Info-ZIP Unix extension

```

### <a id="msdosDir" href="#msdosDir">const msdosDir</a>

```
searchKey: zip.msdosDir
tags: [constant number private]
```

```Go
const msdosDir = 0x10
```

### <a id="msdosReadOnly" href="#msdosReadOnly">const msdosReadOnly</a>

```
searchKey: zip.msdosReadOnly
tags: [constant number private]
```

```Go
const msdosReadOnly = 0x01
```

### <a id="ntfsExtraID" href="#ntfsExtraID">const ntfsExtraID</a>

```
searchKey: zip.ntfsExtraID
tags: [constant number private]
```

```Go
const ntfsExtraID = 0x000a // NTFS

```

### <a id="s_IFBLK" href="#s_IFBLK">const s_IFBLK</a>

```
searchKey: zip.s_IFBLK
tags: [constant number private]
```

```Go
const s_IFBLK = 0x6000
```

### <a id="s_IFCHR" href="#s_IFCHR">const s_IFCHR</a>

```
searchKey: zip.s_IFCHR
tags: [constant number private]
```

```Go
const s_IFCHR = 0x2000
```

### <a id="s_IFDIR" href="#s_IFDIR">const s_IFDIR</a>

```
searchKey: zip.s_IFDIR
tags: [constant number private]
```

```Go
const s_IFDIR = 0x4000
```

### <a id="s_IFIFO" href="#s_IFIFO">const s_IFIFO</a>

```
searchKey: zip.s_IFIFO
tags: [constant number private]
```

```Go
const s_IFIFO = 0x1000
```

### <a id="s_IFLNK" href="#s_IFLNK">const s_IFLNK</a>

```
searchKey: zip.s_IFLNK
tags: [constant number private]
```

```Go
const s_IFLNK = 0xa000
```

### <a id="s_IFMT" href="#s_IFMT">const s_IFMT</a>

```
searchKey: zip.s_IFMT
tags: [constant number private]
```

```Go
const s_IFMT = 0xf000
```

Unix constants. The specification doesn't mention them, but these seem to be the values agreed on by tools. 

### <a id="s_IFREG" href="#s_IFREG">const s_IFREG</a>

```
searchKey: zip.s_IFREG
tags: [constant number private]
```

```Go
const s_IFREG = 0x8000
```

### <a id="s_IFSOCK" href="#s_IFSOCK">const s_IFSOCK</a>

```
searchKey: zip.s_IFSOCK
tags: [constant number private]
```

```Go
const s_IFSOCK = 0xc000
```

### <a id="s_ISGID" href="#s_ISGID">const s_ISGID</a>

```
searchKey: zip.s_ISGID
tags: [constant number private]
```

```Go
const s_ISGID = 0x400
```

### <a id="s_ISUID" href="#s_ISUID">const s_ISUID</a>

```
searchKey: zip.s_ISUID
tags: [constant number private]
```

```Go
const s_ISUID = 0x800
```

### <a id="s_ISVTX" href="#s_ISVTX">const s_ISVTX</a>

```
searchKey: zip.s_ISVTX
tags: [constant number private]
```

```Go
const s_ISVTX = 0x200
```

### <a id="uint16max" href="#uint16max">const uint16max</a>

```
searchKey: zip.uint16max
tags: [constant number private]
```

```Go
const uint16max = (1 << 16) - 1
```

Limits for non zip64 files. 

### <a id="uint32max" href="#uint32max">const uint32max</a>

```
searchKey: zip.uint32max
tags: [constant number private]
```

```Go
const uint32max = (1 << 32) - 1
```

### <a id="unixExtraID" href="#unixExtraID">const unixExtraID</a>

```
searchKey: zip.unixExtraID
tags: [constant number private]
```

```Go
const unixExtraID = 0x000d // UNIX

```

### <a id="zip64ExtraID" href="#zip64ExtraID">const zip64ExtraID</a>

```
searchKey: zip.zip64ExtraID
tags: [constant number private]
```

```Go
const zip64ExtraID = 0x0001 // Zip64 extended information

```

Extra header IDs. 

IDs 0..31 are reserved for official use by PKWARE. IDs above that range are defined by third-party vendors. Since ZIP lacked high precision timestamps (nor a official specification of the timezone used for the date fields), many competing extra fields have been invented. Pervasive use effectively makes them "official". 

See [http://mdfs.net/Docs/Comp/Archiving/Zip/ExtraField](http://mdfs.net/Docs/Comp/Archiving/Zip/ExtraField) 

### <a id="zipVersion20" href="#zipVersion20">const zipVersion20</a>

```
searchKey: zip.zipVersion20
tags: [constant number private]
```

```Go
const zipVersion20 = 20 // 2.0

```

Version numbers. 

### <a id="zipVersion45" href="#zipVersion45">const zipVersion45</a>

```
searchKey: zip.zipVersion45
tags: [constant number private]
```

```Go
const zipVersion45 = 45 // 4.5 (reads and writes zip64 archives)

```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="ErrAlgorithm" href="#ErrAlgorithm">var ErrAlgorithm</a>

```
searchKey: zip.ErrAlgorithm
tags: [variable interface]
```

```Go
var ErrAlgorithm = errors.New("zip: unsupported compression algorithm")
```

### <a id="ErrChecksum" href="#ErrChecksum">var ErrChecksum</a>

```
searchKey: zip.ErrChecksum
tags: [variable interface]
```

```Go
var ErrChecksum = errors.New("zip: checksum error")
```

### <a id="ErrFormat" href="#ErrFormat">var ErrFormat</a>

```
searchKey: zip.ErrFormat
tags: [variable interface]
```

```Go
var ErrFormat = errors.New("zip: not a valid zip file")
```

### <a id="compressors" href="#compressors">var compressors</a>

```
searchKey: zip.compressors
tags: [variable struct private]
```

```Go
var compressors sync.Map // map[uint16]Compressor

```

### <a id="decompressors" href="#decompressors">var decompressors</a>

```
searchKey: zip.decompressors
tags: [variable struct private]
```

```Go
var decompressors sync.Map // map[uint16]Decompressor

```

### <a id="dotFile" href="#dotFile">var dotFile</a>

```
searchKey: zip.dotFile
tags: [variable struct private]
```

```Go
var dotFile = &fileListEntry{name: "./", isDir: true}
```

### <a id="errDiscardedBytes" href="#errDiscardedBytes">var errDiscardedBytes</a>

```
searchKey: zip.errDiscardedBytes
tags: [variable interface private]
```

```Go
var errDiscardedBytes = errors.New("ReadAt of discarded bytes")
```

### <a id="errLongExtra" href="#errLongExtra">var errLongExtra</a>

```
searchKey: zip.errLongExtra
tags: [variable interface private]
```

```Go
var errLongExtra = errors.New("zip: FileHeader.Extra too long")
```

### <a id="errLongName" href="#errLongName">var errLongName</a>

```
searchKey: zip.errLongName
tags: [variable interface private]
```

```Go
var errLongName = errors.New("zip: FileHeader.Name too long")
```

### <a id="flateReaderPool" href="#flateReaderPool">var flateReaderPool</a>

```
searchKey: zip.flateReaderPool
tags: [variable struct private]
```

```Go
var flateReaderPool sync.Pool
```

### <a id="flateWriterPool" href="#flateWriterPool">var flateWriterPool</a>

```
searchKey: zip.flateWriterPool
tags: [variable struct private]
```

```Go
var flateWriterPool sync.Pool
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: zip.tests
tags: [variable array struct private]
```

```Go
var tests = ...
```

### <a id="writeTests" href="#writeTests">var writeTests</a>

```
searchKey: zip.writeTests
tags: [variable array struct private]
```

```Go
var writeTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Compressor" href="#Compressor">type Compressor func(w io.Writer) (io.WriteCloser, error)</a>

```
searchKey: zip.Compressor
tags: [function]
```

```Go
type Compressor func(w io.Writer) (io.WriteCloser, error)
```

A Compressor returns a new compressing writer, writing to w. The WriteCloser's Close method must be used to flush pending data to w. The Compressor itself must be safe to invoke from multiple goroutines simultaneously, but each returned writer will be used only by one goroutine at a time. 

#### <a id="compressor" href="#compressor">func compressor(method uint16) Compressor</a>

```
searchKey: zip.compressor
tags: [method private]
```

```Go
func compressor(method uint16) Compressor
```

### <a id="Decompressor" href="#Decompressor">type Decompressor func(r io.Reader) io.ReadCloser</a>

```
searchKey: zip.Decompressor
tags: [function]
```

```Go
type Decompressor func(r io.Reader) io.ReadCloser
```

A Decompressor returns a new decompressing reader, reading from r. The ReadCloser's Close method must be used to release associated resources. The Decompressor itself must be safe to invoke from multiple goroutines simultaneously, but each returned reader will be used only by one goroutine at a time. 

#### <a id="decompressor" href="#decompressor">func decompressor(method uint16) Decompressor</a>

```
searchKey: zip.decompressor
tags: [method private]
```

```Go
func decompressor(method uint16) Decompressor
```

### <a id="File" href="#File">type File struct</a>

```
searchKey: zip.File
tags: [struct]
```

```Go
type File struct {
	FileHeader
	zip          *Reader
	zipr         io.ReaderAt
	headerOffset int64
	zip64        bool  // zip64 extended information extra field presence
	descErr      error // error reading the data descriptor during init
}
```

A File is a single file in a ZIP archive. The file information is in the embedded FileHeader. The file content can be accessed by calling Open. 

#### <a id="File.DataOffset" href="#File.DataOffset">func (f *File) DataOffset() (offset int64, err error)</a>

```
searchKey: zip.File.DataOffset
tags: [function]
```

```Go
func (f *File) DataOffset() (offset int64, err error)
```

DataOffset returns the offset of the file's possibly-compressed data, relative to the beginning of the zip file. 

Most callers should instead use Open, which transparently decompresses data and verifies checksums. 

#### <a id="File.Open" href="#File.Open">func (f *File) Open() (io.ReadCloser, error)</a>

```
searchKey: zip.File.Open
tags: [function]
```

```Go
func (f *File) Open() (io.ReadCloser, error)
```

Open returns a ReadCloser that provides access to the File's contents. Multiple files may be read concurrently. 

#### <a id="File.OpenRaw" href="#File.OpenRaw">func (f *File) OpenRaw() (io.Reader, error)</a>

```
searchKey: zip.File.OpenRaw
tags: [function]
```

```Go
func (f *File) OpenRaw() (io.Reader, error)
```

OpenRaw returns a Reader that provides access to the File's contents without decompression. 

#### <a id="File.findBodyOffset" href="#File.findBodyOffset">func (f *File) findBodyOffset() (int64, error)</a>

```
searchKey: zip.File.findBodyOffset
tags: [function private]
```

```Go
func (f *File) findBodyOffset() (int64, error)
```

findBodyOffset does the minimum work to verify the file has a header and returns the file body offset. 

#### <a id="File.readDataDescriptor" href="#File.readDataDescriptor">func (f *File) readDataDescriptor()</a>

```
searchKey: zip.File.readDataDescriptor
tags: [function private]
```

```Go
func (f *File) readDataDescriptor()
```

### <a id="FileHeader" href="#FileHeader">type FileHeader struct</a>

```
searchKey: zip.FileHeader
tags: [struct]
```

```Go
type FileHeader struct {
	// Name is the name of the file.
	//
	// It must be a relative path, not start with a drive letter (such as "C:"),
	// and must use forward slashes instead of back slashes. A trailing slash
	// indicates that this file is a directory and should have no data.
	//
	// When reading zip files, the Name field is populated from
	// the zip file directly and is not validated for correctness.
	// It is the caller's responsibility to sanitize it as
	// appropriate, including canonicalizing slash directions,
	// validating that paths are relative, and preventing path
	// traversal through filenames ("../../../").
	Name string

	// Comment is any arbitrary user-defined string shorter than 64KiB.
	Comment string

	// NonUTF8 indicates that Name and Comment are not encoded in UTF-8.
	//
	// By specification, the only other encoding permitted should be CP-437,
	// but historically many ZIP readers interpret Name and Comment as whatever
	// the system's local character encoding happens to be.
	//
	// This flag should only be set if the user intends to encode a non-portable
	// ZIP file for a specific localized region. Otherwise, the Writer
	// automatically sets the ZIP format's UTF-8 flag for valid UTF-8 strings.
	NonUTF8 bool

	CreatorVersion uint16
	ReaderVersion  uint16
	Flags          uint16

	// Method is the compression method. If zero, Store is used.
	Method uint16

	// Modified is the modified time of the file.
	//
	// When reading, an extended timestamp is preferred over the legacy MS-DOS
	// date field, and the offset between the times is used as the timezone.
	// If only the MS-DOS date is present, the timezone is assumed to be UTC.
	//
	// When writing, an extended timestamp (which is timezone-agnostic) is
	// always emitted. The legacy MS-DOS date field is encoded according to the
	// location of the Modified time.
	Modified     time.Time
	ModifiedTime uint16 // Deprecated: Legacy MS-DOS date; use Modified instead.
	ModifiedDate uint16 // Deprecated: Legacy MS-DOS time; use Modified instead.

	CRC32              uint32
	CompressedSize     uint32 // Deprecated: Use CompressedSize64 instead.
	UncompressedSize   uint32 // Deprecated: Use UncompressedSize64 instead.
	CompressedSize64   uint64
	UncompressedSize64 uint64
	Extra              []byte
	ExternalAttrs      uint32 // Meaning depends on CreatorVersion
}
```

FileHeader describes a file within a zip file. See the zip spec for details. 

#### <a id="FileInfoHeader" href="#FileInfoHeader">func FileInfoHeader(fi fs.FileInfo) (*FileHeader, error)</a>

```
searchKey: zip.FileInfoHeader
tags: [method]
```

```Go
func FileInfoHeader(fi fs.FileInfo) (*FileHeader, error)
```

FileInfoHeader creates a partially-populated FileHeader from an fs.FileInfo. Because fs.FileInfo's Name method returns only the base name of the file it describes, it may be necessary to modify the Name field of the returned header to provide the full path name of the file. If compression is desired, callers should set the FileHeader.Method field; it is unset by default. 

#### <a id="FileHeader.FileInfo" href="#FileHeader.FileInfo">func (h *FileHeader) FileInfo() fs.FileInfo</a>

```
searchKey: zip.FileHeader.FileInfo
tags: [function]
```

```Go
func (h *FileHeader) FileInfo() fs.FileInfo
```

FileInfo returns an fs.FileInfo for the FileHeader. 

#### <a id="FileHeader.ModTime" href="#FileHeader.ModTime">func (h *FileHeader) ModTime() time.Time</a>

```
searchKey: zip.FileHeader.ModTime
tags: [function deprecated]
```

```Go
func (h *FileHeader) ModTime() time.Time
```

ModTime returns the modification time in UTC using the legacy ModifiedDate and ModifiedTime fields. 

Deprecated: Use Modified instead. 

#### <a id="FileHeader.Mode" href="#FileHeader.Mode">func (h *FileHeader) Mode() (mode fs.FileMode)</a>

```
searchKey: zip.FileHeader.Mode
tags: [function]
```

```Go
func (h *FileHeader) Mode() (mode fs.FileMode)
```

Mode returns the permission and mode bits for the FileHeader. 

#### <a id="FileHeader.SetModTime" href="#FileHeader.SetModTime">func (h *FileHeader) SetModTime(t time.Time)</a>

```
searchKey: zip.FileHeader.SetModTime
tags: [method deprecated]
```

```Go
func (h *FileHeader) SetModTime(t time.Time)
```

SetModTime sets the Modified, ModifiedTime, and ModifiedDate fields to the given time in UTC. 

Deprecated: Use Modified instead. 

#### <a id="FileHeader.SetMode" href="#FileHeader.SetMode">func (h *FileHeader) SetMode(mode fs.FileMode)</a>

```
searchKey: zip.FileHeader.SetMode
tags: [method]
```

```Go
func (h *FileHeader) SetMode(mode fs.FileMode)
```

SetMode changes the permission and mode bits for the FileHeader. 

#### <a id="FileHeader.hasDataDescriptor" href="#FileHeader.hasDataDescriptor">func (f *FileHeader) hasDataDescriptor() bool</a>

```
searchKey: zip.FileHeader.hasDataDescriptor
tags: [function private]
```

```Go
func (f *FileHeader) hasDataDescriptor() bool
```

#### <a id="FileHeader.isZip64" href="#FileHeader.isZip64">func (h *FileHeader) isZip64() bool</a>

```
searchKey: zip.FileHeader.isZip64
tags: [function private]
```

```Go
func (h *FileHeader) isZip64() bool
```

isZip64 reports whether the file size exceeds the 32 bit limit 

### <a id="ReadCloser" href="#ReadCloser">type ReadCloser struct</a>

```
searchKey: zip.ReadCloser
tags: [struct]
```

```Go
type ReadCloser struct {
	f *os.File
	Reader
}
```

A ReadCloser is a Reader that must be closed when no longer needed. 

#### <a id="OpenReader" href="#OpenReader">func OpenReader(name string) (*ReadCloser, error)</a>

```
searchKey: zip.OpenReader
tags: [method]
```

```Go
func OpenReader(name string) (*ReadCloser, error)
```

OpenReader will open the Zip file specified by name and return a ReadCloser. 

#### <a id="ReadCloser.Close" href="#ReadCloser.Close">func (rc *ReadCloser) Close() error</a>

```
searchKey: zip.ReadCloser.Close
tags: [function]
```

```Go
func (rc *ReadCloser) Close() error
```

Close closes the Zip file, rendering it unusable for I/O. 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: zip.Reader
tags: [struct]
```

```Go
type Reader struct {
	r             io.ReaderAt
	File          []*File
	Comment       string
	decompressors map[uint16]Decompressor

	// fileList is a list of files sorted by ename,
	// for use by the Open method.
	fileListOnce sync.Once
	fileList     []fileListEntry
}
```

A Reader serves content from a ZIP archive. 

#### <a id="NewReader" href="#NewReader">func NewReader(r io.ReaderAt, size int64) (*Reader, error)</a>

```
searchKey: zip.NewReader
tags: [method]
```

```Go
func NewReader(r io.ReaderAt, size int64) (*Reader, error)
```

NewReader returns a new Reader reading from r, which is assumed to have the given size in bytes. 

#### <a id="Reader.Open" href="#Reader.Open">func (r *Reader) Open(name string) (fs.File, error)</a>

```
searchKey: zip.Reader.Open
tags: [method]
```

```Go
func (r *Reader) Open(name string) (fs.File, error)
```

Open opens the named file in the ZIP archive, using the semantics of fs.FS.Open: paths are always slash separated, with no leading / or ../ elements. 

#### <a id="Reader.RegisterDecompressor" href="#Reader.RegisterDecompressor">func (z *Reader) RegisterDecompressor(method uint16, dcomp Decompressor)</a>

```
searchKey: zip.Reader.RegisterDecompressor
tags: [method]
```

```Go
func (z *Reader) RegisterDecompressor(method uint16, dcomp Decompressor)
```

RegisterDecompressor registers or overrides a custom decompressor for a specific method ID. If a decompressor for a given method is not found, Reader will default to looking up the decompressor at the package level. 

#### <a id="Reader.decompressor" href="#Reader.decompressor">func (z *Reader) decompressor(method uint16) Decompressor</a>

```
searchKey: zip.Reader.decompressor
tags: [method private]
```

```Go
func (z *Reader) decompressor(method uint16) Decompressor
```

#### <a id="Reader.init.reader.go" href="#Reader.init.reader.go">func (z *Reader) init(r io.ReaderAt, size int64) error</a>

```
searchKey: zip.Reader.init
tags: [method private]
```

```Go
func (z *Reader) init(r io.ReaderAt, size int64) error
```

#### <a id="Reader.initFileList" href="#Reader.initFileList">func (r *Reader) initFileList()</a>

```
searchKey: zip.Reader.initFileList
tags: [function private]
```

```Go
func (r *Reader) initFileList()
```

#### <a id="Reader.openLookup" href="#Reader.openLookup">func (r *Reader) openLookup(name string) *fileListEntry</a>

```
searchKey: zip.Reader.openLookup
tags: [method private]
```

```Go
func (r *Reader) openLookup(name string) *fileListEntry
```

#### <a id="Reader.openReadDir" href="#Reader.openReadDir">func (r *Reader) openReadDir(dir string) []fileListEntry</a>

```
searchKey: zip.Reader.openReadDir
tags: [method private]
```

```Go
func (r *Reader) openReadDir(dir string) []fileListEntry
```

### <a id="WriteTest" href="#WriteTest">type WriteTest struct</a>

```
searchKey: zip.WriteTest
tags: [struct private]
```

```Go
type WriteTest struct {
	Name   string
	Data   []byte
	Method uint16
	Mode   fs.FileMode
}
```

### <a id="Writer" href="#Writer">type Writer struct</a>

```
searchKey: zip.Writer
tags: [struct]
```

```Go
type Writer struct {
	cw          *countWriter
	dir         []*header
	last        *fileWriter
	closed      bool
	compressors map[uint16]Compressor
	comment     string

	// testHookCloseSizeOffset if non-nil is called with the size
	// of offset of the central directory at Close.
	testHookCloseSizeOffset func(size, offset uint64)
}
```

Writer implements a zip file writer. 

#### <a id="NewWriter" href="#NewWriter">func NewWriter(w io.Writer) *Writer</a>

```
searchKey: zip.NewWriter
tags: [method]
```

```Go
func NewWriter(w io.Writer) *Writer
```

NewWriter returns a new Writer writing a zip file to w. 

#### <a id="Writer.Close" href="#Writer.Close">func (w *Writer) Close() error</a>

```
searchKey: zip.Writer.Close
tags: [function]
```

```Go
func (w *Writer) Close() error
```

Close finishes writing the zip file by writing the central directory. It does not close the underlying writer. 

#### <a id="Writer.Copy" href="#Writer.Copy">func (w *Writer) Copy(f *File) error</a>

```
searchKey: zip.Writer.Copy
tags: [method]
```

```Go
func (w *Writer) Copy(f *File) error
```

Copy copies the file f (obtained from a Reader) into w. It copies the raw form directly bypassing decompression, compression, and validation. 

#### <a id="Writer.Create" href="#Writer.Create">func (w *Writer) Create(name string) (io.Writer, error)</a>

```
searchKey: zip.Writer.Create
tags: [method]
```

```Go
func (w *Writer) Create(name string) (io.Writer, error)
```

Create adds a file to the zip file using the provided name. It returns a Writer to which the file contents should be written. The file contents will be compressed using the Deflate method. The name must be a relative path: it must not start with a drive letter (e.g. C:) or leading slash, and only forward slashes are allowed. To create a directory instead of a file, add a trailing slash to the name. The file's contents must be written to the io.Writer before the next call to Create, CreateHeader, or Close. 

#### <a id="Writer.CreateHeader" href="#Writer.CreateHeader">func (w *Writer) CreateHeader(fh *FileHeader) (io.Writer, error)</a>

```
searchKey: zip.Writer.CreateHeader
tags: [method]
```

```Go
func (w *Writer) CreateHeader(fh *FileHeader) (io.Writer, error)
```

CreateHeader adds a file to the zip archive using the provided FileHeader for the file metadata. Writer takes ownership of fh and may mutate its fields. The caller must not modify fh after calling CreateHeader. 

This returns a Writer to which the file contents should be written. The file's contents must be written to the io.Writer before the next call to Create, CreateHeader, CreateRaw, or Close. 

#### <a id="Writer.CreateRaw" href="#Writer.CreateRaw">func (w *Writer) CreateRaw(fh *FileHeader) (io.Writer, error)</a>

```
searchKey: zip.Writer.CreateRaw
tags: [method]
```

```Go
func (w *Writer) CreateRaw(fh *FileHeader) (io.Writer, error)
```

CreateRaw adds a file to the zip archive using the provided FileHeader and returns a Writer to which the file contents should be written. The file's contents must be written to the io.Writer before the next call to Create, CreateHeader, CreateRaw, or Close. 

In contrast to CreateHeader, the bytes passed to Writer are not compressed. 

#### <a id="Writer.Flush" href="#Writer.Flush">func (w *Writer) Flush() error</a>

```
searchKey: zip.Writer.Flush
tags: [function]
```

```Go
func (w *Writer) Flush() error
```

Flush flushes any buffered data to the underlying writer. Calling Flush is not normally necessary; calling Close is sufficient. 

#### <a id="Writer.RegisterCompressor" href="#Writer.RegisterCompressor">func (w *Writer) RegisterCompressor(method uint16, comp Compressor)</a>

```
searchKey: zip.Writer.RegisterCompressor
tags: [method]
```

```Go
func (w *Writer) RegisterCompressor(method uint16, comp Compressor)
```

RegisterCompressor registers or overrides a custom compressor for a specific method ID. If a compressor for a given method is not found, Writer will default to looking up the compressor at the package level. 

#### <a id="Writer.SetComment" href="#Writer.SetComment">func (w *Writer) SetComment(comment string) error</a>

```
searchKey: zip.Writer.SetComment
tags: [method]
```

```Go
func (w *Writer) SetComment(comment string) error
```

SetComment sets the end-of-central-directory comment field. It can only be called before Close. 

#### <a id="Writer.SetOffset" href="#Writer.SetOffset">func (w *Writer) SetOffset(n int64)</a>

```
searchKey: zip.Writer.SetOffset
tags: [method]
```

```Go
func (w *Writer) SetOffset(n int64)
```

SetOffset sets the offset of the beginning of the zip data within the underlying writer. It should be used when the zip data is appended to an existing file, such as a binary executable. It must be called before any data is written. 

#### <a id="Writer.compressor" href="#Writer.compressor">func (w *Writer) compressor(method uint16) Compressor</a>

```
searchKey: zip.Writer.compressor
tags: [method private]
```

```Go
func (w *Writer) compressor(method uint16) Compressor
```

#### <a id="Writer.prepare" href="#Writer.prepare">func (w *Writer) prepare(fh *FileHeader) error</a>

```
searchKey: zip.Writer.prepare
tags: [method private]
```

```Go
func (w *Writer) prepare(fh *FileHeader) error
```

prepare performs the bookkeeping operations required at the start of CreateHeader and CreateRaw. 

### <a id="ZipTest" href="#ZipTest">type ZipTest struct</a>

```
searchKey: zip.ZipTest
tags: [struct private]
```

```Go
type ZipTest struct {
	Name     string
	Source   func() (r io.ReaderAt, size int64) // if non-nil, used instead of testdata/<Name> file
	Comment  string
	File     []ZipTestFile
	Obscured bool  // needed for Apple notarization (golang.org/issue/34986)
	Error    error // the error that Opening this file should return
}
```

### <a id="ZipTestFile" href="#ZipTestFile">type ZipTestFile struct</a>

```
searchKey: zip.ZipTestFile
tags: [struct private]
```

```Go
type ZipTestFile struct {
	Name     string
	Mode     fs.FileMode
	NonUTF8  bool
	ModTime  time.Time
	Modified time.Time

	// Information describing expected zip file content.
	// First, reading the entire content should produce the error ContentErr.
	// Second, if ContentErr==nil, the content should match Content.
	// If content is large, an alternative to setting Content is to set File,
	// which names a file in the testdata/ directory containing the
	// uncompressed expected content.
	// If content is very large, an alternative to setting Content or File
	// is to set Size, which will then be checked against the header-reported size
	// but will bypass the decompressing of the actual data.
	// This last option is used for testing very large (multi-GB) compressed files.
	ContentErr error
	Content    []byte
	File       string
	Size       uint64
}
```

### <a id="checksumReader" href="#checksumReader">type checksumReader struct</a>

```
searchKey: zip.checksumReader
tags: [struct private]
```

```Go
type checksumReader struct {
	rc    io.ReadCloser
	hash  hash.Hash32
	nread uint64 // number of bytes read so far
	f     *File
	err   error // sticky error
}
```

#### <a id="checksumReader.Close" href="#checksumReader.Close">func (r *checksumReader) Close() error</a>

```
searchKey: zip.checksumReader.Close
tags: [function private]
```

```Go
func (r *checksumReader) Close() error
```

#### <a id="checksumReader.Read" href="#checksumReader.Read">func (r *checksumReader) Read(b []byte) (n int, err error)</a>

```
searchKey: zip.checksumReader.Read
tags: [method private]
```

```Go
func (r *checksumReader) Read(b []byte) (n int, err error)
```

#### <a id="checksumReader.Stat" href="#checksumReader.Stat">func (r *checksumReader) Stat() (fs.FileInfo, error)</a>

```
searchKey: zip.checksumReader.Stat
tags: [function private]
```

```Go
func (r *checksumReader) Stat() (fs.FileInfo, error)
```

### <a id="countWriter" href="#countWriter">type countWriter struct</a>

```
searchKey: zip.countWriter
tags: [struct private]
```

```Go
type countWriter struct {
	w     io.Writer
	count int64
}
```

#### <a id="countWriter.Write" href="#countWriter.Write">func (w *countWriter) Write(p []byte) (int, error)</a>

```
searchKey: zip.countWriter.Write
tags: [method private]
```

```Go
func (w *countWriter) Write(p []byte) (int, error)
```

### <a id="dataDescriptor" href="#dataDescriptor">type dataDescriptor struct</a>

```
searchKey: zip.dataDescriptor
tags: [struct private]
```

```Go
type dataDescriptor struct {
	crc32            uint32
	compressedSize   uint64
	uncompressedSize uint64
}
```

dataDescriptor holds the data descriptor that optionally follows the file contents in the zip file. 

#### <a id="readDataDescriptor" href="#readDataDescriptor">func readDataDescriptor(r io.Reader, zip64 bool) (*dataDescriptor, error)</a>

```
searchKey: zip.readDataDescriptor
tags: [method private]
```

```Go
func readDataDescriptor(r io.Reader, zip64 bool) (*dataDescriptor, error)
```

### <a id="dirWriter" href="#dirWriter">type dirWriter struct{}</a>

```
searchKey: zip.dirWriter
tags: [struct private]
```

```Go
type dirWriter struct{}
```

#### <a id="dirWriter.Write" href="#dirWriter.Write">func (dirWriter) Write(b []byte) (int, error)</a>

```
searchKey: zip.dirWriter.Write
tags: [method private]
```

```Go
func (dirWriter) Write(b []byte) (int, error)
```

### <a id="directoryEnd" href="#directoryEnd">type directoryEnd struct</a>

```
searchKey: zip.directoryEnd
tags: [struct private]
```

```Go
type directoryEnd struct {
	diskNbr            uint32 // unused
	dirDiskNbr         uint32 // unused
	dirRecordsThisDisk uint64 // unused
	directoryRecords   uint64
	directorySize      uint64
	directoryOffset    uint64 // relative to file
	commentLen         uint16
	comment            string
}
```

#### <a id="readDirectoryEnd" href="#readDirectoryEnd">func readDirectoryEnd(r io.ReaderAt, size int64) (dir *directoryEnd, err error)</a>

```
searchKey: zip.readDirectoryEnd
tags: [method private]
```

```Go
func readDirectoryEnd(r io.ReaderAt, size int64) (dir *directoryEnd, err error)
```

### <a id="fakeHash32" href="#fakeHash32">type fakeHash32 struct</a>

```
searchKey: zip.fakeHash32
tags: [struct private]
```

```Go
type fakeHash32 struct {
	hash.Hash32
}
```

fakeHash32 is a dummy Hash32 that always returns 0. 

#### <a id="fakeHash32.Sum32" href="#fakeHash32.Sum32">func (fakeHash32) Sum32() uint32</a>

```
searchKey: zip.fakeHash32.Sum32
tags: [function private]
```

```Go
func (fakeHash32) Sum32() uint32
```

#### <a id="fakeHash32.Write" href="#fakeHash32.Write">func (fakeHash32) Write(p []byte) (int, error)</a>

```
searchKey: zip.fakeHash32.Write
tags: [method private]
```

```Go
func (fakeHash32) Write(p []byte) (int, error)
```

### <a id="fileInfoDirEntry" href="#fileInfoDirEntry">type fileInfoDirEntry interface</a>

```
searchKey: zip.fileInfoDirEntry
tags: [interface private]
```

```Go
type fileInfoDirEntry interface {
	fs.FileInfo
	fs.DirEntry
}
```

### <a id="fileListEntry" href="#fileListEntry">type fileListEntry struct</a>

```
searchKey: zip.fileListEntry
tags: [struct private]
```

```Go
type fileListEntry struct {
	name  string
	file  *File
	isDir bool
}
```

A fileListEntry is a File and its ename. If file == nil, the fileListEntry describes a directory without metadata. 

#### <a id="fileListEntry.Info" href="#fileListEntry.Info">func (f *fileListEntry) Info() (fs.FileInfo, error)</a>

```
searchKey: zip.fileListEntry.Info
tags: [function private]
```

```Go
func (f *fileListEntry) Info() (fs.FileInfo, error)
```

#### <a id="fileListEntry.IsDir" href="#fileListEntry.IsDir">func (f *fileListEntry) IsDir() bool</a>

```
searchKey: zip.fileListEntry.IsDir
tags: [function private]
```

```Go
func (f *fileListEntry) IsDir() bool
```

#### <a id="fileListEntry.ModTime" href="#fileListEntry.ModTime">func (f *fileListEntry) ModTime() time.Time</a>

```
searchKey: zip.fileListEntry.ModTime
tags: [function private]
```

```Go
func (f *fileListEntry) ModTime() time.Time
```

#### <a id="fileListEntry.Mode" href="#fileListEntry.Mode">func (f *fileListEntry) Mode() fs.FileMode</a>

```
searchKey: zip.fileListEntry.Mode
tags: [function private]
```

```Go
func (f *fileListEntry) Mode() fs.FileMode
```

#### <a id="fileListEntry.Name" href="#fileListEntry.Name">func (f *fileListEntry) Name() string</a>

```
searchKey: zip.fileListEntry.Name
tags: [function private]
```

```Go
func (f *fileListEntry) Name() string
```

Only used for directories. 

#### <a id="fileListEntry.Size" href="#fileListEntry.Size">func (f *fileListEntry) Size() int64</a>

```
searchKey: zip.fileListEntry.Size
tags: [function private]
```

```Go
func (f *fileListEntry) Size() int64
```

#### <a id="fileListEntry.Sys" href="#fileListEntry.Sys">func (f *fileListEntry) Sys() interface{}</a>

```
searchKey: zip.fileListEntry.Sys
tags: [function private]
```

```Go
func (f *fileListEntry) Sys() interface{}
```

#### <a id="fileListEntry.Type" href="#fileListEntry.Type">func (f *fileListEntry) Type() fs.FileMode</a>

```
searchKey: zip.fileListEntry.Type
tags: [function private]
```

```Go
func (f *fileListEntry) Type() fs.FileMode
```

#### <a id="fileListEntry.stat" href="#fileListEntry.stat">func (e *fileListEntry) stat() fileInfoDirEntry</a>

```
searchKey: zip.fileListEntry.stat
tags: [function private]
```

```Go
func (e *fileListEntry) stat() fileInfoDirEntry
```

### <a id="fileWriter" href="#fileWriter">type fileWriter struct</a>

```
searchKey: zip.fileWriter
tags: [struct private]
```

```Go
type fileWriter struct {
	*header
	zipw      io.Writer
	rawCount  *countWriter
	comp      io.WriteCloser
	compCount *countWriter
	crc32     hash.Hash32
	closed    bool
}
```

#### <a id="fileWriter.Write" href="#fileWriter.Write">func (w *fileWriter) Write(p []byte) (int, error)</a>

```
searchKey: zip.fileWriter.Write
tags: [method private]
```

```Go
func (w *fileWriter) Write(p []byte) (int, error)
```

#### <a id="fileWriter.close" href="#fileWriter.close">func (w *fileWriter) close() error</a>

```
searchKey: zip.fileWriter.close
tags: [function private]
```

```Go
func (w *fileWriter) close() error
```

#### <a id="fileWriter.writeDataDescriptor" href="#fileWriter.writeDataDescriptor">func (w *fileWriter) writeDataDescriptor() error</a>

```
searchKey: zip.fileWriter.writeDataDescriptor
tags: [function private]
```

```Go
func (w *fileWriter) writeDataDescriptor() error
```

### <a id="header" href="#header">type header struct</a>

```
searchKey: zip.header
tags: [struct private]
```

```Go
type header struct {
	*FileHeader
	offset uint64
	raw    bool
}
```

### <a id="headerFileInfo" href="#headerFileInfo">type headerFileInfo struct</a>

```
searchKey: zip.headerFileInfo
tags: [struct private]
```

```Go
type headerFileInfo struct {
	fh *FileHeader
}
```

headerFileInfo implements fs.FileInfo. 

#### <a id="headerFileInfo.Info" href="#headerFileInfo.Info">func (fi headerFileInfo) Info() (fs.FileInfo, error)</a>

```
searchKey: zip.headerFileInfo.Info
tags: [function private]
```

```Go
func (fi headerFileInfo) Info() (fs.FileInfo, error)
```

#### <a id="headerFileInfo.IsDir" href="#headerFileInfo.IsDir">func (fi headerFileInfo) IsDir() bool</a>

```
searchKey: zip.headerFileInfo.IsDir
tags: [function private]
```

```Go
func (fi headerFileInfo) IsDir() bool
```

#### <a id="headerFileInfo.ModTime" href="#headerFileInfo.ModTime">func (fi headerFileInfo) ModTime() time.Time</a>

```
searchKey: zip.headerFileInfo.ModTime
tags: [function private]
```

```Go
func (fi headerFileInfo) ModTime() time.Time
```

#### <a id="headerFileInfo.Mode" href="#headerFileInfo.Mode">func (fi headerFileInfo) Mode() fs.FileMode</a>

```
searchKey: zip.headerFileInfo.Mode
tags: [function private]
```

```Go
func (fi headerFileInfo) Mode() fs.FileMode
```

#### <a id="headerFileInfo.Name" href="#headerFileInfo.Name">func (fi headerFileInfo) Name() string</a>

```
searchKey: zip.headerFileInfo.Name
tags: [function private]
```

```Go
func (fi headerFileInfo) Name() string
```

#### <a id="headerFileInfo.Size" href="#headerFileInfo.Size">func (fi headerFileInfo) Size() int64</a>

```
searchKey: zip.headerFileInfo.Size
tags: [function private]
```

```Go
func (fi headerFileInfo) Size() int64
```

#### <a id="headerFileInfo.Sys" href="#headerFileInfo.Sys">func (fi headerFileInfo) Sys() interface{}</a>

```
searchKey: zip.headerFileInfo.Sys
tags: [function private]
```

```Go
func (fi headerFileInfo) Sys() interface{}
```

#### <a id="headerFileInfo.Type" href="#headerFileInfo.Type">func (fi headerFileInfo) Type() fs.FileMode</a>

```
searchKey: zip.headerFileInfo.Type
tags: [function private]
```

```Go
func (fi headerFileInfo) Type() fs.FileMode
```

### <a id="nopCloser" href="#nopCloser">type nopCloser struct</a>

```
searchKey: zip.nopCloser
tags: [struct private]
```

```Go
type nopCloser struct {
	io.Writer
}
```

#### <a id="nopCloser.Close" href="#nopCloser.Close">func (w nopCloser) Close() error</a>

```
searchKey: zip.nopCloser.Close
tags: [function private]
```

```Go
func (w nopCloser) Close() error
```

### <a id="openDir" href="#openDir">type openDir struct</a>

```
searchKey: zip.openDir
tags: [struct private]
```

```Go
type openDir struct {
	e      *fileListEntry
	files  []fileListEntry
	offset int
}
```

#### <a id="openDir.Close" href="#openDir.Close">func (d *openDir) Close() error</a>

```
searchKey: zip.openDir.Close
tags: [function private]
```

```Go
func (d *openDir) Close() error
```

#### <a id="openDir.Read" href="#openDir.Read">func (d *openDir) Read([]byte) (int, error)</a>

```
searchKey: zip.openDir.Read
tags: [method private]
```

```Go
func (d *openDir) Read([]byte) (int, error)
```

#### <a id="openDir.ReadDir" href="#openDir.ReadDir">func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)</a>

```
searchKey: zip.openDir.ReadDir
tags: [method private]
```

```Go
func (d *openDir) ReadDir(count int) ([]fs.DirEntry, error)
```

#### <a id="openDir.Stat" href="#openDir.Stat">func (d *openDir) Stat() (fs.FileInfo, error)</a>

```
searchKey: zip.openDir.Stat
tags: [function private]
```

```Go
func (d *openDir) Stat() (fs.FileInfo, error)
```

### <a id="pooledFlateReader" href="#pooledFlateReader">type pooledFlateReader struct</a>

```
searchKey: zip.pooledFlateReader
tags: [struct private]
```

```Go
type pooledFlateReader struct {
	mu sync.Mutex // guards Close and Read
	fr io.ReadCloser
}
```

#### <a id="pooledFlateReader.Close" href="#pooledFlateReader.Close">func (r *pooledFlateReader) Close() error</a>

```
searchKey: zip.pooledFlateReader.Close
tags: [function private]
```

```Go
func (r *pooledFlateReader) Close() error
```

#### <a id="pooledFlateReader.Read" href="#pooledFlateReader.Read">func (r *pooledFlateReader) Read(p []byte) (n int, err error)</a>

```
searchKey: zip.pooledFlateReader.Read
tags: [method private]
```

```Go
func (r *pooledFlateReader) Read(p []byte) (n int, err error)
```

### <a id="pooledFlateWriter" href="#pooledFlateWriter">type pooledFlateWriter struct</a>

```
searchKey: zip.pooledFlateWriter
tags: [struct private]
```

```Go
type pooledFlateWriter struct {
	mu sync.Mutex // guards Close and Write
	fw *flate.Writer
}
```

#### <a id="pooledFlateWriter.Close" href="#pooledFlateWriter.Close">func (w *pooledFlateWriter) Close() error</a>

```
searchKey: zip.pooledFlateWriter.Close
tags: [function private]
```

```Go
func (w *pooledFlateWriter) Close() error
```

#### <a id="pooledFlateWriter.Write" href="#pooledFlateWriter.Write">func (w *pooledFlateWriter) Write(p []byte) (n int, err error)</a>

```
searchKey: zip.pooledFlateWriter.Write
tags: [method private]
```

```Go
func (w *pooledFlateWriter) Write(p []byte) (n int, err error)
```

### <a id="readBuf" href="#readBuf">type readBuf []byte</a>

```
searchKey: zip.readBuf
tags: [array number private]
```

```Go
type readBuf []byte
```

#### <a id="readBuf.sub" href="#readBuf.sub">func (b *readBuf) sub(n int) readBuf</a>

```
searchKey: zip.readBuf.sub
tags: [method private]
```

```Go
func (b *readBuf) sub(n int) readBuf
```

#### <a id="readBuf.uint16" href="#readBuf.uint16">func (b *readBuf) uint16() uint16</a>

```
searchKey: zip.readBuf.uint16
tags: [function private]
```

```Go
func (b *readBuf) uint16() uint16
```

#### <a id="readBuf.uint32" href="#readBuf.uint32">func (b *readBuf) uint32() uint32</a>

```
searchKey: zip.readBuf.uint32
tags: [function private]
```

```Go
func (b *readBuf) uint32() uint32
```

#### <a id="readBuf.uint64" href="#readBuf.uint64">func (b *readBuf) uint64() uint64</a>

```
searchKey: zip.readBuf.uint64
tags: [function private]
```

```Go
func (b *readBuf) uint64() uint64
```

#### <a id="readBuf.uint8" href="#readBuf.uint8">func (b *readBuf) uint8() uint8</a>

```
searchKey: zip.readBuf.uint8
tags: [function private]
```

```Go
func (b *readBuf) uint8() uint8
```

### <a id="repeatedByte" href="#repeatedByte">type repeatedByte struct</a>

```
searchKey: zip.repeatedByte
tags: [struct private]
```

```Go
type repeatedByte struct {
	off int64
	b   byte
	n   int64
}
```

### <a id="rleBuffer" href="#rleBuffer">type rleBuffer struct</a>

```
searchKey: zip.rleBuffer
tags: [struct private]
```

```Go
type rleBuffer struct {
	buf []repeatedByte
}
```

rleBuffer is a run-length-encoded byte buffer. It's an io.Writer (like a bytes.Buffer) and also an io.ReaderAt, allowing random-access reads. 

#### <a id="testZip64" href="#testZip64">func testZip64(t testing.TB, size int64) *rleBuffer</a>

```
searchKey: zip.testZip64
tags: [method private]
```

```Go
func testZip64(t testing.TB, size int64) *rleBuffer
```

#### <a id="rleBuffer.ReadAt" href="#rleBuffer.ReadAt">func (r *rleBuffer) ReadAt(p []byte, off int64) (n int, err error)</a>

```
searchKey: zip.rleBuffer.ReadAt
tags: [method private]
```

```Go
func (r *rleBuffer) ReadAt(p []byte, off int64) (n int, err error)
```

#### <a id="rleBuffer.Size" href="#rleBuffer.Size">func (r *rleBuffer) Size() int64</a>

```
searchKey: zip.rleBuffer.Size
tags: [function private]
```

```Go
func (r *rleBuffer) Size() int64
```

#### <a id="rleBuffer.Write" href="#rleBuffer.Write">func (r *rleBuffer) Write(p []byte) (n int, err error)</a>

```
searchKey: zip.rleBuffer.Write
tags: [method private]
```

```Go
func (r *rleBuffer) Write(p []byte) (n int, err error)
```

### <a id="sizedReaderAt" href="#sizedReaderAt">type sizedReaderAt interface</a>

```
searchKey: zip.sizedReaderAt
tags: [interface private]
```

```Go
type sizedReaderAt interface {
	io.ReaderAt
	Size() int64
}
```

### <a id="suffixSaver" href="#suffixSaver">type suffixSaver struct</a>

```
searchKey: zip.suffixSaver
tags: [struct private]
```

```Go
type suffixSaver struct {
	keep  int
	buf   []byte
	start int
	size  int64
}
```

suffixSaver is an io.Writer & io.ReaderAt that remembers the last 0 to 'keep' bytes of data written to it. Call Suffix to get the suffix bytes. 

#### <a id="suffixSaver.ReadAt" href="#suffixSaver.ReadAt">func (ss *suffixSaver) ReadAt(p []byte, off int64) (n int, err error)</a>

```
searchKey: zip.suffixSaver.ReadAt
tags: [method private]
```

```Go
func (ss *suffixSaver) ReadAt(p []byte, off int64) (n int, err error)
```

#### <a id="suffixSaver.Size" href="#suffixSaver.Size">func (ss *suffixSaver) Size() int64</a>

```
searchKey: zip.suffixSaver.Size
tags: [function private]
```

```Go
func (ss *suffixSaver) Size() int64
```

#### <a id="suffixSaver.Suffix" href="#suffixSaver.Suffix">func (ss *suffixSaver) Suffix() []byte</a>

```
searchKey: zip.suffixSaver.Suffix
tags: [function private]
```

```Go
func (ss *suffixSaver) Suffix() []byte
```

#### <a id="suffixSaver.Write" href="#suffixSaver.Write">func (ss *suffixSaver) Write(p []byte) (n int, err error)</a>

```
searchKey: zip.suffixSaver.Write
tags: [method private]
```

```Go
func (ss *suffixSaver) Write(p []byte) (n int, err error)
```

### <a id="writeBuf" href="#writeBuf">type writeBuf []byte</a>

```
searchKey: zip.writeBuf
tags: [array number private]
```

```Go
type writeBuf []byte
```

#### <a id="writeBuf.uint16" href="#writeBuf.uint16">func (b *writeBuf) uint16(v uint16)</a>

```
searchKey: zip.writeBuf.uint16
tags: [method private]
```

```Go
func (b *writeBuf) uint16(v uint16)
```

#### <a id="writeBuf.uint32" href="#writeBuf.uint32">func (b *writeBuf) uint32(v uint32)</a>

```
searchKey: zip.writeBuf.uint32
tags: [method private]
```

```Go
func (b *writeBuf) uint32(v uint32)
```

#### <a id="writeBuf.uint64" href="#writeBuf.uint64">func (b *writeBuf) uint64(v uint64)</a>

```
searchKey: zip.writeBuf.uint64
tags: [method private]
```

```Go
func (b *writeBuf) uint64(v uint64)
```

#### <a id="writeBuf.uint8" href="#writeBuf.uint8">func (b *writeBuf) uint8(v uint8)</a>

```
searchKey: zip.writeBuf.uint8
tags: [method private]
```

```Go
func (b *writeBuf) uint8(v uint8)
```

### <a id="zeros" href="#zeros">type zeros struct{}</a>

```
searchKey: zip.zeros
tags: [struct private]
```

```Go
type zeros struct{}
```

#### <a id="zeros.Read" href="#zeros.Read">func (zeros) Read(p []byte) (int, error)</a>

```
searchKey: zip.zeros.Read
tags: [method private]
```

```Go
func (zeros) Read(p []byte) (int, error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkCompressedZipGarbage" href="#BenchmarkCompressedZipGarbage">func BenchmarkCompressedZipGarbage(b *testing.B)</a>

```
searchKey: zip.BenchmarkCompressedZipGarbage
tags: [method private benchmark]
```

```Go
func BenchmarkCompressedZipGarbage(b *testing.B)
```

### <a id="BenchmarkZip64Test" href="#BenchmarkZip64Test">func BenchmarkZip64Test(b *testing.B)</a>

```
searchKey: zip.BenchmarkZip64Test
tags: [method private benchmark]
```

```Go
func BenchmarkZip64Test(b *testing.B)
```

Just benchmarking how fast the Zip64 test above is. Not related to our zip performance, since the test above disabled CRC32 and flate. 

### <a id="BenchmarkZip64TestSizes" href="#BenchmarkZip64TestSizes">func BenchmarkZip64TestSizes(b *testing.B)</a>

```
searchKey: zip.BenchmarkZip64TestSizes
tags: [method private benchmark]
```

```Go
func BenchmarkZip64TestSizes(b *testing.B)
```

### <a id="RegisterCompressor" href="#RegisterCompressor">func RegisterCompressor(method uint16, comp Compressor)</a>

```
searchKey: zip.RegisterCompressor
tags: [method]
```

```Go
func RegisterCompressor(method uint16, comp Compressor)
```

RegisterCompressor registers custom compressors for a specified method ID. The common methods Store and Deflate are built in. 

### <a id="RegisterDecompressor" href="#RegisterDecompressor">func RegisterDecompressor(method uint16, dcomp Decompressor)</a>

```
searchKey: zip.RegisterDecompressor
tags: [method]
```

```Go
func RegisterDecompressor(method uint16, dcomp Decompressor)
```

RegisterDecompressor allows custom decompressors for a specified method ID. The common methods Store and Deflate are built in. 

### <a id="TestCVE202127919" href="#TestCVE202127919">func TestCVE202127919(t *testing.T)</a>

```
searchKey: zip.TestCVE202127919
tags: [method private test]
```

```Go
func TestCVE202127919(t *testing.T)
```

### <a id="TestCVE202133196" href="#TestCVE202133196">func TestCVE202133196(t *testing.T)</a>

```
searchKey: zip.TestCVE202133196
tags: [method private test]
```

```Go
func TestCVE202133196(t *testing.T)
```

### <a id="TestFS" href="#TestFS">func TestFS(t *testing.T)</a>

```
searchKey: zip.TestFS
tags: [method private test]
```

```Go
func TestFS(t *testing.T)
```

### <a id="TestFSModTime" href="#TestFSModTime">func TestFSModTime(t *testing.T)</a>

```
searchKey: zip.TestFSModTime
tags: [method private test]
```

```Go
func TestFSModTime(t *testing.T)
```

### <a id="TestFileHeaderRoundTrip" href="#TestFileHeaderRoundTrip">func TestFileHeaderRoundTrip(t *testing.T)</a>

```
searchKey: zip.TestFileHeaderRoundTrip
tags: [method private test]
```

```Go
func TestFileHeaderRoundTrip(t *testing.T)
```

### <a id="TestFileHeaderRoundTrip64" href="#TestFileHeaderRoundTrip64">func TestFileHeaderRoundTrip64(t *testing.T)</a>

```
searchKey: zip.TestFileHeaderRoundTrip64
tags: [method private test]
```

```Go
func TestFileHeaderRoundTrip64(t *testing.T)
```

### <a id="TestFileHeaderRoundTripModified" href="#TestFileHeaderRoundTripModified">func TestFileHeaderRoundTripModified(t *testing.T)</a>

```
searchKey: zip.TestFileHeaderRoundTripModified
tags: [method private test]
```

```Go
func TestFileHeaderRoundTripModified(t *testing.T)
```

### <a id="TestFileHeaderRoundTripWithoutModified" href="#TestFileHeaderRoundTripWithoutModified">func TestFileHeaderRoundTripWithoutModified(t *testing.T)</a>

```
searchKey: zip.TestFileHeaderRoundTripWithoutModified
tags: [method private test]
```

```Go
func TestFileHeaderRoundTripWithoutModified(t *testing.T)
```

### <a id="TestHeaderIgnoredSize" href="#TestHeaderIgnoredSize">func TestHeaderIgnoredSize(t *testing.T)</a>

```
searchKey: zip.TestHeaderIgnoredSize
tags: [method private test]
```

```Go
func TestHeaderIgnoredSize(t *testing.T)
```

### <a id="TestHeaderInvalidTagAndSize" href="#TestHeaderInvalidTagAndSize">func TestHeaderInvalidTagAndSize(t *testing.T)</a>

```
searchKey: zip.TestHeaderInvalidTagAndSize
tags: [method private test]
```

```Go
func TestHeaderInvalidTagAndSize(t *testing.T)
```

Issue 4302. 

### <a id="TestHeaderTooLongErr" href="#TestHeaderTooLongErr">func TestHeaderTooLongErr(t *testing.T)</a>

```
searchKey: zip.TestHeaderTooLongErr
tags: [method private test]
```

```Go
func TestHeaderTooLongErr(t *testing.T)
```

### <a id="TestHeaderTooShort" href="#TestHeaderTooShort">func TestHeaderTooShort(t *testing.T)</a>

```
searchKey: zip.TestHeaderTooShort
tags: [method private test]
```

```Go
func TestHeaderTooShort(t *testing.T)
```

### <a id="TestInvalidFiles" href="#TestInvalidFiles">func TestInvalidFiles(t *testing.T)</a>

```
searchKey: zip.TestInvalidFiles
tags: [method private test]
```

```Go
func TestInvalidFiles(t *testing.T)
```

### <a id="TestIssue10956" href="#TestIssue10956">func TestIssue10956(t *testing.T)</a>

```
searchKey: zip.TestIssue10956
tags: [method private test]
```

```Go
func TestIssue10956(t *testing.T)
```

Verify that this particular malformed zip file is rejected. 

### <a id="TestIssue10957" href="#TestIssue10957">func TestIssue10957(t *testing.T)</a>

```
searchKey: zip.TestIssue10957
tags: [method private test]
```

```Go
func TestIssue10957(t *testing.T)
```

Verify we return ErrUnexpectedEOF when length is short. 

### <a id="TestIssue11146" href="#TestIssue11146">func TestIssue11146(t *testing.T)</a>

```
searchKey: zip.TestIssue11146
tags: [method private test]
```

```Go
func TestIssue11146(t *testing.T)
```

Verify we return ErrUnexpectedEOF when reading truncated data descriptor. 

### <a id="TestIssue12449" href="#TestIssue12449">func TestIssue12449(t *testing.T)</a>

```
searchKey: zip.TestIssue12449
tags: [method private test]
```

```Go
func TestIssue12449(t *testing.T)
```

Verify we do not treat non-zip64 archives as zip64 

### <a id="TestIssue8186" href="#TestIssue8186">func TestIssue8186(t *testing.T)</a>

```
searchKey: zip.TestIssue8186
tags: [method private test]
```

```Go
func TestIssue8186(t *testing.T)
```

### <a id="TestModTime" href="#TestModTime">func TestModTime(t *testing.T)</a>

```
searchKey: zip.TestModTime
tags: [method private test]
```

```Go
func TestModTime(t *testing.T)
```

### <a id="TestOver65kFiles" href="#TestOver65kFiles">func TestOver65kFiles(t *testing.T)</a>

```
searchKey: zip.TestOver65kFiles
tags: [method private test]
```

```Go
func TestOver65kFiles(t *testing.T)
```

### <a id="TestRLEBuffer" href="#TestRLEBuffer">func TestRLEBuffer(t *testing.T)</a>

```
searchKey: zip.TestRLEBuffer
tags: [method private test]
```

```Go
func TestRLEBuffer(t *testing.T)
```

Just testing the rleBuffer used in the Zip64 test above. Not used by the zip code. 

### <a id="TestReadDataDescriptor" href="#TestReadDataDescriptor">func TestReadDataDescriptor(t *testing.T)</a>

```
searchKey: zip.TestReadDataDescriptor
tags: [method private test]
```

```Go
func TestReadDataDescriptor(t *testing.T)
```

### <a id="TestReader" href="#TestReader">func TestReader(t *testing.T)</a>

```
searchKey: zip.TestReader
tags: [method private test]
```

```Go
func TestReader(t *testing.T)
```

### <a id="TestSuffixSaver" href="#TestSuffixSaver">func TestSuffixSaver(t *testing.T)</a>

```
searchKey: zip.TestSuffixSaver
tags: [method private test]
```

```Go
func TestSuffixSaver(t *testing.T)
```

### <a id="TestWriter" href="#TestWriter">func TestWriter(t *testing.T)</a>

```
searchKey: zip.TestWriter
tags: [method private test]
```

```Go
func TestWriter(t *testing.T)
```

### <a id="TestWriterComment" href="#TestWriterComment">func TestWriterComment(t *testing.T)</a>

```
searchKey: zip.TestWriterComment
tags: [method private test]
```

```Go
func TestWriterComment(t *testing.T)
```

TestWriterComment is test for EOCD comment read/write. 

### <a id="TestWriterCopy" href="#TestWriterCopy">func TestWriterCopy(t *testing.T)</a>

```
searchKey: zip.TestWriterCopy
tags: [method private test]
```

```Go
func TestWriterCopy(t *testing.T)
```

### <a id="TestWriterCreateRaw" href="#TestWriterCreateRaw">func TestWriterCreateRaw(t *testing.T)</a>

```
searchKey: zip.TestWriterCreateRaw
tags: [method private test]
```

```Go
func TestWriterCreateRaw(t *testing.T)
```

### <a id="TestWriterDir" href="#TestWriterDir">func TestWriterDir(t *testing.T)</a>

```
searchKey: zip.TestWriterDir
tags: [method private test]
```

```Go
func TestWriterDir(t *testing.T)
```

### <a id="TestWriterDirAttributes" href="#TestWriterDirAttributes">func TestWriterDirAttributes(t *testing.T)</a>

```
searchKey: zip.TestWriterDirAttributes
tags: [method private test]
```

```Go
func TestWriterDirAttributes(t *testing.T)
```

### <a id="TestWriterFlush" href="#TestWriterFlush">func TestWriterFlush(t *testing.T)</a>

```
searchKey: zip.TestWriterFlush
tags: [method private test]
```

```Go
func TestWriterFlush(t *testing.T)
```

### <a id="TestWriterOffset" href="#TestWriterOffset">func TestWriterOffset(t *testing.T)</a>

```
searchKey: zip.TestWriterOffset
tags: [method private test]
```

```Go
func TestWriterOffset(t *testing.T)
```

### <a id="TestWriterTime" href="#TestWriterTime">func TestWriterTime(t *testing.T)</a>

```
searchKey: zip.TestWriterTime
tags: [method private test]
```

```Go
func TestWriterTime(t *testing.T)
```

### <a id="TestWriterUTF8" href="#TestWriterUTF8">func TestWriterUTF8(t *testing.T)</a>

```
searchKey: zip.TestWriterUTF8
tags: [method private test]
```

```Go
func TestWriterUTF8(t *testing.T)
```

### <a id="TestZeroLengthHeader" href="#TestZeroLengthHeader">func TestZeroLengthHeader(t *testing.T)</a>

```
searchKey: zip.TestZeroLengthHeader
tags: [method private test]
```

```Go
func TestZeroLengthHeader(t *testing.T)
```

Issue 4393. It is valid to have an extra data header which contains no body. 

### <a id="TestZip64" href="#TestZip64">func TestZip64(t *testing.T)</a>

```
searchKey: zip.TestZip64
tags: [method private test]
```

```Go
func TestZip64(t *testing.T)
```

### <a id="TestZip64DirectoryOffset" href="#TestZip64DirectoryOffset">func TestZip64DirectoryOffset(t *testing.T)</a>

```
searchKey: zip.TestZip64DirectoryOffset
tags: [method private test]
```

```Go
func TestZip64DirectoryOffset(t *testing.T)
```

Tests that we generate a zip64 file if the directory at offset 0xFFFFFFFF, but not before. 

### <a id="TestZip64EdgeCase" href="#TestZip64EdgeCase">func TestZip64EdgeCase(t *testing.T)</a>

```
searchKey: zip.TestZip64EdgeCase
tags: [method private test]
```

```Go
func TestZip64EdgeCase(t *testing.T)
```

### <a id="TestZip64LargeDirectory" href="#TestZip64LargeDirectory">func TestZip64LargeDirectory(t *testing.T)</a>

```
searchKey: zip.TestZip64LargeDirectory
tags: [method private test]
```

```Go
func TestZip64LargeDirectory(t *testing.T)
```

Zip64 is required if the total size of the records is uint32max. 

### <a id="TestZip64ManyRecords" href="#TestZip64ManyRecords">func TestZip64ManyRecords(t *testing.T)</a>

```
searchKey: zip.TestZip64ManyRecords
tags: [method private test]
```

```Go
func TestZip64ManyRecords(t *testing.T)
```

At 16k records, we need to generate a zip64 file. 

### <a id="biggestZipBytes" href="#biggestZipBytes">func biggestZipBytes() []byte</a>

```
searchKey: zip.biggestZipBytes
tags: [function private]
```

```Go
func biggestZipBytes() []byte
```

biggestZipBytes returns the bytes of a zip file biggest.zip that contains a zip file bigger.zip that contains a zip file big.zip that contains big.file, which contains 2³²-1 zeros. The big.zip file is interesting because it has no zip64 header, much like the innermost zip files in the well-known 42.zip. 

biggest.zip was generated by changing isZip64 to use > uint32max instead of >= uint32max and then running this program: 

```
package main

import (
	"archive/zip"
	"bytes"
	"io"
	"log"
	"os"
)

type zeros struct{}

func (zeros) Read(b []byte) (int, error) {
	for i := range b {
		b[i] = 0
	}
	return len(b), nil
}

func main() {
	bigZip := makeZip("big.file", io.LimitReader(zeros{}, 1<<32-1))
	if err := os.WriteFile("/tmp/big.zip", bigZip, 0666); err != nil {
		log.Fatal(err)
	}

	biggerZip := makeZip("big.zip", bytes.NewReader(bigZip))
	if err := os.WriteFile("/tmp/bigger.zip", biggerZip, 0666); err != nil {
		log.Fatal(err)
	}

	biggestZip := makeZip("bigger.zip", bytes.NewReader(biggerZip))
	if err := os.WriteFile("/tmp/biggest.zip", biggestZip, 0666); err != nil {
		log.Fatal(err)
	}
}

func makeZip(name string, r io.Reader) []byte {
	var buf bytes.Buffer
	w := zip.NewWriter(&buf)
	wf, err := w.Create(name)
	if err != nil {
		log.Fatal(err)
	}
	if _, err = io.Copy(wf, r); err != nil {
		log.Fatal(err)
	}
	if err := w.Close(); err != nil {
		log.Fatal(err)
	}
	return buf.Bytes()
}

```
The 4 GB of zeros compresses to 4 MB, which compresses to 20 kB, which compresses to 1252 bytes (in the hex dump below). 

It's here in hex for the same reason as rZipBytes above: to avoid problems with on-disk virus scanners or other zip processors. 

### <a id="detectUTF8" href="#detectUTF8">func detectUTF8(s string) (valid, require bool)</a>

```
searchKey: zip.detectUTF8
tags: [method private]
```

```Go
func detectUTF8(s string) (valid, require bool)
```

detectUTF8 reports whether s is a valid UTF-8 string, and whether the string must be considered UTF-8 encoding (i.e., not compatible with CP-437, ASCII, or any other common encoding). 

### <a id="equalTimeAndZone" href="#equalTimeAndZone">func equalTimeAndZone(t1, t2 time.Time) bool</a>

```
searchKey: zip.equalTimeAndZone
tags: [method private]
```

```Go
func equalTimeAndZone(t1, t2 time.Time) bool
```

### <a id="fileEntryLess" href="#fileEntryLess">func fileEntryLess(x, y string) bool</a>

```
searchKey: zip.fileEntryLess
tags: [method private]
```

```Go
func fileEntryLess(x, y string) bool
```

### <a id="fileModeToUnixMode" href="#fileModeToUnixMode">func fileModeToUnixMode(mode fs.FileMode) uint32</a>

```
searchKey: zip.fileModeToUnixMode
tags: [method private]
```

```Go
func fileModeToUnixMode(mode fs.FileMode) uint32
```

### <a id="findDirectory64End" href="#findDirectory64End">func findDirectory64End(r io.ReaderAt, directoryEndOffset int64) (int64, error)</a>

```
searchKey: zip.findDirectory64End
tags: [method private]
```

```Go
func findDirectory64End(r io.ReaderAt, directoryEndOffset int64) (int64, error)
```

findDirectory64End tries to read the zip64 locator just before the directory end and returns the offset of the zip64 directory end if found. 

### <a id="findSignatureInBlock" href="#findSignatureInBlock">func findSignatureInBlock(b []byte) int</a>

```
searchKey: zip.findSignatureInBlock
tags: [method private]
```

```Go
func findSignatureInBlock(b []byte) int
```

### <a id="generatesZip64" href="#generatesZip64">func generatesZip64(t *testing.T, f func(w *Writer)) bool</a>

```
searchKey: zip.generatesZip64
tags: [method private]
```

```Go
func generatesZip64(t *testing.T, f func(w *Writer)) bool
```

generatesZip64 reports whether f wrote a zip64 file. f is also responsible for closing w. 

### <a id="init.register.go" href="#init.register.go">func init()</a>

```
searchKey: zip.init
tags: [function private]
```

```Go
func init()
```

### <a id="memset" href="#memset">func memset(a []byte, b byte)</a>

```
searchKey: zip.memset
tags: [method private]
```

```Go
func memset(a []byte, b byte)
```

### <a id="messWith" href="#messWith">func messWith(fileName string, corrupter func(b []byte)) (r io.ReaderAt, size int64)</a>

```
searchKey: zip.messWith
tags: [method private]
```

```Go
func messWith(fileName string, corrupter func(b []byte)) (r io.ReaderAt, size int64)
```

### <a id="min" href="#min">func min(x, y int64) int64</a>

```
searchKey: zip.min
tags: [method private]
```

```Go
func min(x, y int64) int64
```

### <a id="min64" href="#min64">func min64(x, y uint64) uint64</a>

```
searchKey: zip.min64
tags: [method private]
```

```Go
func min64(x, y uint64) uint64
```

### <a id="msDosTimeToTime" href="#msDosTimeToTime">func msDosTimeToTime(dosDate, dosTime uint16) time.Time</a>

```
searchKey: zip.msDosTimeToTime
tags: [method private]
```

```Go
func msDosTimeToTime(dosDate, dosTime uint16) time.Time
```

msDosTimeToTime converts an MS-DOS date and time into a time.Time. The resolution is 2s. See: [https://msdn.microsoft.com/en-us/library/ms724247(v=VS.85).aspx](https://msdn.microsoft.com/en-us/library/ms724247(v=VS.85).aspx) 

### <a id="msdosModeToFileMode" href="#msdosModeToFileMode">func msdosModeToFileMode(m uint32) (mode fs.FileMode)</a>

```
searchKey: zip.msdosModeToFileMode
tags: [method private]
```

```Go
func msdosModeToFileMode(m uint32) (mode fs.FileMode)
```

### <a id="newFlateReader" href="#newFlateReader">func newFlateReader(r io.Reader) io.ReadCloser</a>

```
searchKey: zip.newFlateReader
tags: [method private]
```

```Go
func newFlateReader(r io.Reader) io.ReadCloser
```

### <a id="newFlateWriter" href="#newFlateWriter">func newFlateWriter(w io.Writer) io.WriteCloser</a>

```
searchKey: zip.newFlateWriter
tags: [method private]
```

```Go
func newFlateWriter(w io.Writer) io.WriteCloser
```

### <a id="rZipBytes" href="#rZipBytes">func rZipBytes() []byte</a>

```
searchKey: zip.rZipBytes
tags: [function private]
```

```Go
func rZipBytes() []byte
```

rZipBytes returns the bytes of a recursive zip file, without putting it on disk and triggering certain virus scanners. 

### <a id="readDirectory64End" href="#readDirectory64End">func readDirectory64End(r io.ReaderAt, offset int64, d *directoryEnd) (err error)</a>

```
searchKey: zip.readDirectory64End
tags: [method private]
```

```Go
func readDirectory64End(r io.ReaderAt, offset int64, d *directoryEnd) (err error)
```

readDirectory64End reads the zip64 directory end and updates the directory end with the zip64 directory end values. 

### <a id="readDirectoryHeader" href="#readDirectoryHeader">func readDirectoryHeader(f *File, r io.Reader) error</a>

```
searchKey: zip.readDirectoryHeader
tags: [method private]
```

```Go
func readDirectoryHeader(f *File, r io.Reader) error
```

readDirectoryHeader attempts to read a directory header from r. It returns io.ErrUnexpectedEOF if it cannot read a complete header, and ErrFormat if it doesn't find a valid header signature. 

### <a id="readTestFile" href="#readTestFile">func readTestFile(t *testing.T, zt ZipTest, ft ZipTestFile, f *File, raw []byte)</a>

```
searchKey: zip.readTestFile
tags: [method private]
```

```Go
func readTestFile(t *testing.T, zt ZipTest, ft ZipTestFile, f *File, raw []byte)
```

### <a id="readTestZip" href="#readTestZip">func readTestZip(t *testing.T, zt ZipTest)</a>

```
searchKey: zip.readTestZip
tags: [method private]
```

```Go
func readTestZip(t *testing.T, zt ZipTest)
```

### <a id="returnBigZipBytes" href="#returnBigZipBytes">func returnBigZipBytes() (r io.ReaderAt, size int64)</a>

```
searchKey: zip.returnBigZipBytes
tags: [function private]
```

```Go
func returnBigZipBytes() (r io.ReaderAt, size int64)
```

### <a id="returnCorruptCRC32Zip" href="#returnCorruptCRC32Zip">func returnCorruptCRC32Zip() (r io.ReaderAt, size int64)</a>

```
searchKey: zip.returnCorruptCRC32Zip
tags: [function private]
```

```Go
func returnCorruptCRC32Zip() (r io.ReaderAt, size int64)
```

### <a id="returnCorruptNotStreamedZip" href="#returnCorruptNotStreamedZip">func returnCorruptNotStreamedZip() (r io.ReaderAt, size int64)</a>

```
searchKey: zip.returnCorruptNotStreamedZip
tags: [function private]
```

```Go
func returnCorruptNotStreamedZip() (r io.ReaderAt, size int64)
```

### <a id="returnRecursiveZip" href="#returnRecursiveZip">func returnRecursiveZip() (r io.ReaderAt, size int64)</a>

```
searchKey: zip.returnRecursiveZip
tags: [function private]
```

```Go
func returnRecursiveZip() (r io.ReaderAt, size int64)
```

### <a id="split" href="#split">func split(name string) (dir, elem string, isDir bool)</a>

```
searchKey: zip.split
tags: [method private]
```

```Go
func split(name string) (dir, elem string, isDir bool)
```

### <a id="suffixIsZip64" href="#suffixIsZip64">func suffixIsZip64(t *testing.T, zip sizedReaderAt) bool</a>

```
searchKey: zip.suffixIsZip64
tags: [method private]
```

```Go
func suffixIsZip64(t *testing.T, zip sizedReaderAt) bool
```

### <a id="testCreate" href="#testCreate">func testCreate(t *testing.T, w *Writer, wt *WriteTest)</a>

```
searchKey: zip.testCreate
tags: [method private]
```

```Go
func testCreate(t *testing.T, w *Writer, wt *WriteTest)
```

### <a id="testFileMode" href="#testFileMode">func testFileMode(t *testing.T, f *File, want fs.FileMode)</a>

```
searchKey: zip.testFileMode
tags: [method private]
```

```Go
func testFileMode(t *testing.T, f *File, want fs.FileMode)
```

### <a id="testHeaderRoundTrip" href="#testHeaderRoundTrip">func testHeaderRoundTrip(fh *FileHeader, wantUncompressedSize uint32, wantUncompressedSize64 uint64, t *testing.T)</a>

```
searchKey: zip.testHeaderRoundTrip
tags: [method private]
```

```Go
func testHeaderRoundTrip(fh *FileHeader, wantUncompressedSize uint32, wantUncompressedSize64 uint64, t *testing.T)
```

### <a id="testReadFile" href="#testReadFile">func testReadFile(t *testing.T, f *File, wt *WriteTest)</a>

```
searchKey: zip.testReadFile
tags: [method private]
```

```Go
func testReadFile(t *testing.T, f *File, wt *WriteTest)
```

### <a id="testValidHeader" href="#testValidHeader">func testValidHeader(h *FileHeader, t *testing.T)</a>

```
searchKey: zip.testValidHeader
tags: [method private]
```

```Go
func testValidHeader(h *FileHeader, t *testing.T)
```

### <a id="testZip64DirectoryRecordLength" href="#testZip64DirectoryRecordLength">func testZip64DirectoryRecordLength(buf *rleBuffer, t *testing.T)</a>

```
searchKey: zip.testZip64DirectoryRecordLength
tags: [method private]
```

```Go
func testZip64DirectoryRecordLength(buf *rleBuffer, t *testing.T)
```

Issue 9857 

### <a id="timeToMsDosTime" href="#timeToMsDosTime">func timeToMsDosTime(t time.Time) (fDate uint16, fTime uint16)</a>

```
searchKey: zip.timeToMsDosTime
tags: [method private]
```

```Go
func timeToMsDosTime(t time.Time) (fDate uint16, fTime uint16)
```

timeToMsDosTime converts a time.Time to an MS-DOS date and time. The resolution is 2s. See: [https://msdn.microsoft.com/en-us/library/ms724274(v=VS.85).aspx](https://msdn.microsoft.com/en-us/library/ms724274(v=VS.85).aspx) 

### <a id="timeZone" href="#timeZone">func timeZone(offset time.Duration) *time.Location</a>

```
searchKey: zip.timeZone
tags: [method private]
```

```Go
func timeZone(offset time.Duration) *time.Location
```

timeZone returns a *time.Location based on the provided offset. If the offset is non-sensible, then this uses an offset of zero. 

### <a id="toValidName" href="#toValidName">func toValidName(name string) string</a>

```
searchKey: zip.toValidName
tags: [method private]
```

```Go
func toValidName(name string) string
```

toValidName coerces name to be a valid name for fs.FS.Open. 

### <a id="unixModeToFileMode" href="#unixModeToFileMode">func unixModeToFileMode(m uint32) fs.FileMode</a>

```
searchKey: zip.unixModeToFileMode
tags: [method private]
```

```Go
func unixModeToFileMode(m uint32) fs.FileMode
```

### <a id="writeHeader" href="#writeHeader">func writeHeader(w io.Writer, h *header) error</a>

```
searchKey: zip.writeHeader
tags: [method private]
```

```Go
func writeHeader(w io.Writer, h *header) error
```

