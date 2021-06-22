# Package dwarf

Package dwarf provides access to DWARF debugging information loaded from executable files, as defined in the DWARF 2.0 Standard at [http://dwarfstd.org/doc/dwarf-2.0.0.pdf](http://dwarfstd.org/doc/dwarf-2.0.0.pdf) 

## Index

* [Constants](#const)
    * [const _Attr_name](#_Attr_name)
    * [const _Class_name](#_Class_name)
    * [const AttrSibling](#AttrSibling)
    * [const AttrLocation](#AttrLocation)
    * [const AttrName](#AttrName)
    * [const AttrOrdering](#AttrOrdering)
    * [const AttrByteSize](#AttrByteSize)
    * [const AttrBitOffset](#AttrBitOffset)
    * [const AttrBitSize](#AttrBitSize)
    * [const AttrStmtList](#AttrStmtList)
    * [const AttrLowpc](#AttrLowpc)
    * [const AttrHighpc](#AttrHighpc)
    * [const AttrLanguage](#AttrLanguage)
    * [const AttrDiscr](#AttrDiscr)
    * [const AttrDiscrValue](#AttrDiscrValue)
    * [const AttrVisibility](#AttrVisibility)
    * [const AttrImport](#AttrImport)
    * [const AttrStringLength](#AttrStringLength)
    * [const AttrCommonRef](#AttrCommonRef)
    * [const AttrCompDir](#AttrCompDir)
    * [const AttrConstValue](#AttrConstValue)
    * [const AttrContainingType](#AttrContainingType)
    * [const AttrDefaultValue](#AttrDefaultValue)
    * [const AttrInline](#AttrInline)
    * [const AttrIsOptional](#AttrIsOptional)
    * [const AttrLowerBound](#AttrLowerBound)
    * [const AttrProducer](#AttrProducer)
    * [const AttrPrototyped](#AttrPrototyped)
    * [const AttrReturnAddr](#AttrReturnAddr)
    * [const AttrStartScope](#AttrStartScope)
    * [const AttrStrideSize](#AttrStrideSize)
    * [const AttrUpperBound](#AttrUpperBound)
    * [const AttrAbstractOrigin](#AttrAbstractOrigin)
    * [const AttrAccessibility](#AttrAccessibility)
    * [const AttrAddrClass](#AttrAddrClass)
    * [const AttrArtificial](#AttrArtificial)
    * [const AttrBaseTypes](#AttrBaseTypes)
    * [const AttrCalling](#AttrCalling)
    * [const AttrCount](#AttrCount)
    * [const AttrDataMemberLoc](#AttrDataMemberLoc)
    * [const AttrDeclColumn](#AttrDeclColumn)
    * [const AttrDeclFile](#AttrDeclFile)
    * [const AttrDeclLine](#AttrDeclLine)
    * [const AttrDeclaration](#AttrDeclaration)
    * [const AttrDiscrList](#AttrDiscrList)
    * [const AttrEncoding](#AttrEncoding)
    * [const AttrExternal](#AttrExternal)
    * [const AttrFrameBase](#AttrFrameBase)
    * [const AttrFriend](#AttrFriend)
    * [const AttrIdentifierCase](#AttrIdentifierCase)
    * [const AttrMacroInfo](#AttrMacroInfo)
    * [const AttrNamelistItem](#AttrNamelistItem)
    * [const AttrPriority](#AttrPriority)
    * [const AttrSegment](#AttrSegment)
    * [const AttrSpecification](#AttrSpecification)
    * [const AttrStaticLink](#AttrStaticLink)
    * [const AttrType](#AttrType)
    * [const AttrUseLocation](#AttrUseLocation)
    * [const AttrVarParam](#AttrVarParam)
    * [const AttrVirtuality](#AttrVirtuality)
    * [const AttrVtableElemLoc](#AttrVtableElemLoc)
    * [const AttrAllocated](#AttrAllocated)
    * [const AttrAssociated](#AttrAssociated)
    * [const AttrDataLocation](#AttrDataLocation)
    * [const AttrStride](#AttrStride)
    * [const AttrEntrypc](#AttrEntrypc)
    * [const AttrUseUTF8](#AttrUseUTF8)
    * [const AttrExtension](#AttrExtension)
    * [const AttrRanges](#AttrRanges)
    * [const AttrTrampoline](#AttrTrampoline)
    * [const AttrCallColumn](#AttrCallColumn)
    * [const AttrCallFile](#AttrCallFile)
    * [const AttrCallLine](#AttrCallLine)
    * [const AttrDescription](#AttrDescription)
    * [const AttrBinaryScale](#AttrBinaryScale)
    * [const AttrDecimalScale](#AttrDecimalScale)
    * [const AttrSmall](#AttrSmall)
    * [const AttrDecimalSign](#AttrDecimalSign)
    * [const AttrDigitCount](#AttrDigitCount)
    * [const AttrPictureString](#AttrPictureString)
    * [const AttrMutable](#AttrMutable)
    * [const AttrThreadsScaled](#AttrThreadsScaled)
    * [const AttrExplicit](#AttrExplicit)
    * [const AttrObjectPointer](#AttrObjectPointer)
    * [const AttrEndianity](#AttrEndianity)
    * [const AttrElemental](#AttrElemental)
    * [const AttrPure](#AttrPure)
    * [const AttrRecursive](#AttrRecursive)
    * [const AttrSignature](#AttrSignature)
    * [const AttrMainSubprogram](#AttrMainSubprogram)
    * [const AttrDataBitOffset](#AttrDataBitOffset)
    * [const AttrConstExpr](#AttrConstExpr)
    * [const AttrEnumClass](#AttrEnumClass)
    * [const AttrLinkageName](#AttrLinkageName)
    * [const AttrStringLengthBitSize](#AttrStringLengthBitSize)
    * [const AttrStringLengthByteSize](#AttrStringLengthByteSize)
    * [const AttrRank](#AttrRank)
    * [const AttrStrOffsetsBase](#AttrStrOffsetsBase)
    * [const AttrAddrBase](#AttrAddrBase)
    * [const AttrRnglistsBase](#AttrRnglistsBase)
    * [const AttrDwoName](#AttrDwoName)
    * [const AttrReference](#AttrReference)
    * [const AttrRvalueReference](#AttrRvalueReference)
    * [const AttrMacros](#AttrMacros)
    * [const AttrCallAllCalls](#AttrCallAllCalls)
    * [const AttrCallAllSourceCalls](#AttrCallAllSourceCalls)
    * [const AttrCallAllTailCalls](#AttrCallAllTailCalls)
    * [const AttrCallReturnPC](#AttrCallReturnPC)
    * [const AttrCallValue](#AttrCallValue)
    * [const AttrCallOrigin](#AttrCallOrigin)
    * [const AttrCallParameter](#AttrCallParameter)
    * [const AttrCallPC](#AttrCallPC)
    * [const AttrCallTailCall](#AttrCallTailCall)
    * [const AttrCallTarget](#AttrCallTarget)
    * [const AttrCallTargetClobbered](#AttrCallTargetClobbered)
    * [const AttrCallDataLocation](#AttrCallDataLocation)
    * [const AttrCallDataValue](#AttrCallDataValue)
    * [const AttrNoreturn](#AttrNoreturn)
    * [const AttrAlignment](#AttrAlignment)
    * [const AttrExportSymbols](#AttrExportSymbols)
    * [const AttrDeleted](#AttrDeleted)
    * [const AttrDefaulted](#AttrDefaulted)
    * [const AttrLoclistsBase](#AttrLoclistsBase)
    * [const formAddr](#formAddr)
    * [const formDwarfBlock2](#formDwarfBlock2)
    * [const formDwarfBlock4](#formDwarfBlock4)
    * [const formData2](#formData2)
    * [const formData4](#formData4)
    * [const formData8](#formData8)
    * [const formString](#formString)
    * [const formDwarfBlock](#formDwarfBlock)
    * [const formDwarfBlock1](#formDwarfBlock1)
    * [const formData1](#formData1)
    * [const formFlag](#formFlag)
    * [const formSdata](#formSdata)
    * [const formStrp](#formStrp)
    * [const formUdata](#formUdata)
    * [const formRefAddr](#formRefAddr)
    * [const formRef1](#formRef1)
    * [const formRef2](#formRef2)
    * [const formRef4](#formRef4)
    * [const formRef8](#formRef8)
    * [const formRefUdata](#formRefUdata)
    * [const formIndirect](#formIndirect)
    * [const formSecOffset](#formSecOffset)
    * [const formExprloc](#formExprloc)
    * [const formFlagPresent](#formFlagPresent)
    * [const formRefSig8](#formRefSig8)
    * [const formStrx](#formStrx)
    * [const formAddrx](#formAddrx)
    * [const formRefSup4](#formRefSup4)
    * [const formStrpSup](#formStrpSup)
    * [const formData16](#formData16)
    * [const formLineStrp](#formLineStrp)
    * [const formImplicitConst](#formImplicitConst)
    * [const formLoclistx](#formLoclistx)
    * [const formRnglistx](#formRnglistx)
    * [const formRefSup8](#formRefSup8)
    * [const formStrx1](#formStrx1)
    * [const formStrx2](#formStrx2)
    * [const formStrx3](#formStrx3)
    * [const formStrx4](#formStrx4)
    * [const formAddrx1](#formAddrx1)
    * [const formAddrx2](#formAddrx2)
    * [const formAddrx3](#formAddrx3)
    * [const formAddrx4](#formAddrx4)
    * [const formGnuRefAlt](#formGnuRefAlt)
    * [const formGnuStrpAlt](#formGnuStrpAlt)
    * [const TagArrayType](#TagArrayType)
    * [const TagClassType](#TagClassType)
    * [const TagEntryPoint](#TagEntryPoint)
    * [const TagEnumerationType](#TagEnumerationType)
    * [const TagFormalParameter](#TagFormalParameter)
    * [const TagImportedDeclaration](#TagImportedDeclaration)
    * [const TagLabel](#TagLabel)
    * [const TagLexDwarfBlock](#TagLexDwarfBlock)
    * [const TagMember](#TagMember)
    * [const TagPointerType](#TagPointerType)
    * [const TagReferenceType](#TagReferenceType)
    * [const TagCompileUnit](#TagCompileUnit)
    * [const TagStringType](#TagStringType)
    * [const TagStructType](#TagStructType)
    * [const TagSubroutineType](#TagSubroutineType)
    * [const TagTypedef](#TagTypedef)
    * [const TagUnionType](#TagUnionType)
    * [const TagUnspecifiedParameters](#TagUnspecifiedParameters)
    * [const TagVariant](#TagVariant)
    * [const TagCommonDwarfBlock](#TagCommonDwarfBlock)
    * [const TagCommonInclusion](#TagCommonInclusion)
    * [const TagInheritance](#TagInheritance)
    * [const TagInlinedSubroutine](#TagInlinedSubroutine)
    * [const TagModule](#TagModule)
    * [const TagPtrToMemberType](#TagPtrToMemberType)
    * [const TagSetType](#TagSetType)
    * [const TagSubrangeType](#TagSubrangeType)
    * [const TagWithStmt](#TagWithStmt)
    * [const TagAccessDeclaration](#TagAccessDeclaration)
    * [const TagBaseType](#TagBaseType)
    * [const TagCatchDwarfBlock](#TagCatchDwarfBlock)
    * [const TagConstType](#TagConstType)
    * [const TagConstant](#TagConstant)
    * [const TagEnumerator](#TagEnumerator)
    * [const TagFileType](#TagFileType)
    * [const TagFriend](#TagFriend)
    * [const TagNamelist](#TagNamelist)
    * [const TagNamelistItem](#TagNamelistItem)
    * [const TagPackedType](#TagPackedType)
    * [const TagSubprogram](#TagSubprogram)
    * [const TagTemplateTypeParameter](#TagTemplateTypeParameter)
    * [const TagTemplateValueParameter](#TagTemplateValueParameter)
    * [const TagThrownType](#TagThrownType)
    * [const TagTryDwarfBlock](#TagTryDwarfBlock)
    * [const TagVariantPart](#TagVariantPart)
    * [const TagVariable](#TagVariable)
    * [const TagVolatileType](#TagVolatileType)
    * [const TagDwarfProcedure](#TagDwarfProcedure)
    * [const TagRestrictType](#TagRestrictType)
    * [const TagInterfaceType](#TagInterfaceType)
    * [const TagNamespace](#TagNamespace)
    * [const TagImportedModule](#TagImportedModule)
    * [const TagUnspecifiedType](#TagUnspecifiedType)
    * [const TagPartialUnit](#TagPartialUnit)
    * [const TagImportedUnit](#TagImportedUnit)
    * [const TagMutableType](#TagMutableType)
    * [const TagCondition](#TagCondition)
    * [const TagSharedType](#TagSharedType)
    * [const TagTypeUnit](#TagTypeUnit)
    * [const TagRvalueReferenceType](#TagRvalueReferenceType)
    * [const TagTemplateAlias](#TagTemplateAlias)
    * [const TagCoarrayType](#TagCoarrayType)
    * [const TagGenericSubrange](#TagGenericSubrange)
    * [const TagDynamicType](#TagDynamicType)
    * [const TagAtomicType](#TagAtomicType)
    * [const TagCallSite](#TagCallSite)
    * [const TagCallSiteParameter](#TagCallSiteParameter)
    * [const TagSkeletonUnit](#TagSkeletonUnit)
    * [const TagImmutableType](#TagImmutableType)
    * [const opAddr](#opAddr)
    * [const opDeref](#opDeref)
    * [const opConst1u](#opConst1u)
    * [const opConst1s](#opConst1s)
    * [const opConst2u](#opConst2u)
    * [const opConst2s](#opConst2s)
    * [const opConst4u](#opConst4u)
    * [const opConst4s](#opConst4s)
    * [const opConst8u](#opConst8u)
    * [const opConst8s](#opConst8s)
    * [const opConstu](#opConstu)
    * [const opConsts](#opConsts)
    * [const opDup](#opDup)
    * [const opDrop](#opDrop)
    * [const opOver](#opOver)
    * [const opPick](#opPick)
    * [const opSwap](#opSwap)
    * [const opRot](#opRot)
    * [const opXderef](#opXderef)
    * [const opAbs](#opAbs)
    * [const opAnd](#opAnd)
    * [const opDiv](#opDiv)
    * [const opMinus](#opMinus)
    * [const opMod](#opMod)
    * [const opMul](#opMul)
    * [const opNeg](#opNeg)
    * [const opNot](#opNot)
    * [const opOr](#opOr)
    * [const opPlus](#opPlus)
    * [const opPlusUconst](#opPlusUconst)
    * [const opShl](#opShl)
    * [const opShr](#opShr)
    * [const opShra](#opShra)
    * [const opXor](#opXor)
    * [const opSkip](#opSkip)
    * [const opBra](#opBra)
    * [const opEq](#opEq)
    * [const opGe](#opGe)
    * [const opGt](#opGt)
    * [const opLe](#opLe)
    * [const opLt](#opLt)
    * [const opNe](#opNe)
    * [const opLit0](#opLit0)
    * [const opReg0](#opReg0)
    * [const opBreg0](#opBreg0)
    * [const opRegx](#opRegx)
    * [const opFbreg](#opFbreg)
    * [const opBregx](#opBregx)
    * [const opPiece](#opPiece)
    * [const opDerefSize](#opDerefSize)
    * [const opXderefSize](#opXderefSize)
    * [const opNop](#opNop)
    * [const opPushObjAddr](#opPushObjAddr)
    * [const opCall2](#opCall2)
    * [const opCall4](#opCall4)
    * [const opCallRef](#opCallRef)
    * [const opFormTLSAddress](#opFormTLSAddress)
    * [const opCallFrameCFA](#opCallFrameCFA)
    * [const opBitPiece](#opBitPiece)
    * [const opImplicitValue](#opImplicitValue)
    * [const opStackValue](#opStackValue)
    * [const opImplicitPointer](#opImplicitPointer)
    * [const opAddrx](#opAddrx)
    * [const opConstx](#opConstx)
    * [const opEntryValue](#opEntryValue)
    * [const opConstType](#opConstType)
    * [const opRegvalType](#opRegvalType)
    * [const opDerefType](#opDerefType)
    * [const opXderefType](#opXderefType)
    * [const opConvert](#opConvert)
    * [const opReinterpret](#opReinterpret)
    * [const encAddress](#encAddress)
    * [const encBoolean](#encBoolean)
    * [const encComplexFloat](#encComplexFloat)
    * [const encFloat](#encFloat)
    * [const encSigned](#encSigned)
    * [const encSignedChar](#encSignedChar)
    * [const encUnsigned](#encUnsigned)
    * [const encUnsignedChar](#encUnsignedChar)
    * [const encImaginaryFloat](#encImaginaryFloat)
    * [const encPackedDecimal](#encPackedDecimal)
    * [const encNumericString](#encNumericString)
    * [const encEdited](#encEdited)
    * [const encSignedFixed](#encSignedFixed)
    * [const encUnsignedFixed](#encUnsignedFixed)
    * [const encDecimalFloat](#encDecimalFloat)
    * [const encUTF](#encUTF)
    * [const encUCS](#encUCS)
    * [const encASCII](#encASCII)
    * [const lnsCopy](#lnsCopy)
    * [const lnsAdvancePC](#lnsAdvancePC)
    * [const lnsAdvanceLine](#lnsAdvanceLine)
    * [const lnsSetFile](#lnsSetFile)
    * [const lnsSetColumn](#lnsSetColumn)
    * [const lnsNegateStmt](#lnsNegateStmt)
    * [const lnsSetBasicBlock](#lnsSetBasicBlock)
    * [const lnsConstAddPC](#lnsConstAddPC)
    * [const lnsFixedAdvancePC](#lnsFixedAdvancePC)
    * [const lnsSetPrologueEnd](#lnsSetPrologueEnd)
    * [const lnsSetEpilogueBegin](#lnsSetEpilogueBegin)
    * [const lnsSetISA](#lnsSetISA)
    * [const lneEndSequence](#lneEndSequence)
    * [const lneSetAddress](#lneSetAddress)
    * [const lneDefineFile](#lneDefineFile)
    * [const lneSetDiscriminator](#lneSetDiscriminator)
    * [const lnctPath](#lnctPath)
    * [const lnctDirectoryIndex](#lnctDirectoryIndex)
    * [const lnctTimestamp](#lnctTimestamp)
    * [const lnctSize](#lnctSize)
    * [const lnctMD5](#lnctMD5)
    * [const lleEndOfList](#lleEndOfList)
    * [const lleBaseAddressx](#lleBaseAddressx)
    * [const lleStartxEndx](#lleStartxEndx)
    * [const lleStartxLength](#lleStartxLength)
    * [const lleOffsetPair](#lleOffsetPair)
    * [const lleDefaultLocation](#lleDefaultLocation)
    * [const lleBaseAddress](#lleBaseAddress)
    * [const lleStartEnd](#lleStartEnd)
    * [const lleStartLength](#lleStartLength)
    * [const utCompile](#utCompile)
    * [const utType](#utType)
    * [const utPartial](#utPartial)
    * [const utSkeleton](#utSkeleton)
    * [const utSplitCompile](#utSplitCompile)
    * [const utSplitType](#utSplitType)
    * [const rleEndOfList](#rleEndOfList)
    * [const rleBaseAddressx](#rleBaseAddressx)
    * [const rleStartxEndx](#rleStartxEndx)
    * [const rleStartxLength](#rleStartxLength)
    * [const rleOffsetPair](#rleOffsetPair)
    * [const rleBaseAddress](#rleBaseAddress)
    * [const rleStartEnd](#rleStartEnd)
    * [const rleStartLength](#rleStartLength)
    * [const ClassUnknown](#ClassUnknown)
    * [const ClassAddress](#ClassAddress)
    * [const ClassBlock](#ClassBlock)
    * [const ClassConstant](#ClassConstant)
    * [const ClassExprLoc](#ClassExprLoc)
    * [const ClassFlag](#ClassFlag)
    * [const ClassLinePtr](#ClassLinePtr)
    * [const ClassLocListPtr](#ClassLocListPtr)
    * [const ClassMacPtr](#ClassMacPtr)
    * [const ClassRangeListPtr](#ClassRangeListPtr)
    * [const ClassReference](#ClassReference)
    * [const ClassReferenceSig](#ClassReferenceSig)
    * [const ClassString](#ClassString)
    * [const ClassReferenceAlt](#ClassReferenceAlt)
    * [const ClassStringAlt](#ClassStringAlt)
    * [const ClassAddrPtr](#ClassAddrPtr)
    * [const ClassLocList](#ClassLocList)
    * [const ClassRngList](#ClassRngList)
    * [const ClassRngListsPtr](#ClassRngListsPtr)
    * [const ClassStrOffsetsPtr](#ClassStrOffsetsPtr)
    * [const _Tag_name_0](#_Tag_name_0)
    * [const _Tag_name_1](#_Tag_name_1)
    * [const _Tag_name_2](#_Tag_name_2)
    * [const _Tag_name_3](#_Tag_name_3)
    * [const _Tag_name_4](#_Tag_name_4)
    * [const _Tag_name_5](#_Tag_name_5)
* [Variables](#var)
    * [var _Attr_map](#_Attr_map)
    * [var _Class_index](#_Class_index)
    * [var attrIsExprloc](#attrIsExprloc)
    * [var attrPtrClass](#attrPtrClass)
    * [var knownOpcodeLengths](#knownOpcodeLengths)
    * [var ErrUnknownPC](#ErrUnknownPC)
    * [var errSegmentSelector](#errSegmentSelector)
    * [var _Tag_index_0](#_Tag_index_0)
    * [var _Tag_index_2](#_Tag_index_2)
    * [var _Tag_index_4](#_Tag_index_4)
    * [var _Tag_index_5](#_Tag_index_5)
    * [var PathJoin](#PathJoin)
* [Types](#type)
    * [type buf struct](#buf)
        * [func makeBuf(d *Data, format dataFormat, name string, off Offset, data []byte) buf](#makeBuf)
        * [func (b *buf) uint8() uint8](#buf.uint8)
        * [func (b *buf) bytes(n int) []byte](#buf.bytes)
        * [func (b *buf) skip(n int)](#buf.skip)
        * [func (b *buf) string() string](#buf.string)
        * [func (b *buf) uint16() uint16](#buf.uint16)
        * [func (b *buf) uint24() uint32](#buf.uint24)
        * [func (b *buf) uint32() uint32](#buf.uint32)
        * [func (b *buf) uint64() uint64](#buf.uint64)
        * [func (b *buf) varint() (c uint64, bits uint)](#buf.varint)
        * [func (b *buf) uint() uint64](#buf.uint)
        * [func (b *buf) int() int64](#buf.int)
        * [func (b *buf) addr() uint64](#buf.addr)
        * [func (b *buf) unitLength() (length Offset, dwarf64 bool)](#buf.unitLength)
        * [func (b *buf) error(s string)](#buf.error)
        * [func (b *buf) entry(cu *Entry, atab abbrevTable, ubase Offset, vers int) *Entry](#buf.entry)
    * [type dataFormat interface](#dataFormat)
    * [type unknownFormat struct{}](#unknownFormat)
        * [func (u unknownFormat) version() int](#unknownFormat.version)
        * [func (u unknownFormat) dwarf64() (bool, bool)](#unknownFormat.dwarf64)
        * [func (u unknownFormat) addrsize() int](#unknownFormat.addrsize)
    * [type DecodeError struct](#DecodeError)
        * [func (e DecodeError) Error() string](#DecodeError.Error)
    * [type Attr uint32](#Attr)
        * [func (i Attr) String() string](#Attr.String)
        * [func (a Attr) GoString() string](#Attr.GoString)
    * [type format uint32](#format)
    * [type Tag uint32](#Tag)
        * [func (t Tag) GoString() string](#Tag.GoString)
        * [func (i Tag) String() string](#Tag.String)
    * [type abbrev struct](#abbrev)
    * [type afield struct](#afield)
    * [type abbrevTable map[uint32]dwarf.abbrev](#abbrevTable)
    * [type Entry struct](#Entry)
        * [func (e *Entry) Val(a Attr) interface{}](#Entry.Val)
        * [func (e *Entry) AttrField(a Attr) *Field](#Entry.AttrField)
    * [type Field struct](#Field)
    * [type Class int](#Class)
        * [func formToClass(form format, attr Attr, vers int, b *buf) Class](#formToClass)
        * [func (i Class) String() string](#Class.String)
        * [func (i Class) GoString() string](#Class.GoString)
    * [type Offset uint32](#Offset)
    * [type Reader struct](#Reader)
        * [func (r *Reader) AddressSize() int](#Reader.AddressSize)
        * [func (r *Reader) ByteOrder() binary.ByteOrder](#Reader.ByteOrder)
        * [func (r *Reader) Seek(off Offset)](#Reader.Seek)
        * [func (r *Reader) maybeNextUnit()](#Reader.maybeNextUnit)
        * [func (r *Reader) nextUnit()](#Reader.nextUnit)
        * [func (r *Reader) Next() (*Entry, error)](#Reader.Next)
        * [func (r *Reader) SkipChildren()](#Reader.SkipChildren)
        * [func (r *Reader) clone() typeReader](#Reader.clone)
        * [func (r *Reader) offset() Offset](#Reader.offset)
        * [func (r *Reader) SeekPC(pc uint64) (*Entry, error)](#Reader.SeekPC)
    * [type LineReader struct](#LineReader)
        * [func (r *LineReader) readHeader(compDir string) error](#LineReader.readHeader)
        * [func (r *LineReader) readLNCTFormat() []lnctForm](#LineReader.readLNCTFormat)
        * [func (r *LineReader) readLNCT(s []lnctForm, dwarf64 bool) (path string, mtime uint64, size uint64, err error)](#LineReader.readLNCT)
        * [func (r *LineReader) readFileEntry() (bool, error)](#LineReader.readFileEntry)
        * [func (r *LineReader) updateFile()](#LineReader.updateFile)
        * [func (r *LineReader) Next(entry *LineEntry) error](#LineReader.Next)
        * [func (r *LineReader) step(entry *LineEntry) bool](#LineReader.step)
        * [func (r *LineReader) advancePC(opAdvance int)](#LineReader.advancePC)
        * [func (r *LineReader) Tell() LineReaderPos](#LineReader.Tell)
        * [func (r *LineReader) Seek(pos LineReaderPos)](#LineReader.Seek)
        * [func (r *LineReader) Reset()](#LineReader.Reset)
        * [func (r *LineReader) resetState()](#LineReader.resetState)
        * [func (r *LineReader) Files() []*LineFile](#LineReader.Files)
        * [func (r *LineReader) SeekPC(pc uint64, entry *LineEntry) error](#LineReader.SeekPC)
    * [type LineEntry struct](#LineEntry)
    * [type LineFile struct](#LineFile)
    * [type lnctForm struct](#lnctForm)
    * [type LineReaderPos struct](#LineReaderPos)
    * [type Data struct](#Data)
        * [func New(abbrev, aranges, frame, info, line, pubnames, ranges, str []byte) (*Data, error)](#New)
        * [func (d *Data) parseAbbrev(off uint64, vers int) (abbrevTable, error)](#Data.parseAbbrev)
        * [func (d *Data) Reader() *Reader](#Data.Reader)
        * [func (d *Data) Ranges(e *Entry) ([][2]uint64, error)](#Data.Ranges)
        * [func (d *Data) baseAddressForEntry(e *Entry) (*Entry, uint64, error)](#Data.baseAddressForEntry)
        * [func (d *Data) dwarf2Ranges(u *unit, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)](#Data.dwarf2Ranges)
        * [func (d *Data) dwarf5Ranges(u *unit, cu *Entry, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)](#Data.dwarf5Ranges)
        * [func (d *Data) debugAddr(format dataFormat, addrBase, idx uint64) (uint64, error)](#Data.debugAddr)
        * [func (d *Data) LineReader(cu *Entry) (*LineReader, error)](#Data.LineReader)
        * [func (d *Data) AddTypes(name string, types []byte) error](#Data.AddTypes)
        * [func (d *Data) AddSection(name string, contents []byte) error](#Data.AddSection)
        * [func (d *Data) Type(off Offset) (Type, error)](#Data.Type)
        * [func (d *Data) readType(name string, r typeReader, off Offset, typeCache map[Offset]Type, fixups *typeFixer) (Type, error)](#Data.readType)
        * [func (d *Data) parseTypes(name string, types []byte) error](#Data.parseTypes)
        * [func (d *Data) sigToType(sig uint64) (Type, error)](#Data.sigToType)
        * [func (d *Data) parseUnits() ([]unit, error)](#Data.parseUnits)
        * [func (d *Data) offsetToUnit(off Offset) int](#Data.offsetToUnit)
    * [type Type interface](#Type)
    * [type CommonType struct](#CommonType)
        * [func (c *CommonType) Common() *CommonType](#CommonType.Common)
        * [func (c *CommonType) Size() int64](#CommonType.Size)
    * [type BasicType struct](#BasicType)
        * [func (b *BasicType) Basic() *BasicType](#BasicType.Basic)
        * [func (t *BasicType) String() string](#BasicType.String)
    * [type CharType struct](#CharType)
    * [type UcharType struct](#UcharType)
    * [type IntType struct](#IntType)
    * [type UintType struct](#UintType)
    * [type FloatType struct](#FloatType)
    * [type ComplexType struct](#ComplexType)
    * [type BoolType struct](#BoolType)
    * [type AddrType struct](#AddrType)
    * [type UnspecifiedType struct](#UnspecifiedType)
    * [type QualType struct](#QualType)
        * [func (t *QualType) String() string](#QualType.String)
        * [func (t *QualType) Size() int64](#QualType.Size)
    * [type ArrayType struct](#ArrayType)
        * [func (t *ArrayType) String() string](#ArrayType.String)
        * [func (t *ArrayType) Size() int64](#ArrayType.Size)
    * [type VoidType struct](#VoidType)
        * [func (t *VoidType) String() string](#VoidType.String)
    * [type PtrType struct](#PtrType)
        * [func (t *PtrType) String() string](#PtrType.String)
    * [type StructType struct](#StructType)
        * [func (t *StructType) String() string](#StructType.String)
        * [func (t *StructType) Defn() string](#StructType.Defn)
    * [type StructField struct](#StructField)
    * [type EnumType struct](#EnumType)
        * [func (t *EnumType) String() string](#EnumType.String)
    * [type EnumValue struct](#EnumValue)
    * [type FuncType struct](#FuncType)
        * [func (t *FuncType) String() string](#FuncType.String)
    * [type DotDotDotType struct](#DotDotDotType)
        * [func (t *DotDotDotType) String() string](#DotDotDotType.String)
    * [type TypedefType struct](#TypedefType)
        * [func (t *TypedefType) String() string](#TypedefType.String)
        * [func (t *TypedefType) Size() int64](#TypedefType.Size)
    * [type UnsupportedType struct](#UnsupportedType)
        * [func (t *UnsupportedType) String() string](#UnsupportedType.String)
    * [type typeReader interface](#typeReader)
    * [type typeFixer struct](#typeFixer)
        * [func (tf *typeFixer) recordArrayType(t *Type)](#typeFixer.recordArrayType)
        * [func (tf *typeFixer) apply()](#typeFixer.apply)
    * [type typeUnit struct](#typeUnit)
    * [type typeUnitReader struct](#typeUnitReader)
        * [func (tur *typeUnitReader) Seek(off Offset)](#typeUnitReader.Seek)
        * [func (tur *typeUnitReader) AddressSize() int](#typeUnitReader.AddressSize)
        * [func (tur *typeUnitReader) Next() (*Entry, error)](#typeUnitReader.Next)
        * [func (tur *typeUnitReader) clone() typeReader](#typeUnitReader.clone)
        * [func (tur *typeUnitReader) offset() Offset](#typeUnitReader.offset)
    * [type unit struct](#unit)
        * [func (u *unit) version() int](#unit.version)
        * [func (u *unit) dwarf64() (bool, bool)](#unit.dwarf64)
        * [func (u *unit) addrsize() int](#unit.addrsize)
* [Functions](#func)
    * [func _()](#_)
    * [func _()](#_)
    * [func pathIsAbs(path string) bool](#pathIsAbs)
    * [func pathJoin(dirname, filename string) string](#pathJoin)
    * [func splitDrive(path string) (drive, rest string)](#splitDrive)
    * [func _()](#_)
    * [func zeroArray(t *Type)](#zeroArray)
    * [func TestDwarf5Ranges(t *testing.T)](#TestDwarf5Ranges)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="_Attr_name" href="#_Attr_name">const _Attr_name</a>

```
searchKey: dwarf._Attr_name
```

```Go
const _Attr_name = ...
```

### <a id="_Class_name" href="#_Class_name">const _Class_name</a>

```
searchKey: dwarf._Class_name
```

```Go
const _Class_name = ...
```

### <a id="AttrSibling" href="#AttrSibling">const AttrSibling</a>

```
searchKey: dwarf.AttrSibling
tags: [exported]
```

```Go
const AttrSibling Attr = 0x01
```

### <a id="AttrLocation" href="#AttrLocation">const AttrLocation</a>

```
searchKey: dwarf.AttrLocation
tags: [exported]
```

```Go
const AttrLocation Attr = 0x02
```

### <a id="AttrName" href="#AttrName">const AttrName</a>

```
searchKey: dwarf.AttrName
tags: [exported]
```

```Go
const AttrName Attr = 0x03
```

### <a id="AttrOrdering" href="#AttrOrdering">const AttrOrdering</a>

```
searchKey: dwarf.AttrOrdering
tags: [exported]
```

```Go
const AttrOrdering Attr = 0x09
```

### <a id="AttrByteSize" href="#AttrByteSize">const AttrByteSize</a>

```
searchKey: dwarf.AttrByteSize
tags: [exported]
```

```Go
const AttrByteSize Attr = 0x0B
```

### <a id="AttrBitOffset" href="#AttrBitOffset">const AttrBitOffset</a>

```
searchKey: dwarf.AttrBitOffset
tags: [exported]
```

```Go
const AttrBitOffset Attr = 0x0C
```

### <a id="AttrBitSize" href="#AttrBitSize">const AttrBitSize</a>

```
searchKey: dwarf.AttrBitSize
tags: [exported]
```

```Go
const AttrBitSize Attr = 0x0D
```

### <a id="AttrStmtList" href="#AttrStmtList">const AttrStmtList</a>

```
searchKey: dwarf.AttrStmtList
tags: [exported]
```

```Go
const AttrStmtList Attr = 0x10
```

### <a id="AttrLowpc" href="#AttrLowpc">const AttrLowpc</a>

```
searchKey: dwarf.AttrLowpc
tags: [exported]
```

```Go
const AttrLowpc Attr = 0x11
```

### <a id="AttrHighpc" href="#AttrHighpc">const AttrHighpc</a>

```
searchKey: dwarf.AttrHighpc
tags: [exported]
```

```Go
const AttrHighpc Attr = 0x12
```

### <a id="AttrLanguage" href="#AttrLanguage">const AttrLanguage</a>

```
searchKey: dwarf.AttrLanguage
tags: [exported]
```

```Go
const AttrLanguage Attr = 0x13
```

### <a id="AttrDiscr" href="#AttrDiscr">const AttrDiscr</a>

```
searchKey: dwarf.AttrDiscr
tags: [exported]
```

```Go
const AttrDiscr Attr = 0x15
```

### <a id="AttrDiscrValue" href="#AttrDiscrValue">const AttrDiscrValue</a>

```
searchKey: dwarf.AttrDiscrValue
tags: [exported]
```

```Go
const AttrDiscrValue Attr = 0x16
```

### <a id="AttrVisibility" href="#AttrVisibility">const AttrVisibility</a>

```
searchKey: dwarf.AttrVisibility
tags: [exported]
```

```Go
const AttrVisibility Attr = 0x17
```

### <a id="AttrImport" href="#AttrImport">const AttrImport</a>

```
searchKey: dwarf.AttrImport
tags: [exported]
```

```Go
const AttrImport Attr = 0x18
```

### <a id="AttrStringLength" href="#AttrStringLength">const AttrStringLength</a>

```
searchKey: dwarf.AttrStringLength
tags: [exported]
```

```Go
const AttrStringLength Attr = 0x19
```

### <a id="AttrCommonRef" href="#AttrCommonRef">const AttrCommonRef</a>

```
searchKey: dwarf.AttrCommonRef
tags: [exported]
```

```Go
const AttrCommonRef Attr = 0x1A
```

### <a id="AttrCompDir" href="#AttrCompDir">const AttrCompDir</a>

```
searchKey: dwarf.AttrCompDir
tags: [exported]
```

```Go
const AttrCompDir Attr = 0x1B
```

### <a id="AttrConstValue" href="#AttrConstValue">const AttrConstValue</a>

```
searchKey: dwarf.AttrConstValue
tags: [exported]
```

```Go
const AttrConstValue Attr = 0x1C
```

### <a id="AttrContainingType" href="#AttrContainingType">const AttrContainingType</a>

```
searchKey: dwarf.AttrContainingType
tags: [exported]
```

```Go
const AttrContainingType Attr = 0x1D
```

### <a id="AttrDefaultValue" href="#AttrDefaultValue">const AttrDefaultValue</a>

```
searchKey: dwarf.AttrDefaultValue
tags: [exported]
```

```Go
const AttrDefaultValue Attr = 0x1E
```

### <a id="AttrInline" href="#AttrInline">const AttrInline</a>

```
searchKey: dwarf.AttrInline
tags: [exported]
```

```Go
const AttrInline Attr = 0x20
```

### <a id="AttrIsOptional" href="#AttrIsOptional">const AttrIsOptional</a>

```
searchKey: dwarf.AttrIsOptional
tags: [exported]
```

```Go
const AttrIsOptional Attr = 0x21
```

### <a id="AttrLowerBound" href="#AttrLowerBound">const AttrLowerBound</a>

```
searchKey: dwarf.AttrLowerBound
tags: [exported]
```

```Go
const AttrLowerBound Attr = 0x22
```

### <a id="AttrProducer" href="#AttrProducer">const AttrProducer</a>

```
searchKey: dwarf.AttrProducer
tags: [exported]
```

```Go
const AttrProducer Attr = 0x25
```

### <a id="AttrPrototyped" href="#AttrPrototyped">const AttrPrototyped</a>

```
searchKey: dwarf.AttrPrototyped
tags: [exported]
```

```Go
const AttrPrototyped Attr = 0x27
```

### <a id="AttrReturnAddr" href="#AttrReturnAddr">const AttrReturnAddr</a>

```
searchKey: dwarf.AttrReturnAddr
tags: [exported]
```

```Go
const AttrReturnAddr Attr = 0x2A
```

### <a id="AttrStartScope" href="#AttrStartScope">const AttrStartScope</a>

```
searchKey: dwarf.AttrStartScope
tags: [exported]
```

```Go
const AttrStartScope Attr = 0x2C
```

### <a id="AttrStrideSize" href="#AttrStrideSize">const AttrStrideSize</a>

```
searchKey: dwarf.AttrStrideSize
tags: [exported]
```

```Go
const AttrStrideSize Attr = 0x2E
```

### <a id="AttrUpperBound" href="#AttrUpperBound">const AttrUpperBound</a>

```
searchKey: dwarf.AttrUpperBound
tags: [exported]
```

```Go
const AttrUpperBound Attr = 0x2F
```

### <a id="AttrAbstractOrigin" href="#AttrAbstractOrigin">const AttrAbstractOrigin</a>

```
searchKey: dwarf.AttrAbstractOrigin
tags: [exported]
```

```Go
const AttrAbstractOrigin Attr = 0x31
```

### <a id="AttrAccessibility" href="#AttrAccessibility">const AttrAccessibility</a>

```
searchKey: dwarf.AttrAccessibility
tags: [exported]
```

```Go
const AttrAccessibility Attr = 0x32
```

### <a id="AttrAddrClass" href="#AttrAddrClass">const AttrAddrClass</a>

```
searchKey: dwarf.AttrAddrClass
tags: [exported]
```

```Go
const AttrAddrClass Attr = 0x33
```

### <a id="AttrArtificial" href="#AttrArtificial">const AttrArtificial</a>

```
searchKey: dwarf.AttrArtificial
tags: [exported]
```

```Go
const AttrArtificial Attr = 0x34
```

### <a id="AttrBaseTypes" href="#AttrBaseTypes">const AttrBaseTypes</a>

```
searchKey: dwarf.AttrBaseTypes
tags: [exported]
```

```Go
const AttrBaseTypes Attr = 0x35
```

### <a id="AttrCalling" href="#AttrCalling">const AttrCalling</a>

```
searchKey: dwarf.AttrCalling
tags: [exported]
```

```Go
const AttrCalling Attr = 0x36
```

### <a id="AttrCount" href="#AttrCount">const AttrCount</a>

```
searchKey: dwarf.AttrCount
tags: [exported]
```

```Go
const AttrCount Attr = 0x37
```

### <a id="AttrDataMemberLoc" href="#AttrDataMemberLoc">const AttrDataMemberLoc</a>

```
searchKey: dwarf.AttrDataMemberLoc
tags: [exported]
```

```Go
const AttrDataMemberLoc Attr = 0x38
```

### <a id="AttrDeclColumn" href="#AttrDeclColumn">const AttrDeclColumn</a>

```
searchKey: dwarf.AttrDeclColumn
tags: [exported]
```

```Go
const AttrDeclColumn Attr = 0x39
```

### <a id="AttrDeclFile" href="#AttrDeclFile">const AttrDeclFile</a>

```
searchKey: dwarf.AttrDeclFile
tags: [exported]
```

```Go
const AttrDeclFile Attr = 0x3A
```

### <a id="AttrDeclLine" href="#AttrDeclLine">const AttrDeclLine</a>

```
searchKey: dwarf.AttrDeclLine
tags: [exported]
```

```Go
const AttrDeclLine Attr = 0x3B
```

### <a id="AttrDeclaration" href="#AttrDeclaration">const AttrDeclaration</a>

```
searchKey: dwarf.AttrDeclaration
tags: [exported]
```

```Go
const AttrDeclaration Attr = 0x3C
```

### <a id="AttrDiscrList" href="#AttrDiscrList">const AttrDiscrList</a>

```
searchKey: dwarf.AttrDiscrList
tags: [exported]
```

```Go
const AttrDiscrList Attr = 0x3D
```

### <a id="AttrEncoding" href="#AttrEncoding">const AttrEncoding</a>

```
searchKey: dwarf.AttrEncoding
tags: [exported]
```

```Go
const AttrEncoding Attr = 0x3E
```

### <a id="AttrExternal" href="#AttrExternal">const AttrExternal</a>

```
searchKey: dwarf.AttrExternal
tags: [exported]
```

```Go
const AttrExternal Attr = 0x3F
```

### <a id="AttrFrameBase" href="#AttrFrameBase">const AttrFrameBase</a>

```
searchKey: dwarf.AttrFrameBase
tags: [exported]
```

```Go
const AttrFrameBase Attr = 0x40
```

### <a id="AttrFriend" href="#AttrFriend">const AttrFriend</a>

```
searchKey: dwarf.AttrFriend
tags: [exported]
```

```Go
const AttrFriend Attr = 0x41
```

### <a id="AttrIdentifierCase" href="#AttrIdentifierCase">const AttrIdentifierCase</a>

```
searchKey: dwarf.AttrIdentifierCase
tags: [exported]
```

```Go
const AttrIdentifierCase Attr = 0x42
```

### <a id="AttrMacroInfo" href="#AttrMacroInfo">const AttrMacroInfo</a>

```
searchKey: dwarf.AttrMacroInfo
tags: [exported]
```

```Go
const AttrMacroInfo Attr = 0x43
```

### <a id="AttrNamelistItem" href="#AttrNamelistItem">const AttrNamelistItem</a>

```
searchKey: dwarf.AttrNamelistItem
tags: [exported]
```

```Go
const AttrNamelistItem Attr = 0x44
```

### <a id="AttrPriority" href="#AttrPriority">const AttrPriority</a>

```
searchKey: dwarf.AttrPriority
tags: [exported]
```

```Go
const AttrPriority Attr = 0x45
```

### <a id="AttrSegment" href="#AttrSegment">const AttrSegment</a>

```
searchKey: dwarf.AttrSegment
tags: [exported]
```

```Go
const AttrSegment Attr = 0x46
```

### <a id="AttrSpecification" href="#AttrSpecification">const AttrSpecification</a>

```
searchKey: dwarf.AttrSpecification
tags: [exported]
```

```Go
const AttrSpecification Attr = 0x47
```

### <a id="AttrStaticLink" href="#AttrStaticLink">const AttrStaticLink</a>

```
searchKey: dwarf.AttrStaticLink
tags: [exported]
```

```Go
const AttrStaticLink Attr = 0x48
```

### <a id="AttrType" href="#AttrType">const AttrType</a>

```
searchKey: dwarf.AttrType
tags: [exported]
```

```Go
const AttrType Attr = 0x49
```

### <a id="AttrUseLocation" href="#AttrUseLocation">const AttrUseLocation</a>

```
searchKey: dwarf.AttrUseLocation
tags: [exported]
```

```Go
const AttrUseLocation Attr = 0x4A
```

### <a id="AttrVarParam" href="#AttrVarParam">const AttrVarParam</a>

```
searchKey: dwarf.AttrVarParam
tags: [exported]
```

```Go
const AttrVarParam Attr = 0x4B
```

### <a id="AttrVirtuality" href="#AttrVirtuality">const AttrVirtuality</a>

```
searchKey: dwarf.AttrVirtuality
tags: [exported]
```

```Go
const AttrVirtuality Attr = 0x4C
```

### <a id="AttrVtableElemLoc" href="#AttrVtableElemLoc">const AttrVtableElemLoc</a>

```
searchKey: dwarf.AttrVtableElemLoc
tags: [exported]
```

```Go
const AttrVtableElemLoc Attr = 0x4D
```

### <a id="AttrAllocated" href="#AttrAllocated">const AttrAllocated</a>

```
searchKey: dwarf.AttrAllocated
tags: [exported]
```

```Go
const AttrAllocated Attr = 0x4E
```

The following are new in DWARF 3. 

### <a id="AttrAssociated" href="#AttrAssociated">const AttrAssociated</a>

```
searchKey: dwarf.AttrAssociated
tags: [exported]
```

```Go
const AttrAssociated Attr = 0x4F
```

### <a id="AttrDataLocation" href="#AttrDataLocation">const AttrDataLocation</a>

```
searchKey: dwarf.AttrDataLocation
tags: [exported]
```

```Go
const AttrDataLocation Attr = 0x50
```

### <a id="AttrStride" href="#AttrStride">const AttrStride</a>

```
searchKey: dwarf.AttrStride
tags: [exported]
```

```Go
const AttrStride Attr = 0x51
```

### <a id="AttrEntrypc" href="#AttrEntrypc">const AttrEntrypc</a>

```
searchKey: dwarf.AttrEntrypc
tags: [exported]
```

```Go
const AttrEntrypc Attr = 0x52
```

### <a id="AttrUseUTF8" href="#AttrUseUTF8">const AttrUseUTF8</a>

```
searchKey: dwarf.AttrUseUTF8
tags: [exported]
```

```Go
const AttrUseUTF8 Attr = 0x53
```

### <a id="AttrExtension" href="#AttrExtension">const AttrExtension</a>

```
searchKey: dwarf.AttrExtension
tags: [exported]
```

```Go
const AttrExtension Attr = 0x54
```

### <a id="AttrRanges" href="#AttrRanges">const AttrRanges</a>

```
searchKey: dwarf.AttrRanges
tags: [exported]
```

```Go
const AttrRanges Attr = 0x55
```

### <a id="AttrTrampoline" href="#AttrTrampoline">const AttrTrampoline</a>

```
searchKey: dwarf.AttrTrampoline
tags: [exported]
```

```Go
const AttrTrampoline Attr = 0x56
```

### <a id="AttrCallColumn" href="#AttrCallColumn">const AttrCallColumn</a>

```
searchKey: dwarf.AttrCallColumn
tags: [exported]
```

```Go
const AttrCallColumn Attr = 0x57
```

### <a id="AttrCallFile" href="#AttrCallFile">const AttrCallFile</a>

```
searchKey: dwarf.AttrCallFile
tags: [exported]
```

```Go
const AttrCallFile Attr = 0x58
```

### <a id="AttrCallLine" href="#AttrCallLine">const AttrCallLine</a>

```
searchKey: dwarf.AttrCallLine
tags: [exported]
```

```Go
const AttrCallLine Attr = 0x59
```

### <a id="AttrDescription" href="#AttrDescription">const AttrDescription</a>

```
searchKey: dwarf.AttrDescription
tags: [exported]
```

```Go
const AttrDescription Attr = 0x5A
```

### <a id="AttrBinaryScale" href="#AttrBinaryScale">const AttrBinaryScale</a>

```
searchKey: dwarf.AttrBinaryScale
tags: [exported]
```

```Go
const AttrBinaryScale Attr = 0x5B
```

### <a id="AttrDecimalScale" href="#AttrDecimalScale">const AttrDecimalScale</a>

```
searchKey: dwarf.AttrDecimalScale
tags: [exported]
```

```Go
const AttrDecimalScale Attr = 0x5C
```

### <a id="AttrSmall" href="#AttrSmall">const AttrSmall</a>

```
searchKey: dwarf.AttrSmall
tags: [exported]
```

```Go
const AttrSmall Attr = 0x5D
```

### <a id="AttrDecimalSign" href="#AttrDecimalSign">const AttrDecimalSign</a>

```
searchKey: dwarf.AttrDecimalSign
tags: [exported]
```

```Go
const AttrDecimalSign Attr = 0x5E
```

### <a id="AttrDigitCount" href="#AttrDigitCount">const AttrDigitCount</a>

```
searchKey: dwarf.AttrDigitCount
tags: [exported]
```

```Go
const AttrDigitCount Attr = 0x5F
```

### <a id="AttrPictureString" href="#AttrPictureString">const AttrPictureString</a>

```
searchKey: dwarf.AttrPictureString
tags: [exported]
```

```Go
const AttrPictureString Attr = 0x60
```

### <a id="AttrMutable" href="#AttrMutable">const AttrMutable</a>

```
searchKey: dwarf.AttrMutable
tags: [exported]
```

```Go
const AttrMutable Attr = 0x61
```

### <a id="AttrThreadsScaled" href="#AttrThreadsScaled">const AttrThreadsScaled</a>

```
searchKey: dwarf.AttrThreadsScaled
tags: [exported]
```

```Go
const AttrThreadsScaled Attr = 0x62
```

### <a id="AttrExplicit" href="#AttrExplicit">const AttrExplicit</a>

```
searchKey: dwarf.AttrExplicit
tags: [exported]
```

```Go
const AttrExplicit Attr = 0x63
```

### <a id="AttrObjectPointer" href="#AttrObjectPointer">const AttrObjectPointer</a>

```
searchKey: dwarf.AttrObjectPointer
tags: [exported]
```

```Go
const AttrObjectPointer Attr = 0x64
```

### <a id="AttrEndianity" href="#AttrEndianity">const AttrEndianity</a>

```
searchKey: dwarf.AttrEndianity
tags: [exported]
```

```Go
const AttrEndianity Attr = 0x65
```

### <a id="AttrElemental" href="#AttrElemental">const AttrElemental</a>

```
searchKey: dwarf.AttrElemental
tags: [exported]
```

```Go
const AttrElemental Attr = 0x66
```

### <a id="AttrPure" href="#AttrPure">const AttrPure</a>

```
searchKey: dwarf.AttrPure
tags: [exported]
```

```Go
const AttrPure Attr = 0x67
```

### <a id="AttrRecursive" href="#AttrRecursive">const AttrRecursive</a>

```
searchKey: dwarf.AttrRecursive
tags: [exported]
```

```Go
const AttrRecursive Attr = 0x68
```

### <a id="AttrSignature" href="#AttrSignature">const AttrSignature</a>

```
searchKey: dwarf.AttrSignature
tags: [exported]
```

```Go
const AttrSignature Attr = 0x69
```

The following are new in DWARF 4. 

### <a id="AttrMainSubprogram" href="#AttrMainSubprogram">const AttrMainSubprogram</a>

```
searchKey: dwarf.AttrMainSubprogram
tags: [exported]
```

```Go
const AttrMainSubprogram Attr = 0x6A
```

### <a id="AttrDataBitOffset" href="#AttrDataBitOffset">const AttrDataBitOffset</a>

```
searchKey: dwarf.AttrDataBitOffset
tags: [exported]
```

```Go
const AttrDataBitOffset Attr = 0x6B
```

### <a id="AttrConstExpr" href="#AttrConstExpr">const AttrConstExpr</a>

```
searchKey: dwarf.AttrConstExpr
tags: [exported]
```

```Go
const AttrConstExpr Attr = 0x6C
```

### <a id="AttrEnumClass" href="#AttrEnumClass">const AttrEnumClass</a>

```
searchKey: dwarf.AttrEnumClass
tags: [exported]
```

```Go
const AttrEnumClass Attr = 0x6D
```

### <a id="AttrLinkageName" href="#AttrLinkageName">const AttrLinkageName</a>

```
searchKey: dwarf.AttrLinkageName
tags: [exported]
```

```Go
const AttrLinkageName Attr = 0x6E
```

### <a id="AttrStringLengthBitSize" href="#AttrStringLengthBitSize">const AttrStringLengthBitSize</a>

```
searchKey: dwarf.AttrStringLengthBitSize
tags: [exported]
```

```Go
const AttrStringLengthBitSize Attr = 0x6F
```

The following are new in DWARF 5. 

### <a id="AttrStringLengthByteSize" href="#AttrStringLengthByteSize">const AttrStringLengthByteSize</a>

```
searchKey: dwarf.AttrStringLengthByteSize
tags: [exported]
```

```Go
const AttrStringLengthByteSize Attr = 0x70
```

### <a id="AttrRank" href="#AttrRank">const AttrRank</a>

```
searchKey: dwarf.AttrRank
tags: [exported]
```

```Go
const AttrRank Attr = 0x71
```

### <a id="AttrStrOffsetsBase" href="#AttrStrOffsetsBase">const AttrStrOffsetsBase</a>

```
searchKey: dwarf.AttrStrOffsetsBase
tags: [exported]
```

```Go
const AttrStrOffsetsBase Attr = 0x72
```

### <a id="AttrAddrBase" href="#AttrAddrBase">const AttrAddrBase</a>

```
searchKey: dwarf.AttrAddrBase
tags: [exported]
```

```Go
const AttrAddrBase Attr = 0x73
```

### <a id="AttrRnglistsBase" href="#AttrRnglistsBase">const AttrRnglistsBase</a>

```
searchKey: dwarf.AttrRnglistsBase
tags: [exported]
```

```Go
const AttrRnglistsBase Attr = 0x74
```

### <a id="AttrDwoName" href="#AttrDwoName">const AttrDwoName</a>

```
searchKey: dwarf.AttrDwoName
tags: [exported]
```

```Go
const AttrDwoName Attr = 0x76
```

### <a id="AttrReference" href="#AttrReference">const AttrReference</a>

```
searchKey: dwarf.AttrReference
tags: [exported]
```

```Go
const AttrReference Attr = 0x77
```

### <a id="AttrRvalueReference" href="#AttrRvalueReference">const AttrRvalueReference</a>

```
searchKey: dwarf.AttrRvalueReference
tags: [exported]
```

```Go
const AttrRvalueReference Attr = 0x78
```

### <a id="AttrMacros" href="#AttrMacros">const AttrMacros</a>

```
searchKey: dwarf.AttrMacros
tags: [exported]
```

```Go
const AttrMacros Attr = 0x79
```

### <a id="AttrCallAllCalls" href="#AttrCallAllCalls">const AttrCallAllCalls</a>

```
searchKey: dwarf.AttrCallAllCalls
tags: [exported]
```

```Go
const AttrCallAllCalls Attr = 0x7A
```

### <a id="AttrCallAllSourceCalls" href="#AttrCallAllSourceCalls">const AttrCallAllSourceCalls</a>

```
searchKey: dwarf.AttrCallAllSourceCalls
tags: [exported]
```

```Go
const AttrCallAllSourceCalls Attr = 0x7B
```

### <a id="AttrCallAllTailCalls" href="#AttrCallAllTailCalls">const AttrCallAllTailCalls</a>

```
searchKey: dwarf.AttrCallAllTailCalls
tags: [exported]
```

```Go
const AttrCallAllTailCalls Attr = 0x7C
```

### <a id="AttrCallReturnPC" href="#AttrCallReturnPC">const AttrCallReturnPC</a>

```
searchKey: dwarf.AttrCallReturnPC
tags: [exported]
```

```Go
const AttrCallReturnPC Attr = 0x7D
```

### <a id="AttrCallValue" href="#AttrCallValue">const AttrCallValue</a>

```
searchKey: dwarf.AttrCallValue
tags: [exported]
```

```Go
const AttrCallValue Attr = 0x7E
```

### <a id="AttrCallOrigin" href="#AttrCallOrigin">const AttrCallOrigin</a>

```
searchKey: dwarf.AttrCallOrigin
tags: [exported]
```

```Go
const AttrCallOrigin Attr = 0x7F
```

### <a id="AttrCallParameter" href="#AttrCallParameter">const AttrCallParameter</a>

```
searchKey: dwarf.AttrCallParameter
tags: [exported]
```

```Go
const AttrCallParameter Attr = 0x80
```

### <a id="AttrCallPC" href="#AttrCallPC">const AttrCallPC</a>

```
searchKey: dwarf.AttrCallPC
tags: [exported]
```

```Go
const AttrCallPC Attr = 0x81
```

### <a id="AttrCallTailCall" href="#AttrCallTailCall">const AttrCallTailCall</a>

```
searchKey: dwarf.AttrCallTailCall
tags: [exported]
```

```Go
const AttrCallTailCall Attr = 0x82
```

### <a id="AttrCallTarget" href="#AttrCallTarget">const AttrCallTarget</a>

```
searchKey: dwarf.AttrCallTarget
tags: [exported]
```

```Go
const AttrCallTarget Attr = 0x83
```

### <a id="AttrCallTargetClobbered" href="#AttrCallTargetClobbered">const AttrCallTargetClobbered</a>

```
searchKey: dwarf.AttrCallTargetClobbered
tags: [exported]
```

```Go
const AttrCallTargetClobbered Attr = 0x84
```

### <a id="AttrCallDataLocation" href="#AttrCallDataLocation">const AttrCallDataLocation</a>

```
searchKey: dwarf.AttrCallDataLocation
tags: [exported]
```

```Go
const AttrCallDataLocation Attr = 0x85
```

### <a id="AttrCallDataValue" href="#AttrCallDataValue">const AttrCallDataValue</a>

```
searchKey: dwarf.AttrCallDataValue
tags: [exported]
```

```Go
const AttrCallDataValue Attr = 0x86
```

### <a id="AttrNoreturn" href="#AttrNoreturn">const AttrNoreturn</a>

```
searchKey: dwarf.AttrNoreturn
tags: [exported]
```

```Go
const AttrNoreturn Attr = 0x87
```

### <a id="AttrAlignment" href="#AttrAlignment">const AttrAlignment</a>

```
searchKey: dwarf.AttrAlignment
tags: [exported]
```

```Go
const AttrAlignment Attr = 0x88
```

### <a id="AttrExportSymbols" href="#AttrExportSymbols">const AttrExportSymbols</a>

```
searchKey: dwarf.AttrExportSymbols
tags: [exported]
```

```Go
const AttrExportSymbols Attr = 0x89
```

### <a id="AttrDeleted" href="#AttrDeleted">const AttrDeleted</a>

```
searchKey: dwarf.AttrDeleted
tags: [exported]
```

```Go
const AttrDeleted Attr = 0x8A
```

### <a id="AttrDefaulted" href="#AttrDefaulted">const AttrDefaulted</a>

```
searchKey: dwarf.AttrDefaulted
tags: [exported]
```

```Go
const AttrDefaulted Attr = 0x8B
```

### <a id="AttrLoclistsBase" href="#AttrLoclistsBase">const AttrLoclistsBase</a>

```
searchKey: dwarf.AttrLoclistsBase
tags: [exported]
```

```Go
const AttrLoclistsBase Attr = 0x8C
```

### <a id="formAddr" href="#formAddr">const formAddr</a>

```
searchKey: dwarf.formAddr
```

```Go
const formAddr format = 0x01
```

value formats 

### <a id="formDwarfBlock2" href="#formDwarfBlock2">const formDwarfBlock2</a>

```
searchKey: dwarf.formDwarfBlock2
```

```Go
const formDwarfBlock2 format = 0x03
```

### <a id="formDwarfBlock4" href="#formDwarfBlock4">const formDwarfBlock4</a>

```
searchKey: dwarf.formDwarfBlock4
```

```Go
const formDwarfBlock4 format = 0x04
```

### <a id="formData2" href="#formData2">const formData2</a>

```
searchKey: dwarf.formData2
```

```Go
const formData2 format = 0x05
```

### <a id="formData4" href="#formData4">const formData4</a>

```
searchKey: dwarf.formData4
```

```Go
const formData4 format = 0x06
```

### <a id="formData8" href="#formData8">const formData8</a>

```
searchKey: dwarf.formData8
```

```Go
const formData8 format = 0x07
```

### <a id="formString" href="#formString">const formString</a>

```
searchKey: dwarf.formString
```

```Go
const formString format = 0x08
```

### <a id="formDwarfBlock" href="#formDwarfBlock">const formDwarfBlock</a>

```
searchKey: dwarf.formDwarfBlock
```

```Go
const formDwarfBlock format = 0x09
```

### <a id="formDwarfBlock1" href="#formDwarfBlock1">const formDwarfBlock1</a>

```
searchKey: dwarf.formDwarfBlock1
```

```Go
const formDwarfBlock1 format = 0x0A
```

### <a id="formData1" href="#formData1">const formData1</a>

```
searchKey: dwarf.formData1
```

```Go
const formData1 format = 0x0B
```

### <a id="formFlag" href="#formFlag">const formFlag</a>

```
searchKey: dwarf.formFlag
```

```Go
const formFlag format = 0x0C
```

### <a id="formSdata" href="#formSdata">const formSdata</a>

```
searchKey: dwarf.formSdata
```

```Go
const formSdata format = 0x0D
```

### <a id="formStrp" href="#formStrp">const formStrp</a>

```
searchKey: dwarf.formStrp
```

```Go
const formStrp format = 0x0E
```

### <a id="formUdata" href="#formUdata">const formUdata</a>

```
searchKey: dwarf.formUdata
```

```Go
const formUdata format = 0x0F
```

### <a id="formRefAddr" href="#formRefAddr">const formRefAddr</a>

```
searchKey: dwarf.formRefAddr
```

```Go
const formRefAddr format = 0x10
```

### <a id="formRef1" href="#formRef1">const formRef1</a>

```
searchKey: dwarf.formRef1
```

```Go
const formRef1 format = 0x11
```

### <a id="formRef2" href="#formRef2">const formRef2</a>

```
searchKey: dwarf.formRef2
```

```Go
const formRef2 format = 0x12
```

### <a id="formRef4" href="#formRef4">const formRef4</a>

```
searchKey: dwarf.formRef4
```

```Go
const formRef4 format = 0x13
```

### <a id="formRef8" href="#formRef8">const formRef8</a>

```
searchKey: dwarf.formRef8
```

```Go
const formRef8 format = 0x14
```

### <a id="formRefUdata" href="#formRefUdata">const formRefUdata</a>

```
searchKey: dwarf.formRefUdata
```

```Go
const formRefUdata format = 0x15
```

### <a id="formIndirect" href="#formIndirect">const formIndirect</a>

```
searchKey: dwarf.formIndirect
```

```Go
const formIndirect format = 0x16
```

### <a id="formSecOffset" href="#formSecOffset">const formSecOffset</a>

```
searchKey: dwarf.formSecOffset
```

```Go
const formSecOffset format = 0x17
```

The following are new in DWARF 4. 

### <a id="formExprloc" href="#formExprloc">const formExprloc</a>

```
searchKey: dwarf.formExprloc
```

```Go
const formExprloc format = 0x18
```

### <a id="formFlagPresent" href="#formFlagPresent">const formFlagPresent</a>

```
searchKey: dwarf.formFlagPresent
```

```Go
const formFlagPresent format = 0x19
```

### <a id="formRefSig8" href="#formRefSig8">const formRefSig8</a>

```
searchKey: dwarf.formRefSig8
```

```Go
const formRefSig8 format = 0x20
```

### <a id="formStrx" href="#formStrx">const formStrx</a>

```
searchKey: dwarf.formStrx
```

```Go
const formStrx format = 0x1A
```

The following are new in DWARF 5. 

### <a id="formAddrx" href="#formAddrx">const formAddrx</a>

```
searchKey: dwarf.formAddrx
```

```Go
const formAddrx format = 0x1B
```

### <a id="formRefSup4" href="#formRefSup4">const formRefSup4</a>

```
searchKey: dwarf.formRefSup4
```

```Go
const formRefSup4 format = 0x1C
```

### <a id="formStrpSup" href="#formStrpSup">const formStrpSup</a>

```
searchKey: dwarf.formStrpSup
```

```Go
const formStrpSup format = 0x1D
```

### <a id="formData16" href="#formData16">const formData16</a>

```
searchKey: dwarf.formData16
```

```Go
const formData16 format = 0x1E
```

### <a id="formLineStrp" href="#formLineStrp">const formLineStrp</a>

```
searchKey: dwarf.formLineStrp
```

```Go
const formLineStrp format = 0x1F
```

### <a id="formImplicitConst" href="#formImplicitConst">const formImplicitConst</a>

```
searchKey: dwarf.formImplicitConst
```

```Go
const formImplicitConst format = 0x21
```

### <a id="formLoclistx" href="#formLoclistx">const formLoclistx</a>

```
searchKey: dwarf.formLoclistx
```

```Go
const formLoclistx format = 0x22
```

### <a id="formRnglistx" href="#formRnglistx">const formRnglistx</a>

```
searchKey: dwarf.formRnglistx
```

```Go
const formRnglistx format = 0x23
```

### <a id="formRefSup8" href="#formRefSup8">const formRefSup8</a>

```
searchKey: dwarf.formRefSup8
```

```Go
const formRefSup8 format = 0x24
```

### <a id="formStrx1" href="#formStrx1">const formStrx1</a>

```
searchKey: dwarf.formStrx1
```

```Go
const formStrx1 format = 0x25
```

### <a id="formStrx2" href="#formStrx2">const formStrx2</a>

```
searchKey: dwarf.formStrx2
```

```Go
const formStrx2 format = 0x26
```

### <a id="formStrx3" href="#formStrx3">const formStrx3</a>

```
searchKey: dwarf.formStrx3
```

```Go
const formStrx3 format = 0x27
```

### <a id="formStrx4" href="#formStrx4">const formStrx4</a>

```
searchKey: dwarf.formStrx4
```

```Go
const formStrx4 format = 0x28
```

### <a id="formAddrx1" href="#formAddrx1">const formAddrx1</a>

```
searchKey: dwarf.formAddrx1
```

```Go
const formAddrx1 format = 0x29
```

### <a id="formAddrx2" href="#formAddrx2">const formAddrx2</a>

```
searchKey: dwarf.formAddrx2
```

```Go
const formAddrx2 format = 0x2A
```

### <a id="formAddrx3" href="#formAddrx3">const formAddrx3</a>

```
searchKey: dwarf.formAddrx3
```

```Go
const formAddrx3 format = 0x2B
```

### <a id="formAddrx4" href="#formAddrx4">const formAddrx4</a>

```
searchKey: dwarf.formAddrx4
```

```Go
const formAddrx4 format = 0x2C
```

### <a id="formGnuRefAlt" href="#formGnuRefAlt">const formGnuRefAlt</a>

```
searchKey: dwarf.formGnuRefAlt
```

```Go
const formGnuRefAlt format = 0x1f20
```

Extensions for multi-file compression (.dwz) [http://www.dwarfstd.org/ShowIssue.php?issue=120604.1](http://www.dwarfstd.org/ShowIssue.php?issue=120604.1) 

### <a id="formGnuStrpAlt" href="#formGnuStrpAlt">const formGnuStrpAlt</a>

```
searchKey: dwarf.formGnuStrpAlt
```

```Go
const formGnuStrpAlt format = 0x1f21
```

### <a id="TagArrayType" href="#TagArrayType">const TagArrayType</a>

```
searchKey: dwarf.TagArrayType
tags: [exported]
```

```Go
const TagArrayType Tag = 0x01
```

### <a id="TagClassType" href="#TagClassType">const TagClassType</a>

```
searchKey: dwarf.TagClassType
tags: [exported]
```

```Go
const TagClassType Tag = 0x02
```

### <a id="TagEntryPoint" href="#TagEntryPoint">const TagEntryPoint</a>

```
searchKey: dwarf.TagEntryPoint
tags: [exported]
```

```Go
const TagEntryPoint Tag = 0x03
```

### <a id="TagEnumerationType" href="#TagEnumerationType">const TagEnumerationType</a>

```
searchKey: dwarf.TagEnumerationType
tags: [exported]
```

```Go
const TagEnumerationType Tag = 0x04
```

### <a id="TagFormalParameter" href="#TagFormalParameter">const TagFormalParameter</a>

```
searchKey: dwarf.TagFormalParameter
tags: [exported]
```

```Go
const TagFormalParameter Tag = 0x05
```

### <a id="TagImportedDeclaration" href="#TagImportedDeclaration">const TagImportedDeclaration</a>

```
searchKey: dwarf.TagImportedDeclaration
tags: [exported]
```

```Go
const TagImportedDeclaration Tag = 0x08
```

### <a id="TagLabel" href="#TagLabel">const TagLabel</a>

```
searchKey: dwarf.TagLabel
tags: [exported]
```

```Go
const TagLabel Tag = 0x0A
```

### <a id="TagLexDwarfBlock" href="#TagLexDwarfBlock">const TagLexDwarfBlock</a>

```
searchKey: dwarf.TagLexDwarfBlock
tags: [exported]
```

```Go
const TagLexDwarfBlock Tag = 0x0B
```

### <a id="TagMember" href="#TagMember">const TagMember</a>

```
searchKey: dwarf.TagMember
tags: [exported]
```

```Go
const TagMember Tag = 0x0D
```

### <a id="TagPointerType" href="#TagPointerType">const TagPointerType</a>

```
searchKey: dwarf.TagPointerType
tags: [exported]
```

```Go
const TagPointerType Tag = 0x0F
```

### <a id="TagReferenceType" href="#TagReferenceType">const TagReferenceType</a>

```
searchKey: dwarf.TagReferenceType
tags: [exported]
```

```Go
const TagReferenceType Tag = 0x10
```

### <a id="TagCompileUnit" href="#TagCompileUnit">const TagCompileUnit</a>

```
searchKey: dwarf.TagCompileUnit
tags: [exported]
```

```Go
const TagCompileUnit Tag = 0x11
```

### <a id="TagStringType" href="#TagStringType">const TagStringType</a>

```
searchKey: dwarf.TagStringType
tags: [exported]
```

```Go
const TagStringType Tag = 0x12
```

### <a id="TagStructType" href="#TagStructType">const TagStructType</a>

```
searchKey: dwarf.TagStructType
tags: [exported]
```

```Go
const TagStructType Tag = 0x13
```

### <a id="TagSubroutineType" href="#TagSubroutineType">const TagSubroutineType</a>

```
searchKey: dwarf.TagSubroutineType
tags: [exported]
```

```Go
const TagSubroutineType Tag = 0x15
```

### <a id="TagTypedef" href="#TagTypedef">const TagTypedef</a>

```
searchKey: dwarf.TagTypedef
tags: [exported]
```

```Go
const TagTypedef Tag = 0x16
```

### <a id="TagUnionType" href="#TagUnionType">const TagUnionType</a>

```
searchKey: dwarf.TagUnionType
tags: [exported]
```

```Go
const TagUnionType Tag = 0x17
```

### <a id="TagUnspecifiedParameters" href="#TagUnspecifiedParameters">const TagUnspecifiedParameters</a>

```
searchKey: dwarf.TagUnspecifiedParameters
tags: [exported]
```

```Go
const TagUnspecifiedParameters Tag = 0x18
```

### <a id="TagVariant" href="#TagVariant">const TagVariant</a>

```
searchKey: dwarf.TagVariant
tags: [exported]
```

```Go
const TagVariant Tag = 0x19
```

### <a id="TagCommonDwarfBlock" href="#TagCommonDwarfBlock">const TagCommonDwarfBlock</a>

```
searchKey: dwarf.TagCommonDwarfBlock
tags: [exported]
```

```Go
const TagCommonDwarfBlock Tag = 0x1A
```

### <a id="TagCommonInclusion" href="#TagCommonInclusion">const TagCommonInclusion</a>

```
searchKey: dwarf.TagCommonInclusion
tags: [exported]
```

```Go
const TagCommonInclusion Tag = 0x1B
```

### <a id="TagInheritance" href="#TagInheritance">const TagInheritance</a>

```
searchKey: dwarf.TagInheritance
tags: [exported]
```

```Go
const TagInheritance Tag = 0x1C
```

### <a id="TagInlinedSubroutine" href="#TagInlinedSubroutine">const TagInlinedSubroutine</a>

```
searchKey: dwarf.TagInlinedSubroutine
tags: [exported]
```

```Go
const TagInlinedSubroutine Tag = 0x1D
```

### <a id="TagModule" href="#TagModule">const TagModule</a>

```
searchKey: dwarf.TagModule
tags: [exported]
```

```Go
const TagModule Tag = 0x1E
```

### <a id="TagPtrToMemberType" href="#TagPtrToMemberType">const TagPtrToMemberType</a>

```
searchKey: dwarf.TagPtrToMemberType
tags: [exported]
```

```Go
const TagPtrToMemberType Tag = 0x1F
```

### <a id="TagSetType" href="#TagSetType">const TagSetType</a>

```
searchKey: dwarf.TagSetType
tags: [exported]
```

```Go
const TagSetType Tag = 0x20
```

### <a id="TagSubrangeType" href="#TagSubrangeType">const TagSubrangeType</a>

```
searchKey: dwarf.TagSubrangeType
tags: [exported]
```

```Go
const TagSubrangeType Tag = 0x21
```

### <a id="TagWithStmt" href="#TagWithStmt">const TagWithStmt</a>

```
searchKey: dwarf.TagWithStmt
tags: [exported]
```

```Go
const TagWithStmt Tag = 0x22
```

### <a id="TagAccessDeclaration" href="#TagAccessDeclaration">const TagAccessDeclaration</a>

```
searchKey: dwarf.TagAccessDeclaration
tags: [exported]
```

```Go
const TagAccessDeclaration Tag = 0x23
```

### <a id="TagBaseType" href="#TagBaseType">const TagBaseType</a>

```
searchKey: dwarf.TagBaseType
tags: [exported]
```

```Go
const TagBaseType Tag = 0x24
```

### <a id="TagCatchDwarfBlock" href="#TagCatchDwarfBlock">const TagCatchDwarfBlock</a>

```
searchKey: dwarf.TagCatchDwarfBlock
tags: [exported]
```

```Go
const TagCatchDwarfBlock Tag = 0x25
```

### <a id="TagConstType" href="#TagConstType">const TagConstType</a>

```
searchKey: dwarf.TagConstType
tags: [exported]
```

```Go
const TagConstType Tag = 0x26
```

### <a id="TagConstant" href="#TagConstant">const TagConstant</a>

```
searchKey: dwarf.TagConstant
tags: [exported]
```

```Go
const TagConstant Tag = 0x27
```

### <a id="TagEnumerator" href="#TagEnumerator">const TagEnumerator</a>

```
searchKey: dwarf.TagEnumerator
tags: [exported]
```

```Go
const TagEnumerator Tag = 0x28
```

### <a id="TagFileType" href="#TagFileType">const TagFileType</a>

```
searchKey: dwarf.TagFileType
tags: [exported]
```

```Go
const TagFileType Tag = 0x29
```

### <a id="TagFriend" href="#TagFriend">const TagFriend</a>

```
searchKey: dwarf.TagFriend
tags: [exported]
```

```Go
const TagFriend Tag = 0x2A
```

### <a id="TagNamelist" href="#TagNamelist">const TagNamelist</a>

```
searchKey: dwarf.TagNamelist
tags: [exported]
```

```Go
const TagNamelist Tag = 0x2B
```

### <a id="TagNamelistItem" href="#TagNamelistItem">const TagNamelistItem</a>

```
searchKey: dwarf.TagNamelistItem
tags: [exported]
```

```Go
const TagNamelistItem Tag = 0x2C
```

### <a id="TagPackedType" href="#TagPackedType">const TagPackedType</a>

```
searchKey: dwarf.TagPackedType
tags: [exported]
```

```Go
const TagPackedType Tag = 0x2D
```

### <a id="TagSubprogram" href="#TagSubprogram">const TagSubprogram</a>

```
searchKey: dwarf.TagSubprogram
tags: [exported]
```

```Go
const TagSubprogram Tag = 0x2E
```

### <a id="TagTemplateTypeParameter" href="#TagTemplateTypeParameter">const TagTemplateTypeParameter</a>

```
searchKey: dwarf.TagTemplateTypeParameter
tags: [exported]
```

```Go
const TagTemplateTypeParameter Tag = 0x2F
```

### <a id="TagTemplateValueParameter" href="#TagTemplateValueParameter">const TagTemplateValueParameter</a>

```
searchKey: dwarf.TagTemplateValueParameter
tags: [exported]
```

```Go
const TagTemplateValueParameter Tag = 0x30
```

### <a id="TagThrownType" href="#TagThrownType">const TagThrownType</a>

```
searchKey: dwarf.TagThrownType
tags: [exported]
```

```Go
const TagThrownType Tag = 0x31
```

### <a id="TagTryDwarfBlock" href="#TagTryDwarfBlock">const TagTryDwarfBlock</a>

```
searchKey: dwarf.TagTryDwarfBlock
tags: [exported]
```

```Go
const TagTryDwarfBlock Tag = 0x32
```

### <a id="TagVariantPart" href="#TagVariantPart">const TagVariantPart</a>

```
searchKey: dwarf.TagVariantPart
tags: [exported]
```

```Go
const TagVariantPart Tag = 0x33
```

### <a id="TagVariable" href="#TagVariable">const TagVariable</a>

```
searchKey: dwarf.TagVariable
tags: [exported]
```

```Go
const TagVariable Tag = 0x34
```

### <a id="TagVolatileType" href="#TagVolatileType">const TagVolatileType</a>

```
searchKey: dwarf.TagVolatileType
tags: [exported]
```

```Go
const TagVolatileType Tag = 0x35
```

### <a id="TagDwarfProcedure" href="#TagDwarfProcedure">const TagDwarfProcedure</a>

```
searchKey: dwarf.TagDwarfProcedure
tags: [exported]
```

```Go
const TagDwarfProcedure Tag = 0x36
```

The following are new in DWARF 3. 

### <a id="TagRestrictType" href="#TagRestrictType">const TagRestrictType</a>

```
searchKey: dwarf.TagRestrictType
tags: [exported]
```

```Go
const TagRestrictType Tag = 0x37
```

### <a id="TagInterfaceType" href="#TagInterfaceType">const TagInterfaceType</a>

```
searchKey: dwarf.TagInterfaceType
tags: [exported]
```

```Go
const TagInterfaceType Tag = 0x38
```

### <a id="TagNamespace" href="#TagNamespace">const TagNamespace</a>

```
searchKey: dwarf.TagNamespace
tags: [exported]
```

```Go
const TagNamespace Tag = 0x39
```

### <a id="TagImportedModule" href="#TagImportedModule">const TagImportedModule</a>

```
searchKey: dwarf.TagImportedModule
tags: [exported]
```

```Go
const TagImportedModule Tag = 0x3A
```

### <a id="TagUnspecifiedType" href="#TagUnspecifiedType">const TagUnspecifiedType</a>

```
searchKey: dwarf.TagUnspecifiedType
tags: [exported]
```

```Go
const TagUnspecifiedType Tag = 0x3B
```

### <a id="TagPartialUnit" href="#TagPartialUnit">const TagPartialUnit</a>

```
searchKey: dwarf.TagPartialUnit
tags: [exported]
```

```Go
const TagPartialUnit Tag = 0x3C
```

### <a id="TagImportedUnit" href="#TagImportedUnit">const TagImportedUnit</a>

```
searchKey: dwarf.TagImportedUnit
tags: [exported]
```

```Go
const TagImportedUnit Tag = 0x3D
```

### <a id="TagMutableType" href="#TagMutableType">const TagMutableType</a>

```
searchKey: dwarf.TagMutableType
tags: [exported]
```

```Go
const TagMutableType Tag = 0x3E // Later removed from DWARF.

```

### <a id="TagCondition" href="#TagCondition">const TagCondition</a>

```
searchKey: dwarf.TagCondition
tags: [exported]
```

```Go
const TagCondition Tag = 0x3F
```

### <a id="TagSharedType" href="#TagSharedType">const TagSharedType</a>

```
searchKey: dwarf.TagSharedType
tags: [exported]
```

```Go
const TagSharedType Tag = 0x40
```

### <a id="TagTypeUnit" href="#TagTypeUnit">const TagTypeUnit</a>

```
searchKey: dwarf.TagTypeUnit
tags: [exported]
```

```Go
const TagTypeUnit Tag = 0x41
```

The following are new in DWARF 4. 

### <a id="TagRvalueReferenceType" href="#TagRvalueReferenceType">const TagRvalueReferenceType</a>

```
searchKey: dwarf.TagRvalueReferenceType
tags: [exported]
```

```Go
const TagRvalueReferenceType Tag = 0x42
```

### <a id="TagTemplateAlias" href="#TagTemplateAlias">const TagTemplateAlias</a>

```
searchKey: dwarf.TagTemplateAlias
tags: [exported]
```

```Go
const TagTemplateAlias Tag = 0x43
```

### <a id="TagCoarrayType" href="#TagCoarrayType">const TagCoarrayType</a>

```
searchKey: dwarf.TagCoarrayType
tags: [exported]
```

```Go
const TagCoarrayType Tag = 0x44
```

The following are new in DWARF 5. 

### <a id="TagGenericSubrange" href="#TagGenericSubrange">const TagGenericSubrange</a>

```
searchKey: dwarf.TagGenericSubrange
tags: [exported]
```

```Go
const TagGenericSubrange Tag = 0x45
```

### <a id="TagDynamicType" href="#TagDynamicType">const TagDynamicType</a>

```
searchKey: dwarf.TagDynamicType
tags: [exported]
```

```Go
const TagDynamicType Tag = 0x46
```

### <a id="TagAtomicType" href="#TagAtomicType">const TagAtomicType</a>

```
searchKey: dwarf.TagAtomicType
tags: [exported]
```

```Go
const TagAtomicType Tag = 0x47
```

### <a id="TagCallSite" href="#TagCallSite">const TagCallSite</a>

```
searchKey: dwarf.TagCallSite
tags: [exported]
```

```Go
const TagCallSite Tag = 0x48
```

### <a id="TagCallSiteParameter" href="#TagCallSiteParameter">const TagCallSiteParameter</a>

```
searchKey: dwarf.TagCallSiteParameter
tags: [exported]
```

```Go
const TagCallSiteParameter Tag = 0x49
```

### <a id="TagSkeletonUnit" href="#TagSkeletonUnit">const TagSkeletonUnit</a>

```
searchKey: dwarf.TagSkeletonUnit
tags: [exported]
```

```Go
const TagSkeletonUnit Tag = 0x4A
```

### <a id="TagImmutableType" href="#TagImmutableType">const TagImmutableType</a>

```
searchKey: dwarf.TagImmutableType
tags: [exported]
```

```Go
const TagImmutableType Tag = 0x4B
```

### <a id="opAddr" href="#opAddr">const opAddr</a>

```
searchKey: dwarf.opAddr
```

```Go
const opAddr = 0x03 /* 1 op, const addr */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDeref" href="#opDeref">const opDeref</a>

```
searchKey: dwarf.opDeref
```

```Go
const opDeref = 0x06
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst1u" href="#opConst1u">const opConst1u</a>

```
searchKey: dwarf.opConst1u
```

```Go
const opConst1u = 0x08 /* 1 op, 1 byte const */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst1s" href="#opConst1s">const opConst1s</a>

```
searchKey: dwarf.opConst1s
```

```Go
const opConst1s = 0x09 /*	" signed */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst2u" href="#opConst2u">const opConst2u</a>

```
searchKey: dwarf.opConst2u
```

```Go
const opConst2u = 0x0A /* 1 op, 2 byte const  */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst2s" href="#opConst2s">const opConst2s</a>

```
searchKey: dwarf.opConst2s
```

```Go
const opConst2s = 0x0B /*	" signed */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst4u" href="#opConst4u">const opConst4u</a>

```
searchKey: dwarf.opConst4u
```

```Go
const opConst4u = 0x0C /* 1 op, 4 byte const */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst4s" href="#opConst4s">const opConst4s</a>

```
searchKey: dwarf.opConst4s
```

```Go
const opConst4s = 0x0D /*	" signed */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst8u" href="#opConst8u">const opConst8u</a>

```
searchKey: dwarf.opConst8u
```

```Go
const opConst8u = 0x0E /* 1 op, 8 byte const */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConst8s" href="#opConst8s">const opConst8s</a>

```
searchKey: dwarf.opConst8s
```

```Go
const opConst8s = 0x0F /*	" signed */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConstu" href="#opConstu">const opConstu</a>

```
searchKey: dwarf.opConstu
```

```Go
const opConstu = 0x10 /* 1 op, LEB128 const */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConsts" href="#opConsts">const opConsts</a>

```
searchKey: dwarf.opConsts
```

```Go
const opConsts = 0x11 /*	" signed */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDup" href="#opDup">const opDup</a>

```
searchKey: dwarf.opDup
```

```Go
const opDup = 0x12
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDrop" href="#opDrop">const opDrop</a>

```
searchKey: dwarf.opDrop
```

```Go
const opDrop = 0x13
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opOver" href="#opOver">const opOver</a>

```
searchKey: dwarf.opOver
```

```Go
const opOver = 0x14
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opPick" href="#opPick">const opPick</a>

```
searchKey: dwarf.opPick
```

```Go
const opPick = 0x15 /* 1 op, 1 byte stack index */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opSwap" href="#opSwap">const opSwap</a>

```
searchKey: dwarf.opSwap
```

```Go
const opSwap = 0x16
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opRot" href="#opRot">const opRot</a>

```
searchKey: dwarf.opRot
```

```Go
const opRot = 0x17
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opXderef" href="#opXderef">const opXderef</a>

```
searchKey: dwarf.opXderef
```

```Go
const opXderef = 0x18
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opAbs" href="#opAbs">const opAbs</a>

```
searchKey: dwarf.opAbs
```

```Go
const opAbs = 0x19
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opAnd" href="#opAnd">const opAnd</a>

```
searchKey: dwarf.opAnd
```

```Go
const opAnd = 0x1A
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDiv" href="#opDiv">const opDiv</a>

```
searchKey: dwarf.opDiv
```

```Go
const opDiv = 0x1B
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opMinus" href="#opMinus">const opMinus</a>

```
searchKey: dwarf.opMinus
```

```Go
const opMinus = 0x1C
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opMod" href="#opMod">const opMod</a>

```
searchKey: dwarf.opMod
```

```Go
const opMod = 0x1D
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opMul" href="#opMul">const opMul</a>

```
searchKey: dwarf.opMul
```

```Go
const opMul = 0x1E
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opNeg" href="#opNeg">const opNeg</a>

```
searchKey: dwarf.opNeg
```

```Go
const opNeg = 0x1F
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opNot" href="#opNot">const opNot</a>

```
searchKey: dwarf.opNot
```

```Go
const opNot = 0x20
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opOr" href="#opOr">const opOr</a>

```
searchKey: dwarf.opOr
```

```Go
const opOr = 0x21
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opPlus" href="#opPlus">const opPlus</a>

```
searchKey: dwarf.opPlus
```

```Go
const opPlus = 0x22
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opPlusUconst" href="#opPlusUconst">const opPlusUconst</a>

```
searchKey: dwarf.opPlusUconst
```

```Go
const opPlusUconst = 0x23 /* 1 op, ULEB128 addend */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opShl" href="#opShl">const opShl</a>

```
searchKey: dwarf.opShl
```

```Go
const opShl = 0x24
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opShr" href="#opShr">const opShr</a>

```
searchKey: dwarf.opShr
```

```Go
const opShr = 0x25
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opShra" href="#opShra">const opShra</a>

```
searchKey: dwarf.opShra
```

```Go
const opShra = 0x26
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opXor" href="#opXor">const opXor</a>

```
searchKey: dwarf.opXor
```

```Go
const opXor = 0x27
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opSkip" href="#opSkip">const opSkip</a>

```
searchKey: dwarf.opSkip
```

```Go
const opSkip = 0x2F /* 1 op, signed 2-byte constant */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opBra" href="#opBra">const opBra</a>

```
searchKey: dwarf.opBra
```

```Go
const opBra = 0x28 /* 1 op, signed 2-byte constant */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opEq" href="#opEq">const opEq</a>

```
searchKey: dwarf.opEq
```

```Go
const opEq = 0x29
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opGe" href="#opGe">const opGe</a>

```
searchKey: dwarf.opGe
```

```Go
const opGe = 0x2A
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opGt" href="#opGt">const opGt</a>

```
searchKey: dwarf.opGt
```

```Go
const opGt = 0x2B
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opLe" href="#opLe">const opLe</a>

```
searchKey: dwarf.opLe
```

```Go
const opLe = 0x2C
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opLt" href="#opLt">const opLt</a>

```
searchKey: dwarf.opLt
```

```Go
const opLt = 0x2D
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opNe" href="#opNe">const opNe</a>

```
searchKey: dwarf.opNe
```

```Go
const opNe = 0x2E
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opLit0" href="#opLit0">const opLit0</a>

```
searchKey: dwarf.opLit0
```

```Go
const opLit0 = 0x30
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opReg0" href="#opReg0">const opReg0</a>

```
searchKey: dwarf.opReg0
```

```Go
const opReg0 = 0x50
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

OpLitN = OpLit0 + N for N = 0..31 

### <a id="opBreg0" href="#opBreg0">const opBreg0</a>

```
searchKey: dwarf.opBreg0
```

```Go
const opBreg0 = 0x70 /* 1 op, signed LEB128 constant */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

OpRegN = OpReg0 + N for N = 0..31 

### <a id="opRegx" href="#opRegx">const opRegx</a>

```
searchKey: dwarf.opRegx
```

```Go
const opRegx = 0x90 /* 1 op, ULEB128 register */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

OpBregN = OpBreg0 + N for N = 0..31 

### <a id="opFbreg" href="#opFbreg">const opFbreg</a>

```
searchKey: dwarf.opFbreg
```

```Go
const opFbreg = 0x91 /* 1 op, SLEB128 offset */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opBregx" href="#opBregx">const opBregx</a>

```
searchKey: dwarf.opBregx
```

```Go
const opBregx = 0x92 /* 2 op, ULEB128 reg; SLEB128 off */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opPiece" href="#opPiece">const opPiece</a>

```
searchKey: dwarf.opPiece
```

```Go
const opPiece = 0x93 /* 1 op, ULEB128 size of piece */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDerefSize" href="#opDerefSize">const opDerefSize</a>

```
searchKey: dwarf.opDerefSize
```

```Go
const opDerefSize = 0x94 /* 1-byte size of data retrieved */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opXderefSize" href="#opXderefSize">const opXderefSize</a>

```
searchKey: dwarf.opXderefSize
```

```Go
const opXderefSize = 0x95 /* 1-byte size of data retrieved */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opNop" href="#opNop">const opNop</a>

```
searchKey: dwarf.opNop
```

```Go
const opNop = 0x96
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opPushObjAddr" href="#opPushObjAddr">const opPushObjAddr</a>

```
searchKey: dwarf.opPushObjAddr
```

```Go
const opPushObjAddr = 0x97
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

The following are new in DWARF 3. 

### <a id="opCall2" href="#opCall2">const opCall2</a>

```
searchKey: dwarf.opCall2
```

```Go
const opCall2 = 0x98 /* 2-byte offset of DIE */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opCall4" href="#opCall4">const opCall4</a>

```
searchKey: dwarf.opCall4
```

```Go
const opCall4 = 0x99 /* 4-byte offset of DIE */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opCallRef" href="#opCallRef">const opCallRef</a>

```
searchKey: dwarf.opCallRef
```

```Go
const opCallRef = 0x9A /* 4- or 8- byte offset of DIE */

```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opFormTLSAddress" href="#opFormTLSAddress">const opFormTLSAddress</a>

```
searchKey: dwarf.opFormTLSAddress
```

```Go
const opFormTLSAddress = 0x9B
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opCallFrameCFA" href="#opCallFrameCFA">const opCallFrameCFA</a>

```
searchKey: dwarf.opCallFrameCFA
```

```Go
const opCallFrameCFA = 0x9C
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opBitPiece" href="#opBitPiece">const opBitPiece</a>

```
searchKey: dwarf.opBitPiece
```

```Go
const opBitPiece = 0x9D
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opImplicitValue" href="#opImplicitValue">const opImplicitValue</a>

```
searchKey: dwarf.opImplicitValue
```

```Go
const opImplicitValue = 0x9E
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

The following are new in DWARF 4. 

### <a id="opStackValue" href="#opStackValue">const opStackValue</a>

```
searchKey: dwarf.opStackValue
```

```Go
const opStackValue = 0x9F
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opImplicitPointer" href="#opImplicitPointer">const opImplicitPointer</a>

```
searchKey: dwarf.opImplicitPointer
```

```Go
const opImplicitPointer = 0xA0
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

The following a new in DWARF 5. 

### <a id="opAddrx" href="#opAddrx">const opAddrx</a>

```
searchKey: dwarf.opAddrx
```

```Go
const opAddrx = 0xA1
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConstx" href="#opConstx">const opConstx</a>

```
searchKey: dwarf.opConstx
```

```Go
const opConstx = 0xA2
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opEntryValue" href="#opEntryValue">const opEntryValue</a>

```
searchKey: dwarf.opEntryValue
```

```Go
const opEntryValue = 0xA3
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConstType" href="#opConstType">const opConstType</a>

```
searchKey: dwarf.opConstType
```

```Go
const opConstType = 0xA4
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opRegvalType" href="#opRegvalType">const opRegvalType</a>

```
searchKey: dwarf.opRegvalType
```

```Go
const opRegvalType = 0xA5
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opDerefType" href="#opDerefType">const opDerefType</a>

```
searchKey: dwarf.opDerefType
```

```Go
const opDerefType = 0xA6
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opXderefType" href="#opXderefType">const opXderefType</a>

```
searchKey: dwarf.opXderefType
```

```Go
const opXderefType = 0xA7
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opConvert" href="#opConvert">const opConvert</a>

```
searchKey: dwarf.opConvert
```

```Go
const opConvert = 0xA8
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="opReinterpret" href="#opReinterpret">const opReinterpret</a>

```
searchKey: dwarf.opReinterpret
```

```Go
const opReinterpret = 0xA9
```

Location expression operators. The debug info encodes value locations like 8(R3) as a sequence of these op codes. This package does not implement full expressions; the opPlusUconst operator is expected by the type parser. 

### <a id="encAddress" href="#encAddress">const encAddress</a>

```
searchKey: dwarf.encAddress
```

```Go
const encAddress = 0x01
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encBoolean" href="#encBoolean">const encBoolean</a>

```
searchKey: dwarf.encBoolean
```

```Go
const encBoolean = 0x02
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encComplexFloat" href="#encComplexFloat">const encComplexFloat</a>

```
searchKey: dwarf.encComplexFloat
```

```Go
const encComplexFloat = 0x03
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encFloat" href="#encFloat">const encFloat</a>

```
searchKey: dwarf.encFloat
```

```Go
const encFloat = 0x04
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encSigned" href="#encSigned">const encSigned</a>

```
searchKey: dwarf.encSigned
```

```Go
const encSigned = 0x05
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encSignedChar" href="#encSignedChar">const encSignedChar</a>

```
searchKey: dwarf.encSignedChar
```

```Go
const encSignedChar = 0x06
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encUnsigned" href="#encUnsigned">const encUnsigned</a>

```
searchKey: dwarf.encUnsigned
```

```Go
const encUnsigned = 0x07
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encUnsignedChar" href="#encUnsignedChar">const encUnsignedChar</a>

```
searchKey: dwarf.encUnsignedChar
```

```Go
const encUnsignedChar = 0x08
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encImaginaryFloat" href="#encImaginaryFloat">const encImaginaryFloat</a>

```
searchKey: dwarf.encImaginaryFloat
```

```Go
const encImaginaryFloat = 0x09
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

The following are new in DWARF 3. 

### <a id="encPackedDecimal" href="#encPackedDecimal">const encPackedDecimal</a>

```
searchKey: dwarf.encPackedDecimal
```

```Go
const encPackedDecimal = 0x0A
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encNumericString" href="#encNumericString">const encNumericString</a>

```
searchKey: dwarf.encNumericString
```

```Go
const encNumericString = 0x0B
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encEdited" href="#encEdited">const encEdited</a>

```
searchKey: dwarf.encEdited
```

```Go
const encEdited = 0x0C
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encSignedFixed" href="#encSignedFixed">const encSignedFixed</a>

```
searchKey: dwarf.encSignedFixed
```

```Go
const encSignedFixed = 0x0D
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encUnsignedFixed" href="#encUnsignedFixed">const encUnsignedFixed</a>

```
searchKey: dwarf.encUnsignedFixed
```

```Go
const encUnsignedFixed = 0x0E
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encDecimalFloat" href="#encDecimalFloat">const encDecimalFloat</a>

```
searchKey: dwarf.encDecimalFloat
```

```Go
const encDecimalFloat = 0x0F
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="encUTF" href="#encUTF">const encUTF</a>

```
searchKey: dwarf.encUTF
```

```Go
const encUTF = 0x10
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

The following are new in DWARF 4. 

### <a id="encUCS" href="#encUCS">const encUCS</a>

```
searchKey: dwarf.encUCS
```

```Go
const encUCS = 0x11
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

The following are new in DWARF 5. 

### <a id="encASCII" href="#encASCII">const encASCII</a>

```
searchKey: dwarf.encASCII
```

```Go
const encASCII = 0x12
```

Basic type encodings -- the value for AttrEncoding in a TagBaseType Entry. 

### <a id="lnsCopy" href="#lnsCopy">const lnsCopy</a>

```
searchKey: dwarf.lnsCopy
```

```Go
const lnsCopy = 1
```

Statement program standard opcode encodings. 

### <a id="lnsAdvancePC" href="#lnsAdvancePC">const lnsAdvancePC</a>

```
searchKey: dwarf.lnsAdvancePC
```

```Go
const lnsAdvancePC = 2
```

Statement program standard opcode encodings. 

### <a id="lnsAdvanceLine" href="#lnsAdvanceLine">const lnsAdvanceLine</a>

```
searchKey: dwarf.lnsAdvanceLine
```

```Go
const lnsAdvanceLine = 3
```

Statement program standard opcode encodings. 

### <a id="lnsSetFile" href="#lnsSetFile">const lnsSetFile</a>

```
searchKey: dwarf.lnsSetFile
```

```Go
const lnsSetFile = 4
```

Statement program standard opcode encodings. 

### <a id="lnsSetColumn" href="#lnsSetColumn">const lnsSetColumn</a>

```
searchKey: dwarf.lnsSetColumn
```

```Go
const lnsSetColumn = 5
```

Statement program standard opcode encodings. 

### <a id="lnsNegateStmt" href="#lnsNegateStmt">const lnsNegateStmt</a>

```
searchKey: dwarf.lnsNegateStmt
```

```Go
const lnsNegateStmt = 6
```

Statement program standard opcode encodings. 

### <a id="lnsSetBasicBlock" href="#lnsSetBasicBlock">const lnsSetBasicBlock</a>

```
searchKey: dwarf.lnsSetBasicBlock
```

```Go
const lnsSetBasicBlock = 7
```

Statement program standard opcode encodings. 

### <a id="lnsConstAddPC" href="#lnsConstAddPC">const lnsConstAddPC</a>

```
searchKey: dwarf.lnsConstAddPC
```

```Go
const lnsConstAddPC = 8
```

Statement program standard opcode encodings. 

### <a id="lnsFixedAdvancePC" href="#lnsFixedAdvancePC">const lnsFixedAdvancePC</a>

```
searchKey: dwarf.lnsFixedAdvancePC
```

```Go
const lnsFixedAdvancePC = 9
```

Statement program standard opcode encodings. 

### <a id="lnsSetPrologueEnd" href="#lnsSetPrologueEnd">const lnsSetPrologueEnd</a>

```
searchKey: dwarf.lnsSetPrologueEnd
```

```Go
const lnsSetPrologueEnd = 10
```

Statement program standard opcode encodings. 

DWARF 3 

### <a id="lnsSetEpilogueBegin" href="#lnsSetEpilogueBegin">const lnsSetEpilogueBegin</a>

```
searchKey: dwarf.lnsSetEpilogueBegin
```

```Go
const lnsSetEpilogueBegin = 11
```

Statement program standard opcode encodings. 

### <a id="lnsSetISA" href="#lnsSetISA">const lnsSetISA</a>

```
searchKey: dwarf.lnsSetISA
```

```Go
const lnsSetISA = 12
```

Statement program standard opcode encodings. 

### <a id="lneEndSequence" href="#lneEndSequence">const lneEndSequence</a>

```
searchKey: dwarf.lneEndSequence
```

```Go
const lneEndSequence = 1
```

Statement program extended opcode encodings. 

### <a id="lneSetAddress" href="#lneSetAddress">const lneSetAddress</a>

```
searchKey: dwarf.lneSetAddress
```

```Go
const lneSetAddress = 2
```

Statement program extended opcode encodings. 

### <a id="lneDefineFile" href="#lneDefineFile">const lneDefineFile</a>

```
searchKey: dwarf.lneDefineFile
```

```Go
const lneDefineFile = 3
```

Statement program extended opcode encodings. 

### <a id="lneSetDiscriminator" href="#lneSetDiscriminator">const lneSetDiscriminator</a>

```
searchKey: dwarf.lneSetDiscriminator
```

```Go
const lneSetDiscriminator = 4
```

Statement program extended opcode encodings. 

DWARF 4 

### <a id="lnctPath" href="#lnctPath">const lnctPath</a>

```
searchKey: dwarf.lnctPath
```

```Go
const lnctPath = 0x01
```

Line table directory and file name entry formats. These are new in DWARF 5. 

### <a id="lnctDirectoryIndex" href="#lnctDirectoryIndex">const lnctDirectoryIndex</a>

```
searchKey: dwarf.lnctDirectoryIndex
```

```Go
const lnctDirectoryIndex = 0x02
```

Line table directory and file name entry formats. These are new in DWARF 5. 

### <a id="lnctTimestamp" href="#lnctTimestamp">const lnctTimestamp</a>

```
searchKey: dwarf.lnctTimestamp
```

```Go
const lnctTimestamp = 0x03
```

Line table directory and file name entry formats. These are new in DWARF 5. 

### <a id="lnctSize" href="#lnctSize">const lnctSize</a>

```
searchKey: dwarf.lnctSize
```

```Go
const lnctSize = 0x04
```

Line table directory and file name entry formats. These are new in DWARF 5. 

### <a id="lnctMD5" href="#lnctMD5">const lnctMD5</a>

```
searchKey: dwarf.lnctMD5
```

```Go
const lnctMD5 = 0x05
```

Line table directory and file name entry formats. These are new in DWARF 5. 

### <a id="lleEndOfList" href="#lleEndOfList">const lleEndOfList</a>

```
searchKey: dwarf.lleEndOfList
```

```Go
const lleEndOfList = 0x00
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleBaseAddressx" href="#lleBaseAddressx">const lleBaseAddressx</a>

```
searchKey: dwarf.lleBaseAddressx
```

```Go
const lleBaseAddressx = 0x01
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleStartxEndx" href="#lleStartxEndx">const lleStartxEndx</a>

```
searchKey: dwarf.lleStartxEndx
```

```Go
const lleStartxEndx = 0x02
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleStartxLength" href="#lleStartxLength">const lleStartxLength</a>

```
searchKey: dwarf.lleStartxLength
```

```Go
const lleStartxLength = 0x03
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleOffsetPair" href="#lleOffsetPair">const lleOffsetPair</a>

```
searchKey: dwarf.lleOffsetPair
```

```Go
const lleOffsetPair = 0x04
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleDefaultLocation" href="#lleDefaultLocation">const lleDefaultLocation</a>

```
searchKey: dwarf.lleDefaultLocation
```

```Go
const lleDefaultLocation = 0x05
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleBaseAddress" href="#lleBaseAddress">const lleBaseAddress</a>

```
searchKey: dwarf.lleBaseAddress
```

```Go
const lleBaseAddress = 0x06
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleStartEnd" href="#lleStartEnd">const lleStartEnd</a>

```
searchKey: dwarf.lleStartEnd
```

```Go
const lleStartEnd = 0x07
```

Location list entry codes. These are new in DWARF 5. 

### <a id="lleStartLength" href="#lleStartLength">const lleStartLength</a>

```
searchKey: dwarf.lleStartLength
```

```Go
const lleStartLength = 0x08
```

Location list entry codes. These are new in DWARF 5. 

### <a id="utCompile" href="#utCompile">const utCompile</a>

```
searchKey: dwarf.utCompile
```

```Go
const utCompile = 0x01
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="utType" href="#utType">const utType</a>

```
searchKey: dwarf.utType
```

```Go
const utType = 0x02
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="utPartial" href="#utPartial">const utPartial</a>

```
searchKey: dwarf.utPartial
```

```Go
const utPartial = 0x03
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="utSkeleton" href="#utSkeleton">const utSkeleton</a>

```
searchKey: dwarf.utSkeleton
```

```Go
const utSkeleton = 0x04
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="utSplitCompile" href="#utSplitCompile">const utSplitCompile</a>

```
searchKey: dwarf.utSplitCompile
```

```Go
const utSplitCompile = 0x05
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="utSplitType" href="#utSplitType">const utSplitType</a>

```
searchKey: dwarf.utSplitType
```

```Go
const utSplitType = 0x06
```

Unit header unit type encodings. These are new in DWARF 5. 

### <a id="rleEndOfList" href="#rleEndOfList">const rleEndOfList</a>

```
searchKey: dwarf.rleEndOfList
```

```Go
const rleEndOfList = 0x0
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleBaseAddressx" href="#rleBaseAddressx">const rleBaseAddressx</a>

```
searchKey: dwarf.rleBaseAddressx
```

```Go
const rleBaseAddressx = 0x1
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleStartxEndx" href="#rleStartxEndx">const rleStartxEndx</a>

```
searchKey: dwarf.rleStartxEndx
```

```Go
const rleStartxEndx = 0x2
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleStartxLength" href="#rleStartxLength">const rleStartxLength</a>

```
searchKey: dwarf.rleStartxLength
```

```Go
const rleStartxLength = 0x3
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleOffsetPair" href="#rleOffsetPair">const rleOffsetPair</a>

```
searchKey: dwarf.rleOffsetPair
```

```Go
const rleOffsetPair = 0x4
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleBaseAddress" href="#rleBaseAddress">const rleBaseAddress</a>

```
searchKey: dwarf.rleBaseAddress
```

```Go
const rleBaseAddress = 0x5
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleStartEnd" href="#rleStartEnd">const rleStartEnd</a>

```
searchKey: dwarf.rleStartEnd
```

```Go
const rleStartEnd = 0x6
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="rleStartLength" href="#rleStartLength">const rleStartLength</a>

```
searchKey: dwarf.rleStartLength
```

```Go
const rleStartLength = 0x7
```

Opcodes for DWARFv5 debug_rnglists section. 

### <a id="ClassUnknown" href="#ClassUnknown">const ClassUnknown</a>

```
searchKey: dwarf.ClassUnknown
tags: [exported]
```

```Go
const ClassUnknown Class = iota
```

ClassUnknown represents values of unknown DWARF class. 

### <a id="ClassAddress" href="#ClassAddress">const ClassAddress</a>

```
searchKey: dwarf.ClassAddress
tags: [exported]
```

```Go
const ClassAddress
```

ClassAddress represents values of type uint64 that are addresses on the target machine. 

### <a id="ClassBlock" href="#ClassBlock">const ClassBlock</a>

```
searchKey: dwarf.ClassBlock
tags: [exported]
```

```Go
const ClassBlock
```

ClassBlock represents values of type []byte whose interpretation depends on the attribute. 

### <a id="ClassConstant" href="#ClassConstant">const ClassConstant</a>

```
searchKey: dwarf.ClassConstant
tags: [exported]
```

```Go
const ClassConstant
```

ClassConstant represents values of type int64 that are constants. The interpretation of this constant depends on the attribute. 

### <a id="ClassExprLoc" href="#ClassExprLoc">const ClassExprLoc</a>

```
searchKey: dwarf.ClassExprLoc
tags: [exported]
```

```Go
const ClassExprLoc
```

ClassExprLoc represents values of type []byte that contain an encoded DWARF expression or location description. 

### <a id="ClassFlag" href="#ClassFlag">const ClassFlag</a>

```
searchKey: dwarf.ClassFlag
tags: [exported]
```

```Go
const ClassFlag
```

ClassFlag represents values of type bool. 

### <a id="ClassLinePtr" href="#ClassLinePtr">const ClassLinePtr</a>

```
searchKey: dwarf.ClassLinePtr
tags: [exported]
```

```Go
const ClassLinePtr
```

ClassLinePtr represents values that are an int64 offset into the "line" section. 

### <a id="ClassLocListPtr" href="#ClassLocListPtr">const ClassLocListPtr</a>

```
searchKey: dwarf.ClassLocListPtr
tags: [exported]
```

```Go
const ClassLocListPtr
```

ClassLocListPtr represents values that are an int64 offset into the "loclist" section. 

### <a id="ClassMacPtr" href="#ClassMacPtr">const ClassMacPtr</a>

```
searchKey: dwarf.ClassMacPtr
tags: [exported]
```

```Go
const ClassMacPtr
```

ClassMacPtr represents values that are an int64 offset into the "mac" section. 

### <a id="ClassRangeListPtr" href="#ClassRangeListPtr">const ClassRangeListPtr</a>

```
searchKey: dwarf.ClassRangeListPtr
tags: [exported]
```

```Go
const ClassRangeListPtr
```

ClassRangeListPtr represents values that are an int64 offset into the "rangelist" section. 

### <a id="ClassReference" href="#ClassReference">const ClassReference</a>

```
searchKey: dwarf.ClassReference
tags: [exported]
```

```Go
const ClassReference
```

ClassReference represents values that are an Offset offset of an Entry in the info section (for use with Reader.Seek). The DWARF specification combines ClassReference and ClassReferenceSig into class "reference". 

### <a id="ClassReferenceSig" href="#ClassReferenceSig">const ClassReferenceSig</a>

```
searchKey: dwarf.ClassReferenceSig
tags: [exported]
```

```Go
const ClassReferenceSig
```

ClassReferenceSig represents values that are a uint64 type signature referencing a type Entry. 

### <a id="ClassString" href="#ClassString">const ClassString</a>

```
searchKey: dwarf.ClassString
tags: [exported]
```

```Go
const ClassString
```

ClassString represents values that are strings. If the compilation unit specifies the AttrUseUTF8 flag (strongly recommended), the string value will be encoded in UTF-8. Otherwise, the encoding is unspecified. 

### <a id="ClassReferenceAlt" href="#ClassReferenceAlt">const ClassReferenceAlt</a>

```
searchKey: dwarf.ClassReferenceAlt
tags: [exported]
```

```Go
const ClassReferenceAlt
```

ClassReferenceAlt represents values of type int64 that are an offset into the DWARF "info" section of an alternate object file. 

### <a id="ClassStringAlt" href="#ClassStringAlt">const ClassStringAlt</a>

```
searchKey: dwarf.ClassStringAlt
tags: [exported]
```

```Go
const ClassStringAlt
```

ClassStringAlt represents values of type int64 that are an offset into the DWARF string section of an alternate object file. 

### <a id="ClassAddrPtr" href="#ClassAddrPtr">const ClassAddrPtr</a>

```
searchKey: dwarf.ClassAddrPtr
tags: [exported]
```

```Go
const ClassAddrPtr
```

ClassAddrPtr represents values that are an int64 offset into the "addr" section. 

### <a id="ClassLocList" href="#ClassLocList">const ClassLocList</a>

```
searchKey: dwarf.ClassLocList
tags: [exported]
```

```Go
const ClassLocList
```

ClassLocList represents values that are an int64 offset into the "loclists" section. 

### <a id="ClassRngList" href="#ClassRngList">const ClassRngList</a>

```
searchKey: dwarf.ClassRngList
tags: [exported]
```

```Go
const ClassRngList
```

ClassRngList represents values that are a uint64 offset from the base of the "rnglists" section. 

### <a id="ClassRngListsPtr" href="#ClassRngListsPtr">const ClassRngListsPtr</a>

```
searchKey: dwarf.ClassRngListsPtr
tags: [exported]
```

```Go
const ClassRngListsPtr
```

ClassRngListsPtr represents values that are an int64 offset into the "rnglists" section. These are used as the base for ClassRngList values. 

### <a id="ClassStrOffsetsPtr" href="#ClassStrOffsetsPtr">const ClassStrOffsetsPtr</a>

```
searchKey: dwarf.ClassStrOffsetsPtr
tags: [exported]
```

```Go
const ClassStrOffsetsPtr
```

ClassStrOffsetsPtr represents values that are an int64 offset into the "str_offsets" section. 

### <a id="_Tag_name_0" href="#_Tag_name_0">const _Tag_name_0</a>

```
searchKey: dwarf._Tag_name_0
```

```Go
const _Tag_name_0 = "ArrayTypeClassTypeEntryPointEnumerationTypeFormalParameter"
```

### <a id="_Tag_name_1" href="#_Tag_name_1">const _Tag_name_1</a>

```
searchKey: dwarf._Tag_name_1
```

```Go
const _Tag_name_1 = "ImportedDeclaration"
```

### <a id="_Tag_name_2" href="#_Tag_name_2">const _Tag_name_2</a>

```
searchKey: dwarf._Tag_name_2
```

```Go
const _Tag_name_2 = "LabelLexDwarfBlock"
```

### <a id="_Tag_name_3" href="#_Tag_name_3">const _Tag_name_3</a>

```
searchKey: dwarf._Tag_name_3
```

```Go
const _Tag_name_3 = "Member"
```

### <a id="_Tag_name_4" href="#_Tag_name_4">const _Tag_name_4</a>

```
searchKey: dwarf._Tag_name_4
```

```Go
const _Tag_name_4 = "PointerTypeReferenceTypeCompileUnitStringTypeStructType"
```

### <a id="_Tag_name_5" href="#_Tag_name_5">const _Tag_name_5</a>

```
searchKey: dwarf._Tag_name_5
```

```Go
const _Tag_name_5 = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="_Attr_map" href="#_Attr_map">var _Attr_map</a>

```
searchKey: dwarf._Attr_map
```

```Go
var _Attr_map = ...
```

### <a id="_Class_index" href="#_Class_index">var _Class_index</a>

```
searchKey: dwarf._Class_index
```

```Go
var _Class_index = [...]uint8{0, 12, 24, 34, 47, 59, 68, 80, 95, 106, 123, 137, 154, 165, 182, 196}
```

### <a id="attrIsExprloc" href="#attrIsExprloc">var attrIsExprloc</a>

```
searchKey: dwarf.attrIsExprloc
```

```Go
var attrIsExprloc = ...
```

attrIsExprloc indicates attributes that allow exprloc values that are encoded as block values in DWARF 2 and 3. See DWARF 4, Figure 20. 

### <a id="attrPtrClass" href="#attrPtrClass">var attrPtrClass</a>

```
searchKey: dwarf.attrPtrClass
```

```Go
var attrPtrClass = ...
```

attrPtrClass indicates the *ptr class of attributes that have encoding formSecOffset in DWARF 4 or formData* in DWARF 2 and 3. 

### <a id="knownOpcodeLengths" href="#knownOpcodeLengths">var knownOpcodeLengths</a>

```
searchKey: dwarf.knownOpcodeLengths
```

```Go
var knownOpcodeLengths = ...
```

knownOpcodeLengths gives the opcode lengths (in varint arguments) of known standard opcodes. 

### <a id="ErrUnknownPC" href="#ErrUnknownPC">var ErrUnknownPC</a>

```
searchKey: dwarf.ErrUnknownPC
tags: [exported]
```

```Go
var ErrUnknownPC = errors.New("ErrUnknownPC")
```

ErrUnknownPC is the error returned by LineReader.ScanPC when the seek PC is not covered by any entry in the line table. 

### <a id="errSegmentSelector" href="#errSegmentSelector">var errSegmentSelector</a>

```
searchKey: dwarf.errSegmentSelector
```

```Go
var errSegmentSelector = errors.New("non-zero segment_selector size not supported")
```

### <a id="_Tag_index_0" href="#_Tag_index_0">var _Tag_index_0</a>

```
searchKey: dwarf._Tag_index_0
```

```Go
var _Tag_index_0 = [...]uint8{0, 9, 18, 28, 43, 58}
```

### <a id="_Tag_index_2" href="#_Tag_index_2">var _Tag_index_2</a>

```
searchKey: dwarf._Tag_index_2
```

```Go
var _Tag_index_2 = [...]uint8{0, 5, 18}
```

### <a id="_Tag_index_4" href="#_Tag_index_4">var _Tag_index_4</a>

```
searchKey: dwarf._Tag_index_4
```

```Go
var _Tag_index_4 = [...]uint8{0, 11, 24, 35, 45, 55}
```

### <a id="_Tag_index_5" href="#_Tag_index_5">var _Tag_index_5</a>

```
searchKey: dwarf._Tag_index_5
```

```Go
var _Tag_index_5 = ...
```

### <a id="PathJoin" href="#PathJoin">var PathJoin</a>

```
searchKey: dwarf.PathJoin
```

```Go
var PathJoin = pathJoin
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="buf" href="#buf">type buf struct</a>

```
searchKey: dwarf.buf
```

```Go
type buf struct {
	dwarf  *Data
	order  binary.ByteOrder
	format dataFormat
	name   string
	off    Offset
	data   []byte
	err    error
}
```

Data buffer being decoded. 

#### <a id="makeBuf" href="#makeBuf">func makeBuf(d *Data, format dataFormat, name string, off Offset, data []byte) buf</a>

```
searchKey: dwarf.makeBuf
```

```Go
func makeBuf(d *Data, format dataFormat, name string, off Offset, data []byte) buf
```

#### <a id="buf.uint8" href="#buf.uint8">func (b *buf) uint8() uint8</a>

```
searchKey: dwarf.buf.uint8
```

```Go
func (b *buf) uint8() uint8
```

#### <a id="buf.bytes" href="#buf.bytes">func (b *buf) bytes(n int) []byte</a>

```
searchKey: dwarf.buf.bytes
```

```Go
func (b *buf) bytes(n int) []byte
```

#### <a id="buf.skip" href="#buf.skip">func (b *buf) skip(n int)</a>

```
searchKey: dwarf.buf.skip
```

```Go
func (b *buf) skip(n int)
```

#### <a id="buf.string" href="#buf.string">func (b *buf) string() string</a>

```
searchKey: dwarf.buf.string
```

```Go
func (b *buf) string() string
```

#### <a id="buf.uint16" href="#buf.uint16">func (b *buf) uint16() uint16</a>

```
searchKey: dwarf.buf.uint16
```

```Go
func (b *buf) uint16() uint16
```

#### <a id="buf.uint24" href="#buf.uint24">func (b *buf) uint24() uint32</a>

```
searchKey: dwarf.buf.uint24
```

```Go
func (b *buf) uint24() uint32
```

#### <a id="buf.uint32" href="#buf.uint32">func (b *buf) uint32() uint32</a>

```
searchKey: dwarf.buf.uint32
```

```Go
func (b *buf) uint32() uint32
```

#### <a id="buf.uint64" href="#buf.uint64">func (b *buf) uint64() uint64</a>

```
searchKey: dwarf.buf.uint64
```

```Go
func (b *buf) uint64() uint64
```

#### <a id="buf.varint" href="#buf.varint">func (b *buf) varint() (c uint64, bits uint)</a>

```
searchKey: dwarf.buf.varint
```

```Go
func (b *buf) varint() (c uint64, bits uint)
```

Read a varint, which is 7 bits per byte, little endian. the 0x80 bit means read another byte. 

#### <a id="buf.uint" href="#buf.uint">func (b *buf) uint() uint64</a>

```
searchKey: dwarf.buf.uint
```

```Go
func (b *buf) uint() uint64
```

Unsigned int is just a varint. 

#### <a id="buf.int" href="#buf.int">func (b *buf) int() int64</a>

```
searchKey: dwarf.buf.int
```

```Go
func (b *buf) int() int64
```

Signed int is a sign-extended varint. 

#### <a id="buf.addr" href="#buf.addr">func (b *buf) addr() uint64</a>

```
searchKey: dwarf.buf.addr
```

```Go
func (b *buf) addr() uint64
```

Address-sized uint. 

#### <a id="buf.unitLength" href="#buf.unitLength">func (b *buf) unitLength() (length Offset, dwarf64 bool)</a>

```
searchKey: dwarf.buf.unitLength
```

```Go
func (b *buf) unitLength() (length Offset, dwarf64 bool)
```

#### <a id="buf.error" href="#buf.error">func (b *buf) error(s string)</a>

```
searchKey: dwarf.buf.error
```

```Go
func (b *buf) error(s string)
```

#### <a id="buf.entry" href="#buf.entry">func (b *buf) entry(cu *Entry, atab abbrevTable, ubase Offset, vers int) *Entry</a>

```
searchKey: dwarf.buf.entry
```

```Go
func (b *buf) entry(cu *Entry, atab abbrevTable, ubase Offset, vers int) *Entry
```

Entry reads a single entry from buf, decoding according to the given abbreviation table. 

### <a id="dataFormat" href="#dataFormat">type dataFormat interface</a>

```
searchKey: dwarf.dataFormat
```

```Go
type dataFormat interface {
	// DWARF version number. Zero means unknown.
	version() int

	// 64-bit DWARF format?
	dwarf64() (dwarf64 bool, isKnown bool)

	// Size of an address, in bytes. Zero means unknown.
	addrsize() int
}
```

Data format, other than byte order. This affects the handling of certain field formats. 

### <a id="unknownFormat" href="#unknownFormat">type unknownFormat struct{}</a>

```
searchKey: dwarf.unknownFormat
```

```Go
type unknownFormat struct{}
```

Some parts of DWARF have no data format, e.g., abbrevs. 

#### <a id="unknownFormat.version" href="#unknownFormat.version">func (u unknownFormat) version() int</a>

```
searchKey: dwarf.unknownFormat.version
```

```Go
func (u unknownFormat) version() int
```

#### <a id="unknownFormat.dwarf64" href="#unknownFormat.dwarf64">func (u unknownFormat) dwarf64() (bool, bool)</a>

```
searchKey: dwarf.unknownFormat.dwarf64
```

```Go
func (u unknownFormat) dwarf64() (bool, bool)
```

#### <a id="unknownFormat.addrsize" href="#unknownFormat.addrsize">func (u unknownFormat) addrsize() int</a>

```
searchKey: dwarf.unknownFormat.addrsize
```

```Go
func (u unknownFormat) addrsize() int
```

### <a id="DecodeError" href="#DecodeError">type DecodeError struct</a>

```
searchKey: dwarf.DecodeError
tags: [exported]
```

```Go
type DecodeError struct {
	Name   string
	Offset Offset
	Err    string
}
```

#### <a id="DecodeError.Error" href="#DecodeError.Error">func (e DecodeError) Error() string</a>

```
searchKey: dwarf.DecodeError.Error
tags: [exported]
```

```Go
func (e DecodeError) Error() string
```

### <a id="Attr" href="#Attr">type Attr uint32</a>

```
searchKey: dwarf.Attr
tags: [exported]
```

```Go
type Attr uint32
```

An Attr identifies the attribute type in a DWARF Entry's Field. 

#### <a id="Attr.String" href="#Attr.String">func (i Attr) String() string</a>

```
searchKey: dwarf.Attr.String
tags: [exported]
```

```Go
func (i Attr) String() string
```

#### <a id="Attr.GoString" href="#Attr.GoString">func (a Attr) GoString() string</a>

```
searchKey: dwarf.Attr.GoString
tags: [exported]
```

```Go
func (a Attr) GoString() string
```

### <a id="format" href="#format">type format uint32</a>

```
searchKey: dwarf.format
```

```Go
type format uint32
```

A format is a DWARF data encoding format. 

### <a id="Tag" href="#Tag">type Tag uint32</a>

```
searchKey: dwarf.Tag
tags: [exported]
```

```Go
type Tag uint32
```

A Tag is the classification (the type) of an Entry. 

#### <a id="Tag.GoString" href="#Tag.GoString">func (t Tag) GoString() string</a>

```
searchKey: dwarf.Tag.GoString
tags: [exported]
```

```Go
func (t Tag) GoString() string
```

#### <a id="Tag.String" href="#Tag.String">func (i Tag) String() string</a>

```
searchKey: dwarf.Tag.String
tags: [exported]
```

```Go
func (i Tag) String() string
```

### <a id="abbrev" href="#abbrev">type abbrev struct</a>

```
searchKey: dwarf.abbrev
```

```Go
type abbrev struct {
	tag      Tag
	children bool
	field    []afield
}
```

a single entry's description: a sequence of attributes 

### <a id="afield" href="#afield">type afield struct</a>

```
searchKey: dwarf.afield
```

```Go
type afield struct {
	attr  Attr
	fmt   format
	class Class
	val   int64 // for formImplicitConst
}
```

### <a id="abbrevTable" href="#abbrevTable">type abbrevTable map[uint32]dwarf.abbrev</a>

```
searchKey: dwarf.abbrevTable
```

```Go
type abbrevTable map[uint32]abbrev
```

a map from entry format ids to their descriptions 

### <a id="Entry" href="#Entry">type Entry struct</a>

```
searchKey: dwarf.Entry
tags: [exported]
```

```Go
type Entry struct {
	Offset   Offset // offset of Entry in DWARF info
	Tag      Tag    // tag (kind of Entry)
	Children bool   // whether Entry is followed by children
	Field    []Field
}
```

An entry is a sequence of attribute/value pairs. 

#### <a id="Entry.Val" href="#Entry.Val">func (e *Entry) Val(a Attr) interface{}</a>

```
searchKey: dwarf.Entry.Val
tags: [exported]
```

```Go
func (e *Entry) Val(a Attr) interface{}
```

Val returns the value associated with attribute Attr in Entry, or nil if there is no such attribute. 

A common idiom is to merge the check for nil return with the check that the value has the expected dynamic type, as in: 

```
v, ok := e.Val(AttrSibling).(int64)

```
#### <a id="Entry.AttrField" href="#Entry.AttrField">func (e *Entry) AttrField(a Attr) *Field</a>

```
searchKey: dwarf.Entry.AttrField
tags: [exported]
```

```Go
func (e *Entry) AttrField(a Attr) *Field
```

AttrField returns the Field associated with attribute Attr in Entry, or nil if there is no such attribute. 

### <a id="Field" href="#Field">type Field struct</a>

```
searchKey: dwarf.Field
tags: [exported]
```

```Go
type Field struct {
	Attr  Attr
	Val   interface{}
	Class Class
}
```

A Field is a single attribute/value pair in an Entry. 

A value can be one of several "attribute classes" defined by DWARF. The Go types corresponding to each class are: 

```
DWARF class       Go type        Class
-----------       -------        -----
address           uint64         ClassAddress
block             []byte         ClassBlock
constant          int64          ClassConstant
flag              bool           ClassFlag
reference
  to info         dwarf.Offset   ClassReference
  to type unit    uint64         ClassReferenceSig
string            string         ClassString
exprloc           []byte         ClassExprLoc
lineptr           int64          ClassLinePtr
loclistptr        int64          ClassLocListPtr
macptr            int64          ClassMacPtr
rangelistptr      int64          ClassRangeListPtr

```
For unrecognized or vendor-defined attributes, Class may be ClassUnknown. 

### <a id="Class" href="#Class">type Class int</a>

```
searchKey: dwarf.Class
tags: [exported]
```

```Go
type Class int
```

A Class is the DWARF 4 class of an attribute value. 

In general, a given attribute's value may take on one of several possible classes defined by DWARF, each of which leads to a slightly different interpretation of the attribute. 

DWARF version 4 distinguishes attribute value classes more finely than previous versions of DWARF. The reader will disambiguate coarser classes from earlier versions of DWARF into the appropriate DWARF 4 class. For example, DWARF 2 uses "constant" for constants as well as all types of section offsets, but the reader will canonicalize attributes in DWARF 2 files that refer to section offsets to one of the Class*Ptr classes, even though these classes were only defined in DWARF 3. 

#### <a id="formToClass" href="#formToClass">func formToClass(form format, attr Attr, vers int, b *buf) Class</a>

```
searchKey: dwarf.formToClass
```

```Go
func formToClass(form format, attr Attr, vers int, b *buf) Class
```

formToClass returns the DWARF 4 Class for the given form. If the DWARF version is less then 4, it will disambiguate some forms depending on the attribute. 

#### <a id="Class.String" href="#Class.String">func (i Class) String() string</a>

```
searchKey: dwarf.Class.String
tags: [exported]
```

```Go
func (i Class) String() string
```

#### <a id="Class.GoString" href="#Class.GoString">func (i Class) GoString() string</a>

```
searchKey: dwarf.Class.GoString
tags: [exported]
```

```Go
func (i Class) GoString() string
```

### <a id="Offset" href="#Offset">type Offset uint32</a>

```
searchKey: dwarf.Offset
tags: [exported]
```

```Go
type Offset uint32
```

An Offset represents the location of an Entry within the DWARF info. (See Reader.Seek.) 

### <a id="Reader" href="#Reader">type Reader struct</a>

```
searchKey: dwarf.Reader
tags: [exported]
```

```Go
type Reader struct {
	b            buf
	d            *Data
	err          error
	unit         int
	lastUnit     bool   // set if last entry returned by Next is TagCompileUnit/TagPartialUnit
	lastChildren bool   // .Children of last entry returned by Next
	lastSibling  Offset // .Val(AttrSibling) of last entry returned by Next
	cu           *Entry // current compilation unit
}
```

A Reader allows reading Entry structures from a DWARF `info' section. The Entry structures are arranged in a tree. The Reader's Next function return successive entries from a pre-order traversal of the tree. If an entry has children, its Children field will be true, and the children follow, terminated by an Entry with Tag 0. 

#### <a id="Reader.AddressSize" href="#Reader.AddressSize">func (r *Reader) AddressSize() int</a>

```
searchKey: dwarf.Reader.AddressSize
tags: [exported]
```

```Go
func (r *Reader) AddressSize() int
```

AddressSize returns the size in bytes of addresses in the current compilation unit. 

#### <a id="Reader.ByteOrder" href="#Reader.ByteOrder">func (r *Reader) ByteOrder() binary.ByteOrder</a>

```
searchKey: dwarf.Reader.ByteOrder
tags: [exported]
```

```Go
func (r *Reader) ByteOrder() binary.ByteOrder
```

ByteOrder returns the byte order in the current compilation unit. 

#### <a id="Reader.Seek" href="#Reader.Seek">func (r *Reader) Seek(off Offset)</a>

```
searchKey: dwarf.Reader.Seek
tags: [exported]
```

```Go
func (r *Reader) Seek(off Offset)
```

Seek positions the Reader at offset off in the encoded entry stream. Offset 0 can be used to denote the first entry. 

#### <a id="Reader.maybeNextUnit" href="#Reader.maybeNextUnit">func (r *Reader) maybeNextUnit()</a>

```
searchKey: dwarf.Reader.maybeNextUnit
```

```Go
func (r *Reader) maybeNextUnit()
```

maybeNextUnit advances to the next unit if this one is finished. 

#### <a id="Reader.nextUnit" href="#Reader.nextUnit">func (r *Reader) nextUnit()</a>

```
searchKey: dwarf.Reader.nextUnit
```

```Go
func (r *Reader) nextUnit()
```

nextUnit advances to the next unit. 

#### <a id="Reader.Next" href="#Reader.Next">func (r *Reader) Next() (*Entry, error)</a>

```
searchKey: dwarf.Reader.Next
tags: [exported]
```

```Go
func (r *Reader) Next() (*Entry, error)
```

Next reads the next entry from the encoded entry stream. It returns nil, nil when it reaches the end of the section. It returns an error if the current offset is invalid or the data at the offset cannot be decoded as a valid Entry. 

#### <a id="Reader.SkipChildren" href="#Reader.SkipChildren">func (r *Reader) SkipChildren()</a>

```
searchKey: dwarf.Reader.SkipChildren
tags: [exported]
```

```Go
func (r *Reader) SkipChildren()
```

SkipChildren skips over the child entries associated with the last Entry returned by Next. If that Entry did not have children or Next has not been called, SkipChildren is a no-op. 

#### <a id="Reader.clone" href="#Reader.clone">func (r *Reader) clone() typeReader</a>

```
searchKey: dwarf.Reader.clone
```

```Go
func (r *Reader) clone() typeReader
```

clone returns a copy of the reader. This is used by the typeReader interface. 

#### <a id="Reader.offset" href="#Reader.offset">func (r *Reader) offset() Offset</a>

```
searchKey: dwarf.Reader.offset
```

```Go
func (r *Reader) offset() Offset
```

offset returns the current buffer offset. This is used by the typeReader interface. 

#### <a id="Reader.SeekPC" href="#Reader.SeekPC">func (r *Reader) SeekPC(pc uint64) (*Entry, error)</a>

```
searchKey: dwarf.Reader.SeekPC
tags: [exported]
```

```Go
func (r *Reader) SeekPC(pc uint64) (*Entry, error)
```

SeekPC returns the Entry for the compilation unit that includes pc, and positions the reader to read the children of that unit.  If pc is not covered by any unit, SeekPC returns ErrUnknownPC and the position of the reader is undefined. 

Because compilation units can describe multiple regions of the executable, in the worst case SeekPC must search through all the ranges in all the compilation units. Each call to SeekPC starts the search at the compilation unit of the last call, so in general looking up a series of PCs will be faster if they are sorted. If the caller wishes to do repeated fast PC lookups, it should build an appropriate index using the Ranges method. 

### <a id="LineReader" href="#LineReader">type LineReader struct</a>

```
searchKey: dwarf.LineReader
tags: [exported]
```

```Go
type LineReader struct {
	buf buf

	// Original .debug_line section data. Used by Seek.
	section []byte

	str     []byte // .debug_str
	lineStr []byte // .debug_line_str

	// Header information
	version              uint16
	addrsize             int
	segmentSelectorSize  int
	minInstructionLength int
	maxOpsPerInstruction int
	defaultIsStmt        bool
	lineBase             int
	lineRange            int
	opcodeBase           int
	opcodeLengths        []int
	directories          []string
	fileEntries          []*LineFile

	programOffset Offset // section offset of line number program
	endOffset     Offset // section offset of byte following program

	initialFileEntries int // initial length of fileEntries

	// Current line number program state machine registers
	state     LineEntry // public state
	fileIndex int       // private state
}
```

A LineReader reads a sequence of LineEntry structures from a DWARF "line" section for a single compilation unit. LineEntries occur in order of increasing PC and each LineEntry gives metadata for the instructions from that LineEntry's PC to just before the next LineEntry's PC. The last entry will have its EndSequence field set. 

#### <a id="LineReader.readHeader" href="#LineReader.readHeader">func (r *LineReader) readHeader(compDir string) error</a>

```
searchKey: dwarf.LineReader.readHeader
```

```Go
func (r *LineReader) readHeader(compDir string) error
```

readHeader reads the line number program header from r.buf and sets all of the header fields in r. 

#### <a id="LineReader.readLNCTFormat" href="#LineReader.readLNCTFormat">func (r *LineReader) readLNCTFormat() []lnctForm</a>

```
searchKey: dwarf.LineReader.readLNCTFormat
```

```Go
func (r *LineReader) readLNCTFormat() []lnctForm
```

readLNCTFormat reads an LNCT format description. 

#### <a id="LineReader.readLNCT" href="#LineReader.readLNCT">func (r *LineReader) readLNCT(s []lnctForm, dwarf64 bool) (path string, mtime uint64, size uint64, err error)</a>

```
searchKey: dwarf.LineReader.readLNCT
```

```Go
func (r *LineReader) readLNCT(s []lnctForm, dwarf64 bool) (path string, mtime uint64, size uint64, err error)
```

readLNCT reads a sequence of LNCT entries and returns path information. 

#### <a id="LineReader.readFileEntry" href="#LineReader.readFileEntry">func (r *LineReader) readFileEntry() (bool, error)</a>

```
searchKey: dwarf.LineReader.readFileEntry
```

```Go
func (r *LineReader) readFileEntry() (bool, error)
```

readFileEntry reads a file entry from either the header or a DW_LNE_define_file extended opcode and adds it to r.fileEntries. A true return value indicates that there are no more entries to read. 

#### <a id="LineReader.updateFile" href="#LineReader.updateFile">func (r *LineReader) updateFile()</a>

```
searchKey: dwarf.LineReader.updateFile
```

```Go
func (r *LineReader) updateFile()
```

updateFile updates r.state.File after r.fileIndex has changed or r.fileEntries has changed. 

#### <a id="LineReader.Next" href="#LineReader.Next">func (r *LineReader) Next(entry *LineEntry) error</a>

```
searchKey: dwarf.LineReader.Next
tags: [exported]
```

```Go
func (r *LineReader) Next(entry *LineEntry) error
```

Next sets *entry to the next row in this line table and moves to the next row. If there are no more entries and the line table is properly terminated, it returns io.EOF. 

Rows are always in order of increasing entry.Address, but entry.Line may go forward or backward. 

#### <a id="LineReader.step" href="#LineReader.step">func (r *LineReader) step(entry *LineEntry) bool</a>

```
searchKey: dwarf.LineReader.step
```

```Go
func (r *LineReader) step(entry *LineEntry) bool
```

step processes the next opcode and updates r.state. If the opcode emits a row in the line table, this updates *entry and returns true. 

#### <a id="LineReader.advancePC" href="#LineReader.advancePC">func (r *LineReader) advancePC(opAdvance int)</a>

```
searchKey: dwarf.LineReader.advancePC
```

```Go
func (r *LineReader) advancePC(opAdvance int)
```

advancePC advances "operation pointer" (the combination of Address and OpIndex) in r.state by opAdvance steps. 

#### <a id="LineReader.Tell" href="#LineReader.Tell">func (r *LineReader) Tell() LineReaderPos</a>

```
searchKey: dwarf.LineReader.Tell
tags: [exported]
```

```Go
func (r *LineReader) Tell() LineReaderPos
```

Tell returns the current position in the line table. 

#### <a id="LineReader.Seek" href="#LineReader.Seek">func (r *LineReader) Seek(pos LineReaderPos)</a>

```
searchKey: dwarf.LineReader.Seek
tags: [exported]
```

```Go
func (r *LineReader) Seek(pos LineReaderPos)
```

Seek restores the line table reader to a position returned by Tell. 

The argument pos must have been returned by a call to Tell on this line table. 

#### <a id="LineReader.Reset" href="#LineReader.Reset">func (r *LineReader) Reset()</a>

```
searchKey: dwarf.LineReader.Reset
tags: [exported]
```

```Go
func (r *LineReader) Reset()
```

Reset repositions the line table reader at the beginning of the line table. 

#### <a id="LineReader.resetState" href="#LineReader.resetState">func (r *LineReader) resetState()</a>

```
searchKey: dwarf.LineReader.resetState
```

```Go
func (r *LineReader) resetState()
```

resetState resets r.state to its default values 

#### <a id="LineReader.Files" href="#LineReader.Files">func (r *LineReader) Files() []*LineFile</a>

```
searchKey: dwarf.LineReader.Files
tags: [exported]
```

```Go
func (r *LineReader) Files() []*LineFile
```

Files returns the file name table of this compilation unit as of the current position in the line table. The file name table may be referenced from attributes in this compilation unit such as AttrDeclFile. 

Entry 0 is always nil, since file index 0 represents "no file". 

The file name table of a compilation unit is not fixed. Files returns the file table as of the current position in the line table. This may contain more entries than the file table at an earlier position in the line table, though existing entries never change. 

#### <a id="LineReader.SeekPC" href="#LineReader.SeekPC">func (r *LineReader) SeekPC(pc uint64, entry *LineEntry) error</a>

```
searchKey: dwarf.LineReader.SeekPC
tags: [exported]
```

```Go
func (r *LineReader) SeekPC(pc uint64, entry *LineEntry) error
```

SeekPC sets *entry to the LineEntry that includes pc and positions the reader on the next entry in the line table. If necessary, this will seek backwards to find pc. 

If pc is not covered by any entry in this line table, SeekPC returns ErrUnknownPC. In this case, *entry and the final seek position are unspecified. 

Note that DWARF line tables only permit sequential, forward scans. Hence, in the worst case, this takes time linear in the size of the line table. If the caller wishes to do repeated fast PC lookups, it should build an appropriate index of the line table. 

### <a id="LineEntry" href="#LineEntry">type LineEntry struct</a>

```
searchKey: dwarf.LineEntry
tags: [exported]
```

```Go
type LineEntry struct {
	// Address is the program-counter value of a machine
	// instruction generated by the compiler. This LineEntry
	// applies to each instruction from Address to just before the
	// Address of the next LineEntry.
	Address uint64

	// OpIndex is the index of an operation within a VLIW
	// instruction. The index of the first operation is 0. For
	// non-VLIW architectures, it will always be 0. Address and
	// OpIndex together form an operation pointer that can
	// reference any individual operation within the instruction
	// stream.
	OpIndex int

	// File is the source file corresponding to these
	// instructions.
	File *LineFile

	// Line is the source code line number corresponding to these
	// instructions. Lines are numbered beginning at 1. It may be
	// 0 if these instructions cannot be attributed to any source
	// line.
	Line int

	// Column is the column number within the source line of these
	// instructions. Columns are numbered beginning at 1. It may
	// be 0 to indicate the "left edge" of the line.
	Column int

	// IsStmt indicates that Address is a recommended breakpoint
	// location, such as the beginning of a line, statement, or a
	// distinct subpart of a statement.
	IsStmt bool

	// BasicBlock indicates that Address is the beginning of a
	// basic block.
	BasicBlock bool

	// PrologueEnd indicates that Address is one (of possibly
	// many) PCs where execution should be suspended for a
	// breakpoint on entry to the containing function.
	//
	// Added in DWARF 3.
	PrologueEnd bool

	// EpilogueBegin indicates that Address is one (of possibly
	// many) PCs where execution should be suspended for a
	// breakpoint on exit from this function.
	//
	// Added in DWARF 3.
	EpilogueBegin bool

	// ISA is the instruction set architecture for these
	// instructions. Possible ISA values should be defined by the
	// applicable ABI specification.
	//
	// Added in DWARF 3.
	ISA int

	// Discriminator is an arbitrary integer indicating the block
	// to which these instructions belong. It serves to
	// distinguish among multiple blocks that may all have with
	// the same source file, line, and column. Where only one
	// block exists for a given source position, it should be 0.
	//
	// Added in DWARF 3.
	Discriminator int

	// EndSequence indicates that Address is the first byte after
	// the end of a sequence of target machine instructions. If it
	// is set, only this and the Address field are meaningful. A
	// line number table may contain information for multiple
	// potentially disjoint instruction sequences. The last entry
	// in a line table should always have EndSequence set.
	EndSequence bool
}
```

A LineEntry is a row in a DWARF line table. 

### <a id="LineFile" href="#LineFile">type LineFile struct</a>

```
searchKey: dwarf.LineFile
tags: [exported]
```

```Go
type LineFile struct {
	Name   string
	Mtime  uint64 // Implementation defined modification time, or 0 if unknown
	Length int    // File length, or 0 if unknown
}
```

A LineFile is a source file referenced by a DWARF line table entry. 

### <a id="lnctForm" href="#lnctForm">type lnctForm struct</a>

```
searchKey: dwarf.lnctForm
```

```Go
type lnctForm struct {
	lnct int
	form format
}
```

lnctForm is a pair of an LNCT code and a form. This represents an entry in the directory name or file name description in the DWARF 5 line number program header. 

### <a id="LineReaderPos" href="#LineReaderPos">type LineReaderPos struct</a>

```
searchKey: dwarf.LineReaderPos
tags: [exported]
```

```Go
type LineReaderPos struct {
	// off is the current offset in the DWARF line section.
	off Offset
	// numFileEntries is the length of fileEntries.
	numFileEntries int
	// state and fileIndex are the statement machine state at
	// offset off.
	state     LineEntry
	fileIndex int
}
```

A LineReaderPos represents a position in a line table. 

### <a id="Data" href="#Data">type Data struct</a>

```
searchKey: dwarf.Data
tags: [exported]
```

```Go
type Data struct {
	// raw data
	abbrev   []byte
	aranges  []byte
	frame    []byte
	info     []byte
	line     []byte
	pubnames []byte
	ranges   []byte
	str      []byte

	// New sections added in DWARF 5.
	addr       []byte
	lineStr    []byte
	strOffsets []byte
	rngLists   []byte

	// parsed data
	abbrevCache map[uint64]abbrevTable
	bigEndian   bool
	order       binary.ByteOrder
	typeCache   map[Offset]Type
	typeSigs    map[uint64]*typeUnit
	unit        []unit
}
```

Data represents the DWARF debugging information loaded from an executable file (for example, an ELF or Mach-O executable). 

#### <a id="New" href="#New">func New(abbrev, aranges, frame, info, line, pubnames, ranges, str []byte) (*Data, error)</a>

```
searchKey: dwarf.New
tags: [exported]
```

```Go
func New(abbrev, aranges, frame, info, line, pubnames, ranges, str []byte) (*Data, error)
```

New returns a new Data object initialized from the given parameters. Rather than calling this function directly, clients should typically use the DWARF method of the File type of the appropriate package debug/elf, debug/macho, or debug/pe. 

The []byte arguments are the data from the corresponding debug section in the object file; for example, for an ELF object, abbrev is the contents of the ".debug_abbrev" section. 

#### <a id="Data.parseAbbrev" href="#Data.parseAbbrev">func (d *Data) parseAbbrev(off uint64, vers int) (abbrevTable, error)</a>

```
searchKey: dwarf.Data.parseAbbrev
```

```Go
func (d *Data) parseAbbrev(off uint64, vers int) (abbrevTable, error)
```

ParseAbbrev returns the abbreviation table that starts at byte off in the .debug_abbrev section. 

#### <a id="Data.Reader" href="#Data.Reader">func (d *Data) Reader() *Reader</a>

```
searchKey: dwarf.Data.Reader
tags: [exported]
```

```Go
func (d *Data) Reader() *Reader
```

Reader returns a new Reader for Data. The reader is positioned at byte offset 0 in the DWARF `info' section. 

#### <a id="Data.Ranges" href="#Data.Ranges">func (d *Data) Ranges(e *Entry) ([][2]uint64, error)</a>

```
searchKey: dwarf.Data.Ranges
tags: [exported]
```

```Go
func (d *Data) Ranges(e *Entry) ([][2]uint64, error)
```

Ranges returns the PC ranges covered by e, a slice of [low,high) pairs. Only some entry types, such as TagCompileUnit or TagSubprogram, have PC ranges; for others, this will return nil with no error. 

#### <a id="Data.baseAddressForEntry" href="#Data.baseAddressForEntry">func (d *Data) baseAddressForEntry(e *Entry) (*Entry, uint64, error)</a>

```
searchKey: dwarf.Data.baseAddressForEntry
```

```Go
func (d *Data) baseAddressForEntry(e *Entry) (*Entry, uint64, error)
```

baseAddressForEntry returns the initial base address to be used when looking up the range list of entry e. DWARF specifies that this should be the lowpc attribute of the enclosing compilation unit, however comments in gdb/dwarf2read.c say that some versions of GCC use the entrypc attribute, so we check that too. 

#### <a id="Data.dwarf2Ranges" href="#Data.dwarf2Ranges">func (d *Data) dwarf2Ranges(u *unit, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)</a>

```
searchKey: dwarf.Data.dwarf2Ranges
```

```Go
func (d *Data) dwarf2Ranges(u *unit, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)
```

#### <a id="Data.dwarf5Ranges" href="#Data.dwarf5Ranges">func (d *Data) dwarf5Ranges(u *unit, cu *Entry, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)</a>

```
searchKey: dwarf.Data.dwarf5Ranges
```

```Go
func (d *Data) dwarf5Ranges(u *unit, cu *Entry, base uint64, ranges int64, ret [][2]uint64) ([][2]uint64, error)
```

dwarf5Ranges interpets a debug_rnglists sequence, see DWARFv5 section 2.17.3 (page 53). 

#### <a id="Data.debugAddr" href="#Data.debugAddr">func (d *Data) debugAddr(format dataFormat, addrBase, idx uint64) (uint64, error)</a>

```
searchKey: dwarf.Data.debugAddr
```

```Go
func (d *Data) debugAddr(format dataFormat, addrBase, idx uint64) (uint64, error)
```

debugAddr returns the address at idx in debug_addr 

#### <a id="Data.LineReader" href="#Data.LineReader">func (d *Data) LineReader(cu *Entry) (*LineReader, error)</a>

```
searchKey: dwarf.Data.LineReader
tags: [exported]
```

```Go
func (d *Data) LineReader(cu *Entry) (*LineReader, error)
```

LineReader returns a new reader for the line table of compilation unit cu, which must be an Entry with tag TagCompileUnit. 

If this compilation unit has no line table, it returns nil, nil. 

#### <a id="Data.AddTypes" href="#Data.AddTypes">func (d *Data) AddTypes(name string, types []byte) error</a>

```
searchKey: dwarf.Data.AddTypes
tags: [exported]
```

```Go
func (d *Data) AddTypes(name string, types []byte) error
```

AddTypes will add one .debug_types section to the DWARF data. A typical object with DWARF version 4 debug info will have multiple .debug_types sections. The name is used for error reporting only, and serves to distinguish one .debug_types section from another. 

#### <a id="Data.AddSection" href="#Data.AddSection">func (d *Data) AddSection(name string, contents []byte) error</a>

```
searchKey: dwarf.Data.AddSection
tags: [exported]
```

```Go
func (d *Data) AddSection(name string, contents []byte) error
```

AddSection adds another DWARF section by name. The name should be a DWARF section name such as ".debug_addr", ".debug_str_offsets", and so forth. This approach is used for new DWARF sections added in DWARF 5 and later. 

#### <a id="Data.Type" href="#Data.Type">func (d *Data) Type(off Offset) (Type, error)</a>

```
searchKey: dwarf.Data.Type
tags: [exported]
```

```Go
func (d *Data) Type(off Offset) (Type, error)
```

Type reads the type at off in the DWARF `info' section. 

#### <a id="Data.readType" href="#Data.readType">func (d *Data) readType(name string, r typeReader, off Offset, typeCache map[Offset]Type, fixups *typeFixer) (Type, error)</a>

```
searchKey: dwarf.Data.readType
```

```Go
func (d *Data) readType(name string, r typeReader, off Offset, typeCache map[Offset]Type, fixups *typeFixer) (Type, error)
```

readType reads a type from r at off of name. It adds types to the type cache, appends new typedef types to typedefs, and computes the sizes of types. Callers should pass nil for typedefs; this is used for internal recursion. 

#### <a id="Data.parseTypes" href="#Data.parseTypes">func (d *Data) parseTypes(name string, types []byte) error</a>

```
searchKey: dwarf.Data.parseTypes
```

```Go
func (d *Data) parseTypes(name string, types []byte) error
```

Parse a .debug_types section. 

#### <a id="Data.sigToType" href="#Data.sigToType">func (d *Data) sigToType(sig uint64) (Type, error)</a>

```
searchKey: dwarf.Data.sigToType
```

```Go
func (d *Data) sigToType(sig uint64) (Type, error)
```

Return the type for a type signature. 

#### <a id="Data.parseUnits" href="#Data.parseUnits">func (d *Data) parseUnits() ([]unit, error)</a>

```
searchKey: dwarf.Data.parseUnits
```

```Go
func (d *Data) parseUnits() ([]unit, error)
```

#### <a id="Data.offsetToUnit" href="#Data.offsetToUnit">func (d *Data) offsetToUnit(off Offset) int</a>

```
searchKey: dwarf.Data.offsetToUnit
```

```Go
func (d *Data) offsetToUnit(off Offset) int
```

offsetToUnit returns the index of the unit containing offset off. It returns -1 if no unit contains this offset. 

### <a id="Type" href="#Type">type Type interface</a>

```
searchKey: dwarf.Type
tags: [exported]
```

```Go
type Type interface {
	Common() *CommonType
	String() string
	Size() int64
}
```

A Type conventionally represents a pointer to any of the specific Type structures (CharType, StructType, etc.). 

### <a id="CommonType" href="#CommonType">type CommonType struct</a>

```
searchKey: dwarf.CommonType
tags: [exported]
```

```Go
type CommonType struct {
	ByteSize int64  // size of value of this type, in bytes
	Name     string // name that can be used to refer to type
}
```

A CommonType holds fields common to multiple types. If a field is not known or not applicable for a given type, the zero value is used. 

#### <a id="CommonType.Common" href="#CommonType.Common">func (c *CommonType) Common() *CommonType</a>

```
searchKey: dwarf.CommonType.Common
tags: [exported]
```

```Go
func (c *CommonType) Common() *CommonType
```

#### <a id="CommonType.Size" href="#CommonType.Size">func (c *CommonType) Size() int64</a>

```
searchKey: dwarf.CommonType.Size
tags: [exported]
```

```Go
func (c *CommonType) Size() int64
```

### <a id="BasicType" href="#BasicType">type BasicType struct</a>

```
searchKey: dwarf.BasicType
tags: [exported]
```

```Go
type BasicType struct {
	CommonType
	BitSize   int64
	BitOffset int64
}
```

A BasicType holds fields common to all basic types. 

#### <a id="BasicType.Basic" href="#BasicType.Basic">func (b *BasicType) Basic() *BasicType</a>

```
searchKey: dwarf.BasicType.Basic
tags: [exported]
```

```Go
func (b *BasicType) Basic() *BasicType
```

#### <a id="BasicType.String" href="#BasicType.String">func (t *BasicType) String() string</a>

```
searchKey: dwarf.BasicType.String
tags: [exported]
```

```Go
func (t *BasicType) String() string
```

### <a id="CharType" href="#CharType">type CharType struct</a>

```
searchKey: dwarf.CharType
tags: [exported]
```

```Go
type CharType struct {
	BasicType
}
```

A CharType represents a signed character type. 

### <a id="UcharType" href="#UcharType">type UcharType struct</a>

```
searchKey: dwarf.UcharType
tags: [exported]
```

```Go
type UcharType struct {
	BasicType
}
```

A UcharType represents an unsigned character type. 

### <a id="IntType" href="#IntType">type IntType struct</a>

```
searchKey: dwarf.IntType
tags: [exported]
```

```Go
type IntType struct {
	BasicType
}
```

An IntType represents a signed integer type. 

### <a id="UintType" href="#UintType">type UintType struct</a>

```
searchKey: dwarf.UintType
tags: [exported]
```

```Go
type UintType struct {
	BasicType
}
```

A UintType represents an unsigned integer type. 

### <a id="FloatType" href="#FloatType">type FloatType struct</a>

```
searchKey: dwarf.FloatType
tags: [exported]
```

```Go
type FloatType struct {
	BasicType
}
```

A FloatType represents a floating point type. 

### <a id="ComplexType" href="#ComplexType">type ComplexType struct</a>

```
searchKey: dwarf.ComplexType
tags: [exported]
```

```Go
type ComplexType struct {
	BasicType
}
```

A ComplexType represents a complex floating point type. 

### <a id="BoolType" href="#BoolType">type BoolType struct</a>

```
searchKey: dwarf.BoolType
tags: [exported]
```

```Go
type BoolType struct {
	BasicType
}
```

A BoolType represents a boolean type. 

### <a id="AddrType" href="#AddrType">type AddrType struct</a>

```
searchKey: dwarf.AddrType
tags: [exported]
```

```Go
type AddrType struct {
	BasicType
}
```

An AddrType represents a machine address type. 

### <a id="UnspecifiedType" href="#UnspecifiedType">type UnspecifiedType struct</a>

```
searchKey: dwarf.UnspecifiedType
tags: [exported]
```

```Go
type UnspecifiedType struct {
	BasicType
}
```

An UnspecifiedType represents an implicit, unknown, ambiguous or nonexistent type. 

### <a id="QualType" href="#QualType">type QualType struct</a>

```
searchKey: dwarf.QualType
tags: [exported]
```

```Go
type QualType struct {
	CommonType
	Qual string
	Type Type
}
```

A QualType represents a type that has the C/C++ "const", "restrict", or "volatile" qualifier. 

#### <a id="QualType.String" href="#QualType.String">func (t *QualType) String() string</a>

```
searchKey: dwarf.QualType.String
tags: [exported]
```

```Go
func (t *QualType) String() string
```

#### <a id="QualType.Size" href="#QualType.Size">func (t *QualType) Size() int64</a>

```
searchKey: dwarf.QualType.Size
tags: [exported]
```

```Go
func (t *QualType) Size() int64
```

### <a id="ArrayType" href="#ArrayType">type ArrayType struct</a>

```
searchKey: dwarf.ArrayType
tags: [exported]
```

```Go
type ArrayType struct {
	CommonType
	Type          Type
	StrideBitSize int64 // if > 0, number of bits to hold each element
	Count         int64 // if == -1, an incomplete array, like char x[].
}
```

An ArrayType represents a fixed size array type. 

#### <a id="ArrayType.String" href="#ArrayType.String">func (t *ArrayType) String() string</a>

```
searchKey: dwarf.ArrayType.String
tags: [exported]
```

```Go
func (t *ArrayType) String() string
```

#### <a id="ArrayType.Size" href="#ArrayType.Size">func (t *ArrayType) Size() int64</a>

```
searchKey: dwarf.ArrayType.Size
tags: [exported]
```

```Go
func (t *ArrayType) Size() int64
```

### <a id="VoidType" href="#VoidType">type VoidType struct</a>

```
searchKey: dwarf.VoidType
tags: [exported]
```

```Go
type VoidType struct {
	CommonType
}
```

A VoidType represents the C void type. 

#### <a id="VoidType.String" href="#VoidType.String">func (t *VoidType) String() string</a>

```
searchKey: dwarf.VoidType.String
tags: [exported]
```

```Go
func (t *VoidType) String() string
```

### <a id="PtrType" href="#PtrType">type PtrType struct</a>

```
searchKey: dwarf.PtrType
tags: [exported]
```

```Go
type PtrType struct {
	CommonType
	Type Type
}
```

A PtrType represents a pointer type. 

#### <a id="PtrType.String" href="#PtrType.String">func (t *PtrType) String() string</a>

```
searchKey: dwarf.PtrType.String
tags: [exported]
```

```Go
func (t *PtrType) String() string
```

### <a id="StructType" href="#StructType">type StructType struct</a>

```
searchKey: dwarf.StructType
tags: [exported]
```

```Go
type StructType struct {
	CommonType
	StructName string
	Kind       string // "struct", "union", or "class".
	Field      []*StructField
	Incomplete bool // if true, struct, union, class is declared but not defined
}
```

A StructType represents a struct, union, or C++ class type. 

#### <a id="StructType.String" href="#StructType.String">func (t *StructType) String() string</a>

```
searchKey: dwarf.StructType.String
tags: [exported]
```

```Go
func (t *StructType) String() string
```

#### <a id="StructType.Defn" href="#StructType.Defn">func (t *StructType) Defn() string</a>

```
searchKey: dwarf.StructType.Defn
tags: [exported]
```

```Go
func (t *StructType) Defn() string
```

### <a id="StructField" href="#StructField">type StructField struct</a>

```
searchKey: dwarf.StructField
tags: [exported]
```

```Go
type StructField struct {
	Name       string
	Type       Type
	ByteOffset int64
	ByteSize   int64 // usually zero; use Type.Size() for normal fields
	BitOffset  int64 // within the ByteSize bytes at ByteOffset
	BitSize    int64 // zero if not a bit field
}
```

A StructField represents a field in a struct, union, or C++ class type. 

### <a id="EnumType" href="#EnumType">type EnumType struct</a>

```
searchKey: dwarf.EnumType
tags: [exported]
```

```Go
type EnumType struct {
	CommonType
	EnumName string
	Val      []*EnumValue
}
```

An EnumType represents an enumerated type. The only indication of its native integer type is its ByteSize (inside CommonType). 

#### <a id="EnumType.String" href="#EnumType.String">func (t *EnumType) String() string</a>

```
searchKey: dwarf.EnumType.String
tags: [exported]
```

```Go
func (t *EnumType) String() string
```

### <a id="EnumValue" href="#EnumValue">type EnumValue struct</a>

```
searchKey: dwarf.EnumValue
tags: [exported]
```

```Go
type EnumValue struct {
	Name string
	Val  int64
}
```

An EnumValue represents a single enumeration value. 

### <a id="FuncType" href="#FuncType">type FuncType struct</a>

```
searchKey: dwarf.FuncType
tags: [exported]
```

```Go
type FuncType struct {
	CommonType
	ReturnType Type
	ParamType  []Type
}
```

A FuncType represents a function type. 

#### <a id="FuncType.String" href="#FuncType.String">func (t *FuncType) String() string</a>

```
searchKey: dwarf.FuncType.String
tags: [exported]
```

```Go
func (t *FuncType) String() string
```

### <a id="DotDotDotType" href="#DotDotDotType">type DotDotDotType struct</a>

```
searchKey: dwarf.DotDotDotType
tags: [exported]
```

```Go
type DotDotDotType struct {
	CommonType
}
```

A DotDotDotType represents the variadic ... function parameter. 

#### <a id="DotDotDotType.String" href="#DotDotDotType.String">func (t *DotDotDotType) String() string</a>

```
searchKey: dwarf.DotDotDotType.String
tags: [exported]
```

```Go
func (t *DotDotDotType) String() string
```

### <a id="TypedefType" href="#TypedefType">type TypedefType struct</a>

```
searchKey: dwarf.TypedefType
tags: [exported]
```

```Go
type TypedefType struct {
	CommonType
	Type Type
}
```

A TypedefType represents a named type. 

#### <a id="TypedefType.String" href="#TypedefType.String">func (t *TypedefType) String() string</a>

```
searchKey: dwarf.TypedefType.String
tags: [exported]
```

```Go
func (t *TypedefType) String() string
```

#### <a id="TypedefType.Size" href="#TypedefType.Size">func (t *TypedefType) Size() int64</a>

```
searchKey: dwarf.TypedefType.Size
tags: [exported]
```

```Go
func (t *TypedefType) Size() int64
```

### <a id="UnsupportedType" href="#UnsupportedType">type UnsupportedType struct</a>

```
searchKey: dwarf.UnsupportedType
tags: [exported]
```

```Go
type UnsupportedType struct {
	CommonType
	Tag Tag
}
```

An UnsupportedType is a placeholder returned in situations where we encounter a type that isn't supported. 

#### <a id="UnsupportedType.String" href="#UnsupportedType.String">func (t *UnsupportedType) String() string</a>

```
searchKey: dwarf.UnsupportedType.String
tags: [exported]
```

```Go
func (t *UnsupportedType) String() string
```

### <a id="typeReader" href="#typeReader">type typeReader interface</a>

```
searchKey: dwarf.typeReader
```

```Go
type typeReader interface {
	Seek(Offset)
	Next() (*Entry, error)
	clone() typeReader
	offset() Offset
	// AddressSize returns the size in bytes of addresses in the current
	// compilation unit.
	AddressSize() int
}
```

typeReader is used to read from either the info section or the types section. 

### <a id="typeFixer" href="#typeFixer">type typeFixer struct</a>

```
searchKey: dwarf.typeFixer
```

```Go
type typeFixer struct {
	typedefs   []*TypedefType
	arraytypes []*Type
}
```

#### <a id="typeFixer.recordArrayType" href="#typeFixer.recordArrayType">func (tf *typeFixer) recordArrayType(t *Type)</a>

```
searchKey: dwarf.typeFixer.recordArrayType
```

```Go
func (tf *typeFixer) recordArrayType(t *Type)
```

#### <a id="typeFixer.apply" href="#typeFixer.apply">func (tf *typeFixer) apply()</a>

```
searchKey: dwarf.typeFixer.apply
```

```Go
func (tf *typeFixer) apply()
```

### <a id="typeUnit" href="#typeUnit">type typeUnit struct</a>

```
searchKey: dwarf.typeUnit
```

```Go
type typeUnit struct {
	unit
	toff  Offset // Offset to signature type within data.
	name  string // Name of .debug_type section.
	cache Type   // Cache the type, nil to start.
}
```

The typeUnit format is a single type with a signature. It holds the same data as a compilation unit. 

### <a id="typeUnitReader" href="#typeUnitReader">type typeUnitReader struct</a>

```
searchKey: dwarf.typeUnitReader
```

```Go
type typeUnitReader struct {
	d   *Data
	tu  *typeUnit
	b   buf
	err error
}
```

typeUnitReader is a typeReader for a tagTypeUnit. 

#### <a id="typeUnitReader.Seek" href="#typeUnitReader.Seek">func (tur *typeUnitReader) Seek(off Offset)</a>

```
searchKey: dwarf.typeUnitReader.Seek
```

```Go
func (tur *typeUnitReader) Seek(off Offset)
```

Seek to a new position in the type unit. 

#### <a id="typeUnitReader.AddressSize" href="#typeUnitReader.AddressSize">func (tur *typeUnitReader) AddressSize() int</a>

```
searchKey: dwarf.typeUnitReader.AddressSize
```

```Go
func (tur *typeUnitReader) AddressSize() int
```

AddressSize returns the size in bytes of addresses in the current type unit. 

#### <a id="typeUnitReader.Next" href="#typeUnitReader.Next">func (tur *typeUnitReader) Next() (*Entry, error)</a>

```
searchKey: dwarf.typeUnitReader.Next
```

```Go
func (tur *typeUnitReader) Next() (*Entry, error)
```

Next reads the next Entry from the type unit. 

#### <a id="typeUnitReader.clone" href="#typeUnitReader.clone">func (tur *typeUnitReader) clone() typeReader</a>

```
searchKey: dwarf.typeUnitReader.clone
```

```Go
func (tur *typeUnitReader) clone() typeReader
```

clone returns a new reader for the type unit. 

#### <a id="typeUnitReader.offset" href="#typeUnitReader.offset">func (tur *typeUnitReader) offset() Offset</a>

```
searchKey: dwarf.typeUnitReader.offset
```

```Go
func (tur *typeUnitReader) offset() Offset
```

offset returns the current offset. 

### <a id="unit" href="#unit">type unit struct</a>

```
searchKey: dwarf.unit
```

```Go
type unit struct {
	base   Offset // byte offset of header within the aggregate info
	off    Offset // byte offset of data within the aggregate info
	data   []byte
	atable abbrevTable
	asize  int
	vers   int
	utype  uint8 // DWARF 5 unit type
	is64   bool  // True for 64-bit DWARF format
}
```

#### <a id="unit.version" href="#unit.version">func (u *unit) version() int</a>

```
searchKey: dwarf.unit.version
```

```Go
func (u *unit) version() int
```

#### <a id="unit.dwarf64" href="#unit.dwarf64">func (u *unit) dwarf64() (bool, bool)</a>

```
searchKey: dwarf.unit.dwarf64
```

```Go
func (u *unit) dwarf64() (bool, bool)
```

#### <a id="unit.addrsize" href="#unit.addrsize">func (u *unit) addrsize() int</a>

```
searchKey: dwarf.unit.addrsize
```

```Go
func (u *unit) addrsize() int
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="_" href="#_">func _()</a>

```
searchKey: dwarf._
```

```Go
func _()
```

### <a id="_" href="#_">func _()</a>

```
searchKey: dwarf._
```

```Go
func _()
```

### <a id="pathIsAbs" href="#pathIsAbs">func pathIsAbs(path string) bool</a>

```
searchKey: dwarf.pathIsAbs
```

```Go
func pathIsAbs(path string) bool
```

pathIsAbs reports whether path is an absolute path (or "full path name" in DWARF parlance). This is in "whatever form makes sense for the host system", so this accepts both UNIX-style and DOS-style absolute paths. We avoid the filepath package because we want this to behave the same regardless of our host system and because we don't know what system the paths came from. 

### <a id="pathJoin" href="#pathJoin">func pathJoin(dirname, filename string) string</a>

```
searchKey: dwarf.pathJoin
```

```Go
func pathJoin(dirname, filename string) string
```

pathJoin joins dirname and filename. filename must be relative. DWARF paths can be UNIX-style or DOS-style, so this handles both. 

### <a id="splitDrive" href="#splitDrive">func splitDrive(path string) (drive, rest string)</a>

```
searchKey: dwarf.splitDrive
```

```Go
func splitDrive(path string) (drive, rest string)
```

splitDrive splits the DOS drive letter or UNC share point from path, if any. path == drive + rest 

### <a id="_" href="#_">func _()</a>

```
searchKey: dwarf._
```

```Go
func _()
```

### <a id="zeroArray" href="#zeroArray">func zeroArray(t *Type)</a>

```
searchKey: dwarf.zeroArray
```

```Go
func zeroArray(t *Type)
```

### <a id="TestDwarf5Ranges" href="#TestDwarf5Ranges">func TestDwarf5Ranges(t *testing.T)</a>

```
searchKey: dwarf.TestDwarf5Ranges
```

```Go
func TestDwarf5Ranges(t *testing.T)
```

