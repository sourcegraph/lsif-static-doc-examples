# Package unicode

Package unicode provides data and functions to test some properties of Unicode code points. 

## Index

* Subpages
  * [unicode/utf16](unicode/utf16.md)
  * [unicode/utf16_test](unicode/utf16_test.md)
  * [unicode/utf8](unicode/utf8.md)
  * [unicode/utf8_test](unicode/utf8_test.md)
* [Constants](#const)
    * [const pC](#pC)
    * [const pP](#pP)
    * [const pN](#pN)
    * [const pS](#pS)
    * [const pZ](#pZ)
    * [const pLu](#pLu)
    * [const pLl](#pLl)
    * [const pp](#pp)
    * [const pg](#pg)
    * [const pLo](#pLo)
    * [const pLmask](#pLmask)
    * [const MaxRune](#MaxRune)
    * [const ReplacementChar](#ReplacementChar)
    * [const MaxASCII](#MaxASCII)
    * [const MaxLatin1](#MaxLatin1)
    * [const UpperCase](#UpperCase)
    * [const LowerCase](#LowerCase)
    * [const TitleCase](#TitleCase)
    * [const MaxCase](#MaxCase)
    * [const UpperLower](#UpperLower)
    * [const linearMax](#linearMax)
    * [const Version](#Version)
* [Variables](#var)
    * [var TurkishCase](#TurkishCase)
    * [var _TurkishCase](#_TurkishCase)
    * [var AzeriCase](#AzeriCase)
    * [var GraphicRanges](#GraphicRanges)
    * [var PrintRanges](#PrintRanges)
    * [var Categories](#Categories)
    * [var _C](#_C)
    * [var _Cc](#_Cc)
    * [var _Cf](#_Cf)
    * [var _Co](#_Co)
    * [var _Cs](#_Cs)
    * [var _L](#_L)
    * [var _Ll](#_Ll)
    * [var _Lm](#_Lm)
    * [var _Lo](#_Lo)
    * [var _Lt](#_Lt)
    * [var _Lu](#_Lu)
    * [var _M](#_M)
    * [var _Mc](#_Mc)
    * [var _Me](#_Me)
    * [var _Mn](#_Mn)
    * [var _N](#_N)
    * [var _Nd](#_Nd)
    * [var _Nl](#_Nl)
    * [var _No](#_No)
    * [var _P](#_P)
    * [var _Pc](#_Pc)
    * [var _Pd](#_Pd)
    * [var _Pe](#_Pe)
    * [var _Pf](#_Pf)
    * [var _Pi](#_Pi)
    * [var _Po](#_Po)
    * [var _Ps](#_Ps)
    * [var _S](#_S)
    * [var _Sc](#_Sc)
    * [var _Sk](#_Sk)
    * [var _Sm](#_Sm)
    * [var _So](#_So)
    * [var _Z](#_Z)
    * [var _Zl](#_Zl)
    * [var _Zp](#_Zp)
    * [var _Zs](#_Zs)
    * [var Cc](#Cc)
    * [var Cf](#Cf)
    * [var Co](#Co)
    * [var Cs](#Cs)
    * [var Digit](#Digit)
    * [var Nd](#Nd)
    * [var Letter](#Letter)
    * [var L](#L)
    * [var Lm](#Lm)
    * [var Lo](#Lo)
    * [var Lower](#Lower)
    * [var Ll](#Ll)
    * [var Mark](#Mark)
    * [var M](#M)
    * [var Mc](#Mc)
    * [var Me](#Me)
    * [var Mn](#Mn)
    * [var Nl](#Nl)
    * [var No](#No)
    * [var Number](#Number)
    * [var N](#N)
    * [var Other](#Other)
    * [var C](#C)
    * [var Pc](#Pc)
    * [var Pd](#Pd)
    * [var Pe](#Pe)
    * [var Pf](#Pf)
    * [var Pi](#Pi)
    * [var Po](#Po)
    * [var Ps](#Ps)
    * [var Punct](#Punct)
    * [var P](#P)
    * [var Sc](#Sc)
    * [var Sk](#Sk)
    * [var Sm](#Sm)
    * [var So](#So)
    * [var Space](#Space)
    * [var Z](#Z)
    * [var Symbol](#Symbol)
    * [var S](#S)
    * [var Title](#Title)
    * [var Lt](#Lt)
    * [var Upper](#Upper)
    * [var Lu](#Lu)
    * [var Zl](#Zl)
    * [var Zp](#Zp)
    * [var Zs](#Zs)
    * [var Scripts](#Scripts)
    * [var _Adlam](#_Adlam)
    * [var _Ahom](#_Ahom)
    * [var _Anatolian_Hieroglyphs](#_Anatolian_Hieroglyphs)
    * [var _Arabic](#_Arabic)
    * [var _Armenian](#_Armenian)
    * [var _Avestan](#_Avestan)
    * [var _Balinese](#_Balinese)
    * [var _Bamum](#_Bamum)
    * [var _Bassa_Vah](#_Bassa_Vah)
    * [var _Batak](#_Batak)
    * [var _Bengali](#_Bengali)
    * [var _Bhaiksuki](#_Bhaiksuki)
    * [var _Bopomofo](#_Bopomofo)
    * [var _Brahmi](#_Brahmi)
    * [var _Braille](#_Braille)
    * [var _Buginese](#_Buginese)
    * [var _Buhid](#_Buhid)
    * [var _Canadian_Aboriginal](#_Canadian_Aboriginal)
    * [var _Carian](#_Carian)
    * [var _Caucasian_Albanian](#_Caucasian_Albanian)
    * [var _Chakma](#_Chakma)
    * [var _Cham](#_Cham)
    * [var _Cherokee](#_Cherokee)
    * [var _Chorasmian](#_Chorasmian)
    * [var _Common](#_Common)
    * [var _Coptic](#_Coptic)
    * [var _Cuneiform](#_Cuneiform)
    * [var _Cypriot](#_Cypriot)
    * [var _Cyrillic](#_Cyrillic)
    * [var _Deseret](#_Deseret)
    * [var _Devanagari](#_Devanagari)
    * [var _Dives_Akuru](#_Dives_Akuru)
    * [var _Dogra](#_Dogra)
    * [var _Duployan](#_Duployan)
    * [var _Egyptian_Hieroglyphs](#_Egyptian_Hieroglyphs)
    * [var _Elbasan](#_Elbasan)
    * [var _Elymaic](#_Elymaic)
    * [var _Ethiopic](#_Ethiopic)
    * [var _Georgian](#_Georgian)
    * [var _Glagolitic](#_Glagolitic)
    * [var _Gothic](#_Gothic)
    * [var _Grantha](#_Grantha)
    * [var _Greek](#_Greek)
    * [var _Gujarati](#_Gujarati)
    * [var _Gunjala_Gondi](#_Gunjala_Gondi)
    * [var _Gurmukhi](#_Gurmukhi)
    * [var _Han](#_Han)
    * [var _Hangul](#_Hangul)
    * [var _Hanifi_Rohingya](#_Hanifi_Rohingya)
    * [var _Hanunoo](#_Hanunoo)
    * [var _Hatran](#_Hatran)
    * [var _Hebrew](#_Hebrew)
    * [var _Hiragana](#_Hiragana)
    * [var _Imperial_Aramaic](#_Imperial_Aramaic)
    * [var _Inherited](#_Inherited)
    * [var _Inscriptional_Pahlavi](#_Inscriptional_Pahlavi)
    * [var _Inscriptional_Parthian](#_Inscriptional_Parthian)
    * [var _Javanese](#_Javanese)
    * [var _Kaithi](#_Kaithi)
    * [var _Kannada](#_Kannada)
    * [var _Katakana](#_Katakana)
    * [var _Kayah_Li](#_Kayah_Li)
    * [var _Kharoshthi](#_Kharoshthi)
    * [var _Khitan_Small_Script](#_Khitan_Small_Script)
    * [var _Khmer](#_Khmer)
    * [var _Khojki](#_Khojki)
    * [var _Khudawadi](#_Khudawadi)
    * [var _Lao](#_Lao)
    * [var _Latin](#_Latin)
    * [var _Lepcha](#_Lepcha)
    * [var _Limbu](#_Limbu)
    * [var _Linear_A](#_Linear_A)
    * [var _Linear_B](#_Linear_B)
    * [var _Lisu](#_Lisu)
    * [var _Lycian](#_Lycian)
    * [var _Lydian](#_Lydian)
    * [var _Mahajani](#_Mahajani)
    * [var _Makasar](#_Makasar)
    * [var _Malayalam](#_Malayalam)
    * [var _Mandaic](#_Mandaic)
    * [var _Manichaean](#_Manichaean)
    * [var _Marchen](#_Marchen)
    * [var _Masaram_Gondi](#_Masaram_Gondi)
    * [var _Medefaidrin](#_Medefaidrin)
    * [var _Meetei_Mayek](#_Meetei_Mayek)
    * [var _Mende_Kikakui](#_Mende_Kikakui)
    * [var _Meroitic_Cursive](#_Meroitic_Cursive)
    * [var _Meroitic_Hieroglyphs](#_Meroitic_Hieroglyphs)
    * [var _Miao](#_Miao)
    * [var _Modi](#_Modi)
    * [var _Mongolian](#_Mongolian)
    * [var _Mro](#_Mro)
    * [var _Multani](#_Multani)
    * [var _Myanmar](#_Myanmar)
    * [var _Nabataean](#_Nabataean)
    * [var _Nandinagari](#_Nandinagari)
    * [var _New_Tai_Lue](#_New_Tai_Lue)
    * [var _Newa](#_Newa)
    * [var _Nko](#_Nko)
    * [var _Nushu](#_Nushu)
    * [var _Nyiakeng_Puachue_Hmong](#_Nyiakeng_Puachue_Hmong)
    * [var _Ogham](#_Ogham)
    * [var _Ol_Chiki](#_Ol_Chiki)
    * [var _Old_Hungarian](#_Old_Hungarian)
    * [var _Old_Italic](#_Old_Italic)
    * [var _Old_North_Arabian](#_Old_North_Arabian)
    * [var _Old_Permic](#_Old_Permic)
    * [var _Old_Persian](#_Old_Persian)
    * [var _Old_Sogdian](#_Old_Sogdian)
    * [var _Old_South_Arabian](#_Old_South_Arabian)
    * [var _Old_Turkic](#_Old_Turkic)
    * [var _Oriya](#_Oriya)
    * [var _Osage](#_Osage)
    * [var _Osmanya](#_Osmanya)
    * [var _Pahawh_Hmong](#_Pahawh_Hmong)
    * [var _Palmyrene](#_Palmyrene)
    * [var _Pau_Cin_Hau](#_Pau_Cin_Hau)
    * [var _Phags_Pa](#_Phags_Pa)
    * [var _Phoenician](#_Phoenician)
    * [var _Psalter_Pahlavi](#_Psalter_Pahlavi)
    * [var _Rejang](#_Rejang)
    * [var _Runic](#_Runic)
    * [var _Samaritan](#_Samaritan)
    * [var _Saurashtra](#_Saurashtra)
    * [var _Sharada](#_Sharada)
    * [var _Shavian](#_Shavian)
    * [var _Siddham](#_Siddham)
    * [var _SignWriting](#_SignWriting)
    * [var _Sinhala](#_Sinhala)
    * [var _Sogdian](#_Sogdian)
    * [var _Sora_Sompeng](#_Sora_Sompeng)
    * [var _Soyombo](#_Soyombo)
    * [var _Sundanese](#_Sundanese)
    * [var _Syloti_Nagri](#_Syloti_Nagri)
    * [var _Syriac](#_Syriac)
    * [var _Tagalog](#_Tagalog)
    * [var _Tagbanwa](#_Tagbanwa)
    * [var _Tai_Le](#_Tai_Le)
    * [var _Tai_Tham](#_Tai_Tham)
    * [var _Tai_Viet](#_Tai_Viet)
    * [var _Takri](#_Takri)
    * [var _Tamil](#_Tamil)
    * [var _Tangut](#_Tangut)
    * [var _Telugu](#_Telugu)
    * [var _Thaana](#_Thaana)
    * [var _Thai](#_Thai)
    * [var _Tibetan](#_Tibetan)
    * [var _Tifinagh](#_Tifinagh)
    * [var _Tirhuta](#_Tirhuta)
    * [var _Ugaritic](#_Ugaritic)
    * [var _Vai](#_Vai)
    * [var _Wancho](#_Wancho)
    * [var _Warang_Citi](#_Warang_Citi)
    * [var _Yezidi](#_Yezidi)
    * [var _Yi](#_Yi)
    * [var _Zanabazar_Square](#_Zanabazar_Square)
    * [var Adlam](#Adlam)
    * [var Ahom](#Ahom)
    * [var Anatolian_Hieroglyphs](#Anatolian_Hieroglyphs)
    * [var Arabic](#Arabic)
    * [var Armenian](#Armenian)
    * [var Avestan](#Avestan)
    * [var Balinese](#Balinese)
    * [var Bamum](#Bamum)
    * [var Bassa_Vah](#Bassa_Vah)
    * [var Batak](#Batak)
    * [var Bengali](#Bengali)
    * [var Bhaiksuki](#Bhaiksuki)
    * [var Bopomofo](#Bopomofo)
    * [var Brahmi](#Brahmi)
    * [var Braille](#Braille)
    * [var Buginese](#Buginese)
    * [var Buhid](#Buhid)
    * [var Canadian_Aboriginal](#Canadian_Aboriginal)
    * [var Carian](#Carian)
    * [var Caucasian_Albanian](#Caucasian_Albanian)
    * [var Chakma](#Chakma)
    * [var Cham](#Cham)
    * [var Cherokee](#Cherokee)
    * [var Chorasmian](#Chorasmian)
    * [var Common](#Common)
    * [var Coptic](#Coptic)
    * [var Cuneiform](#Cuneiform)
    * [var Cypriot](#Cypriot)
    * [var Cyrillic](#Cyrillic)
    * [var Deseret](#Deseret)
    * [var Devanagari](#Devanagari)
    * [var Dives_Akuru](#Dives_Akuru)
    * [var Dogra](#Dogra)
    * [var Duployan](#Duployan)
    * [var Egyptian_Hieroglyphs](#Egyptian_Hieroglyphs)
    * [var Elbasan](#Elbasan)
    * [var Elymaic](#Elymaic)
    * [var Ethiopic](#Ethiopic)
    * [var Georgian](#Georgian)
    * [var Glagolitic](#Glagolitic)
    * [var Gothic](#Gothic)
    * [var Grantha](#Grantha)
    * [var Greek](#Greek)
    * [var Gujarati](#Gujarati)
    * [var Gunjala_Gondi](#Gunjala_Gondi)
    * [var Gurmukhi](#Gurmukhi)
    * [var Han](#Han)
    * [var Hangul](#Hangul)
    * [var Hanifi_Rohingya](#Hanifi_Rohingya)
    * [var Hanunoo](#Hanunoo)
    * [var Hatran](#Hatran)
    * [var Hebrew](#Hebrew)
    * [var Hiragana](#Hiragana)
    * [var Imperial_Aramaic](#Imperial_Aramaic)
    * [var Inherited](#Inherited)
    * [var Inscriptional_Pahlavi](#Inscriptional_Pahlavi)
    * [var Inscriptional_Parthian](#Inscriptional_Parthian)
    * [var Javanese](#Javanese)
    * [var Kaithi](#Kaithi)
    * [var Kannada](#Kannada)
    * [var Katakana](#Katakana)
    * [var Kayah_Li](#Kayah_Li)
    * [var Kharoshthi](#Kharoshthi)
    * [var Khitan_Small_Script](#Khitan_Small_Script)
    * [var Khmer](#Khmer)
    * [var Khojki](#Khojki)
    * [var Khudawadi](#Khudawadi)
    * [var Lao](#Lao)
    * [var Latin](#Latin)
    * [var Lepcha](#Lepcha)
    * [var Limbu](#Limbu)
    * [var Linear_A](#Linear_A)
    * [var Linear_B](#Linear_B)
    * [var Lisu](#Lisu)
    * [var Lycian](#Lycian)
    * [var Lydian](#Lydian)
    * [var Mahajani](#Mahajani)
    * [var Makasar](#Makasar)
    * [var Malayalam](#Malayalam)
    * [var Mandaic](#Mandaic)
    * [var Manichaean](#Manichaean)
    * [var Marchen](#Marchen)
    * [var Masaram_Gondi](#Masaram_Gondi)
    * [var Medefaidrin](#Medefaidrin)
    * [var Meetei_Mayek](#Meetei_Mayek)
    * [var Mende_Kikakui](#Mende_Kikakui)
    * [var Meroitic_Cursive](#Meroitic_Cursive)
    * [var Meroitic_Hieroglyphs](#Meroitic_Hieroglyphs)
    * [var Miao](#Miao)
    * [var Modi](#Modi)
    * [var Mongolian](#Mongolian)
    * [var Mro](#Mro)
    * [var Multani](#Multani)
    * [var Myanmar](#Myanmar)
    * [var Nabataean](#Nabataean)
    * [var Nandinagari](#Nandinagari)
    * [var New_Tai_Lue](#New_Tai_Lue)
    * [var Newa](#Newa)
    * [var Nko](#Nko)
    * [var Nushu](#Nushu)
    * [var Nyiakeng_Puachue_Hmong](#Nyiakeng_Puachue_Hmong)
    * [var Ogham](#Ogham)
    * [var Ol_Chiki](#Ol_Chiki)
    * [var Old_Hungarian](#Old_Hungarian)
    * [var Old_Italic](#Old_Italic)
    * [var Old_North_Arabian](#Old_North_Arabian)
    * [var Old_Permic](#Old_Permic)
    * [var Old_Persian](#Old_Persian)
    * [var Old_Sogdian](#Old_Sogdian)
    * [var Old_South_Arabian](#Old_South_Arabian)
    * [var Old_Turkic](#Old_Turkic)
    * [var Oriya](#Oriya)
    * [var Osage](#Osage)
    * [var Osmanya](#Osmanya)
    * [var Pahawh_Hmong](#Pahawh_Hmong)
    * [var Palmyrene](#Palmyrene)
    * [var Pau_Cin_Hau](#Pau_Cin_Hau)
    * [var Phags_Pa](#Phags_Pa)
    * [var Phoenician](#Phoenician)
    * [var Psalter_Pahlavi](#Psalter_Pahlavi)
    * [var Rejang](#Rejang)
    * [var Runic](#Runic)
    * [var Samaritan](#Samaritan)
    * [var Saurashtra](#Saurashtra)
    * [var Sharada](#Sharada)
    * [var Shavian](#Shavian)
    * [var Siddham](#Siddham)
    * [var SignWriting](#SignWriting)
    * [var Sinhala](#Sinhala)
    * [var Sogdian](#Sogdian)
    * [var Sora_Sompeng](#Sora_Sompeng)
    * [var Soyombo](#Soyombo)
    * [var Sundanese](#Sundanese)
    * [var Syloti_Nagri](#Syloti_Nagri)
    * [var Syriac](#Syriac)
    * [var Tagalog](#Tagalog)
    * [var Tagbanwa](#Tagbanwa)
    * [var Tai_Le](#Tai_Le)
    * [var Tai_Tham](#Tai_Tham)
    * [var Tai_Viet](#Tai_Viet)
    * [var Takri](#Takri)
    * [var Tamil](#Tamil)
    * [var Tangut](#Tangut)
    * [var Telugu](#Telugu)
    * [var Thaana](#Thaana)
    * [var Thai](#Thai)
    * [var Tibetan](#Tibetan)
    * [var Tifinagh](#Tifinagh)
    * [var Tirhuta](#Tirhuta)
    * [var Ugaritic](#Ugaritic)
    * [var Vai](#Vai)
    * [var Wancho](#Wancho)
    * [var Warang_Citi](#Warang_Citi)
    * [var Yezidi](#Yezidi)
    * [var Yi](#Yi)
    * [var Zanabazar_Square](#Zanabazar_Square)
    * [var Properties](#Properties)
    * [var _ASCII_Hex_Digit](#_ASCII_Hex_Digit)
    * [var _Bidi_Control](#_Bidi_Control)
    * [var _Dash](#_Dash)
    * [var _Deprecated](#_Deprecated)
    * [var _Diacritic](#_Diacritic)
    * [var _Extender](#_Extender)
    * [var _Hex_Digit](#_Hex_Digit)
    * [var _Hyphen](#_Hyphen)
    * [var _IDS_Binary_Operator](#_IDS_Binary_Operator)
    * [var _IDS_Trinary_Operator](#_IDS_Trinary_Operator)
    * [var _Ideographic](#_Ideographic)
    * [var _Join_Control](#_Join_Control)
    * [var _Logical_Order_Exception](#_Logical_Order_Exception)
    * [var _Noncharacter_Code_Point](#_Noncharacter_Code_Point)
    * [var _Other_Alphabetic](#_Other_Alphabetic)
    * [var _Other_Default_Ignorable_Code_Point](#_Other_Default_Ignorable_Code_Point)
    * [var _Other_Grapheme_Extend](#_Other_Grapheme_Extend)
    * [var _Other_ID_Continue](#_Other_ID_Continue)
    * [var _Other_ID_Start](#_Other_ID_Start)
    * [var _Other_Lowercase](#_Other_Lowercase)
    * [var _Other_Math](#_Other_Math)
    * [var _Other_Uppercase](#_Other_Uppercase)
    * [var _Pattern_Syntax](#_Pattern_Syntax)
    * [var _Pattern_White_Space](#_Pattern_White_Space)
    * [var _Prepended_Concatenation_Mark](#_Prepended_Concatenation_Mark)
    * [var _Quotation_Mark](#_Quotation_Mark)
    * [var _Radical](#_Radical)
    * [var _Regional_Indicator](#_Regional_Indicator)
    * [var _Sentence_Terminal](#_Sentence_Terminal)
    * [var _Soft_Dotted](#_Soft_Dotted)
    * [var _Terminal_Punctuation](#_Terminal_Punctuation)
    * [var _Unified_Ideograph](#_Unified_Ideograph)
    * [var _Variation_Selector](#_Variation_Selector)
    * [var _White_Space](#_White_Space)
    * [var ASCII_Hex_Digit](#ASCII_Hex_Digit)
    * [var Bidi_Control](#Bidi_Control)
    * [var Dash](#Dash)
    * [var Deprecated](#Deprecated)
    * [var Diacritic](#Diacritic)
    * [var Extender](#Extender)
    * [var Hex_Digit](#Hex_Digit)
    * [var Hyphen](#Hyphen)
    * [var IDS_Binary_Operator](#IDS_Binary_Operator)
    * [var IDS_Trinary_Operator](#IDS_Trinary_Operator)
    * [var Ideographic](#Ideographic)
    * [var Join_Control](#Join_Control)
    * [var Logical_Order_Exception](#Logical_Order_Exception)
    * [var Noncharacter_Code_Point](#Noncharacter_Code_Point)
    * [var Other_Alphabetic](#Other_Alphabetic)
    * [var Other_Default_Ignorable_Code_Point](#Other_Default_Ignorable_Code_Point)
    * [var Other_Grapheme_Extend](#Other_Grapheme_Extend)
    * [var Other_ID_Continue](#Other_ID_Continue)
    * [var Other_ID_Start](#Other_ID_Start)
    * [var Other_Lowercase](#Other_Lowercase)
    * [var Other_Math](#Other_Math)
    * [var Other_Uppercase](#Other_Uppercase)
    * [var Pattern_Syntax](#Pattern_Syntax)
    * [var Pattern_White_Space](#Pattern_White_Space)
    * [var Prepended_Concatenation_Mark](#Prepended_Concatenation_Mark)
    * [var Quotation_Mark](#Quotation_Mark)
    * [var Radical](#Radical)
    * [var Regional_Indicator](#Regional_Indicator)
    * [var STerm](#STerm)
    * [var Sentence_Terminal](#Sentence_Terminal)
    * [var Soft_Dotted](#Soft_Dotted)
    * [var Terminal_Punctuation](#Terminal_Punctuation)
    * [var Unified_Ideograph](#Unified_Ideograph)
    * [var Variation_Selector](#Variation_Selector)
    * [var White_Space](#White_Space)
    * [var CaseRanges](#CaseRanges)
    * [var _CaseRanges](#_CaseRanges)
    * [var properties](#properties)
    * [var asciiFold](#asciiFold)
    * [var caseOrbit](#caseOrbit)
    * [var FoldCategory](#FoldCategory)
    * [var foldL](#foldL)
    * [var foldLl](#foldLl)
    * [var foldLt](#foldLt)
    * [var foldLu](#foldLu)
    * [var foldM](#foldM)
    * [var foldMn](#foldMn)
    * [var FoldScript](#FoldScript)
    * [var foldCommon](#foldCommon)
    * [var foldGreek](#foldGreek)
    * [var foldInherited](#foldInherited)
* [Types](#type)
    * [type RangeTable struct](#RangeTable)
    * [type Range16 struct](#Range16)
    * [type Range32 struct](#Range32)
    * [type CaseRange struct](#CaseRange)
    * [type SpecialCase []unicode.CaseRange](#SpecialCase)
        * [func (special SpecialCase) ToUpper(r rune) rune](#SpecialCase.ToUpper)
        * [func (special SpecialCase) ToTitle(r rune) rune](#SpecialCase.ToTitle)
        * [func (special SpecialCase) ToLower(r rune) rune](#SpecialCase.ToLower)
    * [type d [3]rune](#d)
    * [type foldPair struct](#foldPair)
* [Functions](#func)
    * [func IsDigit(r rune) bool](#IsDigit)
    * [func IsGraphic(r rune) bool](#IsGraphic)
    * [func IsPrint(r rune) bool](#IsPrint)
    * [func IsOneOf(ranges []*RangeTable, r rune) bool](#IsOneOf)
    * [func In(r rune, ranges ...*RangeTable) bool](#In)
    * [func IsControl(r rune) bool](#IsControl)
    * [func IsLetter(r rune) bool](#IsLetter)
    * [func IsMark(r rune) bool](#IsMark)
    * [func IsNumber(r rune) bool](#IsNumber)
    * [func IsPunct(r rune) bool](#IsPunct)
    * [func IsSpace(r rune) bool](#IsSpace)
    * [func IsSymbol(r rune) bool](#IsSymbol)
    * [func is16(ranges []Range16, r uint16) bool](#is16)
    * [func is32(ranges []Range32, r uint32) bool](#is32)
    * [func Is(rangeTab *RangeTable, r rune) bool](#Is)
    * [func isExcludingLatin(rangeTab *RangeTable, r rune) bool](#isExcludingLatin)
    * [func IsUpper(r rune) bool](#IsUpper)
    * [func IsLower(r rune) bool](#IsLower)
    * [func IsTitle(r rune) bool](#IsTitle)
    * [func to(_case int, r rune, caseRange []CaseRange) (mappedRune rune, foundMapping bool)](#to)
    * [func To(_case int, r rune) rune](#To)
    * [func ToUpper(r rune) rune](#ToUpper)
    * [func ToLower(r rune) rune](#ToLower)
    * [func ToTitle(r rune) rune](#ToTitle)
    * [func SimpleFold(r rune) rune](#SimpleFold)


## <a id="const" href="#const">Constants</a>

### <a id="pC" href="#pC">const pC</a>

```
searchKey: unicode.pC
tags: [private]
```

```Go
const pC = 1 << iota // a control character.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pP" href="#pP">const pP</a>

```
searchKey: unicode.pP
tags: [private]
```

```Go
const pP // a punctuation character.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pN" href="#pN">const pN</a>

```
searchKey: unicode.pN
tags: [private]
```

```Go
const pN // a numeral.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pS" href="#pS">const pS</a>

```
searchKey: unicode.pS
tags: [private]
```

```Go
const pS // a symbolic character.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pZ" href="#pZ">const pZ</a>

```
searchKey: unicode.pZ
tags: [private]
```

```Go
const pZ // a spacing character.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pLu" href="#pLu">const pLu</a>

```
searchKey: unicode.pLu
tags: [private]
```

```Go
const pLu // an upper-case letter.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pLl" href="#pLl">const pLl</a>

```
searchKey: unicode.pLl
tags: [private]
```

```Go
const pLl // a lower-case letter.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pp" href="#pp">const pp</a>

```
searchKey: unicode.pp
tags: [private]
```

```Go
const pp // a printable character according to Go's definition.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pg" href="#pg">const pg</a>

```
searchKey: unicode.pg
tags: [private]
```

```Go
const pg = pp | pZ // a graphical character according to the Unicode definition.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pLo" href="#pLo">const pLo</a>

```
searchKey: unicode.pLo
tags: [private]
```

```Go
const pLo = pLl | pLu // a letter that is neither upper nor lower case.

```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="pLmask" href="#pLmask">const pLmask</a>

```
searchKey: unicode.pLmask
tags: [private]
```

```Go
const pLmask = pLo
```

Bit masks for each code point under U+0100, for fast lookup. 

### <a id="MaxRune" href="#MaxRune">const MaxRune</a>

```
searchKey: unicode.MaxRune
```

```Go
const MaxRune = '\U0010FFFF' // Maximum valid Unicode code point.

```

### <a id="ReplacementChar" href="#ReplacementChar">const ReplacementChar</a>

```
searchKey: unicode.ReplacementChar
```

```Go
const ReplacementChar = '\uFFFD' // Represents invalid code points.

```

### <a id="MaxASCII" href="#MaxASCII">const MaxASCII</a>

```
searchKey: unicode.MaxASCII
```

```Go
const MaxASCII = '\u007F' // maximum ASCII value.

```

### <a id="MaxLatin1" href="#MaxLatin1">const MaxLatin1</a>

```
searchKey: unicode.MaxLatin1
```

```Go
const MaxLatin1 = '\u00FF' // maximum Latin-1 value.

```

### <a id="UpperCase" href="#UpperCase">const UpperCase</a>

```
searchKey: unicode.UpperCase
```

```Go
const UpperCase = iota
```

Indices into the Delta arrays inside CaseRanges for case mapping. 

### <a id="LowerCase" href="#LowerCase">const LowerCase</a>

```
searchKey: unicode.LowerCase
```

```Go
const LowerCase
```

Indices into the Delta arrays inside CaseRanges for case mapping. 

### <a id="TitleCase" href="#TitleCase">const TitleCase</a>

```
searchKey: unicode.TitleCase
```

```Go
const TitleCase
```

Indices into the Delta arrays inside CaseRanges for case mapping. 

### <a id="MaxCase" href="#MaxCase">const MaxCase</a>

```
searchKey: unicode.MaxCase
```

```Go
const MaxCase
```

Indices into the Delta arrays inside CaseRanges for case mapping. 

### <a id="UpperLower" href="#UpperLower">const UpperLower</a>

```
searchKey: unicode.UpperLower
```

```Go
const UpperLower = MaxRune + 1 // (Cannot be a valid delta.)

```

If the Delta field of a CaseRange is UpperLower, it means this CaseRange represents a sequence of the form (say) Upper Lower Upper Lower. 

### <a id="linearMax" href="#linearMax">const linearMax</a>

```
searchKey: unicode.linearMax
tags: [private]
```

```Go
const linearMax = 18
```

linearMax is the maximum size table for linear search for non-Latin1 rune. Derived by running 'go test -calibrate'. 

### <a id="Version" href="#Version">const Version</a>

```
searchKey: unicode.Version
```

```Go
const Version = "13.0.0"
```

Version is the Unicode edition from which the tables are derived. 

## <a id="var" href="#var">Variables</a>

### <a id="TurkishCase" href="#TurkishCase">var TurkishCase</a>

```
searchKey: unicode.TurkishCase
```

```Go
var TurkishCase SpecialCase = _TurkishCase
```

### <a id="_TurkishCase" href="#_TurkishCase">var _TurkishCase</a>

```
searchKey: unicode._TurkishCase
tags: [private]
```

```Go
var _TurkishCase = ...
```

### <a id="AzeriCase" href="#AzeriCase">var AzeriCase</a>

```
searchKey: unicode.AzeriCase
```

```Go
var AzeriCase SpecialCase = _TurkishCase
```

### <a id="GraphicRanges" href="#GraphicRanges">var GraphicRanges</a>

```
searchKey: unicode.GraphicRanges
```

```Go
var GraphicRanges = []*RangeTable{
	L, M, N, P, S, Zs,
}
```

GraphicRanges defines the set of graphic characters according to Unicode. 

### <a id="PrintRanges" href="#PrintRanges">var PrintRanges</a>

```
searchKey: unicode.PrintRanges
```

```Go
var PrintRanges = []*RangeTable{
	L, M, N, P, S,
}
```

PrintRanges defines the set of printable characters according to Go. ASCII space, U+0020, is handled separately. 

### <a id="Categories" href="#Categories">var Categories</a>

```
searchKey: unicode.Categories
```

```Go
var Categories = ...
```

Categories is the set of Unicode category tables. 

### <a id="_C" href="#_C">var _C</a>

```
searchKey: unicode._C
tags: [private]
```

```Go
var _C = ...
```

### <a id="_Cc" href="#_Cc">var _Cc</a>

```
searchKey: unicode._Cc
tags: [private]
```

```Go
var _Cc = ...
```

### <a id="_Cf" href="#_Cf">var _Cf</a>

```
searchKey: unicode._Cf
tags: [private]
```

```Go
var _Cf = ...
```

### <a id="_Co" href="#_Co">var _Co</a>

```
searchKey: unicode._Co
tags: [private]
```

```Go
var _Co = ...
```

### <a id="_Cs" href="#_Cs">var _Cs</a>

```
searchKey: unicode._Cs
tags: [private]
```

```Go
var _Cs = &RangeTable{
	R16: []Range16{
		{0xd800, 0xdfff, 1},
	},
}
```

### <a id="_L" href="#_L">var _L</a>

```
searchKey: unicode._L
tags: [private]
```

```Go
var _L = ...
```

### <a id="_Ll" href="#_Ll">var _Ll</a>

```
searchKey: unicode._Ll
tags: [private]
```

```Go
var _Ll = ...
```

### <a id="_Lm" href="#_Lm">var _Lm</a>

```
searchKey: unicode._Lm
tags: [private]
```

```Go
var _Lm = ...
```

### <a id="_Lo" href="#_Lo">var _Lo</a>

```
searchKey: unicode._Lo
tags: [private]
```

```Go
var _Lo = ...
```

### <a id="_Lt" href="#_Lt">var _Lt</a>

```
searchKey: unicode._Lt
tags: [private]
```

```Go
var _Lt = ...
```

### <a id="_Lu" href="#_Lu">var _Lu</a>

```
searchKey: unicode._Lu
tags: [private]
```

```Go
var _Lu = ...
```

### <a id="_M" href="#_M">var _M</a>

```
searchKey: unicode._M
tags: [private]
```

```Go
var _M = ...
```

### <a id="_Mc" href="#_Mc">var _Mc</a>

```
searchKey: unicode._Mc
tags: [private]
```

```Go
var _Mc = ...
```

### <a id="_Me" href="#_Me">var _Me</a>

```
searchKey: unicode._Me
tags: [private]
```

```Go
var _Me = ...
```

### <a id="_Mn" href="#_Mn">var _Mn</a>

```
searchKey: unicode._Mn
tags: [private]
```

```Go
var _Mn = ...
```

### <a id="_N" href="#_N">var _N</a>

```
searchKey: unicode._N
tags: [private]
```

```Go
var _N = ...
```

### <a id="_Nd" href="#_Nd">var _Nd</a>

```
searchKey: unicode._Nd
tags: [private]
```

```Go
var _Nd = ...
```

### <a id="_Nl" href="#_Nl">var _Nl</a>

```
searchKey: unicode._Nl
tags: [private]
```

```Go
var _Nl = ...
```

### <a id="_No" href="#_No">var _No</a>

```
searchKey: unicode._No
tags: [private]
```

```Go
var _No = ...
```

### <a id="_P" href="#_P">var _P</a>

```
searchKey: unicode._P
tags: [private]
```

```Go
var _P = ...
```

### <a id="_Pc" href="#_Pc">var _Pc</a>

```
searchKey: unicode._Pc
tags: [private]
```

```Go
var _Pc = ...
```

### <a id="_Pd" href="#_Pd">var _Pd</a>

```
searchKey: unicode._Pd
tags: [private]
```

```Go
var _Pd = ...
```

### <a id="_Pe" href="#_Pe">var _Pe</a>

```
searchKey: unicode._Pe
tags: [private]
```

```Go
var _Pe = ...
```

### <a id="_Pf" href="#_Pf">var _Pf</a>

```
searchKey: unicode._Pf
tags: [private]
```

```Go
var _Pf = ...
```

### <a id="_Pi" href="#_Pi">var _Pi</a>

```
searchKey: unicode._Pi
tags: [private]
```

```Go
var _Pi = ...
```

### <a id="_Po" href="#_Po">var _Po</a>

```
searchKey: unicode._Po
tags: [private]
```

```Go
var _Po = ...
```

### <a id="_Ps" href="#_Ps">var _Ps</a>

```
searchKey: unicode._Ps
tags: [private]
```

```Go
var _Ps = ...
```

### <a id="_S" href="#_S">var _S</a>

```
searchKey: unicode._S
tags: [private]
```

```Go
var _S = ...
```

### <a id="_Sc" href="#_Sc">var _Sc</a>

```
searchKey: unicode._Sc
tags: [private]
```

```Go
var _Sc = ...
```

### <a id="_Sk" href="#_Sk">var _Sk</a>

```
searchKey: unicode._Sk
tags: [private]
```

```Go
var _Sk = ...
```

### <a id="_Sm" href="#_Sm">var _Sm</a>

```
searchKey: unicode._Sm
tags: [private]
```

```Go
var _Sm = ...
```

### <a id="_So" href="#_So">var _So</a>

```
searchKey: unicode._So
tags: [private]
```

```Go
var _So = ...
```

### <a id="_Z" href="#_Z">var _Z</a>

```
searchKey: unicode._Z
tags: [private]
```

```Go
var _Z = ...
```

### <a id="_Zl" href="#_Zl">var _Zl</a>

```
searchKey: unicode._Zl
tags: [private]
```

```Go
var _Zl = &RangeTable{
	R16: []Range16{
		{0x2028, 0x2028, 1},
	},
}
```

### <a id="_Zp" href="#_Zp">var _Zp</a>

```
searchKey: unicode._Zp
tags: [private]
```

```Go
var _Zp = &RangeTable{
	R16: []Range16{
		{0x2029, 0x2029, 1},
	},
}
```

### <a id="_Zs" href="#_Zs">var _Zs</a>

```
searchKey: unicode._Zs
tags: [private]
```

```Go
var _Zs = ...
```

### <a id="Cc" href="#Cc">var Cc</a>

```
searchKey: unicode.Cc
```

```Go
var Cc = _Cc // Cc is the set of Unicode characters in category Cc (Other, control).

```

These variables have type *RangeTable. 

### <a id="Cf" href="#Cf">var Cf</a>

```
searchKey: unicode.Cf
```

```Go
var Cf = _Cf // Cf is the set of Unicode characters in category Cf (Other, format).

```

These variables have type *RangeTable. 

### <a id="Co" href="#Co">var Co</a>

```
searchKey: unicode.Co
```

```Go
var Co = _Co // Co is the set of Unicode characters in category Co (Other, private use).

```

These variables have type *RangeTable. 

### <a id="Cs" href="#Cs">var Cs</a>

```
searchKey: unicode.Cs
```

```Go
var Cs = _Cs // Cs is the set of Unicode characters in category Cs (Other, surrogate).

```

These variables have type *RangeTable. 

### <a id="Digit" href="#Digit">var Digit</a>

```
searchKey: unicode.Digit
```

```Go
var Digit = _Nd // Digit is the set of Unicode characters with the "decimal digit" property.

```

These variables have type *RangeTable. 

### <a id="Nd" href="#Nd">var Nd</a>

```
searchKey: unicode.Nd
```

```Go
var Nd = _Nd // Nd is the set of Unicode characters in category Nd (Number, decimal digit).

```

These variables have type *RangeTable. 

### <a id="Letter" href="#Letter">var Letter</a>

```
searchKey: unicode.Letter
```

```Go
var Letter = _L // Letter/L is the set of Unicode letters, category L.

```

These variables have type *RangeTable. 

### <a id="L" href="#L">var L</a>

```
searchKey: unicode.L
```

```Go
var L = _L
```

These variables have type *RangeTable. 

### <a id="Lm" href="#Lm">var Lm</a>

```
searchKey: unicode.Lm
```

```Go
var Lm = _Lm // Lm is the set of Unicode characters in category Lm (Letter, modifier).

```

These variables have type *RangeTable. 

### <a id="Lo" href="#Lo">var Lo</a>

```
searchKey: unicode.Lo
```

```Go
var Lo = _Lo // Lo is the set of Unicode characters in category Lo (Letter, other).

```

These variables have type *RangeTable. 

### <a id="Lower" href="#Lower">var Lower</a>

```
searchKey: unicode.Lower
```

```Go
var Lower = _Ll // Lower is the set of Unicode lower case letters.

```

These variables have type *RangeTable. 

### <a id="Ll" href="#Ll">var Ll</a>

```
searchKey: unicode.Ll
```

```Go
var Ll = _Ll // Ll is the set of Unicode characters in category Ll (Letter, lowercase).

```

These variables have type *RangeTable. 

### <a id="Mark" href="#Mark">var Mark</a>

```
searchKey: unicode.Mark
```

```Go
var Mark = _M // Mark/M is the set of Unicode mark characters, category M.

```

These variables have type *RangeTable. 

### <a id="M" href="#M">var M</a>

```
searchKey: unicode.M
```

```Go
var M = _M
```

These variables have type *RangeTable. 

### <a id="Mc" href="#Mc">var Mc</a>

```
searchKey: unicode.Mc
```

```Go
var Mc = _Mc // Mc is the set of Unicode characters in category Mc (Mark, spacing combining).

```

These variables have type *RangeTable. 

### <a id="Me" href="#Me">var Me</a>

```
searchKey: unicode.Me
```

```Go
var Me = _Me // Me is the set of Unicode characters in category Me (Mark, enclosing).

```

These variables have type *RangeTable. 

### <a id="Mn" href="#Mn">var Mn</a>

```
searchKey: unicode.Mn
```

```Go
var Mn = _Mn // Mn is the set of Unicode characters in category Mn (Mark, nonspacing).

```

These variables have type *RangeTable. 

### <a id="Nl" href="#Nl">var Nl</a>

```
searchKey: unicode.Nl
```

```Go
var Nl = _Nl // Nl is the set of Unicode characters in category Nl (Number, letter).

```

These variables have type *RangeTable. 

### <a id="No" href="#No">var No</a>

```
searchKey: unicode.No
```

```Go
var No = _No // No is the set of Unicode characters in category No (Number, other).

```

These variables have type *RangeTable. 

### <a id="Number" href="#Number">var Number</a>

```
searchKey: unicode.Number
```

```Go
var Number = _N // Number/N is the set of Unicode number characters, category N.

```

These variables have type *RangeTable. 

### <a id="N" href="#N">var N</a>

```
searchKey: unicode.N
```

```Go
var N = _N
```

These variables have type *RangeTable. 

### <a id="Other" href="#Other">var Other</a>

```
searchKey: unicode.Other
```

```Go
var Other = _C // Other/C is the set of Unicode control and special characters, category C.

```

These variables have type *RangeTable. 

### <a id="C" href="#C">var C</a>

```
searchKey: unicode.C
```

```Go
var C = _C
```

These variables have type *RangeTable. 

### <a id="Pc" href="#Pc">var Pc</a>

```
searchKey: unicode.Pc
```

```Go
var Pc = _Pc // Pc is the set of Unicode characters in category Pc (Punctuation, connector).

```

These variables have type *RangeTable. 

### <a id="Pd" href="#Pd">var Pd</a>

```
searchKey: unicode.Pd
```

```Go
var Pd = _Pd // Pd is the set of Unicode characters in category Pd (Punctuation, dash).

```

These variables have type *RangeTable. 

### <a id="Pe" href="#Pe">var Pe</a>

```
searchKey: unicode.Pe
```

```Go
var Pe = _Pe // Pe is the set of Unicode characters in category Pe (Punctuation, close).

```

These variables have type *RangeTable. 

### <a id="Pf" href="#Pf">var Pf</a>

```
searchKey: unicode.Pf
```

```Go
var Pf = _Pf // Pf is the set of Unicode characters in category Pf (Punctuation, final quote).

```

These variables have type *RangeTable. 

### <a id="Pi" href="#Pi">var Pi</a>

```
searchKey: unicode.Pi
```

```Go
var Pi = _Pi // Pi is the set of Unicode characters in category Pi (Punctuation, initial quote).

```

These variables have type *RangeTable. 

### <a id="Po" href="#Po">var Po</a>

```
searchKey: unicode.Po
```

```Go
var Po = _Po // Po is the set of Unicode characters in category Po (Punctuation, other).

```

These variables have type *RangeTable. 

### <a id="Ps" href="#Ps">var Ps</a>

```
searchKey: unicode.Ps
```

```Go
var Ps = _Ps // Ps is the set of Unicode characters in category Ps (Punctuation, open).

```

These variables have type *RangeTable. 

### <a id="Punct" href="#Punct">var Punct</a>

```
searchKey: unicode.Punct
```

```Go
var Punct = _P // Punct/P is the set of Unicode punctuation characters, category P.

```

These variables have type *RangeTable. 

### <a id="P" href="#P">var P</a>

```
searchKey: unicode.P
```

```Go
var P = _P
```

These variables have type *RangeTable. 

### <a id="Sc" href="#Sc">var Sc</a>

```
searchKey: unicode.Sc
```

```Go
var Sc = _Sc // Sc is the set of Unicode characters in category Sc (Symbol, currency).

```

These variables have type *RangeTable. 

### <a id="Sk" href="#Sk">var Sk</a>

```
searchKey: unicode.Sk
```

```Go
var Sk = _Sk // Sk is the set of Unicode characters in category Sk (Symbol, modifier).

```

These variables have type *RangeTable. 

### <a id="Sm" href="#Sm">var Sm</a>

```
searchKey: unicode.Sm
```

```Go
var Sm = _Sm // Sm is the set of Unicode characters in category Sm (Symbol, math).

```

These variables have type *RangeTable. 

### <a id="So" href="#So">var So</a>

```
searchKey: unicode.So
```

```Go
var So = _So // So is the set of Unicode characters in category So (Symbol, other).

```

These variables have type *RangeTable. 

### <a id="Space" href="#Space">var Space</a>

```
searchKey: unicode.Space
```

```Go
var Space = _Z // Space/Z is the set of Unicode space characters, category Z.

```

These variables have type *RangeTable. 

### <a id="Z" href="#Z">var Z</a>

```
searchKey: unicode.Z
```

```Go
var Z = _Z
```

These variables have type *RangeTable. 

### <a id="Symbol" href="#Symbol">var Symbol</a>

```
searchKey: unicode.Symbol
```

```Go
var Symbol = _S // Symbol/S is the set of Unicode symbol characters, category S.

```

These variables have type *RangeTable. 

### <a id="S" href="#S">var S</a>

```
searchKey: unicode.S
```

```Go
var S = _S
```

These variables have type *RangeTable. 

### <a id="Title" href="#Title">var Title</a>

```
searchKey: unicode.Title
```

```Go
var Title = _Lt // Title is the set of Unicode title case letters.

```

These variables have type *RangeTable. 

### <a id="Lt" href="#Lt">var Lt</a>

```
searchKey: unicode.Lt
```

```Go
var Lt = _Lt // Lt is the set of Unicode characters in category Lt (Letter, titlecase).

```

These variables have type *RangeTable. 

### <a id="Upper" href="#Upper">var Upper</a>

```
searchKey: unicode.Upper
```

```Go
var Upper = _Lu // Upper is the set of Unicode upper case letters.

```

These variables have type *RangeTable. 

### <a id="Lu" href="#Lu">var Lu</a>

```
searchKey: unicode.Lu
```

```Go
var Lu = _Lu // Lu is the set of Unicode characters in category Lu (Letter, uppercase).

```

These variables have type *RangeTable. 

### <a id="Zl" href="#Zl">var Zl</a>

```
searchKey: unicode.Zl
```

```Go
var Zl = _Zl // Zl is the set of Unicode characters in category Zl (Separator, line).

```

These variables have type *RangeTable. 

### <a id="Zp" href="#Zp">var Zp</a>

```
searchKey: unicode.Zp
```

```Go
var Zp = _Zp // Zp is the set of Unicode characters in category Zp (Separator, paragraph).

```

These variables have type *RangeTable. 

### <a id="Zs" href="#Zs">var Zs</a>

```
searchKey: unicode.Zs
```

```Go
var Zs = _Zs // Zs is the set of Unicode characters in category Zs (Separator, space).

```

These variables have type *RangeTable. 

### <a id="Scripts" href="#Scripts">var Scripts</a>

```
searchKey: unicode.Scripts
```

```Go
var Scripts = ...
```

Scripts is the set of Unicode script tables. 

### <a id="_Adlam" href="#_Adlam">var _Adlam</a>

```
searchKey: unicode._Adlam
tags: [private]
```

```Go
var _Adlam = ...
```

### <a id="_Ahom" href="#_Ahom">var _Ahom</a>

```
searchKey: unicode._Ahom
tags: [private]
```

```Go
var _Ahom = ...
```

### <a id="_Anatolian_Hieroglyphs" href="#_Anatolian_Hieroglyphs">var _Anatolian_Hieroglyphs</a>

```
searchKey: unicode._Anatolian_Hieroglyphs
tags: [private]
```

```Go
var _Anatolian_Hieroglyphs = ...
```

### <a id="_Arabic" href="#_Arabic">var _Arabic</a>

```
searchKey: unicode._Arabic
tags: [private]
```

```Go
var _Arabic = ...
```

### <a id="_Armenian" href="#_Armenian">var _Armenian</a>

```
searchKey: unicode._Armenian
tags: [private]
```

```Go
var _Armenian = ...
```

### <a id="_Avestan" href="#_Avestan">var _Avestan</a>

```
searchKey: unicode._Avestan
tags: [private]
```

```Go
var _Avestan = ...
```

### <a id="_Balinese" href="#_Balinese">var _Balinese</a>

```
searchKey: unicode._Balinese
tags: [private]
```

```Go
var _Balinese = &RangeTable{
	R16: []Range16{
		{0x1b00, 0x1b4b, 1},
		{0x1b50, 0x1b7c, 1},
	},
}
```

### <a id="_Bamum" href="#_Bamum">var _Bamum</a>

```
searchKey: unicode._Bamum
tags: [private]
```

```Go
var _Bamum = ...
```

### <a id="_Bassa_Vah" href="#_Bassa_Vah">var _Bassa_Vah</a>

```
searchKey: unicode._Bassa_Vah
tags: [private]
```

```Go
var _Bassa_Vah = ...
```

### <a id="_Batak" href="#_Batak">var _Batak</a>

```
searchKey: unicode._Batak
tags: [private]
```

```Go
var _Batak = &RangeTable{
	R16: []Range16{
		{0x1bc0, 0x1bf3, 1},
		{0x1bfc, 0x1bff, 1},
	},
}
```

### <a id="_Bengali" href="#_Bengali">var _Bengali</a>

```
searchKey: unicode._Bengali
tags: [private]
```

```Go
var _Bengali = ...
```

### <a id="_Bhaiksuki" href="#_Bhaiksuki">var _Bhaiksuki</a>

```
searchKey: unicode._Bhaiksuki
tags: [private]
```

```Go
var _Bhaiksuki = ...
```

### <a id="_Bopomofo" href="#_Bopomofo">var _Bopomofo</a>

```
searchKey: unicode._Bopomofo
tags: [private]
```

```Go
var _Bopomofo = ...
```

### <a id="_Brahmi" href="#_Brahmi">var _Brahmi</a>

```
searchKey: unicode._Brahmi
tags: [private]
```

```Go
var _Brahmi = ...
```

### <a id="_Braille" href="#_Braille">var _Braille</a>

```
searchKey: unicode._Braille
tags: [private]
```

```Go
var _Braille = &RangeTable{
	R16: []Range16{
		{0x2800, 0x28ff, 1},
	},
}
```

### <a id="_Buginese" href="#_Buginese">var _Buginese</a>

```
searchKey: unicode._Buginese
tags: [private]
```

```Go
var _Buginese = &RangeTable{
	R16: []Range16{
		{0x1a00, 0x1a1b, 1},
		{0x1a1e, 0x1a1f, 1},
	},
}
```

### <a id="_Buhid" href="#_Buhid">var _Buhid</a>

```
searchKey: unicode._Buhid
tags: [private]
```

```Go
var _Buhid = &RangeTable{
	R16: []Range16{
		{0x1740, 0x1753, 1},
	},
}
```

### <a id="_Canadian_Aboriginal" href="#_Canadian_Aboriginal">var _Canadian_Aboriginal</a>

```
searchKey: unicode._Canadian_Aboriginal
tags: [private]
```

```Go
var _Canadian_Aboriginal = ...
```

### <a id="_Carian" href="#_Carian">var _Carian</a>

```
searchKey: unicode._Carian
tags: [private]
```

```Go
var _Carian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x102a0, 0x102d0, 1},
	},
}
```

### <a id="_Caucasian_Albanian" href="#_Caucasian_Albanian">var _Caucasian_Albanian</a>

```
searchKey: unicode._Caucasian_Albanian
tags: [private]
```

```Go
var _Caucasian_Albanian = ...
```

### <a id="_Chakma" href="#_Chakma">var _Chakma</a>

```
searchKey: unicode._Chakma
tags: [private]
```

```Go
var _Chakma = ...
```

### <a id="_Cham" href="#_Cham">var _Cham</a>

```
searchKey: unicode._Cham
tags: [private]
```

```Go
var _Cham = ...
```

### <a id="_Cherokee" href="#_Cherokee">var _Cherokee</a>

```
searchKey: unicode._Cherokee
tags: [private]
```

```Go
var _Cherokee = ...
```

### <a id="_Chorasmian" href="#_Chorasmian">var _Chorasmian</a>

```
searchKey: unicode._Chorasmian
tags: [private]
```

```Go
var _Chorasmian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10fb0, 0x10fcb, 1},
	},
}
```

### <a id="_Common" href="#_Common">var _Common</a>

```
searchKey: unicode._Common
tags: [private]
```

```Go
var _Common = ...
```

### <a id="_Coptic" href="#_Coptic">var _Coptic</a>

```
searchKey: unicode._Coptic
tags: [private]
```

```Go
var _Coptic = ...
```

### <a id="_Cuneiform" href="#_Cuneiform">var _Cuneiform</a>

```
searchKey: unicode._Cuneiform
tags: [private]
```

```Go
var _Cuneiform = ...
```

### <a id="_Cypriot" href="#_Cypriot">var _Cypriot</a>

```
searchKey: unicode._Cypriot
tags: [private]
```

```Go
var _Cypriot = ...
```

### <a id="_Cyrillic" href="#_Cyrillic">var _Cyrillic</a>

```
searchKey: unicode._Cyrillic
tags: [private]
```

```Go
var _Cyrillic = ...
```

### <a id="_Deseret" href="#_Deseret">var _Deseret</a>

```
searchKey: unicode._Deseret
tags: [private]
```

```Go
var _Deseret = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10400, 0x1044f, 1},
	},
}
```

### <a id="_Devanagari" href="#_Devanagari">var _Devanagari</a>

```
searchKey: unicode._Devanagari
tags: [private]
```

```Go
var _Devanagari = ...
```

### <a id="_Dives_Akuru" href="#_Dives_Akuru">var _Dives_Akuru</a>

```
searchKey: unicode._Dives_Akuru
tags: [private]
```

```Go
var _Dives_Akuru = ...
```

### <a id="_Dogra" href="#_Dogra">var _Dogra</a>

```
searchKey: unicode._Dogra
tags: [private]
```

```Go
var _Dogra = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11800, 0x1183b, 1},
	},
}
```

### <a id="_Duployan" href="#_Duployan">var _Duployan</a>

```
searchKey: unicode._Duployan
tags: [private]
```

```Go
var _Duployan = ...
```

### <a id="_Egyptian_Hieroglyphs" href="#_Egyptian_Hieroglyphs">var _Egyptian_Hieroglyphs</a>

```
searchKey: unicode._Egyptian_Hieroglyphs
tags: [private]
```

```Go
var _Egyptian_Hieroglyphs = ...
```

### <a id="_Elbasan" href="#_Elbasan">var _Elbasan</a>

```
searchKey: unicode._Elbasan
tags: [private]
```

```Go
var _Elbasan = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10500, 0x10527, 1},
	},
}
```

### <a id="_Elymaic" href="#_Elymaic">var _Elymaic</a>

```
searchKey: unicode._Elymaic
tags: [private]
```

```Go
var _Elymaic = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10fe0, 0x10ff6, 1},
	},
}
```

### <a id="_Ethiopic" href="#_Ethiopic">var _Ethiopic</a>

```
searchKey: unicode._Ethiopic
tags: [private]
```

```Go
var _Ethiopic = ...
```

### <a id="_Georgian" href="#_Georgian">var _Georgian</a>

```
searchKey: unicode._Georgian
tags: [private]
```

```Go
var _Georgian = ...
```

### <a id="_Glagolitic" href="#_Glagolitic">var _Glagolitic</a>

```
searchKey: unicode._Glagolitic
tags: [private]
```

```Go
var _Glagolitic = ...
```

### <a id="_Gothic" href="#_Gothic">var _Gothic</a>

```
searchKey: unicode._Gothic
tags: [private]
```

```Go
var _Gothic = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10330, 0x1034a, 1},
	},
}
```

### <a id="_Grantha" href="#_Grantha">var _Grantha</a>

```
searchKey: unicode._Grantha
tags: [private]
```

```Go
var _Grantha = ...
```

### <a id="_Greek" href="#_Greek">var _Greek</a>

```
searchKey: unicode._Greek
tags: [private]
```

```Go
var _Greek = ...
```

### <a id="_Gujarati" href="#_Gujarati">var _Gujarati</a>

```
searchKey: unicode._Gujarati
tags: [private]
```

```Go
var _Gujarati = ...
```

### <a id="_Gunjala_Gondi" href="#_Gunjala_Gondi">var _Gunjala_Gondi</a>

```
searchKey: unicode._Gunjala_Gondi
tags: [private]
```

```Go
var _Gunjala_Gondi = ...
```

### <a id="_Gurmukhi" href="#_Gurmukhi">var _Gurmukhi</a>

```
searchKey: unicode._Gurmukhi
tags: [private]
```

```Go
var _Gurmukhi = ...
```

### <a id="_Han" href="#_Han">var _Han</a>

```
searchKey: unicode._Han
tags: [private]
```

```Go
var _Han = ...
```

### <a id="_Hangul" href="#_Hangul">var _Hangul</a>

```
searchKey: unicode._Hangul
tags: [private]
```

```Go
var _Hangul = ...
```

### <a id="_Hanifi_Rohingya" href="#_Hanifi_Rohingya">var _Hanifi_Rohingya</a>

```
searchKey: unicode._Hanifi_Rohingya
tags: [private]
```

```Go
var _Hanifi_Rohingya = ...
```

### <a id="_Hanunoo" href="#_Hanunoo">var _Hanunoo</a>

```
searchKey: unicode._Hanunoo
tags: [private]
```

```Go
var _Hanunoo = &RangeTable{
	R16: []Range16{
		{0x1720, 0x1734, 1},
	},
}
```

### <a id="_Hatran" href="#_Hatran">var _Hatran</a>

```
searchKey: unicode._Hatran
tags: [private]
```

```Go
var _Hatran = ...
```

### <a id="_Hebrew" href="#_Hebrew">var _Hebrew</a>

```
searchKey: unicode._Hebrew
tags: [private]
```

```Go
var _Hebrew = ...
```

### <a id="_Hiragana" href="#_Hiragana">var _Hiragana</a>

```
searchKey: unicode._Hiragana
tags: [private]
```

```Go
var _Hiragana = ...
```

### <a id="_Imperial_Aramaic" href="#_Imperial_Aramaic">var _Imperial_Aramaic</a>

```
searchKey: unicode._Imperial_Aramaic
tags: [private]
```

```Go
var _Imperial_Aramaic = ...
```

### <a id="_Inherited" href="#_Inherited">var _Inherited</a>

```
searchKey: unicode._Inherited
tags: [private]
```

```Go
var _Inherited = ...
```

### <a id="_Inscriptional_Pahlavi" href="#_Inscriptional_Pahlavi">var _Inscriptional_Pahlavi</a>

```
searchKey: unicode._Inscriptional_Pahlavi
tags: [private]
```

```Go
var _Inscriptional_Pahlavi = ...
```

### <a id="_Inscriptional_Parthian" href="#_Inscriptional_Parthian">var _Inscriptional_Parthian</a>

```
searchKey: unicode._Inscriptional_Parthian
tags: [private]
```

```Go
var _Inscriptional_Parthian = ...
```

### <a id="_Javanese" href="#_Javanese">var _Javanese</a>

```
searchKey: unicode._Javanese
tags: [private]
```

```Go
var _Javanese = ...
```

### <a id="_Kaithi" href="#_Kaithi">var _Kaithi</a>

```
searchKey: unicode._Kaithi
tags: [private]
```

```Go
var _Kaithi = ...
```

### <a id="_Kannada" href="#_Kannada">var _Kannada</a>

```
searchKey: unicode._Kannada
tags: [private]
```

```Go
var _Kannada = ...
```

### <a id="_Katakana" href="#_Katakana">var _Katakana</a>

```
searchKey: unicode._Katakana
tags: [private]
```

```Go
var _Katakana = ...
```

### <a id="_Kayah_Li" href="#_Kayah_Li">var _Kayah_Li</a>

```
searchKey: unicode._Kayah_Li
tags: [private]
```

```Go
var _Kayah_Li = &RangeTable{
	R16: []Range16{
		{0xa900, 0xa92d, 1},
		{0xa92f, 0xa92f, 1},
	},
}
```

### <a id="_Kharoshthi" href="#_Kharoshthi">var _Kharoshthi</a>

```
searchKey: unicode._Kharoshthi
tags: [private]
```

```Go
var _Kharoshthi = ...
```

### <a id="_Khitan_Small_Script" href="#_Khitan_Small_Script">var _Khitan_Small_Script</a>

```
searchKey: unicode._Khitan_Small_Script
tags: [private]
```

```Go
var _Khitan_Small_Script = ...
```

### <a id="_Khmer" href="#_Khmer">var _Khmer</a>

```
searchKey: unicode._Khmer
tags: [private]
```

```Go
var _Khmer = ...
```

### <a id="_Khojki" href="#_Khojki">var _Khojki</a>

```
searchKey: unicode._Khojki
tags: [private]
```

```Go
var _Khojki = ...
```

### <a id="_Khudawadi" href="#_Khudawadi">var _Khudawadi</a>

```
searchKey: unicode._Khudawadi
tags: [private]
```

```Go
var _Khudawadi = ...
```

### <a id="_Lao" href="#_Lao">var _Lao</a>

```
searchKey: unicode._Lao
tags: [private]
```

```Go
var _Lao = ...
```

### <a id="_Latin" href="#_Latin">var _Latin</a>

```
searchKey: unicode._Latin
tags: [private]
```

```Go
var _Latin = ...
```

### <a id="_Lepcha" href="#_Lepcha">var _Lepcha</a>

```
searchKey: unicode._Lepcha
tags: [private]
```

```Go
var _Lepcha = ...
```

### <a id="_Limbu" href="#_Limbu">var _Limbu</a>

```
searchKey: unicode._Limbu
tags: [private]
```

```Go
var _Limbu = ...
```

### <a id="_Linear_A" href="#_Linear_A">var _Linear_A</a>

```
searchKey: unicode._Linear_A
tags: [private]
```

```Go
var _Linear_A = ...
```

### <a id="_Linear_B" href="#_Linear_B">var _Linear_B</a>

```
searchKey: unicode._Linear_B
tags: [private]
```

```Go
var _Linear_B = ...
```

### <a id="_Lisu" href="#_Lisu">var _Lisu</a>

```
searchKey: unicode._Lisu
tags: [private]
```

```Go
var _Lisu = ...
```

### <a id="_Lycian" href="#_Lycian">var _Lycian</a>

```
searchKey: unicode._Lycian
tags: [private]
```

```Go
var _Lycian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10280, 0x1029c, 1},
	},
}
```

### <a id="_Lydian" href="#_Lydian">var _Lydian</a>

```
searchKey: unicode._Lydian
tags: [private]
```

```Go
var _Lydian = ...
```

### <a id="_Mahajani" href="#_Mahajani">var _Mahajani</a>

```
searchKey: unicode._Mahajani
tags: [private]
```

```Go
var _Mahajani = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11150, 0x11176, 1},
	},
}
```

### <a id="_Makasar" href="#_Makasar">var _Makasar</a>

```
searchKey: unicode._Makasar
tags: [private]
```

```Go
var _Makasar = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11ee0, 0x11ef8, 1},
	},
}
```

### <a id="_Malayalam" href="#_Malayalam">var _Malayalam</a>

```
searchKey: unicode._Malayalam
tags: [private]
```

```Go
var _Malayalam = ...
```

### <a id="_Mandaic" href="#_Mandaic">var _Mandaic</a>

```
searchKey: unicode._Mandaic
tags: [private]
```

```Go
var _Mandaic = &RangeTable{
	R16: []Range16{
		{0x0840, 0x085b, 1},
		{0x085e, 0x085e, 1},
	},
}
```

### <a id="_Manichaean" href="#_Manichaean">var _Manichaean</a>

```
searchKey: unicode._Manichaean
tags: [private]
```

```Go
var _Manichaean = ...
```

### <a id="_Marchen" href="#_Marchen">var _Marchen</a>

```
searchKey: unicode._Marchen
tags: [private]
```

```Go
var _Marchen = ...
```

### <a id="_Masaram_Gondi" href="#_Masaram_Gondi">var _Masaram_Gondi</a>

```
searchKey: unicode._Masaram_Gondi
tags: [private]
```

```Go
var _Masaram_Gondi = ...
```

### <a id="_Medefaidrin" href="#_Medefaidrin">var _Medefaidrin</a>

```
searchKey: unicode._Medefaidrin
tags: [private]
```

```Go
var _Medefaidrin = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x16e40, 0x16e9a, 1},
	},
}
```

### <a id="_Meetei_Mayek" href="#_Meetei_Mayek">var _Meetei_Mayek</a>

```
searchKey: unicode._Meetei_Mayek
tags: [private]
```

```Go
var _Meetei_Mayek = ...
```

### <a id="_Mende_Kikakui" href="#_Mende_Kikakui">var _Mende_Kikakui</a>

```
searchKey: unicode._Mende_Kikakui
tags: [private]
```

```Go
var _Mende_Kikakui = ...
```

### <a id="_Meroitic_Cursive" href="#_Meroitic_Cursive">var _Meroitic_Cursive</a>

```
searchKey: unicode._Meroitic_Cursive
tags: [private]
```

```Go
var _Meroitic_Cursive = ...
```

### <a id="_Meroitic_Hieroglyphs" href="#_Meroitic_Hieroglyphs">var _Meroitic_Hieroglyphs</a>

```
searchKey: unicode._Meroitic_Hieroglyphs
tags: [private]
```

```Go
var _Meroitic_Hieroglyphs = ...
```

### <a id="_Miao" href="#_Miao">var _Miao</a>

```
searchKey: unicode._Miao
tags: [private]
```

```Go
var _Miao = ...
```

### <a id="_Modi" href="#_Modi">var _Modi</a>

```
searchKey: unicode._Modi
tags: [private]
```

```Go
var _Modi = ...
```

### <a id="_Mongolian" href="#_Mongolian">var _Mongolian</a>

```
searchKey: unicode._Mongolian
tags: [private]
```

```Go
var _Mongolian = ...
```

### <a id="_Mro" href="#_Mro">var _Mro</a>

```
searchKey: unicode._Mro
tags: [private]
```

```Go
var _Mro = ...
```

### <a id="_Multani" href="#_Multani">var _Multani</a>

```
searchKey: unicode._Multani
tags: [private]
```

```Go
var _Multani = ...
```

### <a id="_Myanmar" href="#_Myanmar">var _Myanmar</a>

```
searchKey: unicode._Myanmar
tags: [private]
```

```Go
var _Myanmar = ...
```

### <a id="_Nabataean" href="#_Nabataean">var _Nabataean</a>

```
searchKey: unicode._Nabataean
tags: [private]
```

```Go
var _Nabataean = ...
```

### <a id="_Nandinagari" href="#_Nandinagari">var _Nandinagari</a>

```
searchKey: unicode._Nandinagari
tags: [private]
```

```Go
var _Nandinagari = ...
```

### <a id="_New_Tai_Lue" href="#_New_Tai_Lue">var _New_Tai_Lue</a>

```
searchKey: unicode._New_Tai_Lue
tags: [private]
```

```Go
var _New_Tai_Lue = ...
```

### <a id="_Newa" href="#_Newa">var _Newa</a>

```
searchKey: unicode._Newa
tags: [private]
```

```Go
var _Newa = ...
```

### <a id="_Nko" href="#_Nko">var _Nko</a>

```
searchKey: unicode._Nko
tags: [private]
```

```Go
var _Nko = &RangeTable{
	R16: []Range16{
		{0x07c0, 0x07fa, 1},
		{0x07fd, 0x07ff, 1},
	},
}
```

### <a id="_Nushu" href="#_Nushu">var _Nushu</a>

```
searchKey: unicode._Nushu
tags: [private]
```

```Go
var _Nushu = ...
```

### <a id="_Nyiakeng_Puachue_Hmong" href="#_Nyiakeng_Puachue_Hmong">var _Nyiakeng_Puachue_Hmong</a>

```
searchKey: unicode._Nyiakeng_Puachue_Hmong
tags: [private]
```

```Go
var _Nyiakeng_Puachue_Hmong = ...
```

### <a id="_Ogham" href="#_Ogham">var _Ogham</a>

```
searchKey: unicode._Ogham
tags: [private]
```

```Go
var _Ogham = &RangeTable{
	R16: []Range16{
		{0x1680, 0x169c, 1},
	},
}
```

### <a id="_Ol_Chiki" href="#_Ol_Chiki">var _Ol_Chiki</a>

```
searchKey: unicode._Ol_Chiki
tags: [private]
```

```Go
var _Ol_Chiki = &RangeTable{
	R16: []Range16{
		{0x1c50, 0x1c7f, 1},
	},
}
```

### <a id="_Old_Hungarian" href="#_Old_Hungarian">var _Old_Hungarian</a>

```
searchKey: unicode._Old_Hungarian
tags: [private]
```

```Go
var _Old_Hungarian = ...
```

### <a id="_Old_Italic" href="#_Old_Italic">var _Old_Italic</a>

```
searchKey: unicode._Old_Italic
tags: [private]
```

```Go
var _Old_Italic = ...
```

### <a id="_Old_North_Arabian" href="#_Old_North_Arabian">var _Old_North_Arabian</a>

```
searchKey: unicode._Old_North_Arabian
tags: [private]
```

```Go
var _Old_North_Arabian = ...
```

### <a id="_Old_Permic" href="#_Old_Permic">var _Old_Permic</a>

```
searchKey: unicode._Old_Permic
tags: [private]
```

```Go
var _Old_Permic = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10350, 0x1037a, 1},
	},
}
```

### <a id="_Old_Persian" href="#_Old_Persian">var _Old_Persian</a>

```
searchKey: unicode._Old_Persian
tags: [private]
```

```Go
var _Old_Persian = ...
```

### <a id="_Old_Sogdian" href="#_Old_Sogdian">var _Old_Sogdian</a>

```
searchKey: unicode._Old_Sogdian
tags: [private]
```

```Go
var _Old_Sogdian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10f00, 0x10f27, 1},
	},
}
```

### <a id="_Old_South_Arabian" href="#_Old_South_Arabian">var _Old_South_Arabian</a>

```
searchKey: unicode._Old_South_Arabian
tags: [private]
```

```Go
var _Old_South_Arabian = ...
```

### <a id="_Old_Turkic" href="#_Old_Turkic">var _Old_Turkic</a>

```
searchKey: unicode._Old_Turkic
tags: [private]
```

```Go
var _Old_Turkic = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10c00, 0x10c48, 1},
	},
}
```

### <a id="_Oriya" href="#_Oriya">var _Oriya</a>

```
searchKey: unicode._Oriya
tags: [private]
```

```Go
var _Oriya = ...
```

### <a id="_Osage" href="#_Osage">var _Osage</a>

```
searchKey: unicode._Osage
tags: [private]
```

```Go
var _Osage = ...
```

### <a id="_Osmanya" href="#_Osmanya">var _Osmanya</a>

```
searchKey: unicode._Osmanya
tags: [private]
```

```Go
var _Osmanya = ...
```

### <a id="_Pahawh_Hmong" href="#_Pahawh_Hmong">var _Pahawh_Hmong</a>

```
searchKey: unicode._Pahawh_Hmong
tags: [private]
```

```Go
var _Pahawh_Hmong = ...
```

### <a id="_Palmyrene" href="#_Palmyrene">var _Palmyrene</a>

```
searchKey: unicode._Palmyrene
tags: [private]
```

```Go
var _Palmyrene = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10860, 0x1087f, 1},
	},
}
```

### <a id="_Pau_Cin_Hau" href="#_Pau_Cin_Hau">var _Pau_Cin_Hau</a>

```
searchKey: unicode._Pau_Cin_Hau
tags: [private]
```

```Go
var _Pau_Cin_Hau = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11ac0, 0x11af8, 1},
	},
}
```

### <a id="_Phags_Pa" href="#_Phags_Pa">var _Phags_Pa</a>

```
searchKey: unicode._Phags_Pa
tags: [private]
```

```Go
var _Phags_Pa = &RangeTable{
	R16: []Range16{
		{0xa840, 0xa877, 1},
	},
}
```

### <a id="_Phoenician" href="#_Phoenician">var _Phoenician</a>

```
searchKey: unicode._Phoenician
tags: [private]
```

```Go
var _Phoenician = ...
```

### <a id="_Psalter_Pahlavi" href="#_Psalter_Pahlavi">var _Psalter_Pahlavi</a>

```
searchKey: unicode._Psalter_Pahlavi
tags: [private]
```

```Go
var _Psalter_Pahlavi = ...
```

### <a id="_Rejang" href="#_Rejang">var _Rejang</a>

```
searchKey: unicode._Rejang
tags: [private]
```

```Go
var _Rejang = &RangeTable{
	R16: []Range16{
		{0xa930, 0xa953, 1},
		{0xa95f, 0xa95f, 1},
	},
}
```

### <a id="_Runic" href="#_Runic">var _Runic</a>

```
searchKey: unicode._Runic
tags: [private]
```

```Go
var _Runic = &RangeTable{
	R16: []Range16{
		{0x16a0, 0x16ea, 1},
		{0x16ee, 0x16f8, 1},
	},
}
```

### <a id="_Samaritan" href="#_Samaritan">var _Samaritan</a>

```
searchKey: unicode._Samaritan
tags: [private]
```

```Go
var _Samaritan = &RangeTable{
	R16: []Range16{
		{0x0800, 0x082d, 1},
		{0x0830, 0x083e, 1},
	},
}
```

### <a id="_Saurashtra" href="#_Saurashtra">var _Saurashtra</a>

```
searchKey: unicode._Saurashtra
tags: [private]
```

```Go
var _Saurashtra = &RangeTable{
	R16: []Range16{
		{0xa880, 0xa8c5, 1},
		{0xa8ce, 0xa8d9, 1},
	},
}
```

### <a id="_Sharada" href="#_Sharada">var _Sharada</a>

```
searchKey: unicode._Sharada
tags: [private]
```

```Go
var _Sharada = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11180, 0x111df, 1},
	},
}
```

### <a id="_Shavian" href="#_Shavian">var _Shavian</a>

```
searchKey: unicode._Shavian
tags: [private]
```

```Go
var _Shavian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10450, 0x1047f, 1},
	},
}
```

### <a id="_Siddham" href="#_Siddham">var _Siddham</a>

```
searchKey: unicode._Siddham
tags: [private]
```

```Go
var _Siddham = ...
```

### <a id="_SignWriting" href="#_SignWriting">var _SignWriting</a>

```
searchKey: unicode._SignWriting
tags: [private]
```

```Go
var _SignWriting = ...
```

### <a id="_Sinhala" href="#_Sinhala">var _Sinhala</a>

```
searchKey: unicode._Sinhala
tags: [private]
```

```Go
var _Sinhala = ...
```

### <a id="_Sogdian" href="#_Sogdian">var _Sogdian</a>

```
searchKey: unicode._Sogdian
tags: [private]
```

```Go
var _Sogdian = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x10f30, 0x10f59, 1},
	},
}
```

### <a id="_Sora_Sompeng" href="#_Sora_Sompeng">var _Sora_Sompeng</a>

```
searchKey: unicode._Sora_Sompeng
tags: [private]
```

```Go
var _Sora_Sompeng = ...
```

### <a id="_Soyombo" href="#_Soyombo">var _Soyombo</a>

```
searchKey: unicode._Soyombo
tags: [private]
```

```Go
var _Soyombo = &RangeTable{
	R16: []Range16{},
	R32: []Range32{
		{0x11a50, 0x11aa2, 1},
	},
}
```

### <a id="_Sundanese" href="#_Sundanese">var _Sundanese</a>

```
searchKey: unicode._Sundanese
tags: [private]
```

```Go
var _Sundanese = &RangeTable{
	R16: []Range16{
		{0x1b80, 0x1bbf, 1},
		{0x1cc0, 0x1cc7, 1},
	},
}
```

### <a id="_Syloti_Nagri" href="#_Syloti_Nagri">var _Syloti_Nagri</a>

```
searchKey: unicode._Syloti_Nagri
tags: [private]
```

```Go
var _Syloti_Nagri = &RangeTable{
	R16: []Range16{
		{0xa800, 0xa82c, 1},
	},
}
```

### <a id="_Syriac" href="#_Syriac">var _Syriac</a>

```
searchKey: unicode._Syriac
tags: [private]
```

```Go
var _Syriac = ...
```

### <a id="_Tagalog" href="#_Tagalog">var _Tagalog</a>

```
searchKey: unicode._Tagalog
tags: [private]
```

```Go
var _Tagalog = &RangeTable{
	R16: []Range16{
		{0x1700, 0x170c, 1},
		{0x170e, 0x1714, 1},
	},
}
```

### <a id="_Tagbanwa" href="#_Tagbanwa">var _Tagbanwa</a>

```
searchKey: unicode._Tagbanwa
tags: [private]
```

```Go
var _Tagbanwa = ...
```

### <a id="_Tai_Le" href="#_Tai_Le">var _Tai_Le</a>

```
searchKey: unicode._Tai_Le
tags: [private]
```

```Go
var _Tai_Le = &RangeTable{
	R16: []Range16{
		{0x1950, 0x196d, 1},
		{0x1970, 0x1974, 1},
	},
}
```

### <a id="_Tai_Tham" href="#_Tai_Tham">var _Tai_Tham</a>

```
searchKey: unicode._Tai_Tham
tags: [private]
```

```Go
var _Tai_Tham = ...
```

### <a id="_Tai_Viet" href="#_Tai_Viet">var _Tai_Viet</a>

```
searchKey: unicode._Tai_Viet
tags: [private]
```

```Go
var _Tai_Viet = &RangeTable{
	R16: []Range16{
		{0xaa80, 0xaac2, 1},
		{0xaadb, 0xaadf, 1},
	},
}
```

### <a id="_Takri" href="#_Takri">var _Takri</a>

```
searchKey: unicode._Takri
tags: [private]
```

```Go
var _Takri = ...
```

### <a id="_Tamil" href="#_Tamil">var _Tamil</a>

```
searchKey: unicode._Tamil
tags: [private]
```

```Go
var _Tamil = ...
```

### <a id="_Tangut" href="#_Tangut">var _Tangut</a>

```
searchKey: unicode._Tangut
tags: [private]
```

```Go
var _Tangut = ...
```

### <a id="_Telugu" href="#_Telugu">var _Telugu</a>

```
searchKey: unicode._Telugu
tags: [private]
```

```Go
var _Telugu = ...
```

### <a id="_Thaana" href="#_Thaana">var _Thaana</a>

```
searchKey: unicode._Thaana
tags: [private]
```

```Go
var _Thaana = &RangeTable{
	R16: []Range16{
		{0x0780, 0x07b1, 1},
	},
}
```

### <a id="_Thai" href="#_Thai">var _Thai</a>

```
searchKey: unicode._Thai
tags: [private]
```

```Go
var _Thai = &RangeTable{
	R16: []Range16{
		{0x0e01, 0x0e3a, 1},
		{0x0e40, 0x0e5b, 1},
	},
}
```

### <a id="_Tibetan" href="#_Tibetan">var _Tibetan</a>

```
searchKey: unicode._Tibetan
tags: [private]
```

```Go
var _Tibetan = ...
```

### <a id="_Tifinagh" href="#_Tifinagh">var _Tifinagh</a>

```
searchKey: unicode._Tifinagh
tags: [private]
```

```Go
var _Tifinagh = ...
```

### <a id="_Tirhuta" href="#_Tirhuta">var _Tirhuta</a>

```
searchKey: unicode._Tirhuta
tags: [private]
```

```Go
var _Tirhuta = ...
```

### <a id="_Ugaritic" href="#_Ugaritic">var _Ugaritic</a>

```
searchKey: unicode._Ugaritic
tags: [private]
```

```Go
var _Ugaritic = ...
```

### <a id="_Vai" href="#_Vai">var _Vai</a>

```
searchKey: unicode._Vai
tags: [private]
```

```Go
var _Vai = &RangeTable{
	R16: []Range16{
		{0xa500, 0xa62b, 1},
	},
}
```

### <a id="_Wancho" href="#_Wancho">var _Wancho</a>

```
searchKey: unicode._Wancho
tags: [private]
```

```Go
var _Wancho = ...
```

### <a id="_Warang_Citi" href="#_Warang_Citi">var _Warang_Citi</a>

```
searchKey: unicode._Warang_Citi
tags: [private]
```

```Go
var _Warang_Citi = ...
```

### <a id="_Yezidi" href="#_Yezidi">var _Yezidi</a>

```
searchKey: unicode._Yezidi
tags: [private]
```

```Go
var _Yezidi = ...
```

### <a id="_Yi" href="#_Yi">var _Yi</a>

```
searchKey: unicode._Yi
tags: [private]
```

```Go
var _Yi = &RangeTable{
	R16: []Range16{
		{0xa000, 0xa48c, 1},
		{0xa490, 0xa4c6, 1},
	},
}
```

### <a id="_Zanabazar_Square" href="#_Zanabazar_Square">var _Zanabazar_Square</a>

```
searchKey: unicode._Zanabazar_Square
tags: [private]
```

```Go
var _Zanabazar_Square = ...
```

### <a id="Adlam" href="#Adlam">var Adlam</a>

```
searchKey: unicode.Adlam
```

```Go
var Adlam = _Adlam // Adlam is the set of Unicode characters in script Adlam.

```

These variables have type *RangeTable. 

### <a id="Ahom" href="#Ahom">var Ahom</a>

```
searchKey: unicode.Ahom
```

```Go
var Ahom = _Ahom // Ahom is the set of Unicode characters in script Ahom.

```

These variables have type *RangeTable. 

### <a id="Anatolian_Hieroglyphs" href="#Anatolian_Hieroglyphs">var Anatolian_Hieroglyphs</a>

```
searchKey: unicode.Anatolian_Hieroglyphs
```

```Go
var Anatolian_Hieroglyphs // Anatolian_Hieroglyphs is the set of Unicode characters in script Anatolian_Hieroglyphs.
 = ...
```

These variables have type *RangeTable. 

### <a id="Arabic" href="#Arabic">var Arabic</a>

```
searchKey: unicode.Arabic
```

```Go
var Arabic = _Arabic // Arabic is the set of Unicode characters in script Arabic.

```

These variables have type *RangeTable. 

### <a id="Armenian" href="#Armenian">var Armenian</a>

```
searchKey: unicode.Armenian
```

```Go
var Armenian = _Armenian // Armenian is the set of Unicode characters in script Armenian.

```

These variables have type *RangeTable. 

### <a id="Avestan" href="#Avestan">var Avestan</a>

```
searchKey: unicode.Avestan
```

```Go
var Avestan = _Avestan // Avestan is the set of Unicode characters in script Avestan.

```

These variables have type *RangeTable. 

### <a id="Balinese" href="#Balinese">var Balinese</a>

```
searchKey: unicode.Balinese
```

```Go
var Balinese = _Balinese // Balinese is the set of Unicode characters in script Balinese.

```

These variables have type *RangeTable. 

### <a id="Bamum" href="#Bamum">var Bamum</a>

```
searchKey: unicode.Bamum
```

```Go
var Bamum = _Bamum // Bamum is the set of Unicode characters in script Bamum.

```

These variables have type *RangeTable. 

### <a id="Bassa_Vah" href="#Bassa_Vah">var Bassa_Vah</a>

```
searchKey: unicode.Bassa_Vah
```

```Go
var Bassa_Vah = _Bassa_Vah // Bassa_Vah is the set of Unicode characters in script Bassa_Vah.

```

These variables have type *RangeTable. 

### <a id="Batak" href="#Batak">var Batak</a>

```
searchKey: unicode.Batak
```

```Go
var Batak = _Batak // Batak is the set of Unicode characters in script Batak.

```

These variables have type *RangeTable. 

### <a id="Bengali" href="#Bengali">var Bengali</a>

```
searchKey: unicode.Bengali
```

```Go
var Bengali = _Bengali // Bengali is the set of Unicode characters in script Bengali.

```

These variables have type *RangeTable. 

### <a id="Bhaiksuki" href="#Bhaiksuki">var Bhaiksuki</a>

```
searchKey: unicode.Bhaiksuki
```

```Go
var Bhaiksuki = _Bhaiksuki // Bhaiksuki is the set of Unicode characters in script Bhaiksuki.

```

These variables have type *RangeTable. 

### <a id="Bopomofo" href="#Bopomofo">var Bopomofo</a>

```
searchKey: unicode.Bopomofo
```

```Go
var Bopomofo = _Bopomofo // Bopomofo is the set of Unicode characters in script Bopomofo.

```

These variables have type *RangeTable. 

### <a id="Brahmi" href="#Brahmi">var Brahmi</a>

```
searchKey: unicode.Brahmi
```

```Go
var Brahmi = _Brahmi // Brahmi is the set of Unicode characters in script Brahmi.

```

These variables have type *RangeTable. 

### <a id="Braille" href="#Braille">var Braille</a>

```
searchKey: unicode.Braille
```

```Go
var Braille = _Braille // Braille is the set of Unicode characters in script Braille.

```

These variables have type *RangeTable. 

### <a id="Buginese" href="#Buginese">var Buginese</a>

```
searchKey: unicode.Buginese
```

```Go
var Buginese = _Buginese // Buginese is the set of Unicode characters in script Buginese.

```

These variables have type *RangeTable. 

### <a id="Buhid" href="#Buhid">var Buhid</a>

```
searchKey: unicode.Buhid
```

```Go
var Buhid = _Buhid // Buhid is the set of Unicode characters in script Buhid.

```

These variables have type *RangeTable. 

### <a id="Canadian_Aboriginal" href="#Canadian_Aboriginal">var Canadian_Aboriginal</a>

```
searchKey: unicode.Canadian_Aboriginal
```

```Go
var Canadian_Aboriginal // Canadian_Aboriginal is the set of Unicode characters in script Canadian_Aboriginal.
 = ...
```

These variables have type *RangeTable. 

### <a id="Carian" href="#Carian">var Carian</a>

```
searchKey: unicode.Carian
```

```Go
var Carian = _Carian // Carian is the set of Unicode characters in script Carian.

```

These variables have type *RangeTable. 

### <a id="Caucasian_Albanian" href="#Caucasian_Albanian">var Caucasian_Albanian</a>

```
searchKey: unicode.Caucasian_Albanian
```

```Go
var Caucasian_Albanian // Caucasian_Albanian is the set of Unicode characters in script Caucasian_Albanian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Chakma" href="#Chakma">var Chakma</a>

```
searchKey: unicode.Chakma
```

```Go
var Chakma = _Chakma // Chakma is the set of Unicode characters in script Chakma.

```

These variables have type *RangeTable. 

### <a id="Cham" href="#Cham">var Cham</a>

```
searchKey: unicode.Cham
```

```Go
var Cham = _Cham // Cham is the set of Unicode characters in script Cham.

```

These variables have type *RangeTable. 

### <a id="Cherokee" href="#Cherokee">var Cherokee</a>

```
searchKey: unicode.Cherokee
```

```Go
var Cherokee = _Cherokee // Cherokee is the set of Unicode characters in script Cherokee.

```

These variables have type *RangeTable. 

### <a id="Chorasmian" href="#Chorasmian">var Chorasmian</a>

```
searchKey: unicode.Chorasmian
```

```Go
var Chorasmian = _Chorasmian // Chorasmian is the set of Unicode characters in script Chorasmian.

```

These variables have type *RangeTable. 

### <a id="Common" href="#Common">var Common</a>

```
searchKey: unicode.Common
```

```Go
var Common = _Common // Common is the set of Unicode characters in script Common.

```

These variables have type *RangeTable. 

### <a id="Coptic" href="#Coptic">var Coptic</a>

```
searchKey: unicode.Coptic
```

```Go
var Coptic = _Coptic // Coptic is the set of Unicode characters in script Coptic.

```

These variables have type *RangeTable. 

### <a id="Cuneiform" href="#Cuneiform">var Cuneiform</a>

```
searchKey: unicode.Cuneiform
```

```Go
var Cuneiform = _Cuneiform // Cuneiform is the set of Unicode characters in script Cuneiform.

```

These variables have type *RangeTable. 

### <a id="Cypriot" href="#Cypriot">var Cypriot</a>

```
searchKey: unicode.Cypriot
```

```Go
var Cypriot = _Cypriot // Cypriot is the set of Unicode characters in script Cypriot.

```

These variables have type *RangeTable. 

### <a id="Cyrillic" href="#Cyrillic">var Cyrillic</a>

```
searchKey: unicode.Cyrillic
```

```Go
var Cyrillic = _Cyrillic // Cyrillic is the set of Unicode characters in script Cyrillic.

```

These variables have type *RangeTable. 

### <a id="Deseret" href="#Deseret">var Deseret</a>

```
searchKey: unicode.Deseret
```

```Go
var Deseret = _Deseret // Deseret is the set of Unicode characters in script Deseret.

```

These variables have type *RangeTable. 

### <a id="Devanagari" href="#Devanagari">var Devanagari</a>

```
searchKey: unicode.Devanagari
```

```Go
var Devanagari = _Devanagari // Devanagari is the set of Unicode characters in script Devanagari.

```

These variables have type *RangeTable. 

### <a id="Dives_Akuru" href="#Dives_Akuru">var Dives_Akuru</a>

```
searchKey: unicode.Dives_Akuru
```

```Go
var Dives_Akuru // Dives_Akuru is the set of Unicode characters in script Dives_Akuru.
 = ...
```

These variables have type *RangeTable. 

### <a id="Dogra" href="#Dogra">var Dogra</a>

```
searchKey: unicode.Dogra
```

```Go
var Dogra = _Dogra // Dogra is the set of Unicode characters in script Dogra.

```

These variables have type *RangeTable. 

### <a id="Duployan" href="#Duployan">var Duployan</a>

```
searchKey: unicode.Duployan
```

```Go
var Duployan = _Duployan // Duployan is the set of Unicode characters in script Duployan.

```

These variables have type *RangeTable. 

### <a id="Egyptian_Hieroglyphs" href="#Egyptian_Hieroglyphs">var Egyptian_Hieroglyphs</a>

```
searchKey: unicode.Egyptian_Hieroglyphs
```

```Go
var Egyptian_Hieroglyphs // Egyptian_Hieroglyphs is the set of Unicode characters in script Egyptian_Hieroglyphs.
 = ...
```

These variables have type *RangeTable. 

### <a id="Elbasan" href="#Elbasan">var Elbasan</a>

```
searchKey: unicode.Elbasan
```

```Go
var Elbasan = _Elbasan // Elbasan is the set of Unicode characters in script Elbasan.

```

These variables have type *RangeTable. 

### <a id="Elymaic" href="#Elymaic">var Elymaic</a>

```
searchKey: unicode.Elymaic
```

```Go
var Elymaic = _Elymaic // Elymaic is the set of Unicode characters in script Elymaic.

```

These variables have type *RangeTable. 

### <a id="Ethiopic" href="#Ethiopic">var Ethiopic</a>

```
searchKey: unicode.Ethiopic
```

```Go
var Ethiopic = _Ethiopic // Ethiopic is the set of Unicode characters in script Ethiopic.

```

These variables have type *RangeTable. 

### <a id="Georgian" href="#Georgian">var Georgian</a>

```
searchKey: unicode.Georgian
```

```Go
var Georgian = _Georgian // Georgian is the set of Unicode characters in script Georgian.

```

These variables have type *RangeTable. 

### <a id="Glagolitic" href="#Glagolitic">var Glagolitic</a>

```
searchKey: unicode.Glagolitic
```

```Go
var Glagolitic = _Glagolitic // Glagolitic is the set of Unicode characters in script Glagolitic.

```

These variables have type *RangeTable. 

### <a id="Gothic" href="#Gothic">var Gothic</a>

```
searchKey: unicode.Gothic
```

```Go
var Gothic = _Gothic // Gothic is the set of Unicode characters in script Gothic.

```

These variables have type *RangeTable. 

### <a id="Grantha" href="#Grantha">var Grantha</a>

```
searchKey: unicode.Grantha
```

```Go
var Grantha = _Grantha // Grantha is the set of Unicode characters in script Grantha.

```

These variables have type *RangeTable. 

### <a id="Greek" href="#Greek">var Greek</a>

```
searchKey: unicode.Greek
```

```Go
var Greek = _Greek // Greek is the set of Unicode characters in script Greek.

```

These variables have type *RangeTable. 

### <a id="Gujarati" href="#Gujarati">var Gujarati</a>

```
searchKey: unicode.Gujarati
```

```Go
var Gujarati = _Gujarati // Gujarati is the set of Unicode characters in script Gujarati.

```

These variables have type *RangeTable. 

### <a id="Gunjala_Gondi" href="#Gunjala_Gondi">var Gunjala_Gondi</a>

```
searchKey: unicode.Gunjala_Gondi
```

```Go
var Gunjala_Gondi // Gunjala_Gondi is the set of Unicode characters in script Gunjala_Gondi.
 = ...
```

These variables have type *RangeTable. 

### <a id="Gurmukhi" href="#Gurmukhi">var Gurmukhi</a>

```
searchKey: unicode.Gurmukhi
```

```Go
var Gurmukhi = _Gurmukhi // Gurmukhi is the set of Unicode characters in script Gurmukhi.

```

These variables have type *RangeTable. 

### <a id="Han" href="#Han">var Han</a>

```
searchKey: unicode.Han
```

```Go
var Han = _Han // Han is the set of Unicode characters in script Han.

```

These variables have type *RangeTable. 

### <a id="Hangul" href="#Hangul">var Hangul</a>

```
searchKey: unicode.Hangul
```

```Go
var Hangul = _Hangul // Hangul is the set of Unicode characters in script Hangul.

```

These variables have type *RangeTable. 

### <a id="Hanifi_Rohingya" href="#Hanifi_Rohingya">var Hanifi_Rohingya</a>

```
searchKey: unicode.Hanifi_Rohingya
```

```Go
var Hanifi_Rohingya // Hanifi_Rohingya is the set of Unicode characters in script Hanifi_Rohingya.
 = ...
```

These variables have type *RangeTable. 

### <a id="Hanunoo" href="#Hanunoo">var Hanunoo</a>

```
searchKey: unicode.Hanunoo
```

```Go
var Hanunoo = _Hanunoo // Hanunoo is the set of Unicode characters in script Hanunoo.

```

These variables have type *RangeTable. 

### <a id="Hatran" href="#Hatran">var Hatran</a>

```
searchKey: unicode.Hatran
```

```Go
var Hatran = _Hatran // Hatran is the set of Unicode characters in script Hatran.

```

These variables have type *RangeTable. 

### <a id="Hebrew" href="#Hebrew">var Hebrew</a>

```
searchKey: unicode.Hebrew
```

```Go
var Hebrew = _Hebrew // Hebrew is the set of Unicode characters in script Hebrew.

```

These variables have type *RangeTable. 

### <a id="Hiragana" href="#Hiragana">var Hiragana</a>

```
searchKey: unicode.Hiragana
```

```Go
var Hiragana = _Hiragana // Hiragana is the set of Unicode characters in script Hiragana.

```

These variables have type *RangeTable. 

### <a id="Imperial_Aramaic" href="#Imperial_Aramaic">var Imperial_Aramaic</a>

```
searchKey: unicode.Imperial_Aramaic
```

```Go
var Imperial_Aramaic // Imperial_Aramaic is the set of Unicode characters in script Imperial_Aramaic.
 = ...
```

These variables have type *RangeTable. 

### <a id="Inherited" href="#Inherited">var Inherited</a>

```
searchKey: unicode.Inherited
```

```Go
var Inherited = _Inherited // Inherited is the set of Unicode characters in script Inherited.

```

These variables have type *RangeTable. 

### <a id="Inscriptional_Pahlavi" href="#Inscriptional_Pahlavi">var Inscriptional_Pahlavi</a>

```
searchKey: unicode.Inscriptional_Pahlavi
```

```Go
var Inscriptional_Pahlavi // Inscriptional_Pahlavi is the set of Unicode characters in script Inscriptional_Pahlavi.
 = ...
```

These variables have type *RangeTable. 

### <a id="Inscriptional_Parthian" href="#Inscriptional_Parthian">var Inscriptional_Parthian</a>

```
searchKey: unicode.Inscriptional_Parthian
```

```Go
var Inscriptional_Parthian // Inscriptional_Parthian is the set of Unicode characters in script Inscriptional_Parthian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Javanese" href="#Javanese">var Javanese</a>

```
searchKey: unicode.Javanese
```

```Go
var Javanese = _Javanese // Javanese is the set of Unicode characters in script Javanese.

```

These variables have type *RangeTable. 

### <a id="Kaithi" href="#Kaithi">var Kaithi</a>

```
searchKey: unicode.Kaithi
```

```Go
var Kaithi = _Kaithi // Kaithi is the set of Unicode characters in script Kaithi.

```

These variables have type *RangeTable. 

### <a id="Kannada" href="#Kannada">var Kannada</a>

```
searchKey: unicode.Kannada
```

```Go
var Kannada = _Kannada // Kannada is the set of Unicode characters in script Kannada.

```

These variables have type *RangeTable. 

### <a id="Katakana" href="#Katakana">var Katakana</a>

```
searchKey: unicode.Katakana
```

```Go
var Katakana = _Katakana // Katakana is the set of Unicode characters in script Katakana.

```

These variables have type *RangeTable. 

### <a id="Kayah_Li" href="#Kayah_Li">var Kayah_Li</a>

```
searchKey: unicode.Kayah_Li
```

```Go
var Kayah_Li = _Kayah_Li // Kayah_Li is the set of Unicode characters in script Kayah_Li.

```

These variables have type *RangeTable. 

### <a id="Kharoshthi" href="#Kharoshthi">var Kharoshthi</a>

```
searchKey: unicode.Kharoshthi
```

```Go
var Kharoshthi = _Kharoshthi // Kharoshthi is the set of Unicode characters in script Kharoshthi.

```

These variables have type *RangeTable. 

### <a id="Khitan_Small_Script" href="#Khitan_Small_Script">var Khitan_Small_Script</a>

```
searchKey: unicode.Khitan_Small_Script
```

```Go
var Khitan_Small_Script // Khitan_Small_Script is the set of Unicode characters in script Khitan_Small_Script.
 = ...
```

These variables have type *RangeTable. 

### <a id="Khmer" href="#Khmer">var Khmer</a>

```
searchKey: unicode.Khmer
```

```Go
var Khmer = _Khmer // Khmer is the set of Unicode characters in script Khmer.

```

These variables have type *RangeTable. 

### <a id="Khojki" href="#Khojki">var Khojki</a>

```
searchKey: unicode.Khojki
```

```Go
var Khojki = _Khojki // Khojki is the set of Unicode characters in script Khojki.

```

These variables have type *RangeTable. 

### <a id="Khudawadi" href="#Khudawadi">var Khudawadi</a>

```
searchKey: unicode.Khudawadi
```

```Go
var Khudawadi = _Khudawadi // Khudawadi is the set of Unicode characters in script Khudawadi.

```

These variables have type *RangeTable. 

### <a id="Lao" href="#Lao">var Lao</a>

```
searchKey: unicode.Lao
```

```Go
var Lao = _Lao // Lao is the set of Unicode characters in script Lao.

```

These variables have type *RangeTable. 

### <a id="Latin" href="#Latin">var Latin</a>

```
searchKey: unicode.Latin
```

```Go
var Latin = _Latin // Latin is the set of Unicode characters in script Latin.

```

These variables have type *RangeTable. 

### <a id="Lepcha" href="#Lepcha">var Lepcha</a>

```
searchKey: unicode.Lepcha
```

```Go
var Lepcha = _Lepcha // Lepcha is the set of Unicode characters in script Lepcha.

```

These variables have type *RangeTable. 

### <a id="Limbu" href="#Limbu">var Limbu</a>

```
searchKey: unicode.Limbu
```

```Go
var Limbu = _Limbu // Limbu is the set of Unicode characters in script Limbu.

```

These variables have type *RangeTable. 

### <a id="Linear_A" href="#Linear_A">var Linear_A</a>

```
searchKey: unicode.Linear_A
```

```Go
var Linear_A = _Linear_A // Linear_A is the set of Unicode characters in script Linear_A.

```

These variables have type *RangeTable. 

### <a id="Linear_B" href="#Linear_B">var Linear_B</a>

```
searchKey: unicode.Linear_B
```

```Go
var Linear_B = _Linear_B // Linear_B is the set of Unicode characters in script Linear_B.

```

These variables have type *RangeTable. 

### <a id="Lisu" href="#Lisu">var Lisu</a>

```
searchKey: unicode.Lisu
```

```Go
var Lisu = _Lisu // Lisu is the set of Unicode characters in script Lisu.

```

These variables have type *RangeTable. 

### <a id="Lycian" href="#Lycian">var Lycian</a>

```
searchKey: unicode.Lycian
```

```Go
var Lycian = _Lycian // Lycian is the set of Unicode characters in script Lycian.

```

These variables have type *RangeTable. 

### <a id="Lydian" href="#Lydian">var Lydian</a>

```
searchKey: unicode.Lydian
```

```Go
var Lydian = _Lydian // Lydian is the set of Unicode characters in script Lydian.

```

These variables have type *RangeTable. 

### <a id="Mahajani" href="#Mahajani">var Mahajani</a>

```
searchKey: unicode.Mahajani
```

```Go
var Mahajani = _Mahajani // Mahajani is the set of Unicode characters in script Mahajani.

```

These variables have type *RangeTable. 

### <a id="Makasar" href="#Makasar">var Makasar</a>

```
searchKey: unicode.Makasar
```

```Go
var Makasar = _Makasar // Makasar is the set of Unicode characters in script Makasar.

```

These variables have type *RangeTable. 

### <a id="Malayalam" href="#Malayalam">var Malayalam</a>

```
searchKey: unicode.Malayalam
```

```Go
var Malayalam = _Malayalam // Malayalam is the set of Unicode characters in script Malayalam.

```

These variables have type *RangeTable. 

### <a id="Mandaic" href="#Mandaic">var Mandaic</a>

```
searchKey: unicode.Mandaic
```

```Go
var Mandaic = _Mandaic // Mandaic is the set of Unicode characters in script Mandaic.

```

These variables have type *RangeTable. 

### <a id="Manichaean" href="#Manichaean">var Manichaean</a>

```
searchKey: unicode.Manichaean
```

```Go
var Manichaean = _Manichaean // Manichaean is the set of Unicode characters in script Manichaean.

```

These variables have type *RangeTable. 

### <a id="Marchen" href="#Marchen">var Marchen</a>

```
searchKey: unicode.Marchen
```

```Go
var Marchen = _Marchen // Marchen is the set of Unicode characters in script Marchen.

```

These variables have type *RangeTable. 

### <a id="Masaram_Gondi" href="#Masaram_Gondi">var Masaram_Gondi</a>

```
searchKey: unicode.Masaram_Gondi
```

```Go
var Masaram_Gondi // Masaram_Gondi is the set of Unicode characters in script Masaram_Gondi.
 = ...
```

These variables have type *RangeTable. 

### <a id="Medefaidrin" href="#Medefaidrin">var Medefaidrin</a>

```
searchKey: unicode.Medefaidrin
```

```Go
var Medefaidrin // Medefaidrin is the set of Unicode characters in script Medefaidrin.
 = ...
```

These variables have type *RangeTable. 

### <a id="Meetei_Mayek" href="#Meetei_Mayek">var Meetei_Mayek</a>

```
searchKey: unicode.Meetei_Mayek
```

```Go
var Meetei_Mayek // Meetei_Mayek is the set of Unicode characters in script Meetei_Mayek.
 = ...
```

These variables have type *RangeTable. 

### <a id="Mende_Kikakui" href="#Mende_Kikakui">var Mende_Kikakui</a>

```
searchKey: unicode.Mende_Kikakui
```

```Go
var Mende_Kikakui // Mende_Kikakui is the set of Unicode characters in script Mende_Kikakui.
 = ...
```

These variables have type *RangeTable. 

### <a id="Meroitic_Cursive" href="#Meroitic_Cursive">var Meroitic_Cursive</a>

```
searchKey: unicode.Meroitic_Cursive
```

```Go
var Meroitic_Cursive // Meroitic_Cursive is the set of Unicode characters in script Meroitic_Cursive.
 = ...
```

These variables have type *RangeTable. 

### <a id="Meroitic_Hieroglyphs" href="#Meroitic_Hieroglyphs">var Meroitic_Hieroglyphs</a>

```
searchKey: unicode.Meroitic_Hieroglyphs
```

```Go
var Meroitic_Hieroglyphs // Meroitic_Hieroglyphs is the set of Unicode characters in script Meroitic_Hieroglyphs.
 = ...
```

These variables have type *RangeTable. 

### <a id="Miao" href="#Miao">var Miao</a>

```
searchKey: unicode.Miao
```

```Go
var Miao = _Miao // Miao is the set of Unicode characters in script Miao.

```

These variables have type *RangeTable. 

### <a id="Modi" href="#Modi">var Modi</a>

```
searchKey: unicode.Modi
```

```Go
var Modi = _Modi // Modi is the set of Unicode characters in script Modi.

```

These variables have type *RangeTable. 

### <a id="Mongolian" href="#Mongolian">var Mongolian</a>

```
searchKey: unicode.Mongolian
```

```Go
var Mongolian = _Mongolian // Mongolian is the set of Unicode characters in script Mongolian.

```

These variables have type *RangeTable. 

### <a id="Mro" href="#Mro">var Mro</a>

```
searchKey: unicode.Mro
```

```Go
var Mro = _Mro // Mro is the set of Unicode characters in script Mro.

```

These variables have type *RangeTable. 

### <a id="Multani" href="#Multani">var Multani</a>

```
searchKey: unicode.Multani
```

```Go
var Multani = _Multani // Multani is the set of Unicode characters in script Multani.

```

These variables have type *RangeTable. 

### <a id="Myanmar" href="#Myanmar">var Myanmar</a>

```
searchKey: unicode.Myanmar
```

```Go
var Myanmar = _Myanmar // Myanmar is the set of Unicode characters in script Myanmar.

```

These variables have type *RangeTable. 

### <a id="Nabataean" href="#Nabataean">var Nabataean</a>

```
searchKey: unicode.Nabataean
```

```Go
var Nabataean = _Nabataean // Nabataean is the set of Unicode characters in script Nabataean.

```

These variables have type *RangeTable. 

### <a id="Nandinagari" href="#Nandinagari">var Nandinagari</a>

```
searchKey: unicode.Nandinagari
```

```Go
var Nandinagari // Nandinagari is the set of Unicode characters in script Nandinagari.
 = ...
```

These variables have type *RangeTable. 

### <a id="New_Tai_Lue" href="#New_Tai_Lue">var New_Tai_Lue</a>

```
searchKey: unicode.New_Tai_Lue
```

```Go
var New_Tai_Lue // New_Tai_Lue is the set of Unicode characters in script New_Tai_Lue.
 = ...
```

These variables have type *RangeTable. 

### <a id="Newa" href="#Newa">var Newa</a>

```
searchKey: unicode.Newa
```

```Go
var Newa = _Newa // Newa is the set of Unicode characters in script Newa.

```

These variables have type *RangeTable. 

### <a id="Nko" href="#Nko">var Nko</a>

```
searchKey: unicode.Nko
```

```Go
var Nko = _Nko // Nko is the set of Unicode characters in script Nko.

```

These variables have type *RangeTable. 

### <a id="Nushu" href="#Nushu">var Nushu</a>

```
searchKey: unicode.Nushu
```

```Go
var Nushu = _Nushu // Nushu is the set of Unicode characters in script Nushu.

```

These variables have type *RangeTable. 

### <a id="Nyiakeng_Puachue_Hmong" href="#Nyiakeng_Puachue_Hmong">var Nyiakeng_Puachue_Hmong</a>

```
searchKey: unicode.Nyiakeng_Puachue_Hmong
```

```Go
var Nyiakeng_Puachue_Hmong // Nyiakeng_Puachue_Hmong is the set of Unicode characters in script Nyiakeng_Puachue_Hmong.
 = ...
```

These variables have type *RangeTable. 

### <a id="Ogham" href="#Ogham">var Ogham</a>

```
searchKey: unicode.Ogham
```

```Go
var Ogham = _Ogham // Ogham is the set of Unicode characters in script Ogham.

```

These variables have type *RangeTable. 

### <a id="Ol_Chiki" href="#Ol_Chiki">var Ol_Chiki</a>

```
searchKey: unicode.Ol_Chiki
```

```Go
var Ol_Chiki = _Ol_Chiki // Ol_Chiki is the set of Unicode characters in script Ol_Chiki.

```

These variables have type *RangeTable. 

### <a id="Old_Hungarian" href="#Old_Hungarian">var Old_Hungarian</a>

```
searchKey: unicode.Old_Hungarian
```

```Go
var Old_Hungarian // Old_Hungarian is the set of Unicode characters in script Old_Hungarian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Old_Italic" href="#Old_Italic">var Old_Italic</a>

```
searchKey: unicode.Old_Italic
```

```Go
var Old_Italic = _Old_Italic // Old_Italic is the set of Unicode characters in script Old_Italic.

```

These variables have type *RangeTable. 

### <a id="Old_North_Arabian" href="#Old_North_Arabian">var Old_North_Arabian</a>

```
searchKey: unicode.Old_North_Arabian
```

```Go
var Old_North_Arabian // Old_North_Arabian is the set of Unicode characters in script Old_North_Arabian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Old_Permic" href="#Old_Permic">var Old_Permic</a>

```
searchKey: unicode.Old_Permic
```

```Go
var Old_Permic = _Old_Permic // Old_Permic is the set of Unicode characters in script Old_Permic.

```

These variables have type *RangeTable. 

### <a id="Old_Persian" href="#Old_Persian">var Old_Persian</a>

```
searchKey: unicode.Old_Persian
```

```Go
var Old_Persian // Old_Persian is the set of Unicode characters in script Old_Persian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Old_Sogdian" href="#Old_Sogdian">var Old_Sogdian</a>

```
searchKey: unicode.Old_Sogdian
```

```Go
var Old_Sogdian // Old_Sogdian is the set of Unicode characters in script Old_Sogdian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Old_South_Arabian" href="#Old_South_Arabian">var Old_South_Arabian</a>

```
searchKey: unicode.Old_South_Arabian
```

```Go
var Old_South_Arabian // Old_South_Arabian is the set of Unicode characters in script Old_South_Arabian.
 = ...
```

These variables have type *RangeTable. 

### <a id="Old_Turkic" href="#Old_Turkic">var Old_Turkic</a>

```
searchKey: unicode.Old_Turkic
```

```Go
var Old_Turkic = _Old_Turkic // Old_Turkic is the set of Unicode characters in script Old_Turkic.

```

These variables have type *RangeTable. 

### <a id="Oriya" href="#Oriya">var Oriya</a>

```
searchKey: unicode.Oriya
```

```Go
var Oriya = _Oriya // Oriya is the set of Unicode characters in script Oriya.

```

These variables have type *RangeTable. 

### <a id="Osage" href="#Osage">var Osage</a>

```
searchKey: unicode.Osage
```

```Go
var Osage = _Osage // Osage is the set of Unicode characters in script Osage.

```

These variables have type *RangeTable. 

### <a id="Osmanya" href="#Osmanya">var Osmanya</a>

```
searchKey: unicode.Osmanya
```

```Go
var Osmanya = _Osmanya // Osmanya is the set of Unicode characters in script Osmanya.

```

These variables have type *RangeTable. 

### <a id="Pahawh_Hmong" href="#Pahawh_Hmong">var Pahawh_Hmong</a>

```
searchKey: unicode.Pahawh_Hmong
```

```Go
var Pahawh_Hmong // Pahawh_Hmong is the set of Unicode characters in script Pahawh_Hmong.
 = ...
```

These variables have type *RangeTable. 

### <a id="Palmyrene" href="#Palmyrene">var Palmyrene</a>

```
searchKey: unicode.Palmyrene
```

```Go
var Palmyrene = _Palmyrene // Palmyrene is the set of Unicode characters in script Palmyrene.

```

These variables have type *RangeTable. 

### <a id="Pau_Cin_Hau" href="#Pau_Cin_Hau">var Pau_Cin_Hau</a>

```
searchKey: unicode.Pau_Cin_Hau
```

```Go
var Pau_Cin_Hau // Pau_Cin_Hau is the set of Unicode characters in script Pau_Cin_Hau.
 = ...
```

These variables have type *RangeTable. 

### <a id="Phags_Pa" href="#Phags_Pa">var Phags_Pa</a>

```
searchKey: unicode.Phags_Pa
```

```Go
var Phags_Pa = _Phags_Pa // Phags_Pa is the set of Unicode characters in script Phags_Pa.

```

These variables have type *RangeTable. 

### <a id="Phoenician" href="#Phoenician">var Phoenician</a>

```
searchKey: unicode.Phoenician
```

```Go
var Phoenician = _Phoenician // Phoenician is the set of Unicode characters in script Phoenician.

```

These variables have type *RangeTable. 

### <a id="Psalter_Pahlavi" href="#Psalter_Pahlavi">var Psalter_Pahlavi</a>

```
searchKey: unicode.Psalter_Pahlavi
```

```Go
var Psalter_Pahlavi // Psalter_Pahlavi is the set of Unicode characters in script Psalter_Pahlavi.
 = ...
```

These variables have type *RangeTable. 

### <a id="Rejang" href="#Rejang">var Rejang</a>

```
searchKey: unicode.Rejang
```

```Go
var Rejang = _Rejang // Rejang is the set of Unicode characters in script Rejang.

```

These variables have type *RangeTable. 

### <a id="Runic" href="#Runic">var Runic</a>

```
searchKey: unicode.Runic
```

```Go
var Runic = _Runic // Runic is the set of Unicode characters in script Runic.

```

These variables have type *RangeTable. 

### <a id="Samaritan" href="#Samaritan">var Samaritan</a>

```
searchKey: unicode.Samaritan
```

```Go
var Samaritan = _Samaritan // Samaritan is the set of Unicode characters in script Samaritan.

```

These variables have type *RangeTable. 

### <a id="Saurashtra" href="#Saurashtra">var Saurashtra</a>

```
searchKey: unicode.Saurashtra
```

```Go
var Saurashtra = _Saurashtra // Saurashtra is the set of Unicode characters in script Saurashtra.

```

These variables have type *RangeTable. 

### <a id="Sharada" href="#Sharada">var Sharada</a>

```
searchKey: unicode.Sharada
```

```Go
var Sharada = _Sharada // Sharada is the set of Unicode characters in script Sharada.

```

These variables have type *RangeTable. 

### <a id="Shavian" href="#Shavian">var Shavian</a>

```
searchKey: unicode.Shavian
```

```Go
var Shavian = _Shavian // Shavian is the set of Unicode characters in script Shavian.

```

These variables have type *RangeTable. 

### <a id="Siddham" href="#Siddham">var Siddham</a>

```
searchKey: unicode.Siddham
```

```Go
var Siddham = _Siddham // Siddham is the set of Unicode characters in script Siddham.

```

These variables have type *RangeTable. 

### <a id="SignWriting" href="#SignWriting">var SignWriting</a>

```
searchKey: unicode.SignWriting
```

```Go
var SignWriting // SignWriting is the set of Unicode characters in script SignWriting.
 = ...
```

These variables have type *RangeTable. 

### <a id="Sinhala" href="#Sinhala">var Sinhala</a>

```
searchKey: unicode.Sinhala
```

```Go
var Sinhala = _Sinhala // Sinhala is the set of Unicode characters in script Sinhala.

```

These variables have type *RangeTable. 

### <a id="Sogdian" href="#Sogdian">var Sogdian</a>

```
searchKey: unicode.Sogdian
```

```Go
var Sogdian = _Sogdian // Sogdian is the set of Unicode characters in script Sogdian.

```

These variables have type *RangeTable. 

### <a id="Sora_Sompeng" href="#Sora_Sompeng">var Sora_Sompeng</a>

```
searchKey: unicode.Sora_Sompeng
```

```Go
var Sora_Sompeng // Sora_Sompeng is the set of Unicode characters in script Sora_Sompeng.
 = ...
```

These variables have type *RangeTable. 

### <a id="Soyombo" href="#Soyombo">var Soyombo</a>

```
searchKey: unicode.Soyombo
```

```Go
var Soyombo = _Soyombo // Soyombo is the set of Unicode characters in script Soyombo.

```

These variables have type *RangeTable. 

### <a id="Sundanese" href="#Sundanese">var Sundanese</a>

```
searchKey: unicode.Sundanese
```

```Go
var Sundanese = _Sundanese // Sundanese is the set of Unicode characters in script Sundanese.

```

These variables have type *RangeTable. 

### <a id="Syloti_Nagri" href="#Syloti_Nagri">var Syloti_Nagri</a>

```
searchKey: unicode.Syloti_Nagri
```

```Go
var Syloti_Nagri // Syloti_Nagri is the set of Unicode characters in script Syloti_Nagri.
 = ...
```

These variables have type *RangeTable. 

### <a id="Syriac" href="#Syriac">var Syriac</a>

```
searchKey: unicode.Syriac
```

```Go
var Syriac = _Syriac // Syriac is the set of Unicode characters in script Syriac.

```

These variables have type *RangeTable. 

### <a id="Tagalog" href="#Tagalog">var Tagalog</a>

```
searchKey: unicode.Tagalog
```

```Go
var Tagalog = _Tagalog // Tagalog is the set of Unicode characters in script Tagalog.

```

These variables have type *RangeTable. 

### <a id="Tagbanwa" href="#Tagbanwa">var Tagbanwa</a>

```
searchKey: unicode.Tagbanwa
```

```Go
var Tagbanwa = _Tagbanwa // Tagbanwa is the set of Unicode characters in script Tagbanwa.

```

These variables have type *RangeTable. 

### <a id="Tai_Le" href="#Tai_Le">var Tai_Le</a>

```
searchKey: unicode.Tai_Le
```

```Go
var Tai_Le = _Tai_Le // Tai_Le is the set of Unicode characters in script Tai_Le.

```

These variables have type *RangeTable. 

### <a id="Tai_Tham" href="#Tai_Tham">var Tai_Tham</a>

```
searchKey: unicode.Tai_Tham
```

```Go
var Tai_Tham = _Tai_Tham // Tai_Tham is the set of Unicode characters in script Tai_Tham.

```

These variables have type *RangeTable. 

### <a id="Tai_Viet" href="#Tai_Viet">var Tai_Viet</a>

```
searchKey: unicode.Tai_Viet
```

```Go
var Tai_Viet = _Tai_Viet // Tai_Viet is the set of Unicode characters in script Tai_Viet.

```

These variables have type *RangeTable. 

### <a id="Takri" href="#Takri">var Takri</a>

```
searchKey: unicode.Takri
```

```Go
var Takri = _Takri // Takri is the set of Unicode characters in script Takri.

```

These variables have type *RangeTable. 

### <a id="Tamil" href="#Tamil">var Tamil</a>

```
searchKey: unicode.Tamil
```

```Go
var Tamil = _Tamil // Tamil is the set of Unicode characters in script Tamil.

```

These variables have type *RangeTable. 

### <a id="Tangut" href="#Tangut">var Tangut</a>

```
searchKey: unicode.Tangut
```

```Go
var Tangut = _Tangut // Tangut is the set of Unicode characters in script Tangut.

```

These variables have type *RangeTable. 

### <a id="Telugu" href="#Telugu">var Telugu</a>

```
searchKey: unicode.Telugu
```

```Go
var Telugu = _Telugu // Telugu is the set of Unicode characters in script Telugu.

```

These variables have type *RangeTable. 

### <a id="Thaana" href="#Thaana">var Thaana</a>

```
searchKey: unicode.Thaana
```

```Go
var Thaana = _Thaana // Thaana is the set of Unicode characters in script Thaana.

```

These variables have type *RangeTable. 

### <a id="Thai" href="#Thai">var Thai</a>

```
searchKey: unicode.Thai
```

```Go
var Thai = _Thai // Thai is the set of Unicode characters in script Thai.

```

These variables have type *RangeTable. 

### <a id="Tibetan" href="#Tibetan">var Tibetan</a>

```
searchKey: unicode.Tibetan
```

```Go
var Tibetan = _Tibetan // Tibetan is the set of Unicode characters in script Tibetan.

```

These variables have type *RangeTable. 

### <a id="Tifinagh" href="#Tifinagh">var Tifinagh</a>

```
searchKey: unicode.Tifinagh
```

```Go
var Tifinagh = _Tifinagh // Tifinagh is the set of Unicode characters in script Tifinagh.

```

These variables have type *RangeTable. 

### <a id="Tirhuta" href="#Tirhuta">var Tirhuta</a>

```
searchKey: unicode.Tirhuta
```

```Go
var Tirhuta = _Tirhuta // Tirhuta is the set of Unicode characters in script Tirhuta.

```

These variables have type *RangeTable. 

### <a id="Ugaritic" href="#Ugaritic">var Ugaritic</a>

```
searchKey: unicode.Ugaritic
```

```Go
var Ugaritic = _Ugaritic // Ugaritic is the set of Unicode characters in script Ugaritic.

```

These variables have type *RangeTable. 

### <a id="Vai" href="#Vai">var Vai</a>

```
searchKey: unicode.Vai
```

```Go
var Vai = _Vai // Vai is the set of Unicode characters in script Vai.

```

These variables have type *RangeTable. 

### <a id="Wancho" href="#Wancho">var Wancho</a>

```
searchKey: unicode.Wancho
```

```Go
var Wancho = _Wancho // Wancho is the set of Unicode characters in script Wancho.

```

These variables have type *RangeTable. 

### <a id="Warang_Citi" href="#Warang_Citi">var Warang_Citi</a>

```
searchKey: unicode.Warang_Citi
```

```Go
var Warang_Citi // Warang_Citi is the set of Unicode characters in script Warang_Citi.
 = ...
```

These variables have type *RangeTable. 

### <a id="Yezidi" href="#Yezidi">var Yezidi</a>

```
searchKey: unicode.Yezidi
```

```Go
var Yezidi = _Yezidi // Yezidi is the set of Unicode characters in script Yezidi.

```

These variables have type *RangeTable. 

### <a id="Yi" href="#Yi">var Yi</a>

```
searchKey: unicode.Yi
```

```Go
var Yi = _Yi // Yi is the set of Unicode characters in script Yi.

```

These variables have type *RangeTable. 

### <a id="Zanabazar_Square" href="#Zanabazar_Square">var Zanabazar_Square</a>

```
searchKey: unicode.Zanabazar_Square
```

```Go
var Zanabazar_Square // Zanabazar_Square is the set of Unicode characters in script Zanabazar_Square.
 = ...
```

These variables have type *RangeTable. 

### <a id="Properties" href="#Properties">var Properties</a>

```
searchKey: unicode.Properties
```

```Go
var Properties = ...
```

Properties is the set of Unicode property tables. 

### <a id="_ASCII_Hex_Digit" href="#_ASCII_Hex_Digit">var _ASCII_Hex_Digit</a>

```
searchKey: unicode._ASCII_Hex_Digit
tags: [private]
```

```Go
var _ASCII_Hex_Digit = ...
```

### <a id="_Bidi_Control" href="#_Bidi_Control">var _Bidi_Control</a>

```
searchKey: unicode._Bidi_Control
tags: [private]
```

```Go
var _Bidi_Control = ...
```

### <a id="_Dash" href="#_Dash">var _Dash</a>

```
searchKey: unicode._Dash
tags: [private]
```

```Go
var _Dash = ...
```

### <a id="_Deprecated" href="#_Deprecated">var _Deprecated</a>

```
searchKey: unicode._Deprecated
tags: [private]
```

```Go
var _Deprecated = ...
```

### <a id="_Diacritic" href="#_Diacritic">var _Diacritic</a>

```
searchKey: unicode._Diacritic
tags: [private]
```

```Go
var _Diacritic = ...
```

### <a id="_Extender" href="#_Extender">var _Extender</a>

```
searchKey: unicode._Extender
tags: [private]
```

```Go
var _Extender = ...
```

### <a id="_Hex_Digit" href="#_Hex_Digit">var _Hex_Digit</a>

```
searchKey: unicode._Hex_Digit
tags: [private]
```

```Go
var _Hex_Digit = ...
```

### <a id="_Hyphen" href="#_Hyphen">var _Hyphen</a>

```
searchKey: unicode._Hyphen
tags: [private]
```

```Go
var _Hyphen = ...
```

### <a id="_IDS_Binary_Operator" href="#_IDS_Binary_Operator">var _IDS_Binary_Operator</a>

```
searchKey: unicode._IDS_Binary_Operator
tags: [private]
```

```Go
var _IDS_Binary_Operator = ...
```

### <a id="_IDS_Trinary_Operator" href="#_IDS_Trinary_Operator">var _IDS_Trinary_Operator</a>

```
searchKey: unicode._IDS_Trinary_Operator
tags: [private]
```

```Go
var _IDS_Trinary_Operator = &RangeTable{
	R16: []Range16{
		{0x2ff2, 0x2ff3, 1},
	},
}
```

### <a id="_Ideographic" href="#_Ideographic">var _Ideographic</a>

```
searchKey: unicode._Ideographic
tags: [private]
```

```Go
var _Ideographic = ...
```

### <a id="_Join_Control" href="#_Join_Control">var _Join_Control</a>

```
searchKey: unicode._Join_Control
tags: [private]
```

```Go
var _Join_Control = &RangeTable{
	R16: []Range16{
		{0x200c, 0x200d, 1},
	},
}
```

### <a id="_Logical_Order_Exception" href="#_Logical_Order_Exception">var _Logical_Order_Exception</a>

```
searchKey: unicode._Logical_Order_Exception
tags: [private]
```

```Go
var _Logical_Order_Exception = ...
```

### <a id="_Noncharacter_Code_Point" href="#_Noncharacter_Code_Point">var _Noncharacter_Code_Point</a>

```
searchKey: unicode._Noncharacter_Code_Point
tags: [private]
```

```Go
var _Noncharacter_Code_Point = ...
```

### <a id="_Other_Alphabetic" href="#_Other_Alphabetic">var _Other_Alphabetic</a>

```
searchKey: unicode._Other_Alphabetic
tags: [private]
```

```Go
var _Other_Alphabetic = ...
```

### <a id="_Other_Default_Ignorable_Code_Point" href="#_Other_Default_Ignorable_Code_Point">var _Other_Default_Ignorable_Code_Point</a>

```
searchKey: unicode._Other_Default_Ignorable_Code_Point
tags: [private]
```

```Go
var _Other_Default_Ignorable_Code_Point = ...
```

### <a id="_Other_Grapheme_Extend" href="#_Other_Grapheme_Extend">var _Other_Grapheme_Extend</a>

```
searchKey: unicode._Other_Grapheme_Extend
tags: [private]
```

```Go
var _Other_Grapheme_Extend = ...
```

### <a id="_Other_ID_Continue" href="#_Other_ID_Continue">var _Other_ID_Continue</a>

```
searchKey: unicode._Other_ID_Continue
tags: [private]
```

```Go
var _Other_ID_Continue = ...
```

### <a id="_Other_ID_Start" href="#_Other_ID_Start">var _Other_ID_Start</a>

```
searchKey: unicode._Other_ID_Start
tags: [private]
```

```Go
var _Other_ID_Start = ...
```

### <a id="_Other_Lowercase" href="#_Other_Lowercase">var _Other_Lowercase</a>

```
searchKey: unicode._Other_Lowercase
tags: [private]
```

```Go
var _Other_Lowercase = ...
```

### <a id="_Other_Math" href="#_Other_Math">var _Other_Math</a>

```
searchKey: unicode._Other_Math
tags: [private]
```

```Go
var _Other_Math = ...
```

### <a id="_Other_Uppercase" href="#_Other_Uppercase">var _Other_Uppercase</a>

```
searchKey: unicode._Other_Uppercase
tags: [private]
```

```Go
var _Other_Uppercase = ...
```

### <a id="_Pattern_Syntax" href="#_Pattern_Syntax">var _Pattern_Syntax</a>

```
searchKey: unicode._Pattern_Syntax
tags: [private]
```

```Go
var _Pattern_Syntax = ...
```

### <a id="_Pattern_White_Space" href="#_Pattern_White_Space">var _Pattern_White_Space</a>

```
searchKey: unicode._Pattern_White_Space
tags: [private]
```

```Go
var _Pattern_White_Space = ...
```

### <a id="_Prepended_Concatenation_Mark" href="#_Prepended_Concatenation_Mark">var _Prepended_Concatenation_Mark</a>

```
searchKey: unicode._Prepended_Concatenation_Mark
tags: [private]
```

```Go
var _Prepended_Concatenation_Mark = ...
```

### <a id="_Quotation_Mark" href="#_Quotation_Mark">var _Quotation_Mark</a>

```
searchKey: unicode._Quotation_Mark
tags: [private]
```

```Go
var _Quotation_Mark = ...
```

### <a id="_Radical" href="#_Radical">var _Radical</a>

```
searchKey: unicode._Radical
tags: [private]
```

```Go
var _Radical = ...
```

### <a id="_Regional_Indicator" href="#_Regional_Indicator">var _Regional_Indicator</a>

```
searchKey: unicode._Regional_Indicator
tags: [private]
```

```Go
var _Regional_Indicator = ...
```

### <a id="_Sentence_Terminal" href="#_Sentence_Terminal">var _Sentence_Terminal</a>

```
searchKey: unicode._Sentence_Terminal
tags: [private]
```

```Go
var _Sentence_Terminal = ...
```

### <a id="_Soft_Dotted" href="#_Soft_Dotted">var _Soft_Dotted</a>

```
searchKey: unicode._Soft_Dotted
tags: [private]
```

```Go
var _Soft_Dotted = ...
```

### <a id="_Terminal_Punctuation" href="#_Terminal_Punctuation">var _Terminal_Punctuation</a>

```
searchKey: unicode._Terminal_Punctuation
tags: [private]
```

```Go
var _Terminal_Punctuation = ...
```

### <a id="_Unified_Ideograph" href="#_Unified_Ideograph">var _Unified_Ideograph</a>

```
searchKey: unicode._Unified_Ideograph
tags: [private]
```

```Go
var _Unified_Ideograph = ...
```

### <a id="_Variation_Selector" href="#_Variation_Selector">var _Variation_Selector</a>

```
searchKey: unicode._Variation_Selector
tags: [private]
```

```Go
var _Variation_Selector = ...
```

### <a id="_White_Space" href="#_White_Space">var _White_Space</a>

```
searchKey: unicode._White_Space
tags: [private]
```

```Go
var _White_Space = ...
```

### <a id="ASCII_Hex_Digit" href="#ASCII_Hex_Digit">var ASCII_Hex_Digit</a>

```
searchKey: unicode.ASCII_Hex_Digit
```

```Go
var ASCII_Hex_Digit // ASCII_Hex_Digit is the set of Unicode characters with property ASCII_Hex_Digit.
 = ...
```

These variables have type *RangeTable. 

### <a id="Bidi_Control" href="#Bidi_Control">var Bidi_Control</a>

```
searchKey: unicode.Bidi_Control
```

```Go
var Bidi_Control // Bidi_Control is the set of Unicode characters with property Bidi_Control.
 = ...
```

These variables have type *RangeTable. 

### <a id="Dash" href="#Dash">var Dash</a>

```
searchKey: unicode.Dash
```

```Go
var Dash = _Dash // Dash is the set of Unicode characters with property Dash.

```

These variables have type *RangeTable. 

### <a id="Deprecated" href="#Deprecated">var Deprecated</a>

```
searchKey: unicode.Deprecated
```

```Go
var Deprecated // Deprecated is the set of Unicode characters with property Deprecated.
 = ...
```

These variables have type *RangeTable. 

### <a id="Diacritic" href="#Diacritic">var Diacritic</a>

```
searchKey: unicode.Diacritic
```

```Go
var Diacritic = _Diacritic // Diacritic is the set of Unicode characters with property Diacritic.

```

These variables have type *RangeTable. 

### <a id="Extender" href="#Extender">var Extender</a>

```
searchKey: unicode.Extender
```

```Go
var Extender = _Extender // Extender is the set of Unicode characters with property Extender.

```

These variables have type *RangeTable. 

### <a id="Hex_Digit" href="#Hex_Digit">var Hex_Digit</a>

```
searchKey: unicode.Hex_Digit
```

```Go
var Hex_Digit = _Hex_Digit // Hex_Digit is the set of Unicode characters with property Hex_Digit.

```

These variables have type *RangeTable. 

### <a id="Hyphen" href="#Hyphen">var Hyphen</a>

```
searchKey: unicode.Hyphen
```

```Go
var Hyphen = _Hyphen // Hyphen is the set of Unicode characters with property Hyphen.

```

These variables have type *RangeTable. 

### <a id="IDS_Binary_Operator" href="#IDS_Binary_Operator">var IDS_Binary_Operator</a>

```
searchKey: unicode.IDS_Binary_Operator
```

```Go
var IDS_Binary_Operator // IDS_Binary_Operator is the set of Unicode characters with property IDS_Binary_Operator.
 = ...
```

These variables have type *RangeTable. 

### <a id="IDS_Trinary_Operator" href="#IDS_Trinary_Operator">var IDS_Trinary_Operator</a>

```
searchKey: unicode.IDS_Trinary_Operator
```

```Go
var IDS_Trinary_Operator // IDS_Trinary_Operator is the set of Unicode characters with property IDS_Trinary_Operator.
 = ...
```

These variables have type *RangeTable. 

### <a id="Ideographic" href="#Ideographic">var Ideographic</a>

```
searchKey: unicode.Ideographic
```

```Go
var Ideographic // Ideographic is the set of Unicode characters with property Ideographic.
 = ...
```

These variables have type *RangeTable. 

### <a id="Join_Control" href="#Join_Control">var Join_Control</a>

```
searchKey: unicode.Join_Control
```

```Go
var Join_Control // Join_Control is the set of Unicode characters with property Join_Control.
 = ...
```

These variables have type *RangeTable. 

### <a id="Logical_Order_Exception" href="#Logical_Order_Exception">var Logical_Order_Exception</a>

```
searchKey: unicode.Logical_Order_Exception
```

```Go
var Logical_Order_Exception // Logical_Order_Exception is the set of Unicode characters with property Logical_Order_Exception.
 = ...
```

These variables have type *RangeTable. 

### <a id="Noncharacter_Code_Point" href="#Noncharacter_Code_Point">var Noncharacter_Code_Point</a>

```
searchKey: unicode.Noncharacter_Code_Point
```

```Go
var Noncharacter_Code_Point // Noncharacter_Code_Point is the set of Unicode characters with property Noncharacter_Code_Point.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Alphabetic" href="#Other_Alphabetic">var Other_Alphabetic</a>

```
searchKey: unicode.Other_Alphabetic
```

```Go
var Other_Alphabetic // Other_Alphabetic is the set of Unicode characters with property Other_Alphabetic.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Default_Ignorable_Code_Point" href="#Other_Default_Ignorable_Code_Point">var Other_Default_Ignorable_Code_Point</a>

```
searchKey: unicode.Other_Default_Ignorable_Code_Point
```

```Go
var Other_Default_Ignorable_Code_Point // Other_Default_Ignorable_Code_Point is the set of Unicode characters with property Other_Default_Ignorable_Code_Point.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Grapheme_Extend" href="#Other_Grapheme_Extend">var Other_Grapheme_Extend</a>

```
searchKey: unicode.Other_Grapheme_Extend
```

```Go
var Other_Grapheme_Extend // Other_Grapheme_Extend is the set of Unicode characters with property Other_Grapheme_Extend.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_ID_Continue" href="#Other_ID_Continue">var Other_ID_Continue</a>

```
searchKey: unicode.Other_ID_Continue
```

```Go
var Other_ID_Continue // Other_ID_Continue is the set of Unicode characters with property Other_ID_Continue.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_ID_Start" href="#Other_ID_Start">var Other_ID_Start</a>

```
searchKey: unicode.Other_ID_Start
```

```Go
var Other_ID_Start // Other_ID_Start is the set of Unicode characters with property Other_ID_Start.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Lowercase" href="#Other_Lowercase">var Other_Lowercase</a>

```
searchKey: unicode.Other_Lowercase
```

```Go
var Other_Lowercase // Other_Lowercase is the set of Unicode characters with property Other_Lowercase.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Math" href="#Other_Math">var Other_Math</a>

```
searchKey: unicode.Other_Math
```

```Go
var Other_Math // Other_Math is the set of Unicode characters with property Other_Math.
 = ...
```

These variables have type *RangeTable. 

### <a id="Other_Uppercase" href="#Other_Uppercase">var Other_Uppercase</a>

```
searchKey: unicode.Other_Uppercase
```

```Go
var Other_Uppercase // Other_Uppercase is the set of Unicode characters with property Other_Uppercase.
 = ...
```

These variables have type *RangeTable. 

### <a id="Pattern_Syntax" href="#Pattern_Syntax">var Pattern_Syntax</a>

```
searchKey: unicode.Pattern_Syntax
```

```Go
var Pattern_Syntax // Pattern_Syntax is the set of Unicode characters with property Pattern_Syntax.
 = ...
```

These variables have type *RangeTable. 

### <a id="Pattern_White_Space" href="#Pattern_White_Space">var Pattern_White_Space</a>

```
searchKey: unicode.Pattern_White_Space
```

```Go
var Pattern_White_Space // Pattern_White_Space is the set of Unicode characters with property Pattern_White_Space.
 = ...
```

These variables have type *RangeTable. 

### <a id="Prepended_Concatenation_Mark" href="#Prepended_Concatenation_Mark">var Prepended_Concatenation_Mark</a>

```
searchKey: unicode.Prepended_Concatenation_Mark
```

```Go
var Prepended_Concatenation_Mark // Prepended_Concatenation_Mark is the set of Unicode characters with property Prepended_Concatenation_Mark.
 = ...
```

These variables have type *RangeTable. 

### <a id="Quotation_Mark" href="#Quotation_Mark">var Quotation_Mark</a>

```
searchKey: unicode.Quotation_Mark
```

```Go
var Quotation_Mark // Quotation_Mark is the set of Unicode characters with property Quotation_Mark.
 = ...
```

These variables have type *RangeTable. 

### <a id="Radical" href="#Radical">var Radical</a>

```
searchKey: unicode.Radical
```

```Go
var Radical = _Radical // Radical is the set of Unicode characters with property Radical.

```

These variables have type *RangeTable. 

### <a id="Regional_Indicator" href="#Regional_Indicator">var Regional_Indicator</a>

```
searchKey: unicode.Regional_Indicator
```

```Go
var Regional_Indicator // Regional_Indicator is the set of Unicode characters with property Regional_Indicator.
 = ...
```

These variables have type *RangeTable. 

### <a id="STerm" href="#STerm">var STerm</a>

```
searchKey: unicode.STerm
```

```Go
var STerm = _Sentence_Terminal // STerm is an alias for Sentence_Terminal.

```

These variables have type *RangeTable. 

### <a id="Sentence_Terminal" href="#Sentence_Terminal">var Sentence_Terminal</a>

```
searchKey: unicode.Sentence_Terminal
```

```Go
var Sentence_Terminal // Sentence_Terminal is the set of Unicode characters with property Sentence_Terminal.
 = ...
```

These variables have type *RangeTable. 

### <a id="Soft_Dotted" href="#Soft_Dotted">var Soft_Dotted</a>

```
searchKey: unicode.Soft_Dotted
```

```Go
var Soft_Dotted // Soft_Dotted is the set of Unicode characters with property Soft_Dotted.
 = ...
```

These variables have type *RangeTable. 

### <a id="Terminal_Punctuation" href="#Terminal_Punctuation">var Terminal_Punctuation</a>

```
searchKey: unicode.Terminal_Punctuation
```

```Go
var Terminal_Punctuation // Terminal_Punctuation is the set of Unicode characters with property Terminal_Punctuation.
 = ...
```

These variables have type *RangeTable. 

### <a id="Unified_Ideograph" href="#Unified_Ideograph">var Unified_Ideograph</a>

```
searchKey: unicode.Unified_Ideograph
```

```Go
var Unified_Ideograph // Unified_Ideograph is the set of Unicode characters with property Unified_Ideograph.
 = ...
```

These variables have type *RangeTable. 

### <a id="Variation_Selector" href="#Variation_Selector">var Variation_Selector</a>

```
searchKey: unicode.Variation_Selector
```

```Go
var Variation_Selector // Variation_Selector is the set of Unicode characters with property Variation_Selector.
 = ...
```

These variables have type *RangeTable. 

### <a id="White_Space" href="#White_Space">var White_Space</a>

```
searchKey: unicode.White_Space
```

```Go
var White_Space // White_Space is the set of Unicode characters with property White_Space.
 = ...
```

These variables have type *RangeTable. 

### <a id="CaseRanges" href="#CaseRanges">var CaseRanges</a>

```
searchKey: unicode.CaseRanges
```

```Go
var CaseRanges = _CaseRanges
```

CaseRanges is the table describing case mappings for all letters with non-self mappings. 

### <a id="_CaseRanges" href="#_CaseRanges">var _CaseRanges</a>

```
searchKey: unicode._CaseRanges
tags: [private]
```

```Go
var _CaseRanges = ...
```

### <a id="properties" href="#properties">var properties</a>

```
searchKey: unicode.properties
tags: [private]
```

```Go
var properties = ...
```

### <a id="asciiFold" href="#asciiFold">var asciiFold</a>

```
searchKey: unicode.asciiFold
tags: [private]
```

```Go
var asciiFold = ...
```

### <a id="caseOrbit" href="#caseOrbit">var caseOrbit</a>

```
searchKey: unicode.caseOrbit
tags: [private]
```

```Go
var caseOrbit = ...
```

### <a id="FoldCategory" href="#FoldCategory">var FoldCategory</a>

```
searchKey: unicode.FoldCategory
```

```Go
var FoldCategory = ...
```

FoldCategory maps a category name to a table of code points outside the category that are equivalent under simple case folding to code points inside the category. If there is no entry for a category name, there are no such points. 

### <a id="foldL" href="#foldL">var foldL</a>

```
searchKey: unicode.foldL
tags: [private]
```

```Go
var foldL = &RangeTable{
	R16: []Range16{
		{0x0345, 0x0345, 1},
	},
}
```

### <a id="foldLl" href="#foldLl">var foldLl</a>

```
searchKey: unicode.foldLl
tags: [private]
```

```Go
var foldLl = ...
```

### <a id="foldLt" href="#foldLt">var foldLt</a>

```
searchKey: unicode.foldLt
tags: [private]
```

```Go
var foldLt = ...
```

### <a id="foldLu" href="#foldLu">var foldLu</a>

```
searchKey: unicode.foldLu
tags: [private]
```

```Go
var foldLu = ...
```

### <a id="foldM" href="#foldM">var foldM</a>

```
searchKey: unicode.foldM
tags: [private]
```

```Go
var foldM = &RangeTable{
	R16: []Range16{
		{0x0399, 0x03b9, 32},
		{0x1fbe, 0x1fbe, 1},
	},
}
```

### <a id="foldMn" href="#foldMn">var foldMn</a>

```
searchKey: unicode.foldMn
tags: [private]
```

```Go
var foldMn = &RangeTable{
	R16: []Range16{
		{0x0399, 0x03b9, 32},
		{0x1fbe, 0x1fbe, 1},
	},
}
```

### <a id="FoldScript" href="#FoldScript">var FoldScript</a>

```
searchKey: unicode.FoldScript
```

```Go
var FoldScript = ...
```

FoldScript maps a script name to a table of code points outside the script that are equivalent under simple case folding to code points inside the script. If there is no entry for a script name, there are no such points. 

### <a id="foldCommon" href="#foldCommon">var foldCommon</a>

```
searchKey: unicode.foldCommon
tags: [private]
```

```Go
var foldCommon = &RangeTable{
	R16: []Range16{
		{0x039c, 0x03bc, 32},
	},
}
```

### <a id="foldGreek" href="#foldGreek">var foldGreek</a>

```
searchKey: unicode.foldGreek
tags: [private]
```

```Go
var foldGreek = &RangeTable{
	R16: []Range16{
		{0x00b5, 0x0345, 656},
	},
}
```

### <a id="foldInherited" href="#foldInherited">var foldInherited</a>

```
searchKey: unicode.foldInherited
tags: [private]
```

```Go
var foldInherited = ...
```

## <a id="type" href="#type">Types</a>

### <a id="RangeTable" href="#RangeTable">type RangeTable struct</a>

```
searchKey: unicode.RangeTable
```

```Go
type RangeTable struct {
	R16         []Range16
	R32         []Range32
	LatinOffset int // number of entries in R16 with Hi <= MaxLatin1
}
```

RangeTable defines a set of Unicode code points by listing the ranges of code points within the set. The ranges are listed in two slices to save space: a slice of 16-bit ranges and a slice of 32-bit ranges. The two slices must be in sorted order and non-overlapping. Also, R32 should contain only values >= 0x10000 (1<<16). 

### <a id="Range16" href="#Range16">type Range16 struct</a>

```
searchKey: unicode.Range16
```

```Go
type Range16 struct {
	Lo     uint16
	Hi     uint16
	Stride uint16
}
```

Range16 represents of a range of 16-bit Unicode code points. The range runs from Lo to Hi inclusive and has the specified stride. 

### <a id="Range32" href="#Range32">type Range32 struct</a>

```
searchKey: unicode.Range32
```

```Go
type Range32 struct {
	Lo     uint32
	Hi     uint32
	Stride uint32
}
```

Range32 represents of a range of Unicode code points and is used when one or more of the values will not fit in 16 bits. The range runs from Lo to Hi inclusive and has the specified stride. Lo and Hi must always be >= 1<<16. 

### <a id="CaseRange" href="#CaseRange">type CaseRange struct</a>

```
searchKey: unicode.CaseRange
```

```Go
type CaseRange struct {
	Lo    uint32
	Hi    uint32
	Delta d
}
```

CaseRange represents a range of Unicode code points for simple (one code point to one code point) case conversion. The range runs from Lo to Hi inclusive, with a fixed stride of 1. Deltas are the number to add to the code point to reach the code point for a different case for that character. They may be negative. If zero, it means the character is in the corresponding case. There is a special case representing sequences of alternating corresponding Upper and Lower pairs. It appears with a fixed Delta of 

```
{UpperLower, UpperLower, UpperLower}

```
The constant UpperLower has an otherwise impossible delta value. 

### <a id="SpecialCase" href="#SpecialCase">type SpecialCase []unicode.CaseRange</a>

```
searchKey: unicode.SpecialCase
```

```Go
type SpecialCase []CaseRange
```

SpecialCase represents language-specific case mappings such as Turkish. Methods of SpecialCase customize (by overriding) the standard mappings. 

#### <a id="SpecialCase.ToUpper" href="#SpecialCase.ToUpper">func (special SpecialCase) ToUpper(r rune) rune</a>

```
searchKey: unicode.SpecialCase.ToUpper
```

```Go
func (special SpecialCase) ToUpper(r rune) rune
```

ToUpper maps the rune to upper case giving priority to the special mapping. 

#### <a id="SpecialCase.ToTitle" href="#SpecialCase.ToTitle">func (special SpecialCase) ToTitle(r rune) rune</a>

```
searchKey: unicode.SpecialCase.ToTitle
```

```Go
func (special SpecialCase) ToTitle(r rune) rune
```

ToTitle maps the rune to title case giving priority to the special mapping. 

#### <a id="SpecialCase.ToLower" href="#SpecialCase.ToLower">func (special SpecialCase) ToLower(r rune) rune</a>

```
searchKey: unicode.SpecialCase.ToLower
```

```Go
func (special SpecialCase) ToLower(r rune) rune
```

ToLower maps the rune to lower case giving priority to the special mapping. 

### <a id="d" href="#d">type d [3]rune</a>

```
searchKey: unicode.d
tags: [private]
```

```Go
type d [MaxCase]rune // to make the CaseRanges text shorter

```

### <a id="foldPair" href="#foldPair">type foldPair struct</a>

```
searchKey: unicode.foldPair
tags: [private]
```

```Go
type foldPair struct {
	From uint16
	To   uint16
}
```

caseOrbit is defined in tables.go as []foldPair. Right now all the entries fit in uint16, so use uint16. If that changes, compilation will fail (the constants in the composite literal will not fit in uint16) and the types here can change to uint32. 

## <a id="func" href="#func">Functions</a>

### <a id="IsDigit" href="#IsDigit">func IsDigit(r rune) bool</a>

```
searchKey: unicode.IsDigit
```

```Go
func IsDigit(r rune) bool
```

IsDigit reports whether the rune is a decimal digit. 

### <a id="IsGraphic" href="#IsGraphic">func IsGraphic(r rune) bool</a>

```
searchKey: unicode.IsGraphic
```

```Go
func IsGraphic(r rune) bool
```

IsGraphic reports whether the rune is defined as a Graphic by Unicode. Such characters include letters, marks, numbers, punctuation, symbols, and spaces, from categories L, M, N, P, S, Zs. 

### <a id="IsPrint" href="#IsPrint">func IsPrint(r rune) bool</a>

```
searchKey: unicode.IsPrint
```

```Go
func IsPrint(r rune) bool
```

IsPrint reports whether the rune is defined as printable by Go. Such characters include letters, marks, numbers, punctuation, symbols, and the ASCII space character, from categories L, M, N, P, S and the ASCII space character. This categorization is the same as IsGraphic except that the only spacing character is ASCII space, U+0020. 

### <a id="IsOneOf" href="#IsOneOf">func IsOneOf(ranges []*RangeTable, r rune) bool</a>

```
searchKey: unicode.IsOneOf
```

```Go
func IsOneOf(ranges []*RangeTable, r rune) bool
```

IsOneOf reports whether the rune is a member of one of the ranges. The function "In" provides a nicer signature and should be used in preference to IsOneOf. 

### <a id="In" href="#In">func In(r rune, ranges ...*RangeTable) bool</a>

```
searchKey: unicode.In
```

```Go
func In(r rune, ranges ...*RangeTable) bool
```

In reports whether the rune is a member of one of the ranges. 

### <a id="IsControl" href="#IsControl">func IsControl(r rune) bool</a>

```
searchKey: unicode.IsControl
```

```Go
func IsControl(r rune) bool
```

IsControl reports whether the rune is a control character. The C (Other) Unicode category includes more code points such as surrogates; use Is(C, r) to test for them. 

### <a id="IsLetter" href="#IsLetter">func IsLetter(r rune) bool</a>

```
searchKey: unicode.IsLetter
```

```Go
func IsLetter(r rune) bool
```

IsLetter reports whether the rune is a letter (category L). 

### <a id="IsMark" href="#IsMark">func IsMark(r rune) bool</a>

```
searchKey: unicode.IsMark
```

```Go
func IsMark(r rune) bool
```

IsMark reports whether the rune is a mark character (category M). 

### <a id="IsNumber" href="#IsNumber">func IsNumber(r rune) bool</a>

```
searchKey: unicode.IsNumber
```

```Go
func IsNumber(r rune) bool
```

IsNumber reports whether the rune is a number (category N). 

### <a id="IsPunct" href="#IsPunct">func IsPunct(r rune) bool</a>

```
searchKey: unicode.IsPunct
```

```Go
func IsPunct(r rune) bool
```

IsPunct reports whether the rune is a Unicode punctuation character (category P). 

### <a id="IsSpace" href="#IsSpace">func IsSpace(r rune) bool</a>

```
searchKey: unicode.IsSpace
```

```Go
func IsSpace(r rune) bool
```

IsSpace reports whether the rune is a space character as defined by Unicode's White Space property; in the Latin-1 space this is 

```
'\t', '\n', '\v', '\f', '\r', ' ', U+0085 (NEL), U+00A0 (NBSP).

```
Other definitions of spacing characters are set by category Z and property Pattern_White_Space. 

### <a id="IsSymbol" href="#IsSymbol">func IsSymbol(r rune) bool</a>

```
searchKey: unicode.IsSymbol
```

```Go
func IsSymbol(r rune) bool
```

IsSymbol reports whether the rune is a symbolic character. 

### <a id="is16" href="#is16">func is16(ranges []Range16, r uint16) bool</a>

```
searchKey: unicode.is16
tags: [private]
```

```Go
func is16(ranges []Range16, r uint16) bool
```

is16 reports whether r is in the sorted slice of 16-bit ranges. 

### <a id="is32" href="#is32">func is32(ranges []Range32, r uint32) bool</a>

```
searchKey: unicode.is32
tags: [private]
```

```Go
func is32(ranges []Range32, r uint32) bool
```

is32 reports whether r is in the sorted slice of 32-bit ranges. 

### <a id="Is" href="#Is">func Is(rangeTab *RangeTable, r rune) bool</a>

```
searchKey: unicode.Is
```

```Go
func Is(rangeTab *RangeTable, r rune) bool
```

Is reports whether the rune is in the specified table of ranges. 

### <a id="isExcludingLatin" href="#isExcludingLatin">func isExcludingLatin(rangeTab *RangeTable, r rune) bool</a>

```
searchKey: unicode.isExcludingLatin
tags: [private]
```

```Go
func isExcludingLatin(rangeTab *RangeTable, r rune) bool
```

### <a id="IsUpper" href="#IsUpper">func IsUpper(r rune) bool</a>

```
searchKey: unicode.IsUpper
```

```Go
func IsUpper(r rune) bool
```

IsUpper reports whether the rune is an upper case letter. 

### <a id="IsLower" href="#IsLower">func IsLower(r rune) bool</a>

```
searchKey: unicode.IsLower
```

```Go
func IsLower(r rune) bool
```

IsLower reports whether the rune is a lower case letter. 

### <a id="IsTitle" href="#IsTitle">func IsTitle(r rune) bool</a>

```
searchKey: unicode.IsTitle
```

```Go
func IsTitle(r rune) bool
```

IsTitle reports whether the rune is a title case letter. 

### <a id="to" href="#to">func to(_case int, r rune, caseRange []CaseRange) (mappedRune rune, foundMapping bool)</a>

```
searchKey: unicode.to
tags: [private]
```

```Go
func to(_case int, r rune, caseRange []CaseRange) (mappedRune rune, foundMapping bool)
```

to maps the rune using the specified case mapping. It additionally reports whether caseRange contained a mapping for r. 

### <a id="To" href="#To">func To(_case int, r rune) rune</a>

```
searchKey: unicode.To
```

```Go
func To(_case int, r rune) rune
```

To maps the rune to the specified case: UpperCase, LowerCase, or TitleCase. 

### <a id="ToUpper" href="#ToUpper">func ToUpper(r rune) rune</a>

```
searchKey: unicode.ToUpper
```

```Go
func ToUpper(r rune) rune
```

ToUpper maps the rune to upper case. 

### <a id="ToLower" href="#ToLower">func ToLower(r rune) rune</a>

```
searchKey: unicode.ToLower
```

```Go
func ToLower(r rune) rune
```

ToLower maps the rune to lower case. 

### <a id="ToTitle" href="#ToTitle">func ToTitle(r rune) rune</a>

```
searchKey: unicode.ToTitle
```

```Go
func ToTitle(r rune) rune
```

ToTitle maps the rune to title case. 

### <a id="SimpleFold" href="#SimpleFold">func SimpleFold(r rune) rune</a>

```
searchKey: unicode.SimpleFold
```

```Go
func SimpleFold(r rune) rune
```

SimpleFold iterates over Unicode code points equivalent under the Unicode-defined simple case folding. Among the code points equivalent to rune (including rune itself), SimpleFold returns the smallest rune > r if one exists, or else the smallest rune >= 0. If r is not a valid Unicode code point, SimpleFold(r) returns r. 

For example: 

```
SimpleFold('A') = 'a'
SimpleFold('a') = 'A'

SimpleFold('K') = 'k'
SimpleFold('k') = '\u212A' (Kelvin symbol, K)
SimpleFold('\u212A') = 'K'

SimpleFold('1') = '1'

SimpleFold(-2) = -2

```
