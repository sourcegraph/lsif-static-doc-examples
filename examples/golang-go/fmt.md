# Package fmt

Package fmt implements formatted I/O with functions analogous to C's printf and scanf.  The format 'verbs' are derived from C's but are simpler. 

### hdr-PrintingPrinting
The verbs: 

General: 

```
%v	the value in a default format
	when printing structs, the plus flag (%+v) adds field names
%#v	a Go-syntax representation of the value
%T	a Go-syntax representation of the type of the value
%%	a literal percent sign; consumes no value

```
Boolean: 

```
%t	the word true or false

```
Integer: 

```
%b	base 2
%c	the character represented by the corresponding Unicode code point
%d	base 10
%o	base 8
%O	base 8 with 0o prefix
%q	a single-quoted character literal safely escaped with Go syntax.
%x	base 16, with lower-case letters for a-f
%X	base 16, with upper-case letters for A-F
%U	Unicode format: U+1234; same as "U+%04X"

```
Floating-point and complex constituents: 

```
%b	decimalless scientific notation with exponent a power of two,
	in the manner of strconv.FormatFloat with the 'b' format,
	e.g. -123456p-78
%e	scientific notation, e.g. -1.234456e+78
%E	scientific notation, e.g. -1.234456E+78
%f	decimal point but no exponent, e.g. 123.456
%F	synonym for %f
%g	%e for large exponents, %f otherwise. Precision is discussed below.
%G	%E for large exponents, %F otherwise
%x	hexadecimal notation (with decimal power of two exponent), e.g. -0x1.23abcp+20
%X	upper-case hexadecimal notation, e.g. -0X1.23ABCP+20

```
String and slice of bytes (treated equivalently with these verbs): 

```
%s	the uninterpreted bytes of the string or slice
%q	a double-quoted string safely escaped with Go syntax
%x	base 16, lower-case, two characters per byte
%X	base 16, upper-case, two characters per byte

```
Slice: 

```
%p	address of 0th element in base 16 notation, with leading 0x

```
Pointer: 

```
%p	base 16 notation, with leading 0x
The %b, %d, %o, %x and %X verbs also work with pointers,
formatting the value exactly as if it were an integer.

```
The default format for %v is: 

```
bool:                    %t
int, int8 etc.:          %d
uint, uint8 etc.:        %d, %#x if printed with %#v
float32, complex64, etc: %g
string:                  %s
chan:                    %p
pointer:                 %p

```
For compound objects, the elements are printed using these rules, recursively, laid out like this: 

```
struct:             {field0 field1 ...}
array, slice:       [elem0 elem1 ...]
maps:               map[key1:value1 key2:value2 ...]
pointer to above:   &{}, &[], &map[]

```
Width is specified by an optional decimal number immediately preceding the verb. If absent, the width is whatever is necessary to represent the value. Precision is specified after the (optional) width by a period followed by a decimal number. If no period is present, a default precision is used. A period with no following number specifies a precision of zero. Examples: 

```
%f     default width, default precision
%9f    width 9, default precision
%.2f   default width, precision 2
%9.2f  width 9, precision 2
%9.f   width 9, precision 0

```
Width and precision are measured in units of Unicode code points, that is, runes. (This differs from C's printf where the units are always measured in bytes.) Either or both of the flags may be replaced with the character '*', causing their values to be obtained from the next operand (preceding the one to format), which must be of type int. 

For most values, width is the minimum number of runes to output, padding the formatted form with spaces if necessary. 

For strings, byte slices and byte arrays, however, precision limits the length of the input to be formatted (not the size of the output), truncating if necessary. Normally it is measured in runes, but for these types when formatted with the %x or %X format it is measured in bytes. 

For floating-point values, width sets the minimum width of the field and precision sets the number of places after the decimal, if appropriate, except that for %g/%G precision sets the maximum number of significant digits (trailing zeros are removed). For example, given 12.345 the format %6.3f prints 12.345 while %.3g prints 12.3. The default precision for %e, %f and %#g is 6; for %g it is the smallest number of digits necessary to identify the value uniquely. 

For complex numbers, the width and precision apply to the two components independently and the result is parenthesized, so %f applied to 1.2+3.4i produces (1.200000+3.400000i). 

Other flags: 

```
+	always print a sign for numeric values;
	guarantee ASCII-only output for %q (%+q)
-	pad with spaces on the right rather than the left (left-justify the field)
#	alternate format: add leading 0b for binary (%#b), 0 for octal (%#o),
	0x or 0X for hex (%#x or %#X); suppress 0x for %p (%#p);
	for %q, print a raw (backquoted) string if strconv.CanBackquote
	returns true;
	always print a decimal point for %e, %E, %f, %F, %g and %G;
	do not remove trailing zeros for %g and %G;
	write e.g. U+0078 'x' if the character is printable for %U (%#U).
' '	(space) leave a space for elided sign in numbers (% d);
	put spaces between bytes printing strings or slices in hex (% x, % X)
0	pad with leading zeros rather than spaces;
	for numbers, this moves the padding after the sign

```
Flags are ignored by verbs that do not expect them. For example there is no alternate decimal format, so %#d and %d behave identically. 

For each Printf-like function, there is also a Print function that takes no format and is equivalent to saying %v for every operand.  Another variant Println inserts blanks between operands and appends a newline. 

Regardless of the verb, if an operand is an interface value, the internal concrete value is used, not the interface itself. Thus: 

```
var i interface{} = 23
fmt.Printf("%v\n", i)

```
will print 23. 

Except when printed using the verbs %T and %p, special formatting considerations apply for operands that implement certain interfaces. In order of application: 

1. If the operand is a reflect.Value, the operand is replaced by the concrete value that it holds, and printing continues with the next rule. 

2. If an operand implements the Formatter interface, it will be invoked. In this case the interpretation of verbs and flags is controlled by that implementation. 

3. If the %v verb is used with the # flag (%#v) and the operand implements the GoStringer interface, that will be invoked. 

If the format (which is implicitly %v for Println etc.) is valid for a string (%s %q %v %x %X), the following two rules apply: 

4. If an operand implements the error interface, the Error method will be invoked to convert the object to a string, which will then be formatted as required by the verb (if any). 

5. If an operand implements method String() string, that method will be invoked to convert the object to a string, which will then be formatted as required by the verb (if any). 

For compound operands such as slices and structs, the format applies to the elements of each operand, recursively, not to the operand as a whole. Thus %q will quote each element of a slice of strings, and %6.2f will control formatting for each element of a floating-point array. 

However, when printing a byte slice with a string-like verb (%s %q %x %X), it is treated identically to a string, as a single item. 

To avoid recursion in cases such as 

```
type X string
func (x X) String() string { return Sprintf("<%s>", x) }

```
convert the value before recurring: 

```
func (x X) String() string { return Sprintf("<%s>", string(x)) }

```
Infinite recursion can also be triggered by self-referential data structures, such as a slice that contains itself as an element, if that type has a String method. Such pathologies are rare, however, and the package does not protect against them. 

When printing a struct, fmt cannot and therefore does not invoke formatting methods such as Error or String on unexported fields. 

### hdr-Explicit_argument_indexesExplicit argument indexes
In Printf, Sprintf, and Fprintf, the default behavior is for each formatting verb to format successive arguments passed in the call. However, the notation [n] immediately before the verb indicates that the nth one-indexed argument is to be formatted instead. The same notation before a '*' for a width or precision selects the argument index holding the value. After processing a bracketed expression [n], subsequent verbs will use arguments n+1, n+2, etc. unless otherwise directed. 

For example, 

```
fmt.Sprintf("%[2]d %[1]d\n", 11, 22)

```
will yield "22 11", while 

```
fmt.Sprintf("%[3]*.[2]*[1]f", 12.0, 2, 6)

```
equivalent to 

```
fmt.Sprintf("%6.2f", 12.0)

```
will yield " 12.00". Because an explicit index affects subsequent verbs, this notation can be used to print the same values multiple times by resetting the index for the first argument to be repeated: 

```
fmt.Sprintf("%d %d %#[1]x %#x", 16, 17)

```
will yield "16 17 0x10 0x11". 

### hdr-Format_errorsFormat errors
If an invalid argument is given for a verb, such as providing a string to %d, the generated string will contain a description of the problem, as in these examples: 

```
Wrong type or unknown verb: %!verb(type=value)
	Printf("%d", "hi"):        %!d(string=hi)
Too many arguments: %!(EXTRA type=value)
	Printf("hi", "guys"):      hi%!(EXTRA string=guys)
Too few arguments: %!verb(MISSING)
	Printf("hi%d"):            hi%!d(MISSING)
Non-int for width or precision: %!(BADWIDTH) or %!(BADPREC)
	Printf("%*s", 4.5, "hi"):  %!(BADWIDTH)hi
	Printf("%.*s", 4.5, "hi"): %!(BADPREC)hi
Invalid or invalid use of argument index: %!(BADINDEX)
	Printf("%*[2]d", 7):       %!d(BADINDEX)
	Printf("%.[2]d", 7):       %!d(BADINDEX)

```
All errors begin with the string "%!" followed sometimes by a single character (the verb) and end with a parenthesized description. 

If an Error or String method triggers a panic when called by a print routine, the fmt package reformats the error message from the panic, decorating it with an indication that it came through the fmt package.  For example, if a String method calls panic("bad"), the resulting formatted message will look like 

```
%!s(PANIC=bad)

```
The %!s just shows the print verb in use when the failure occurred. If the panic is caused by a nil receiver to an Error or String method, however, the output is the undecorated string, "<nil>". 

### hdr-ScanningScanning
An analogous set of functions scans formatted text to yield values.  Scan, Scanf and Scanln read from os.Stdin; Fscan, Fscanf and Fscanln read from a specified io.Reader; Sscan, Sscanf and Sscanln read from an argument string. 

Scan, Fscan, Sscan treat newlines in the input as spaces. 

Scanln, Fscanln and Sscanln stop scanning at a newline and require that the items be followed by a newline or EOF. 

Scanf, Fscanf, and Sscanf parse the arguments according to a format string, analogous to that of Printf. In the text that follows, 'space' means any Unicode whitespace character except newline. 

In the format string, a verb introduced by the % character consumes and parses input; these verbs are described in more detail below. A character other than %, space, or newline in the format consumes exactly that input character, which must be present. A newline with zero or more spaces before it in the format string consumes zero or more spaces in the input followed by a single newline or the end of the input. A space following a newline in the format string consumes zero or more spaces in the input. Otherwise, any run of one or more spaces in the format string consumes as many spaces as possible in the input. Unless the run of spaces in the format string appears adjacent to a newline, the run must consume at least one space from the input or find the end of the input. 

The handling of spaces and newlines differs from that of C's scanf family: in C, newlines are treated as any other space, and it is never an error when a run of spaces in the format string finds no spaces to consume in the input. 

The verbs behave analogously to those of Printf. For example, %x will scan an integer as a hexadecimal number, and %v will scan the default representation format for the value. The Printf verbs %p and %T and the flags # and + are not implemented. For floating-point and complex values, all valid formatting verbs (%b %e %E %f %F %g %G %x %X and %v) are equivalent and accept both decimal and hexadecimal notation (for example: "2.3e+7", "0x4.5p-8") and digit-separating underscores (for example: "3.14159_26535_89793"). 

Input processed by verbs is implicitly space-delimited: the implementation of every verb except %c starts by discarding leading spaces from the remaining input, and the %s verb (and %v reading into a string) stops consuming input at the first space or newline character. 

The familiar base-setting prefixes 0b (binary), 0o and 0 (octal), and 0x (hexadecimal) are accepted when scanning integers without a format or with the %v verb, as are digit-separating underscores. 

Width is interpreted in the input text but there is no syntax for scanning with a precision (no %5.2f, just %5f). If width is provided, it applies after leading spaces are trimmed and specifies the maximum number of runes to read to satisfy the verb. For example, 

```
Sscanf(" 1234567 ", "%5s%d", &s, &i)

```
will set s to "12345" and i to 67 while 

```
Sscanf(" 12 34 567 ", "%5s%d", &s, &i)

```
will set s to "12" and i to 34. 

In all the scanning functions, a carriage return followed immediately by a newline is treated as a plain newline (\r\n means the same as \n). 

In all the scanning functions, if an operand implements method Scan (that is, it implements the Scanner interface) that method will be used to scan the text for that operand.  Also, if the number of arguments scanned is less than the number of arguments provided, an error is returned. 

All arguments to be scanned must be either pointers to basic types or implementations of the Scanner interface. 

Like Scanf and Fscanf, Sscanf need not consume its entire input. There is no way to recover how much of the input string Sscanf used. 

Note: Fscan etc. can read one character (rune) past the input they return, which means that a loop calling a scan routine may skip some of the input.  This is usually a problem only when there is no space between input values.  If the reader provided to Fscan implements ReadRune, that method will be used to read characters.  If the reader also implements UnreadRune, that method will be used to save the character and successive calls will not lose data.  To attach ReadRune and UnreadRune methods to a reader without that capability, use bufio.NewReader. 

## Index

* [Constants](#const)
    * [const badIndexString](#badIndexString)
    * [const badPrecString](#badPrecString)
    * [const badWidthString](#badWidthString)
    * [const binaryDigits](#binaryDigits)
    * [const commaSpaceString](#commaSpaceString)
    * [const decimalDigits](#decimalDigits)
    * [const eof](#eof)
    * [const exponent](#exponent)
    * [const extraString](#extraString)
    * [const floatVerbs](#floatVerbs)
    * [const hexadecimalDigits](#hexadecimalDigits)
    * [const hugeWid](#hugeWid)
    * [const intBits](#intBits)
    * [const invReflectString](#invReflectString)
    * [const ldigits](#ldigits)
    * [const mapString](#mapString)
    * [const missingString](#missingString)
    * [const nilAngleString](#nilAngleString)
    * [const nilParenString](#nilParenString)
    * [const nilString](#nilString)
    * [const noVerbString](#noVerbString)
    * [const octalDigits](#octalDigits)
    * [const panicString](#panicString)
    * [const percentBangString](#percentBangString)
    * [const period](#period)
    * [const sign](#sign)
    * [const signed](#signed)
    * [const udigits](#udigits)
    * [const uintptrBits](#uintptrBits)
    * [const unsigned](#unsigned)
* [Variables](#var)
    * [var IsSpace](#IsSpace)
    * [var Parsenum](#Parsenum)
    * [var boolError](#boolError)
    * [var complexError](#complexError)
    * [var ppFree](#ppFree)
    * [var space](#space)
    * [var ssFree](#ssFree)
* [Types](#type)
    * [type Formatter interface](#Formatter)
    * [type GoStringer interface](#GoStringer)
    * [type ScanState interface](#ScanState)
    * [type Scanner interface](#Scanner)
    * [type State interface](#State)
    * [type Stringer interface](#Stringer)
    * [type buffer []byte](#buffer)
        * [func (b *buffer) write(p []byte)](#buffer.write)
        * [func (b *buffer) writeByte(c byte)](#buffer.writeByte)
        * [func (bp *buffer) writeRune(r rune)](#buffer.writeRune)
        * [func (b *buffer) writeString(s string)](#buffer.writeString)
    * [type fmt struct](#fmt)
        * [func (f *fmt) clearflags()](#fmt.clearflags)
        * [func (f *fmt) fmtBoolean(v bool)](#fmt.fmtBoolean)
        * [func (f *fmt) fmtBs(b []byte)](#fmt.fmtBs)
        * [func (f *fmt) fmtBx(b []byte, digits string)](#fmt.fmtBx)
        * [func (f *fmt) fmtC(c uint64)](#fmt.fmtC)
        * [func (f *fmt) fmtFloat(v float64, size int, verb rune, prec int)](#fmt.fmtFloat)
        * [func (f *fmt) fmtInteger(u uint64, base int, isSigned bool, verb rune, digits string)](#fmt.fmtInteger)
        * [func (f *fmt) fmtQ(s string)](#fmt.fmtQ)
        * [func (f *fmt) fmtQc(c uint64)](#fmt.fmtQc)
        * [func (f *fmt) fmtS(s string)](#fmt.fmtS)
        * [func (f *fmt) fmtSbx(s string, b []byte, digits string)](#fmt.fmtSbx)
        * [func (f *fmt) fmtSx(s, digits string)](#fmt.fmtSx)
        * [func (f *fmt) fmtUnicode(u uint64)](#fmt.fmtUnicode)
        * [func (f *fmt) init(buf *buffer)](#fmt.init.format.go)
        * [func (f *fmt) pad(b []byte)](#fmt.pad)
        * [func (f *fmt) padString(s string)](#fmt.padString)
        * [func (f *fmt) truncate(b []byte) []byte](#fmt.truncate)
        * [func (f *fmt) truncateString(s string) string](#fmt.truncateString)
        * [func (f *fmt) writePadding(n int)](#fmt.writePadding)
    * [type fmtFlags struct](#fmtFlags)
    * [type pp struct](#pp)
        * [func newPrinter() *pp](#newPrinter)
        * [func (p *pp) Flag(b int) bool](#pp.Flag)
        * [func (p *pp) Precision() (prec int, ok bool)](#pp.Precision)
        * [func (p *pp) Width() (wid int, ok bool)](#pp.Width)
        * [func (p *pp) Write(b []byte) (ret int, err error)](#pp.Write)
        * [func (p *pp) WriteString(s string) (ret int, err error)](#pp.WriteString)
        * [func (p *pp) argNumber(argNum int, format string, i int, numArgs int) (newArgNum, newi int, found bool)](#pp.argNumber)
        * [func (p *pp) badArgNum(verb rune)](#pp.badArgNum)
        * [func (p *pp) badVerb(verb rune)](#pp.badVerb)
        * [func (p *pp) catchPanic(arg interface{}, verb rune, method string)](#pp.catchPanic)
        * [func (p *pp) doPrint(a []interface{})](#pp.doPrint)
        * [func (p *pp) doPrintf(format string, a []interface{})](#pp.doPrintf)
        * [func (p *pp) doPrintln(a []interface{})](#pp.doPrintln)
        * [func (p *pp) fmt0x64(v uint64, leading0x bool)](#pp.fmt0x64)
        * [func (p *pp) fmtBool(v bool, verb rune)](#pp.fmtBool)
        * [func (p *pp) fmtBytes(v []byte, verb rune, typeString string)](#pp.fmtBytes)
        * [func (p *pp) fmtComplex(v complex128, size int, verb rune)](#pp.fmtComplex)
        * [func (p *pp) fmtFloat(v float64, size int, verb rune)](#pp.fmtFloat)
        * [func (p *pp) fmtInteger(v uint64, isSigned bool, verb rune)](#pp.fmtInteger)
        * [func (p *pp) fmtPointer(value reflect.Value, verb rune)](#pp.fmtPointer)
        * [func (p *pp) fmtString(v string, verb rune)](#pp.fmtString)
        * [func (p *pp) free()](#pp.free)
        * [func (p *pp) handleMethods(verb rune) (handled bool)](#pp.handleMethods)
        * [func (p *pp) missingArg(verb rune)](#pp.missingArg)
        * [func (p *pp) printArg(arg interface{}, verb rune)](#pp.printArg)
        * [func (p *pp) printValue(value reflect.Value, verb rune, depth int)](#pp.printValue)
        * [func (p *pp) unknownType(v reflect.Value)](#pp.unknownType)
    * [type readRune struct](#readRune)
        * [func (r *readRune) ReadRune() (rr rune, size int, err error)](#readRune.ReadRune)
        * [func (r *readRune) UnreadRune() error](#readRune.UnreadRune)
        * [func (r *readRune) readByte() (b byte, err error)](#readRune.readByte)
    * [type scanError struct](#scanError)
    * [type ss struct](#ss)
        * [func newScanState(r io.Reader, nlIsSpace, nlIsEnd bool) (s *ss, old ssave)](#newScanState)
        * [func (s *ss) Read(buf []byte) (n int, err error)](#ss.Read)
        * [func (s *ss) ReadRune() (r rune, size int, err error)](#ss.ReadRune)
        * [func (s *ss) SkipSpace()](#ss.SkipSpace)
        * [func (s *ss) Token(skipSpace bool, f func(rune) bool) (tok []byte, err error)](#ss.Token)
        * [func (s *ss) UnreadRune() error](#ss.UnreadRune)
        * [func (s *ss) Width() (wid int, ok bool)](#ss.Width)
        * [func (s *ss) accept(ok string) bool](#ss.accept)
        * [func (s *ss) advance(format string) (i int)](#ss.advance)
        * [func (s *ss) complexTokens() (real, imag string)](#ss.complexTokens)
        * [func (s *ss) consume(ok string, accept bool) bool](#ss.consume)
        * [func (s *ss) convertFloat(str string, n int) float64](#ss.convertFloat)
        * [func (s *ss) convertString(verb rune) (str string)](#ss.convertString)
        * [func (s *ss) doScan(a []interface{}) (numProcessed int, err error)](#ss.doScan)
        * [func (s *ss) doScanf(format string, a []interface{}) (numProcessed int, err error)](#ss.doScanf)
        * [func (s *ss) error(err error)](#ss.error)
        * [func (s *ss) errorString(err string)](#ss.errorString)
        * [func (s *ss) floatToken() string](#ss.floatToken)
        * [func (s *ss) free(old ssave)](#ss.free)
        * [func (s *ss) getBase(verb rune) (base int, digits string)](#ss.getBase)
        * [func (s *ss) getRune() (r rune)](#ss.getRune)
        * [func (s *ss) hexByte() (b byte, ok bool)](#ss.hexByte)
        * [func (s *ss) hexString() string](#ss.hexString)
        * [func (s *ss) mustReadRune() (r rune)](#ss.mustReadRune)
        * [func (s *ss) notEOF()](#ss.notEOF)
        * [func (s *ss) okVerb(verb rune, okVerbs, typ string) bool](#ss.okVerb)
        * [func (s *ss) peek(ok string) bool](#ss.peek)
        * [func (s *ss) quotedString() string](#ss.quotedString)
        * [func (s *ss) scanBasePrefix() (base int, digits string, zeroFound bool)](#ss.scanBasePrefix)
        * [func (s *ss) scanBool(verb rune) bool](#ss.scanBool)
        * [func (s *ss) scanComplex(verb rune, n int) complex128](#ss.scanComplex)
        * [func (s *ss) scanInt(verb rune, bitSize int) int64](#ss.scanInt)
        * [func (s *ss) scanNumber(digits string, haveDigits bool) string](#ss.scanNumber)
        * [func (s *ss) scanOne(verb rune, arg interface{})](#ss.scanOne)
        * [func (s *ss) scanPercent()](#ss.scanPercent)
        * [func (s *ss) scanRune(bitSize int) int64](#ss.scanRune)
        * [func (s *ss) scanUint(verb rune, bitSize int) uint64](#ss.scanUint)
        * [func (s *ss) token(skipSpace bool, f func(rune) bool) []byte](#ss.token)
    * [type ssave struct](#ssave)
    * [type stringReader string](#stringReader)
        * [func (r *stringReader) Read(b []byte) (n int, err error)](#stringReader.Read)
    * [type wrapError struct](#wrapError)
        * [func (e *wrapError) Error() string](#wrapError.Error)
        * [func (e *wrapError) Unwrap() error](#wrapError.Unwrap)
* [Functions](#func)
    * [func Errorf(format string, a ...interface{}) error](#Errorf)
    * [func Fprint(w io.Writer, a ...interface{}) (n int, err error)](#Fprint)
    * [func Fprintf(w io.Writer, format string, a ...interface{}) (n int, err error)](#Fprintf)
    * [func Fprintln(w io.Writer, a ...interface{}) (n int, err error)](#Fprintln)
    * [func Fscan(r io.Reader, a ...interface{}) (n int, err error)](#Fscan)
    * [func Fscanf(r io.Reader, format string, a ...interface{}) (n int, err error)](#Fscanf)
    * [func Fscanln(r io.Reader, a ...interface{}) (n int, err error)](#Fscanln)
    * [func Print(a ...interface{}) (n int, err error)](#Print)
    * [func Printf(format string, a ...interface{}) (n int, err error)](#Printf)
    * [func Println(a ...interface{}) (n int, err error)](#Println)
    * [func Scan(a ...interface{}) (n int, err error)](#Scan)
    * [func Scanf(format string, a ...interface{}) (n int, err error)](#Scanf)
    * [func Scanln(a ...interface{}) (n int, err error)](#Scanln)
    * [func Sprint(a ...interface{}) string](#Sprint)
    * [func Sprintf(format string, a ...interface{}) string](#Sprintf)
    * [func Sprintln(a ...interface{}) string](#Sprintln)
    * [func Sscan(str string, a ...interface{}) (n int, err error)](#Sscan)
    * [func Sscanf(str string, format string, a ...interface{}) (n int, err error)](#Sscanf)
    * [func Sscanln(str string, a ...interface{}) (n int, err error)](#Sscanln)
    * [func errorHandler(errp *error)](#errorHandler)
    * [func getField(v reflect.Value, i int) reflect.Value](#getField)
    * [func hasX(s string) bool](#hasX)
    * [func hexDigit(d rune) (int, bool)](#hexDigit)
    * [func indexRune(s string, r rune) int](#indexRune)
    * [func intFromArg(a []interface{}, argNum int) (num int, isInt bool, newArgNum int)](#intFromArg)
    * [func isSpace(r rune) bool](#isSpace)
    * [func notSpace(r rune) bool](#notSpace)
    * [func parseArgNumber(format string) (index int, wid int, ok bool)](#parseArgNumber)
    * [func parsenum(s string, start, end int) (num int, isnum bool, newi int)](#parsenum)
    * [func tooLarge(x int) bool](#tooLarge)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="badIndexString" href="#badIndexString">const badIndexString</a>

```
searchKey: fmt.badIndexString
tags: [constant string private]
```

```Go
const badIndexString = "(BADINDEX)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="badPrecString" href="#badPrecString">const badPrecString</a>

```
searchKey: fmt.badPrecString
tags: [constant string private]
```

```Go
const badPrecString = "%!(BADPREC)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="badWidthString" href="#badWidthString">const badWidthString</a>

```
searchKey: fmt.badWidthString
tags: [constant string private]
```

```Go
const badWidthString = "%!(BADWIDTH)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="binaryDigits" href="#binaryDigits">const binaryDigits</a>

```
searchKey: fmt.binaryDigits
tags: [constant string private]
```

```Go
const binaryDigits = "01"
```

Numerical elements 

### <a id="commaSpaceString" href="#commaSpaceString">const commaSpaceString</a>

```
searchKey: fmt.commaSpaceString
tags: [constant string private]
```

```Go
const commaSpaceString = ", "
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="decimalDigits" href="#decimalDigits">const decimalDigits</a>

```
searchKey: fmt.decimalDigits
tags: [constant string private]
```

```Go
const decimalDigits = "0123456789"
```

Numerical elements 

### <a id="eof" href="#eof">const eof</a>

```
searchKey: fmt.eof
tags: [constant number private]
```

```Go
const eof = -1
```

### <a id="exponent" href="#exponent">const exponent</a>

```
searchKey: fmt.exponent
tags: [constant string private]
```

```Go
const exponent = "eEpP"
```

Numerical elements 

### <a id="extraString" href="#extraString">const extraString</a>

```
searchKey: fmt.extraString
tags: [constant string private]
```

```Go
const extraString = "%!(EXTRA "
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="floatVerbs" href="#floatVerbs">const floatVerbs</a>

```
searchKey: fmt.floatVerbs
tags: [constant string private]
```

```Go
const floatVerbs = "beEfFgGv"
```

### <a id="hexadecimalDigits" href="#hexadecimalDigits">const hexadecimalDigits</a>

```
searchKey: fmt.hexadecimalDigits
tags: [constant string private]
```

```Go
const hexadecimalDigits = "0123456789aAbBcCdDeEfF"
```

Numerical elements 

### <a id="hugeWid" href="#hugeWid">const hugeWid</a>

```
searchKey: fmt.hugeWid
tags: [constant number private]
```

```Go
const hugeWid = 1 << 30
```

### <a id="intBits" href="#intBits">const intBits</a>

```
searchKey: fmt.intBits
tags: [constant number private]
```

```Go
const intBits = 32 << (^uint(0) >> 63)
```

### <a id="invReflectString" href="#invReflectString">const invReflectString</a>

```
searchKey: fmt.invReflectString
tags: [constant string private]
```

```Go
const invReflectString = "<invalid reflect.Value>"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="ldigits" href="#ldigits">const ldigits</a>

```
searchKey: fmt.ldigits
tags: [constant string private]
```

```Go
const ldigits = "0123456789abcdefx"
```

### <a id="mapString" href="#mapString">const mapString</a>

```
searchKey: fmt.mapString
tags: [constant string private]
```

```Go
const mapString = "map["
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="missingString" href="#missingString">const missingString</a>

```
searchKey: fmt.missingString
tags: [constant string private]
```

```Go
const missingString = "(MISSING)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="nilAngleString" href="#nilAngleString">const nilAngleString</a>

```
searchKey: fmt.nilAngleString
tags: [constant string private]
```

```Go
const nilAngleString = "<nil>"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="nilParenString" href="#nilParenString">const nilParenString</a>

```
searchKey: fmt.nilParenString
tags: [constant string private]
```

```Go
const nilParenString = "(nil)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="nilString" href="#nilString">const nilString</a>

```
searchKey: fmt.nilString
tags: [constant string private]
```

```Go
const nilString = "nil"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="noVerbString" href="#noVerbString">const noVerbString</a>

```
searchKey: fmt.noVerbString
tags: [constant string private]
```

```Go
const noVerbString = "%!(NOVERB)"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="octalDigits" href="#octalDigits">const octalDigits</a>

```
searchKey: fmt.octalDigits
tags: [constant string private]
```

```Go
const octalDigits = "01234567"
```

Numerical elements 

### <a id="panicString" href="#panicString">const panicString</a>

```
searchKey: fmt.panicString
tags: [constant string private]
```

```Go
const panicString = "(PANIC="
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="percentBangString" href="#percentBangString">const percentBangString</a>

```
searchKey: fmt.percentBangString
tags: [constant string private]
```

```Go
const percentBangString = "%!"
```

Strings for use with buffer.WriteString. This is less overhead than using buffer.Write with byte arrays. 

### <a id="period" href="#period">const period</a>

```
searchKey: fmt.period
tags: [constant string private]
```

```Go
const period = "."
```

Numerical elements 

### <a id="sign" href="#sign">const sign</a>

```
searchKey: fmt.sign
tags: [constant string private]
```

```Go
const sign = "+-"
```

Numerical elements 

### <a id="signed" href="#signed">const signed</a>

```
searchKey: fmt.signed
tags: [constant boolean private]
```

```Go
const signed = true
```

### <a id="udigits" href="#udigits">const udigits</a>

```
searchKey: fmt.udigits
tags: [constant string private]
```

```Go
const udigits = "0123456789ABCDEFX"
```

### <a id="uintptrBits" href="#uintptrBits">const uintptrBits</a>

```
searchKey: fmt.uintptrBits
tags: [constant number private]
```

```Go
const uintptrBits = 32 << (^uintptr(0) >> 63)
```

### <a id="unsigned" href="#unsigned">const unsigned</a>

```
searchKey: fmt.unsigned
tags: [constant boolean private]
```

```Go
const unsigned = false
```

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="IsSpace" href="#IsSpace">var IsSpace</a>

```
searchKey: fmt.IsSpace
tags: [variable function private]
```

```Go
var IsSpace = isSpace
```

### <a id="Parsenum" href="#Parsenum">var Parsenum</a>

```
searchKey: fmt.Parsenum
tags: [variable function private]
```

```Go
var Parsenum = parsenum
```

### <a id="boolError" href="#boolError">var boolError</a>

```
searchKey: fmt.boolError
tags: [variable interface private]
```

```Go
var boolError = errors.New("syntax error scanning boolean")
```

### <a id="complexError" href="#complexError">var complexError</a>

```
searchKey: fmt.complexError
tags: [variable interface private]
```

```Go
var complexError = errors.New("syntax error scanning complex number")
```

### <a id="ppFree" href="#ppFree">var ppFree</a>

```
searchKey: fmt.ppFree
tags: [variable struct private]
```

```Go
var ppFree = sync.Pool{
	New: func() interface{} { return new(pp) },
}
```

### <a id="space" href="#space">var space</a>

```
searchKey: fmt.space
tags: [variable array array number private]
```

```Go
var space = ...
```

space is a copy of the unicode.White_Space ranges, to avoid depending on package unicode. 

### <a id="ssFree" href="#ssFree">var ssFree</a>

```
searchKey: fmt.ssFree
tags: [variable struct private]
```

```Go
var ssFree = sync.Pool{
	New: func() interface{} { return new(ss) },
}
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="Formatter" href="#Formatter">type Formatter interface</a>

```
searchKey: fmt.Formatter
tags: [interface]
```

```Go
type Formatter interface {
	Format(f State, verb rune)
}
```

Formatter is implemented by any value that has a Format method. The implementation controls how State and rune are interpreted, and may call Sprint(f) or Fprint(f) etc. to generate its output. 

### <a id="GoStringer" href="#GoStringer">type GoStringer interface</a>

```
searchKey: fmt.GoStringer
tags: [interface]
```

```Go
type GoStringer interface {
	GoString() string
}
```

GoStringer is implemented by any value that has a GoString method, which defines the Go syntax for that value. The GoString method is used to print values passed as an operand to a %#v format. 

### <a id="ScanState" href="#ScanState">type ScanState interface</a>

```
searchKey: fmt.ScanState
tags: [interface]
```

```Go
type ScanState interface {
	// ReadRune reads the next rune (Unicode code point) from the input.
	// If invoked during Scanln, Fscanln, or Sscanln, ReadRune() will
	// return EOF after returning the first '\n' or when reading beyond
	// the specified width.
	ReadRune() (r rune, size int, err error)
	// UnreadRune causes the next call to ReadRune to return the same rune.
	UnreadRune() error
	// SkipSpace skips space in the input. Newlines are treated appropriately
	// for the operation being performed; see the package documentation
	// for more information.
	SkipSpace()
	// Token skips space in the input if skipSpace is true, then returns the
	// run of Unicode code points c satisfying f(c).  If f is nil,
	// !unicode.IsSpace(c) is used; that is, the token will hold non-space
	// characters. Newlines are treated appropriately for the operation being
	// performed; see the package documentation for more information.
	// The returned slice points to shared data that may be overwritten
	// by the next call to Token, a call to a Scan function using the ScanState
	// as input, or when the calling Scan method returns.
	Token(skipSpace bool, f func(rune) bool) (token []byte, err error)
	// Width returns the value of the width option and whether it has been set.
	// The unit is Unicode code points.
	Width() (wid int, ok bool)
	// Because ReadRune is implemented by the interface, Read should never be
	// called by the scanning routines and a valid implementation of
	// ScanState may choose always to return an error from Read.
	Read(buf []byte) (n int, err error)
}
```

ScanState represents the scanner state passed to custom scanners. Scanners may do rune-at-a-time scanning or ask the ScanState to discover the next space-delimited token. 

### <a id="Scanner" href="#Scanner">type Scanner interface</a>

```
searchKey: fmt.Scanner
tags: [interface]
```

```Go
type Scanner interface {
	Scan(state ScanState, verb rune) error
}
```

Scanner is implemented by any value that has a Scan method, which scans the input for the representation of a value and stores the result in the receiver, which must be a pointer to be useful. The Scan method is called for any argument to Scan, Scanf, or Scanln that implements it. 

### <a id="State" href="#State">type State interface</a>

```
searchKey: fmt.State
tags: [interface]
```

```Go
type State interface {
	// Write is the function to call to emit formatted output to be printed.
	Write(b []byte) (n int, err error)
	// Width returns the value of the width option and whether it has been set.
	Width() (wid int, ok bool)
	// Precision returns the value of the precision option and whether it has been set.
	Precision() (prec int, ok bool)

	// Flag reports whether the flag c, a character, has been set.
	Flag(c int) bool
}
```

State represents the printer state passed to custom formatters. It provides access to the io.Writer interface plus information about the flags and options for the operand's format specifier. 

### <a id="Stringer" href="#Stringer">type Stringer interface</a>

```
searchKey: fmt.Stringer
tags: [interface]
```

```Go
type Stringer interface {
	String() string
}
```

Stringer is implemented by any value that has a String method, which defines the `native' format for that value. The String method is used to print values passed as an operand to any format that accepts a string or to an unformatted printer such as Print. 

### <a id="buffer" href="#buffer">type buffer []byte</a>

```
searchKey: fmt.buffer
tags: [array number private]
```

```Go
type buffer []byte
```

Use simple []byte instead of bytes.Buffer to avoid large dependency. 

#### <a id="buffer.write" href="#buffer.write">func (b *buffer) write(p []byte)</a>

```
searchKey: fmt.buffer.write
tags: [method private]
```

```Go
func (b *buffer) write(p []byte)
```

#### <a id="buffer.writeByte" href="#buffer.writeByte">func (b *buffer) writeByte(c byte)</a>

```
searchKey: fmt.buffer.writeByte
tags: [method private]
```

```Go
func (b *buffer) writeByte(c byte)
```

#### <a id="buffer.writeRune" href="#buffer.writeRune">func (bp *buffer) writeRune(r rune)</a>

```
searchKey: fmt.buffer.writeRune
tags: [method private]
```

```Go
func (bp *buffer) writeRune(r rune)
```

#### <a id="buffer.writeString" href="#buffer.writeString">func (b *buffer) writeString(s string)</a>

```
searchKey: fmt.buffer.writeString
tags: [method private]
```

```Go
func (b *buffer) writeString(s string)
```

### <a id="fmt" href="#fmt">type fmt struct</a>

```
searchKey: fmt.fmt
tags: [struct private]
```

```Go
type fmt struct {
	buf *buffer

	fmtFlags

	wid  int // width
	prec int // precision

	// intbuf is large enough to store %b of an int64 with a sign and
	// avoids padding at the end of the struct on 32 bit architectures.
	intbuf [68]byte
}
```

A fmt is the raw formatter used by Printf etc. It prints into a buffer that must be set up separately. 

#### <a id="fmt.clearflags" href="#fmt.clearflags">func (f *fmt) clearflags()</a>

```
searchKey: fmt.fmt.clearflags
tags: [function private]
```

```Go
func (f *fmt) clearflags()
```

#### <a id="fmt.fmtBoolean" href="#fmt.fmtBoolean">func (f *fmt) fmtBoolean(v bool)</a>

```
searchKey: fmt.fmt.fmtBoolean
tags: [method private]
```

```Go
func (f *fmt) fmtBoolean(v bool)
```

fmtBoolean formats a boolean. 

#### <a id="fmt.fmtBs" href="#fmt.fmtBs">func (f *fmt) fmtBs(b []byte)</a>

```
searchKey: fmt.fmt.fmtBs
tags: [method private]
```

```Go
func (f *fmt) fmtBs(b []byte)
```

fmtBs formats the byte slice b as if it was formatted as string with fmtS. 

#### <a id="fmt.fmtBx" href="#fmt.fmtBx">func (f *fmt) fmtBx(b []byte, digits string)</a>

```
searchKey: fmt.fmt.fmtBx
tags: [method private]
```

```Go
func (f *fmt) fmtBx(b []byte, digits string)
```

fmtBx formats a byte slice as a hexadecimal encoding of its bytes. 

#### <a id="fmt.fmtC" href="#fmt.fmtC">func (f *fmt) fmtC(c uint64)</a>

```
searchKey: fmt.fmt.fmtC
tags: [method private]
```

```Go
func (f *fmt) fmtC(c uint64)
```

fmtC formats an integer as a Unicode character. If the character is not valid Unicode, it will print '\ufffd'. 

#### <a id="fmt.fmtFloat" href="#fmt.fmtFloat">func (f *fmt) fmtFloat(v float64, size int, verb rune, prec int)</a>

```
searchKey: fmt.fmt.fmtFloat
tags: [method private]
```

```Go
func (f *fmt) fmtFloat(v float64, size int, verb rune, prec int)
```

fmtFloat formats a float64. It assumes that verb is a valid format specifier for strconv.AppendFloat and therefore fits into a byte. 

#### <a id="fmt.fmtInteger" href="#fmt.fmtInteger">func (f *fmt) fmtInteger(u uint64, base int, isSigned bool, verb rune, digits string)</a>

```
searchKey: fmt.fmt.fmtInteger
tags: [method private]
```

```Go
func (f *fmt) fmtInteger(u uint64, base int, isSigned bool, verb rune, digits string)
```

fmtInteger formats signed and unsigned integers. 

#### <a id="fmt.fmtQ" href="#fmt.fmtQ">func (f *fmt) fmtQ(s string)</a>

```
searchKey: fmt.fmt.fmtQ
tags: [method private]
```

```Go
func (f *fmt) fmtQ(s string)
```

fmtQ formats a string as a double-quoted, escaped Go string constant. If f.sharp is set a raw (backquoted) string may be returned instead if the string does not contain any control characters other than tab. 

#### <a id="fmt.fmtQc" href="#fmt.fmtQc">func (f *fmt) fmtQc(c uint64)</a>

```
searchKey: fmt.fmt.fmtQc
tags: [method private]
```

```Go
func (f *fmt) fmtQc(c uint64)
```

fmtQc formats an integer as a single-quoted, escaped Go character constant. If the character is not valid Unicode, it will print '\ufffd'. 

#### <a id="fmt.fmtS" href="#fmt.fmtS">func (f *fmt) fmtS(s string)</a>

```
searchKey: fmt.fmt.fmtS
tags: [method private]
```

```Go
func (f *fmt) fmtS(s string)
```

fmtS formats a string. 

#### <a id="fmt.fmtSbx" href="#fmt.fmtSbx">func (f *fmt) fmtSbx(s string, b []byte, digits string)</a>

```
searchKey: fmt.fmt.fmtSbx
tags: [method private]
```

```Go
func (f *fmt) fmtSbx(s string, b []byte, digits string)
```

fmtSbx formats a string or byte slice as a hexadecimal encoding of its bytes. 

#### <a id="fmt.fmtSx" href="#fmt.fmtSx">func (f *fmt) fmtSx(s, digits string)</a>

```
searchKey: fmt.fmt.fmtSx
tags: [method private]
```

```Go
func (f *fmt) fmtSx(s, digits string)
```

fmtSx formats a string as a hexadecimal encoding of its bytes. 

#### <a id="fmt.fmtUnicode" href="#fmt.fmtUnicode">func (f *fmt) fmtUnicode(u uint64)</a>

```
searchKey: fmt.fmt.fmtUnicode
tags: [method private]
```

```Go
func (f *fmt) fmtUnicode(u uint64)
```

fmtUnicode formats a uint64 as "U+0078" or with f.sharp set as "U+0078 'x'". 

#### <a id="fmt.init.format.go" href="#fmt.init.format.go">func (f *fmt) init(buf *buffer)</a>

```
searchKey: fmt.fmt.init
tags: [method private]
```

```Go
func (f *fmt) init(buf *buffer)
```

#### <a id="fmt.pad" href="#fmt.pad">func (f *fmt) pad(b []byte)</a>

```
searchKey: fmt.fmt.pad
tags: [method private]
```

```Go
func (f *fmt) pad(b []byte)
```

pad appends b to f.buf, padded on left (!f.minus) or right (f.minus). 

#### <a id="fmt.padString" href="#fmt.padString">func (f *fmt) padString(s string)</a>

```
searchKey: fmt.fmt.padString
tags: [method private]
```

```Go
func (f *fmt) padString(s string)
```

padString appends s to f.buf, padded on left (!f.minus) or right (f.minus). 

#### <a id="fmt.truncate" href="#fmt.truncate">func (f *fmt) truncate(b []byte) []byte</a>

```
searchKey: fmt.fmt.truncate
tags: [method private]
```

```Go
func (f *fmt) truncate(b []byte) []byte
```

truncate truncates the byte slice b as a string of the specified precision, if present. 

#### <a id="fmt.truncateString" href="#fmt.truncateString">func (f *fmt) truncateString(s string) string</a>

```
searchKey: fmt.fmt.truncateString
tags: [method private]
```

```Go
func (f *fmt) truncateString(s string) string
```

truncateString truncates the string s to the specified precision, if present. 

#### <a id="fmt.writePadding" href="#fmt.writePadding">func (f *fmt) writePadding(n int)</a>

```
searchKey: fmt.fmt.writePadding
tags: [method private]
```

```Go
func (f *fmt) writePadding(n int)
```

writePadding generates n bytes of padding. 

### <a id="fmtFlags" href="#fmtFlags">type fmtFlags struct</a>

```
searchKey: fmt.fmtFlags
tags: [struct private]
```

```Go
type fmtFlags struct {
	widPresent  bool
	precPresent bool
	minus       bool
	plus        bool
	sharp       bool
	space       bool
	zero        bool

	// For the formats %+v %#v, we set the plusV/sharpV flags
	// and clear the plus/sharp flags since %+v and %#v are in effect
	// different, flagless formats set at the top level.
	plusV  bool
	sharpV bool
}
```

flags placed in a separate struct for easy clearing. 

### <a id="pp" href="#pp">type pp struct</a>

```
searchKey: fmt.pp
tags: [struct private]
```

```Go
type pp struct {
	buf buffer

	// arg holds the current item, as an interface{}.
	arg interface{}

	// value is used instead of arg for reflect values.
	value reflect.Value

	// fmt is used to format basic items such as integers or strings.
	fmt fmt

	// reordered records whether the format string used argument reordering.
	reordered bool
	// goodArgNum records whether the most recent reordering directive was valid.
	goodArgNum bool
	// panicking is set by catchPanic to avoid infinite panic, recover, panic, ... recursion.
	panicking bool
	// erroring is set when printing an error string to guard against calling handleMethods.
	erroring bool
	// wrapErrs is set when the format string may contain a %w verb.
	wrapErrs bool
	// wrappedErr records the target of the %w verb.
	wrappedErr error
}
```

pp is used to store a printer's state and is reused with sync.Pool to avoid allocations. 

#### <a id="newPrinter" href="#newPrinter">func newPrinter() *pp</a>

```
searchKey: fmt.newPrinter
tags: [function private]
```

```Go
func newPrinter() *pp
```

newPrinter allocates a new pp struct or grabs a cached one. 

#### <a id="pp.Flag" href="#pp.Flag">func (p *pp) Flag(b int) bool</a>

```
searchKey: fmt.pp.Flag
tags: [method private]
```

```Go
func (p *pp) Flag(b int) bool
```

#### <a id="pp.Precision" href="#pp.Precision">func (p *pp) Precision() (prec int, ok bool)</a>

```
searchKey: fmt.pp.Precision
tags: [function private]
```

```Go
func (p *pp) Precision() (prec int, ok bool)
```

#### <a id="pp.Width" href="#pp.Width">func (p *pp) Width() (wid int, ok bool)</a>

```
searchKey: fmt.pp.Width
tags: [function private]
```

```Go
func (p *pp) Width() (wid int, ok bool)
```

#### <a id="pp.Write" href="#pp.Write">func (p *pp) Write(b []byte) (ret int, err error)</a>

```
searchKey: fmt.pp.Write
tags: [method private]
```

```Go
func (p *pp) Write(b []byte) (ret int, err error)
```

Implement Write so we can call Fprintf on a pp (through State), for recursive use in custom verbs. 

#### <a id="pp.WriteString" href="#pp.WriteString">func (p *pp) WriteString(s string) (ret int, err error)</a>

```
searchKey: fmt.pp.WriteString
tags: [method private]
```

```Go
func (p *pp) WriteString(s string) (ret int, err error)
```

Implement WriteString so that we can call io.WriteString on a pp (through state), for efficiency. 

#### <a id="pp.argNumber" href="#pp.argNumber">func (p *pp) argNumber(argNum int, format string, i int, numArgs int) (newArgNum, newi int, found bool)</a>

```
searchKey: fmt.pp.argNumber
tags: [method private]
```

```Go
func (p *pp) argNumber(argNum int, format string, i int, numArgs int) (newArgNum, newi int, found bool)
```

argNumber returns the next argument to evaluate, which is either the value of the passed-in argNum or the value of the bracketed integer that begins format[i:]. It also returns the new value of i, that is, the index of the next byte of the format to process. 

#### <a id="pp.badArgNum" href="#pp.badArgNum">func (p *pp) badArgNum(verb rune)</a>

```
searchKey: fmt.pp.badArgNum
tags: [method private]
```

```Go
func (p *pp) badArgNum(verb rune)
```

#### <a id="pp.badVerb" href="#pp.badVerb">func (p *pp) badVerb(verb rune)</a>

```
searchKey: fmt.pp.badVerb
tags: [method private]
```

```Go
func (p *pp) badVerb(verb rune)
```

#### <a id="pp.catchPanic" href="#pp.catchPanic">func (p *pp) catchPanic(arg interface{}, verb rune, method string)</a>

```
searchKey: fmt.pp.catchPanic
tags: [method private]
```

```Go
func (p *pp) catchPanic(arg interface{}, verb rune, method string)
```

#### <a id="pp.doPrint" href="#pp.doPrint">func (p *pp) doPrint(a []interface{})</a>

```
searchKey: fmt.pp.doPrint
tags: [method private]
```

```Go
func (p *pp) doPrint(a []interface{})
```

#### <a id="pp.doPrintf" href="#pp.doPrintf">func (p *pp) doPrintf(format string, a []interface{})</a>

```
searchKey: fmt.pp.doPrintf
tags: [method private]
```

```Go
func (p *pp) doPrintf(format string, a []interface{})
```

#### <a id="pp.doPrintln" href="#pp.doPrintln">func (p *pp) doPrintln(a []interface{})</a>

```
searchKey: fmt.pp.doPrintln
tags: [method private]
```

```Go
func (p *pp) doPrintln(a []interface{})
```

doPrintln is like doPrint but always adds a space between arguments and a newline after the last argument. 

#### <a id="pp.fmt0x64" href="#pp.fmt0x64">func (p *pp) fmt0x64(v uint64, leading0x bool)</a>

```
searchKey: fmt.pp.fmt0x64
tags: [method private]
```

```Go
func (p *pp) fmt0x64(v uint64, leading0x bool)
```

fmt0x64 formats a uint64 in hexadecimal and prefixes it with 0x or not, as requested, by temporarily setting the sharp flag. 

#### <a id="pp.fmtBool" href="#pp.fmtBool">func (p *pp) fmtBool(v bool, verb rune)</a>

```
searchKey: fmt.pp.fmtBool
tags: [method private]
```

```Go
func (p *pp) fmtBool(v bool, verb rune)
```

#### <a id="pp.fmtBytes" href="#pp.fmtBytes">func (p *pp) fmtBytes(v []byte, verb rune, typeString string)</a>

```
searchKey: fmt.pp.fmtBytes
tags: [method private]
```

```Go
func (p *pp) fmtBytes(v []byte, verb rune, typeString string)
```

#### <a id="pp.fmtComplex" href="#pp.fmtComplex">func (p *pp) fmtComplex(v complex128, size int, verb rune)</a>

```
searchKey: fmt.pp.fmtComplex
tags: [method private]
```

```Go
func (p *pp) fmtComplex(v complex128, size int, verb rune)
```

fmtComplex formats a complex number v with r = real(v) and j = imag(v) as (r+ji) using fmtFloat for r and j formatting. 

#### <a id="pp.fmtFloat" href="#pp.fmtFloat">func (p *pp) fmtFloat(v float64, size int, verb rune)</a>

```
searchKey: fmt.pp.fmtFloat
tags: [method private]
```

```Go
func (p *pp) fmtFloat(v float64, size int, verb rune)
```

fmtFloat formats a float. The default precision for each verb is specified as last argument in the call to fmt_float. 

#### <a id="pp.fmtInteger" href="#pp.fmtInteger">func (p *pp) fmtInteger(v uint64, isSigned bool, verb rune)</a>

```
searchKey: fmt.pp.fmtInteger
tags: [method private]
```

```Go
func (p *pp) fmtInteger(v uint64, isSigned bool, verb rune)
```

fmtInteger formats a signed or unsigned integer. 

#### <a id="pp.fmtPointer" href="#pp.fmtPointer">func (p *pp) fmtPointer(value reflect.Value, verb rune)</a>

```
searchKey: fmt.pp.fmtPointer
tags: [method private]
```

```Go
func (p *pp) fmtPointer(value reflect.Value, verb rune)
```

#### <a id="pp.fmtString" href="#pp.fmtString">func (p *pp) fmtString(v string, verb rune)</a>

```
searchKey: fmt.pp.fmtString
tags: [method private]
```

```Go
func (p *pp) fmtString(v string, verb rune)
```

#### <a id="pp.free" href="#pp.free">func (p *pp) free()</a>

```
searchKey: fmt.pp.free
tags: [function private]
```

```Go
func (p *pp) free()
```

free saves used pp structs in ppFree; avoids an allocation per invocation. 

#### <a id="pp.handleMethods" href="#pp.handleMethods">func (p *pp) handleMethods(verb rune) (handled bool)</a>

```
searchKey: fmt.pp.handleMethods
tags: [method private]
```

```Go
func (p *pp) handleMethods(verb rune) (handled bool)
```

#### <a id="pp.missingArg" href="#pp.missingArg">func (p *pp) missingArg(verb rune)</a>

```
searchKey: fmt.pp.missingArg
tags: [method private]
```

```Go
func (p *pp) missingArg(verb rune)
```

#### <a id="pp.printArg" href="#pp.printArg">func (p *pp) printArg(arg interface{}, verb rune)</a>

```
searchKey: fmt.pp.printArg
tags: [method private]
```

```Go
func (p *pp) printArg(arg interface{}, verb rune)
```

#### <a id="pp.printValue" href="#pp.printValue">func (p *pp) printValue(value reflect.Value, verb rune, depth int)</a>

```
searchKey: fmt.pp.printValue
tags: [method private]
```

```Go
func (p *pp) printValue(value reflect.Value, verb rune, depth int)
```

printValue is similar to printArg but starts with a reflect value, not an interface{} value. It does not handle 'p' and 'T' verbs because these should have been already handled by printArg. 

#### <a id="pp.unknownType" href="#pp.unknownType">func (p *pp) unknownType(v reflect.Value)</a>

```
searchKey: fmt.pp.unknownType
tags: [method private]
```

```Go
func (p *pp) unknownType(v reflect.Value)
```

### <a id="readRune" href="#readRune">type readRune struct</a>

```
searchKey: fmt.readRune
tags: [struct private]
```

```Go
type readRune struct {
	reader   io.Reader
	buf      [utf8.UTFMax]byte // used only inside ReadRune
	pending  int               // number of bytes in pendBuf; only >0 for bad UTF-8
	pendBuf  [utf8.UTFMax]byte // bytes left over
	peekRune rune              // if >=0 next rune; when <0 is ^(previous Rune)
}
```

readRune is a structure to enable reading UTF-8 encoded code points from an io.Reader. It is used if the Reader given to the scanner does not already implement io.RuneScanner. 

#### <a id="readRune.ReadRune" href="#readRune.ReadRune">func (r *readRune) ReadRune() (rr rune, size int, err error)</a>

```
searchKey: fmt.readRune.ReadRune
tags: [function private]
```

```Go
func (r *readRune) ReadRune() (rr rune, size int, err error)
```

ReadRune returns the next UTF-8 encoded code point from the io.Reader inside r. 

#### <a id="readRune.UnreadRune" href="#readRune.UnreadRune">func (r *readRune) UnreadRune() error</a>

```
searchKey: fmt.readRune.UnreadRune
tags: [function private]
```

```Go
func (r *readRune) UnreadRune() error
```

#### <a id="readRune.readByte" href="#readRune.readByte">func (r *readRune) readByte() (b byte, err error)</a>

```
searchKey: fmt.readRune.readByte
tags: [function private]
```

```Go
func (r *readRune) readByte() (b byte, err error)
```

readByte returns the next byte from the input, which may be left over from a previous read if the UTF-8 was ill-formed. 

### <a id="scanError" href="#scanError">type scanError struct</a>

```
searchKey: fmt.scanError
tags: [struct private]
```

```Go
type scanError struct {
	err error
}
```

scanError represents an error generated by the scanning software. It's used as a unique signature to identify such errors when recovering. 

### <a id="ss" href="#ss">type ss struct</a>

```
searchKey: fmt.ss
tags: [struct private]
```

```Go
type ss struct {
	rs    io.RuneScanner // where to read input
	buf   buffer         // token accumulator
	count int            // runes consumed so far.
	atEOF bool           // already read EOF
	ssave
}
```

ss is the internal implementation of ScanState. 

#### <a id="newScanState" href="#newScanState">func newScanState(r io.Reader, nlIsSpace, nlIsEnd bool) (s *ss, old ssave)</a>

```
searchKey: fmt.newScanState
tags: [method private]
```

```Go
func newScanState(r io.Reader, nlIsSpace, nlIsEnd bool) (s *ss, old ssave)
```

newScanState allocates a new ss struct or grab a cached one. 

#### <a id="ss.Read" href="#ss.Read">func (s *ss) Read(buf []byte) (n int, err error)</a>

```
searchKey: fmt.ss.Read
tags: [method private]
```

```Go
func (s *ss) Read(buf []byte) (n int, err error)
```

The Read method is only in ScanState so that ScanState satisfies io.Reader. It will never be called when used as intended, so there is no need to make it actually work. 

#### <a id="ss.ReadRune" href="#ss.ReadRune">func (s *ss) ReadRune() (r rune, size int, err error)</a>

```
searchKey: fmt.ss.ReadRune
tags: [function private]
```

```Go
func (s *ss) ReadRune() (r rune, size int, err error)
```

#### <a id="ss.SkipSpace" href="#ss.SkipSpace">func (s *ss) SkipSpace()</a>

```
searchKey: fmt.ss.SkipSpace
tags: [function private]
```

```Go
func (s *ss) SkipSpace()
```

SkipSpace provides Scan methods the ability to skip space and newline characters in keeping with the current scanning mode set by format strings and Scan/Scanln. 

#### <a id="ss.Token" href="#ss.Token">func (s *ss) Token(skipSpace bool, f func(rune) bool) (tok []byte, err error)</a>

```
searchKey: fmt.ss.Token
tags: [method private]
```

```Go
func (s *ss) Token(skipSpace bool, f func(rune) bool) (tok []byte, err error)
```

#### <a id="ss.UnreadRune" href="#ss.UnreadRune">func (s *ss) UnreadRune() error</a>

```
searchKey: fmt.ss.UnreadRune
tags: [function private]
```

```Go
func (s *ss) UnreadRune() error
```

#### <a id="ss.Width" href="#ss.Width">func (s *ss) Width() (wid int, ok bool)</a>

```
searchKey: fmt.ss.Width
tags: [function private]
```

```Go
func (s *ss) Width() (wid int, ok bool)
```

#### <a id="ss.accept" href="#ss.accept">func (s *ss) accept(ok string) bool</a>

```
searchKey: fmt.ss.accept
tags: [method private]
```

```Go
func (s *ss) accept(ok string) bool
```

accept checks the next rune in the input. If it's a byte (sic) in the string, it puts it in the buffer and returns true. Otherwise it return false. 

#### <a id="ss.advance" href="#ss.advance">func (s *ss) advance(format string) (i int)</a>

```
searchKey: fmt.ss.advance
tags: [method private]
```

```Go
func (s *ss) advance(format string) (i int)
```

advance determines whether the next characters in the input match those of the format. It returns the number of bytes (sic) consumed in the format. All runs of space characters in either input or format behave as a single space. Newlines are special, though: newlines in the format must match those in the input and vice versa. This routine also handles the %% case. If the return value is zero, either format starts with a % (with no following %) or the input is empty. If it is negative, the input did not match the string. 

#### <a id="ss.complexTokens" href="#ss.complexTokens">func (s *ss) complexTokens() (real, imag string)</a>

```
searchKey: fmt.ss.complexTokens
tags: [function private]
```

```Go
func (s *ss) complexTokens() (real, imag string)
```

complexTokens returns the real and imaginary parts of the complex number starting here. The number might be parenthesized and has the format (N+Ni) where N is a floating-point number and there are no spaces within. 

#### <a id="ss.consume" href="#ss.consume">func (s *ss) consume(ok string, accept bool) bool</a>

```
searchKey: fmt.ss.consume
tags: [method private]
```

```Go
func (s *ss) consume(ok string, accept bool) bool
```

consume reads the next rune in the input and reports whether it is in the ok string. If accept is true, it puts the character into the input token. 

#### <a id="ss.convertFloat" href="#ss.convertFloat">func (s *ss) convertFloat(str string, n int) float64</a>

```
searchKey: fmt.ss.convertFloat
tags: [method private]
```

```Go
func (s *ss) convertFloat(str string, n int) float64
```

convertFloat converts the string to a float64value. 

#### <a id="ss.convertString" href="#ss.convertString">func (s *ss) convertString(verb rune) (str string)</a>

```
searchKey: fmt.ss.convertString
tags: [method private]
```

```Go
func (s *ss) convertString(verb rune) (str string)
```

convertString returns the string represented by the next input characters. The format of the input is determined by the verb. 

#### <a id="ss.doScan" href="#ss.doScan">func (s *ss) doScan(a []interface{}) (numProcessed int, err error)</a>

```
searchKey: fmt.ss.doScan
tags: [method private]
```

```Go
func (s *ss) doScan(a []interface{}) (numProcessed int, err error)
```

doScan does the real work for scanning without a format string. 

#### <a id="ss.doScanf" href="#ss.doScanf">func (s *ss) doScanf(format string, a []interface{}) (numProcessed int, err error)</a>

```
searchKey: fmt.ss.doScanf
tags: [method private]
```

```Go
func (s *ss) doScanf(format string, a []interface{}) (numProcessed int, err error)
```

doScanf does the real work when scanning with a format string. At the moment, it handles only pointers to basic types. 

#### <a id="ss.error" href="#ss.error">func (s *ss) error(err error)</a>

```
searchKey: fmt.ss.error
tags: [method private]
```

```Go
func (s *ss) error(err error)
```

#### <a id="ss.errorString" href="#ss.errorString">func (s *ss) errorString(err string)</a>

```
searchKey: fmt.ss.errorString
tags: [method private]
```

```Go
func (s *ss) errorString(err string)
```

#### <a id="ss.floatToken" href="#ss.floatToken">func (s *ss) floatToken() string</a>

```
searchKey: fmt.ss.floatToken
tags: [function private]
```

```Go
func (s *ss) floatToken() string
```

floatToken returns the floating-point number starting here, no longer than swid if the width is specified. It's not rigorous about syntax because it doesn't check that we have at least some digits, but Atof will do that. 

#### <a id="ss.free" href="#ss.free">func (s *ss) free(old ssave)</a>

```
searchKey: fmt.ss.free
tags: [method private]
```

```Go
func (s *ss) free(old ssave)
```

free saves used ss structs in ssFree; avoid an allocation per invocation. 

#### <a id="ss.getBase" href="#ss.getBase">func (s *ss) getBase(verb rune) (base int, digits string)</a>

```
searchKey: fmt.ss.getBase
tags: [method private]
```

```Go
func (s *ss) getBase(verb rune) (base int, digits string)
```

getBase returns the numeric base represented by the verb and its digit string. 

#### <a id="ss.getRune" href="#ss.getRune">func (s *ss) getRune() (r rune)</a>

```
searchKey: fmt.ss.getRune
tags: [function private]
```

```Go
func (s *ss) getRune() (r rune)
```

The public method returns an error; this private one panics. If getRune reaches EOF, the return value is EOF (-1). 

#### <a id="ss.hexByte" href="#ss.hexByte">func (s *ss) hexByte() (b byte, ok bool)</a>

```
searchKey: fmt.ss.hexByte
tags: [function private]
```

```Go
func (s *ss) hexByte() (b byte, ok bool)
```

hexByte returns the next hex-encoded (two-character) byte from the input. It returns ok==false if the next bytes in the input do not encode a hex byte. If the first byte is hex and the second is not, processing stops. 

#### <a id="ss.hexString" href="#ss.hexString">func (s *ss) hexString() string</a>

```
searchKey: fmt.ss.hexString
tags: [function private]
```

```Go
func (s *ss) hexString() string
```

hexString returns the space-delimited hexpair-encoded string. 

#### <a id="ss.mustReadRune" href="#ss.mustReadRune">func (s *ss) mustReadRune() (r rune)</a>

```
searchKey: fmt.ss.mustReadRune
tags: [function private]
```

```Go
func (s *ss) mustReadRune() (r rune)
```

mustReadRune turns io.EOF into a panic(io.ErrUnexpectedEOF). It is called in cases such as string scanning where an EOF is a syntax error. 

#### <a id="ss.notEOF" href="#ss.notEOF">func (s *ss) notEOF()</a>

```
searchKey: fmt.ss.notEOF
tags: [function private]
```

```Go
func (s *ss) notEOF()
```

#### <a id="ss.okVerb" href="#ss.okVerb">func (s *ss) okVerb(verb rune, okVerbs, typ string) bool</a>

```
searchKey: fmt.ss.okVerb
tags: [method private]
```

```Go
func (s *ss) okVerb(verb rune, okVerbs, typ string) bool
```

okVerb verifies that the verb is present in the list, setting s.err appropriately if not. 

#### <a id="ss.peek" href="#ss.peek">func (s *ss) peek(ok string) bool</a>

```
searchKey: fmt.ss.peek
tags: [method private]
```

```Go
func (s *ss) peek(ok string) bool
```

peek reports whether the next character is in the ok string, without consuming it. 

#### <a id="ss.quotedString" href="#ss.quotedString">func (s *ss) quotedString() string</a>

```
searchKey: fmt.ss.quotedString
tags: [function private]
```

```Go
func (s *ss) quotedString() string
```

quotedString returns the double- or back-quoted string represented by the next input characters. 

#### <a id="ss.scanBasePrefix" href="#ss.scanBasePrefix">func (s *ss) scanBasePrefix() (base int, digits string, zeroFound bool)</a>

```
searchKey: fmt.ss.scanBasePrefix
tags: [function private]
```

```Go
func (s *ss) scanBasePrefix() (base int, digits string, zeroFound bool)
```

scanBasePrefix reports whether the integer begins with a base prefix and returns the base, digit string, and whether a zero was found. It is called only if the verb is %v. 

#### <a id="ss.scanBool" href="#ss.scanBool">func (s *ss) scanBool(verb rune) bool</a>

```
searchKey: fmt.ss.scanBool
tags: [method private]
```

```Go
func (s *ss) scanBool(verb rune) bool
```

scanBool returns the value of the boolean represented by the next token. 

#### <a id="ss.scanComplex" href="#ss.scanComplex">func (s *ss) scanComplex(verb rune, n int) complex128</a>

```
searchKey: fmt.ss.scanComplex
tags: [method private]
```

```Go
func (s *ss) scanComplex(verb rune, n int) complex128
```

convertComplex converts the next token to a complex128 value. The atof argument is a type-specific reader for the underlying type. If we're reading complex64, atof will parse float32s and convert them to float64's to avoid reproducing this code for each complex type. 

#### <a id="ss.scanInt" href="#ss.scanInt">func (s *ss) scanInt(verb rune, bitSize int) int64</a>

```
searchKey: fmt.ss.scanInt
tags: [method private]
```

```Go
func (s *ss) scanInt(verb rune, bitSize int) int64
```

scanInt returns the value of the integer represented by the next token, checking for overflow. Any error is stored in s.err. 

#### <a id="ss.scanNumber" href="#ss.scanNumber">func (s *ss) scanNumber(digits string, haveDigits bool) string</a>

```
searchKey: fmt.ss.scanNumber
tags: [method private]
```

```Go
func (s *ss) scanNumber(digits string, haveDigits bool) string
```

scanNumber returns the numerical string with specified digits starting here. 

#### <a id="ss.scanOne" href="#ss.scanOne">func (s *ss) scanOne(verb rune, arg interface{})</a>

```
searchKey: fmt.ss.scanOne
tags: [method private]
```

```Go
func (s *ss) scanOne(verb rune, arg interface{})
```

scanOne scans a single value, deriving the scanner from the type of the argument. 

#### <a id="ss.scanPercent" href="#ss.scanPercent">func (s *ss) scanPercent()</a>

```
searchKey: fmt.ss.scanPercent
tags: [function private]
```

```Go
func (s *ss) scanPercent()
```

scanPercent scans a literal percent character. 

#### <a id="ss.scanRune" href="#ss.scanRune">func (s *ss) scanRune(bitSize int) int64</a>

```
searchKey: fmt.ss.scanRune
tags: [method private]
```

```Go
func (s *ss) scanRune(bitSize int) int64
```

scanRune returns the next rune value in the input. 

#### <a id="ss.scanUint" href="#ss.scanUint">func (s *ss) scanUint(verb rune, bitSize int) uint64</a>

```
searchKey: fmt.ss.scanUint
tags: [method private]
```

```Go
func (s *ss) scanUint(verb rune, bitSize int) uint64
```

scanUint returns the value of the unsigned integer represented by the next token, checking for overflow. Any error is stored in s.err. 

#### <a id="ss.token" href="#ss.token">func (s *ss) token(skipSpace bool, f func(rune) bool) []byte</a>

```
searchKey: fmt.ss.token
tags: [method private]
```

```Go
func (s *ss) token(skipSpace bool, f func(rune) bool) []byte
```

token returns the next space-delimited string from the input. It skips white space. For Scanln, it stops at newlines. For Scan, newlines are treated as spaces. 

### <a id="ssave" href="#ssave">type ssave struct</a>

```
searchKey: fmt.ssave
tags: [struct private]
```

```Go
type ssave struct {
	validSave bool // is or was a part of an actual ss.
	nlIsEnd   bool // whether newline terminates scan
	nlIsSpace bool // whether newline counts as white space
	argLimit  int  // max value of ss.count for this arg; argLimit <= limit
	limit     int  // max value of ss.count.
	maxWid    int  // width of this arg.
}
```

ssave holds the parts of ss that need to be saved and restored on recursive scans. 

### <a id="stringReader" href="#stringReader">type stringReader string</a>

```
searchKey: fmt.stringReader
tags: [string private]
```

```Go
type stringReader string
```

#### <a id="stringReader.Read" href="#stringReader.Read">func (r *stringReader) Read(b []byte) (n int, err error)</a>

```
searchKey: fmt.stringReader.Read
tags: [method private]
```

```Go
func (r *stringReader) Read(b []byte) (n int, err error)
```

### <a id="wrapError" href="#wrapError">type wrapError struct</a>

```
searchKey: fmt.wrapError
tags: [struct private]
```

```Go
type wrapError struct {
	msg string
	err error
}
```

#### <a id="wrapError.Error" href="#wrapError.Error">func (e *wrapError) Error() string</a>

```
searchKey: fmt.wrapError.Error
tags: [function private]
```

```Go
func (e *wrapError) Error() string
```

#### <a id="wrapError.Unwrap" href="#wrapError.Unwrap">func (e *wrapError) Unwrap() error</a>

```
searchKey: fmt.wrapError.Unwrap
tags: [function private]
```

```Go
func (e *wrapError) Unwrap() error
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="Errorf" href="#Errorf">func Errorf(format string, a ...interface{}) error</a>

```
searchKey: fmt.Errorf
tags: [method]
```

```Go
func Errorf(format string, a ...interface{}) error
```

Errorf formats according to a format specifier and returns the string as a value that satisfies error. 

If the format specifier includes a %w verb with an error operand, the returned error will implement an Unwrap method returning the operand. It is invalid to include more than one %w verb or to supply it with an operand that does not implement the error interface. The %w verb is otherwise a synonym for %v. 

### <a id="Fprint" href="#Fprint">func Fprint(w io.Writer, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fprint
tags: [method]
```

```Go
func Fprint(w io.Writer, a ...interface{}) (n int, err error)
```

Fprint formats using the default formats for its operands and writes to w. Spaces are added between operands when neither is a string. It returns the number of bytes written and any write error encountered. 

### <a id="Fprintf" href="#Fprintf">func Fprintf(w io.Writer, format string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fprintf
tags: [method]
```

```Go
func Fprintf(w io.Writer, format string, a ...interface{}) (n int, err error)
```

Fprintf formats according to a format specifier and writes to w. It returns the number of bytes written and any write error encountered. 

### <a id="Fprintln" href="#Fprintln">func Fprintln(w io.Writer, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fprintln
tags: [method]
```

```Go
func Fprintln(w io.Writer, a ...interface{}) (n int, err error)
```

Fprintln formats using the default formats for its operands and writes to w. Spaces are always added between operands and a newline is appended. It returns the number of bytes written and any write error encountered. 

### <a id="Fscan" href="#Fscan">func Fscan(r io.Reader, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fscan
tags: [method]
```

```Go
func Fscan(r io.Reader, a ...interface{}) (n int, err error)
```

Fscan scans text read from r, storing successive space-separated values into successive arguments. Newlines count as space. It returns the number of items successfully scanned. If that is less than the number of arguments, err will report why. 

### <a id="Fscanf" href="#Fscanf">func Fscanf(r io.Reader, format string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fscanf
tags: [method]
```

```Go
func Fscanf(r io.Reader, format string, a ...interface{}) (n int, err error)
```

Fscanf scans text read from r, storing successive space-separated values into successive arguments as determined by the format. It returns the number of items successfully parsed. Newlines in the input must match newlines in the format. 

### <a id="Fscanln" href="#Fscanln">func Fscanln(r io.Reader, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Fscanln
tags: [method]
```

```Go
func Fscanln(r io.Reader, a ...interface{}) (n int, err error)
```

Fscanln is similar to Fscan, but stops scanning at a newline and after the final item there must be a newline or EOF. 

### <a id="Print" href="#Print">func Print(a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Print
tags: [method]
```

```Go
func Print(a ...interface{}) (n int, err error)
```

Print formats using the default formats for its operands and writes to standard output. Spaces are added between operands when neither is a string. It returns the number of bytes written and any write error encountered. 

### <a id="Printf" href="#Printf">func Printf(format string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Printf
tags: [method]
```

```Go
func Printf(format string, a ...interface{}) (n int, err error)
```

Printf formats according to a format specifier and writes to standard output. It returns the number of bytes written and any write error encountered. 

### <a id="Println" href="#Println">func Println(a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Println
tags: [method]
```

```Go
func Println(a ...interface{}) (n int, err error)
```

Println formats using the default formats for its operands and writes to standard output. Spaces are always added between operands and a newline is appended. It returns the number of bytes written and any write error encountered. 

### <a id="Scan" href="#Scan">func Scan(a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Scan
tags: [method]
```

```Go
func Scan(a ...interface{}) (n int, err error)
```

Scan scans text read from standard input, storing successive space-separated values into successive arguments. Newlines count as space. It returns the number of items successfully scanned. If that is less than the number of arguments, err will report why. 

### <a id="Scanf" href="#Scanf">func Scanf(format string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Scanf
tags: [method]
```

```Go
func Scanf(format string, a ...interface{}) (n int, err error)
```

Scanf scans text read from standard input, storing successive space-separated values into successive arguments as determined by the format. It returns the number of items successfully scanned. If that is less than the number of arguments, err will report why. Newlines in the input must match newlines in the format. The one exception: the verb %c always scans the next rune in the input, even if it is a space (or tab etc.) or newline. 

### <a id="Scanln" href="#Scanln">func Scanln(a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Scanln
tags: [method]
```

```Go
func Scanln(a ...interface{}) (n int, err error)
```

Scanln is similar to Scan, but stops scanning at a newline and after the final item there must be a newline or EOF. 

### <a id="Sprint" href="#Sprint">func Sprint(a ...interface{}) string</a>

```
searchKey: fmt.Sprint
tags: [method]
```

```Go
func Sprint(a ...interface{}) string
```

Sprint formats using the default formats for its operands and returns the resulting string. Spaces are added between operands when neither is a string. 

### <a id="Sprintf" href="#Sprintf">func Sprintf(format string, a ...interface{}) string</a>

```
searchKey: fmt.Sprintf
tags: [method]
```

```Go
func Sprintf(format string, a ...interface{}) string
```

Sprintf formats according to a format specifier and returns the resulting string. 

### <a id="Sprintln" href="#Sprintln">func Sprintln(a ...interface{}) string</a>

```
searchKey: fmt.Sprintln
tags: [method]
```

```Go
func Sprintln(a ...interface{}) string
```

Sprintln formats using the default formats for its operands and returns the resulting string. Spaces are always added between operands and a newline is appended. 

### <a id="Sscan" href="#Sscan">func Sscan(str string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Sscan
tags: [method]
```

```Go
func Sscan(str string, a ...interface{}) (n int, err error)
```

Sscan scans the argument string, storing successive space-separated values into successive arguments. Newlines count as space. It returns the number of items successfully scanned. If that is less than the number of arguments, err will report why. 

### <a id="Sscanf" href="#Sscanf">func Sscanf(str string, format string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Sscanf
tags: [method]
```

```Go
func Sscanf(str string, format string, a ...interface{}) (n int, err error)
```

Sscanf scans the argument string, storing successive space-separated values into successive arguments as determined by the format. It returns the number of items successfully parsed. Newlines in the input must match newlines in the format. 

### <a id="Sscanln" href="#Sscanln">func Sscanln(str string, a ...interface{}) (n int, err error)</a>

```
searchKey: fmt.Sscanln
tags: [method]
```

```Go
func Sscanln(str string, a ...interface{}) (n int, err error)
```

Sscanln is similar to Sscan, but stops scanning at a newline and after the final item there must be a newline or EOF. 

### <a id="errorHandler" href="#errorHandler">func errorHandler(errp *error)</a>

```
searchKey: fmt.errorHandler
tags: [method private]
```

```Go
func errorHandler(errp *error)
```

errorHandler turns local panics into error returns. 

### <a id="getField" href="#getField">func getField(v reflect.Value, i int) reflect.Value</a>

```
searchKey: fmt.getField
tags: [method private]
```

```Go
func getField(v reflect.Value, i int) reflect.Value
```

getField gets the i'th field of the struct value. If the field is itself is an interface, return a value for the thing inside the interface, not the interface itself. 

### <a id="hasX" href="#hasX">func hasX(s string) bool</a>

```
searchKey: fmt.hasX
tags: [method private]
```

```Go
func hasX(s string) bool
```

### <a id="hexDigit" href="#hexDigit">func hexDigit(d rune) (int, bool)</a>

```
searchKey: fmt.hexDigit
tags: [method private]
```

```Go
func hexDigit(d rune) (int, bool)
```

hexDigit returns the value of the hexadecimal digit. 

### <a id="indexRune" href="#indexRune">func indexRune(s string, r rune) int</a>

```
searchKey: fmt.indexRune
tags: [method private]
```

```Go
func indexRune(s string, r rune) int
```

### <a id="intFromArg" href="#intFromArg">func intFromArg(a []interface{}, argNum int) (num int, isInt bool, newArgNum int)</a>

```
searchKey: fmt.intFromArg
tags: [method private]
```

```Go
func intFromArg(a []interface{}, argNum int) (num int, isInt bool, newArgNum int)
```

intFromArg gets the argNumth element of a. On return, isInt reports whether the argument has integer type. 

### <a id="isSpace" href="#isSpace">func isSpace(r rune) bool</a>

```
searchKey: fmt.isSpace
tags: [method private]
```

```Go
func isSpace(r rune) bool
```

### <a id="notSpace" href="#notSpace">func notSpace(r rune) bool</a>

```
searchKey: fmt.notSpace
tags: [method private]
```

```Go
func notSpace(r rune) bool
```

notSpace is the default scanning function used in Token. 

### <a id="parseArgNumber" href="#parseArgNumber">func parseArgNumber(format string) (index int, wid int, ok bool)</a>

```
searchKey: fmt.parseArgNumber
tags: [method private]
```

```Go
func parseArgNumber(format string) (index int, wid int, ok bool)
```

parseArgNumber returns the value of the bracketed number, minus 1 (explicit argument numbers are one-indexed but we want zero-indexed). The opening bracket is known to be present at format[0]. The returned values are the index, the number of bytes to consume up to the closing paren, if present, and whether the number parsed ok. The bytes to consume will be 1 if no closing paren is present. 

### <a id="parsenum" href="#parsenum">func parsenum(s string, start, end int) (num int, isnum bool, newi int)</a>

```
searchKey: fmt.parsenum
tags: [method private]
```

```Go
func parsenum(s string, start, end int) (num int, isnum bool, newi int)
```

parsenum converts ASCII to integer.  num is 0 (and isnum is false) if no number present. 

### <a id="tooLarge" href="#tooLarge">func tooLarge(x int) bool</a>

```
searchKey: fmt.tooLarge
tags: [method private]
```

```Go
func tooLarge(x int) bool
```

tooLarge reports whether the magnitude of the integer is too large to be used as a formatting width or precision. 

