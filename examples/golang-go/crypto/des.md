# Package des

Package des implements the Data Encryption Standard (DES) and the Triple Data Encryption Algorithm (TDEA) as defined in U.S. Federal Information Processing Standards Publication 46-3. 

DES is cryptographically broken and should not be used for secure applications. 

## Index

* [Constants](#const)
    * [const BlockSize](#BlockSize)
* [Variables](#var)
    * [var encryptDESTests](#encryptDESTests)
    * [var encryptTripleDESTests](#encryptTripleDESTests)
    * [var expansionFunction](#expansionFunction)
    * [var feistelBox](#feistelBox)
    * [var feistelBoxOnce](#feistelBoxOnce)
    * [var finalPermutation](#finalPermutation)
    * [var initialPermutation](#initialPermutation)
    * [var ksRotations](#ksRotations)
    * [var permutationFunction](#permutationFunction)
    * [var permutedChoice1](#permutedChoice1)
    * [var permutedChoice2](#permutedChoice2)
    * [var sBoxes](#sBoxes)
    * [var semiWeakKeyTests](#semiWeakKeyTests)
    * [var tableA1Key](#tableA1Key)
    * [var tableA1Tests](#tableA1Tests)
    * [var tableA2Plaintext](#tableA2Plaintext)
    * [var tableA2Tests](#tableA2Tests)
    * [var tableA3Plaintext](#tableA3Plaintext)
    * [var tableA3Tests](#tableA3Tests)
    * [var tableA4Tests](#tableA4Tests)
    * [var weakKeyTests](#weakKeyTests)
* [Types](#type)
    * [type CryptTest struct](#CryptTest)
    * [type KeySizeError int](#KeySizeError)
        * [func (k KeySizeError) Error() string](#KeySizeError.Error)
    * [type desCipher struct](#desCipher)
        * [func newCipher(key []byte) *desCipher](#newCipher)
        * [func (c *desCipher) BlockSize() int](#desCipher.BlockSize)
        * [func (c *desCipher) Decrypt(dst, src []byte)](#desCipher.Decrypt)
        * [func (c *desCipher) Encrypt(dst, src []byte)](#desCipher.Encrypt)
        * [func (c *desCipher) generateSubkeys(keyBytes []byte)](#desCipher.generateSubkeys)
    * [type tripleDESCipher struct](#tripleDESCipher)
        * [func (c *tripleDESCipher) BlockSize() int](#tripleDESCipher.BlockSize)
        * [func (c *tripleDESCipher) Decrypt(dst, src []byte)](#tripleDESCipher.Decrypt)
        * [func (c *tripleDESCipher) Encrypt(dst, src []byte)](#tripleDESCipher.Encrypt)
* [Functions](#func)
    * [func BenchmarkDecrypt(b *testing.B)](#BenchmarkDecrypt)
    * [func BenchmarkEncrypt(b *testing.B)](#BenchmarkEncrypt)
    * [func BenchmarkTDESDecrypt(b *testing.B)](#BenchmarkTDESDecrypt)
    * [func BenchmarkTDESEncrypt(b *testing.B)](#BenchmarkTDESEncrypt)
    * [func NewCipher(key []byte) (cipher.Block, error)](#NewCipher)
    * [func NewTripleDESCipher(key []byte) (cipher.Block, error)](#NewTripleDESCipher)
    * [func TestDESDecryptBlock(t *testing.T)](#TestDESDecryptBlock)
    * [func TestDESEncryptBlock(t *testing.T)](#TestDESEncryptBlock)
    * [func TestDecryptTripleDES(t *testing.T)](#TestDecryptTripleDES)
    * [func TestEncryptTripleDES(t *testing.T)](#TestEncryptTripleDES)
    * [func TestFinalPermute(t *testing.T)](#TestFinalPermute)
    * [func TestInitialPermutationKnownAnswer(t *testing.T)](#TestInitialPermutationKnownAnswer)
    * [func TestInitialPermute(t *testing.T)](#TestInitialPermute)
    * [func TestInversePermutationKnownAnswer(t *testing.T)](#TestInversePermutationKnownAnswer)
    * [func TestPermutationOperationKnownAnswerDecrypt(t *testing.T)](#TestPermutationOperationKnownAnswerDecrypt)
    * [func TestPermutationOperationKnownAnswerEncrypt(t *testing.T)](#TestPermutationOperationKnownAnswerEncrypt)
    * [func TestSemiWeakKeyPairs(t *testing.T)](#TestSemiWeakKeyPairs)
    * [func TestSubstitutionTableKnownAnswerDecrypt(t *testing.T)](#TestSubstitutionTableKnownAnswerDecrypt)
    * [func TestSubstitutionTableKnownAnswerEncrypt(t *testing.T)](#TestSubstitutionTableKnownAnswerEncrypt)
    * [func TestVariableCiphertextKnownAnswer(t *testing.T)](#TestVariableCiphertextKnownAnswer)
    * [func TestVariableKeyKnownAnswerDecrypt(t *testing.T)](#TestVariableKeyKnownAnswerDecrypt)
    * [func TestVariableKeyKnownAnswerEncrypt(t *testing.T)](#TestVariableKeyKnownAnswerEncrypt)
    * [func TestVariablePlaintextKnownAnswer(t *testing.T)](#TestVariablePlaintextKnownAnswer)
    * [func TestWeakKeys(t *testing.T)](#TestWeakKeys)
    * [func cryptBlock(subkeys []uint64, dst, src []byte, decrypt bool)](#cryptBlock)
    * [func decryptBlock(subkeys []uint64, dst, src []byte)](#decryptBlock)
    * [func encryptBlock(subkeys []uint64, dst, src []byte)](#encryptBlock)
    * [func feistel(l, r uint32, k0, k1 uint64) (lout, rout uint32)](#feistel)
    * [func initFeistelBox()](#initFeistelBox)
    * [func ksRotate(in uint32) (out []uint32)](#ksRotate)
    * [func permuteBlock(src uint64, permutation []uint8) (block uint64)](#permuteBlock)
    * [func permuteFinalBlock(block uint64) uint64](#permuteFinalBlock)
    * [func permuteInitialBlock(block uint64) uint64](#permuteInitialBlock)
    * [func unpack(x uint64) uint64](#unpack)


## <a id="const" href="#const">Constants</a>

```
tags: [package]
```

### <a id="BlockSize" href="#BlockSize">const BlockSize</a>

```
searchKey: des.BlockSize
tags: [constant number]
```

```Go
const BlockSize = 8
```

The DES block size in bytes. 

## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="encryptDESTests" href="#encryptDESTests">var encryptDESTests</a>

```
searchKey: des.encryptDESTests
tags: [variable array struct private]
```

```Go
var encryptDESTests = ...
```

some custom tests for DES 

### <a id="encryptTripleDESTests" href="#encryptTripleDESTests">var encryptTripleDESTests</a>

```
searchKey: des.encryptTripleDESTests
tags: [variable array struct private]
```

```Go
var encryptTripleDESTests = ...
```

some custom tests for TripleDES 

### <a id="expansionFunction" href="#expansionFunction">var expansionFunction</a>

```
searchKey: des.expansionFunction
tags: [variable array number private]
```

```Go
var expansionFunction = ...
```

Used to expand an input block of 32 bits, producing an output block of 48 bits. 

### <a id="feistelBox" href="#feistelBox">var feistelBox</a>

```
searchKey: des.feistelBox
tags: [variable array array number private]
```

```Go
var feistelBox [8][64]uint32
```

feistelBox[s][16*i+j] contains the output of permutationFunction for sBoxes[s][i][j] << 4*(7-s) 

### <a id="feistelBoxOnce" href="#feistelBoxOnce">var feistelBoxOnce</a>

```
searchKey: des.feistelBoxOnce
tags: [variable struct private]
```

```Go
var feistelBoxOnce sync.Once
```

### <a id="finalPermutation" href="#finalPermutation">var finalPermutation</a>

```
searchKey: des.finalPermutation
tags: [variable array number private]
```

```Go
var finalPermutation = ...
```

Used to perform a final permutation of a 4-bit preoutput block. This is the inverse of initialPermutation 

### <a id="initialPermutation" href="#initialPermutation">var initialPermutation</a>

```
searchKey: des.initialPermutation
tags: [variable array number private]
```

```Go
var initialPermutation = ...
```

Used to perform an initial permutation of a 64-bit input block. 

### <a id="ksRotations" href="#ksRotations">var ksRotations</a>

```
searchKey: des.ksRotations
tags: [variable array number private]
```

```Go
var ksRotations = [16]uint8{1, 1, 2, 2, 2, 2, 2, 2, 1, 2, 2, 2, 2, 2, 2, 1}
```

Size of left rotation per round in each half of the key schedule 

### <a id="permutationFunction" href="#permutationFunction">var permutationFunction</a>

```
searchKey: des.permutationFunction
tags: [variable array number private]
```

```Go
var permutationFunction = ...
```

Yields a 32-bit output from a 32-bit input 

### <a id="permutedChoice1" href="#permutedChoice1">var permutedChoice1</a>

```
searchKey: des.permutedChoice1
tags: [variable array number private]
```

```Go
var permutedChoice1 = ...
```

Used in the key schedule to select 56 bits from a 64-bit input. 

### <a id="permutedChoice2" href="#permutedChoice2">var permutedChoice2</a>

```
searchKey: des.permutedChoice2
tags: [variable array number private]
```

```Go
var permutedChoice2 = ...
```

Used in the key schedule to produce each subkey by selecting 48 bits from the 56-bit input 

### <a id="sBoxes" href="#sBoxes">var sBoxes</a>

```
searchKey: des.sBoxes
tags: [variable array array array number private]
```

```Go
var sBoxes = ...
```

8 S-boxes composed of 4 rows and 16 columns Used in the DES cipher function 

### <a id="semiWeakKeyTests" href="#semiWeakKeyTests">var semiWeakKeyTests</a>

```
searchKey: des.semiWeakKeyTests
tags: [variable array struct private]
```

```Go
var semiWeakKeyTests = ...
```

### <a id="tableA1Key" href="#tableA1Key">var tableA1Key</a>

```
searchKey: des.tableA1Key
tags: [variable array number private]
```

```Go
var tableA1Key = ...
```

NIST Special Publication 800-20, Appendix A Key for use with Table A.1 tests 

### <a id="tableA1Tests" href="#tableA1Tests">var tableA1Tests</a>

```
searchKey: des.tableA1Tests
tags: [variable array struct private]
```

```Go
var tableA1Tests = ...
```

Table A.1 Resulting Ciphertext from the Variable Plaintext Known Answer Test 

### <a id="tableA2Plaintext" href="#tableA2Plaintext">var tableA2Plaintext</a>

```
searchKey: des.tableA2Plaintext
tags: [variable array number private]
```

```Go
var tableA2Plaintext = []byte{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
```

Plaintext for use with Table A.2 tests 

### <a id="tableA2Tests" href="#tableA2Tests">var tableA2Tests</a>

```
searchKey: des.tableA2Tests
tags: [variable array struct private]
```

```Go
var tableA2Tests = ...
```

Table A.2 Resulting Ciphertext from the Variable Key Known Answer Test 

### <a id="tableA3Plaintext" href="#tableA3Plaintext">var tableA3Plaintext</a>

```
searchKey: des.tableA3Plaintext
tags: [variable array number private]
```

```Go
var tableA3Plaintext = []byte{0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00}
```

Plaintext for use with Table A.3 tests 

### <a id="tableA3Tests" href="#tableA3Tests">var tableA3Tests</a>

```
searchKey: des.tableA3Tests
tags: [variable array struct private]
```

```Go
var tableA3Tests = ...
```

Table A.3 Values To Be Used for the Permutation Operation Known Answer Test 

### <a id="tableA4Tests" href="#tableA4Tests">var tableA4Tests</a>

```
searchKey: des.tableA4Tests
tags: [variable array struct private]
```

```Go
var tableA4Tests = ...
```

Table A.4 Values To Be Used for the Substitution Table Known Answer Test 

### <a id="weakKeyTests" href="#weakKeyTests">var weakKeyTests</a>

```
searchKey: des.weakKeyTests
tags: [variable array struct private]
```

```Go
var weakKeyTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="CryptTest" href="#CryptTest">type CryptTest struct</a>

```
searchKey: des.CryptTest
tags: [struct private]
```

```Go
type CryptTest struct {
	key []byte
	in  []byte
	out []byte
}
```

### <a id="KeySizeError" href="#KeySizeError">type KeySizeError int</a>

```
searchKey: des.KeySizeError
tags: [number]
```

```Go
type KeySizeError int
```

#### <a id="KeySizeError.Error" href="#KeySizeError.Error">func (k KeySizeError) Error() string</a>

```
searchKey: des.KeySizeError.Error
tags: [function]
```

```Go
func (k KeySizeError) Error() string
```

### <a id="desCipher" href="#desCipher">type desCipher struct</a>

```
searchKey: des.desCipher
tags: [struct private]
```

```Go
type desCipher struct {
	subkeys [16]uint64
}
```

desCipher is an instance of DES encryption. 

#### <a id="newCipher" href="#newCipher">func newCipher(key []byte) *desCipher</a>

```
searchKey: des.newCipher
tags: [method private]
```

```Go
func newCipher(key []byte) *desCipher
```

#### <a id="desCipher.BlockSize" href="#desCipher.BlockSize">func (c *desCipher) BlockSize() int</a>

```
searchKey: des.desCipher.BlockSize
tags: [function private]
```

```Go
func (c *desCipher) BlockSize() int
```

#### <a id="desCipher.Decrypt" href="#desCipher.Decrypt">func (c *desCipher) Decrypt(dst, src []byte)</a>

```
searchKey: des.desCipher.Decrypt
tags: [method private]
```

```Go
func (c *desCipher) Decrypt(dst, src []byte)
```

#### <a id="desCipher.Encrypt" href="#desCipher.Encrypt">func (c *desCipher) Encrypt(dst, src []byte)</a>

```
searchKey: des.desCipher.Encrypt
tags: [method private]
```

```Go
func (c *desCipher) Encrypt(dst, src []byte)
```

#### <a id="desCipher.generateSubkeys" href="#desCipher.generateSubkeys">func (c *desCipher) generateSubkeys(keyBytes []byte)</a>

```
searchKey: des.desCipher.generateSubkeys
tags: [method private]
```

```Go
func (c *desCipher) generateSubkeys(keyBytes []byte)
```

creates 16 56-bit subkeys from the original key 

### <a id="tripleDESCipher" href="#tripleDESCipher">type tripleDESCipher struct</a>

```
searchKey: des.tripleDESCipher
tags: [struct private]
```

```Go
type tripleDESCipher struct {
	cipher1, cipher2, cipher3 desCipher
}
```

A tripleDESCipher is an instance of TripleDES encryption. 

#### <a id="tripleDESCipher.BlockSize" href="#tripleDESCipher.BlockSize">func (c *tripleDESCipher) BlockSize() int</a>

```
searchKey: des.tripleDESCipher.BlockSize
tags: [function private]
```

```Go
func (c *tripleDESCipher) BlockSize() int
```

#### <a id="tripleDESCipher.Decrypt" href="#tripleDESCipher.Decrypt">func (c *tripleDESCipher) Decrypt(dst, src []byte)</a>

```
searchKey: des.tripleDESCipher.Decrypt
tags: [method private]
```

```Go
func (c *tripleDESCipher) Decrypt(dst, src []byte)
```

#### <a id="tripleDESCipher.Encrypt" href="#tripleDESCipher.Encrypt">func (c *tripleDESCipher) Encrypt(dst, src []byte)</a>

```
searchKey: des.tripleDESCipher.Encrypt
tags: [method private]
```

```Go
func (c *tripleDESCipher) Encrypt(dst, src []byte)
```

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="BenchmarkDecrypt" href="#BenchmarkDecrypt">func BenchmarkDecrypt(b *testing.B)</a>

```
searchKey: des.BenchmarkDecrypt
tags: [method private benchmark]
```

```Go
func BenchmarkDecrypt(b *testing.B)
```

### <a id="BenchmarkEncrypt" href="#BenchmarkEncrypt">func BenchmarkEncrypt(b *testing.B)</a>

```
searchKey: des.BenchmarkEncrypt
tags: [method private benchmark]
```

```Go
func BenchmarkEncrypt(b *testing.B)
```

### <a id="BenchmarkTDESDecrypt" href="#BenchmarkTDESDecrypt">func BenchmarkTDESDecrypt(b *testing.B)</a>

```
searchKey: des.BenchmarkTDESDecrypt
tags: [method private benchmark]
```

```Go
func BenchmarkTDESDecrypt(b *testing.B)
```

### <a id="BenchmarkTDESEncrypt" href="#BenchmarkTDESEncrypt">func BenchmarkTDESEncrypt(b *testing.B)</a>

```
searchKey: des.BenchmarkTDESEncrypt
tags: [method private benchmark]
```

```Go
func BenchmarkTDESEncrypt(b *testing.B)
```

### <a id="NewCipher" href="#NewCipher">func NewCipher(key []byte) (cipher.Block, error)</a>

```
searchKey: des.NewCipher
tags: [method]
```

```Go
func NewCipher(key []byte) (cipher.Block, error)
```

NewCipher creates and returns a new cipher.Block. 

### <a id="NewTripleDESCipher" href="#NewTripleDESCipher">func NewTripleDESCipher(key []byte) (cipher.Block, error)</a>

```
searchKey: des.NewTripleDESCipher
tags: [method]
```

```Go
func NewTripleDESCipher(key []byte) (cipher.Block, error)
```

NewTripleDESCipher creates and returns a new cipher.Block. 

### <a id="TestDESDecryptBlock" href="#TestDESDecryptBlock">func TestDESDecryptBlock(t *testing.T)</a>

```
searchKey: des.TestDESDecryptBlock
tags: [method private test]
```

```Go
func TestDESDecryptBlock(t *testing.T)
```

### <a id="TestDESEncryptBlock" href="#TestDESEncryptBlock">func TestDESEncryptBlock(t *testing.T)</a>

```
searchKey: des.TestDESEncryptBlock
tags: [method private test]
```

```Go
func TestDESEncryptBlock(t *testing.T)
```

### <a id="TestDecryptTripleDES" href="#TestDecryptTripleDES">func TestDecryptTripleDES(t *testing.T)</a>

```
searchKey: des.TestDecryptTripleDES
tags: [method private test]
```

```Go
func TestDecryptTripleDES(t *testing.T)
```

### <a id="TestEncryptTripleDES" href="#TestEncryptTripleDES">func TestEncryptTripleDES(t *testing.T)</a>

```
searchKey: des.TestEncryptTripleDES
tags: [method private test]
```

```Go
func TestEncryptTripleDES(t *testing.T)
```

### <a id="TestFinalPermute" href="#TestFinalPermute">func TestFinalPermute(t *testing.T)</a>

```
searchKey: des.TestFinalPermute
tags: [method private test]
```

```Go
func TestFinalPermute(t *testing.T)
```

### <a id="TestInitialPermutationKnownAnswer" href="#TestInitialPermutationKnownAnswer">func TestInitialPermutationKnownAnswer(t *testing.T)</a>

```
searchKey: des.TestInitialPermutationKnownAnswer
tags: [method private test]
```

```Go
func TestInitialPermutationKnownAnswer(t *testing.T)
```

Defined in Pub 800-20 Decrypting the Table A.1 plaintext with the 0x01... key produces the corresponding ciphertext 

### <a id="TestInitialPermute" href="#TestInitialPermute">func TestInitialPermute(t *testing.T)</a>

```
searchKey: des.TestInitialPermute
tags: [method private test]
```

```Go
func TestInitialPermute(t *testing.T)
```

### <a id="TestInversePermutationKnownAnswer" href="#TestInversePermutationKnownAnswer">func TestInversePermutationKnownAnswer(t *testing.T)</a>

```
searchKey: des.TestInversePermutationKnownAnswer
tags: [method private test]
```

```Go
func TestInversePermutationKnownAnswer(t *testing.T)
```

Defined in Pub 800-20 Encrypting the Table A.1 ciphertext with the 0x01... key produces the original plaintext 

### <a id="TestPermutationOperationKnownAnswerDecrypt" href="#TestPermutationOperationKnownAnswerDecrypt">func TestPermutationOperationKnownAnswerDecrypt(t *testing.T)</a>

```
searchKey: des.TestPermutationOperationKnownAnswerDecrypt
tags: [method private test]
```

```Go
func TestPermutationOperationKnownAnswerDecrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestPermutationOperationKnownAnswerEncrypt" href="#TestPermutationOperationKnownAnswerEncrypt">func TestPermutationOperationKnownAnswerEncrypt(t *testing.T)</a>

```
searchKey: des.TestPermutationOperationKnownAnswerEncrypt
tags: [method private test]
```

```Go
func TestPermutationOperationKnownAnswerEncrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestSemiWeakKeyPairs" href="#TestSemiWeakKeyPairs">func TestSemiWeakKeyPairs(t *testing.T)</a>

```
searchKey: des.TestSemiWeakKeyPairs
tags: [method private test]
```

```Go
func TestSemiWeakKeyPairs(t *testing.T)
```

Use the known semi-weak key pairs to test DES implementation 

### <a id="TestSubstitutionTableKnownAnswerDecrypt" href="#TestSubstitutionTableKnownAnswerDecrypt">func TestSubstitutionTableKnownAnswerDecrypt(t *testing.T)</a>

```
searchKey: des.TestSubstitutionTableKnownAnswerDecrypt
tags: [method private test]
```

```Go
func TestSubstitutionTableKnownAnswerDecrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestSubstitutionTableKnownAnswerEncrypt" href="#TestSubstitutionTableKnownAnswerEncrypt">func TestSubstitutionTableKnownAnswerEncrypt(t *testing.T)</a>

```
searchKey: des.TestSubstitutionTableKnownAnswerEncrypt
tags: [method private test]
```

```Go
func TestSubstitutionTableKnownAnswerEncrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestVariableCiphertextKnownAnswer" href="#TestVariableCiphertextKnownAnswer">func TestVariableCiphertextKnownAnswer(t *testing.T)</a>

```
searchKey: des.TestVariableCiphertextKnownAnswer
tags: [method private test]
```

```Go
func TestVariableCiphertextKnownAnswer(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestVariableKeyKnownAnswerDecrypt" href="#TestVariableKeyKnownAnswerDecrypt">func TestVariableKeyKnownAnswerDecrypt(t *testing.T)</a>

```
searchKey: des.TestVariableKeyKnownAnswerDecrypt
tags: [method private test]
```

```Go
func TestVariableKeyKnownAnswerDecrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestVariableKeyKnownAnswerEncrypt" href="#TestVariableKeyKnownAnswerEncrypt">func TestVariableKeyKnownAnswerEncrypt(t *testing.T)</a>

```
searchKey: des.TestVariableKeyKnownAnswerEncrypt
tags: [method private test]
```

```Go
func TestVariableKeyKnownAnswerEncrypt(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestVariablePlaintextKnownAnswer" href="#TestVariablePlaintextKnownAnswer">func TestVariablePlaintextKnownAnswer(t *testing.T)</a>

```
searchKey: des.TestVariablePlaintextKnownAnswer
tags: [method private test]
```

```Go
func TestVariablePlaintextKnownAnswer(t *testing.T)
```

Defined in Pub 800-20 

### <a id="TestWeakKeys" href="#TestWeakKeys">func TestWeakKeys(t *testing.T)</a>

```
searchKey: des.TestWeakKeys
tags: [method private test]
```

```Go
func TestWeakKeys(t *testing.T)
```

Use the known weak keys to test DES implementation 

### <a id="cryptBlock" href="#cryptBlock">func cryptBlock(subkeys []uint64, dst, src []byte, decrypt bool)</a>

```
searchKey: des.cryptBlock
tags: [method private]
```

```Go
func cryptBlock(subkeys []uint64, dst, src []byte, decrypt bool)
```

### <a id="decryptBlock" href="#decryptBlock">func decryptBlock(subkeys []uint64, dst, src []byte)</a>

```
searchKey: des.decryptBlock
tags: [method private]
```

```Go
func decryptBlock(subkeys []uint64, dst, src []byte)
```

Decrypt one block from src into dst, using the subkeys. 

### <a id="encryptBlock" href="#encryptBlock">func encryptBlock(subkeys []uint64, dst, src []byte)</a>

```
searchKey: des.encryptBlock
tags: [method private]
```

```Go
func encryptBlock(subkeys []uint64, dst, src []byte)
```

Encrypt one block from src into dst, using the subkeys. 

### <a id="feistel" href="#feistel">func feistel(l, r uint32, k0, k1 uint64) (lout, rout uint32)</a>

```
searchKey: des.feistel
tags: [method private]
```

```Go
func feistel(l, r uint32, k0, k1 uint64) (lout, rout uint32)
```

DES Feistel function. feistelBox must be initialized via feistelBoxOnce.Do(initFeistelBox) first. 

### <a id="initFeistelBox" href="#initFeistelBox">func initFeistelBox()</a>

```
searchKey: des.initFeistelBox
tags: [function private]
```

```Go
func initFeistelBox()
```

### <a id="ksRotate" href="#ksRotate">func ksRotate(in uint32) (out []uint32)</a>

```
searchKey: des.ksRotate
tags: [method private]
```

```Go
func ksRotate(in uint32) (out []uint32)
```

creates 16 28-bit blocks rotated according to the rotation schedule 

### <a id="permuteBlock" href="#permuteBlock">func permuteBlock(src uint64, permutation []uint8) (block uint64)</a>

```
searchKey: des.permuteBlock
tags: [method private]
```

```Go
func permuteBlock(src uint64, permutation []uint8) (block uint64)
```

general purpose function to perform DES block permutations 

### <a id="permuteFinalBlock" href="#permuteFinalBlock">func permuteFinalBlock(block uint64) uint64</a>

```
searchKey: des.permuteFinalBlock
tags: [method private]
```

```Go
func permuteFinalBlock(block uint64) uint64
```

permuteInitialBlock is equivalent to the permutation defined by finalPermutation. 

### <a id="permuteInitialBlock" href="#permuteInitialBlock">func permuteInitialBlock(block uint64) uint64</a>

```
searchKey: des.permuteInitialBlock
tags: [method private]
```

```Go
func permuteInitialBlock(block uint64) uint64
```

permuteInitialBlock is equivalent to the permutation defined by initialPermutation. 

### <a id="unpack" href="#unpack">func unpack(x uint64) uint64</a>

```
searchKey: des.unpack
tags: [method private]
```

```Go
func unpack(x uint64) uint64
```

Expand 48-bit input to 64-bit, with each 6-bit block padded by extra two bits at the top. By doing so, we can have the input blocks (four bits each), and the key blocks (six bits each) well-aligned without extra shifts/rotations for alignments. 

