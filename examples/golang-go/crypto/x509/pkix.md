# Package pkix

Package pkix contains shared, low level structures used for ASN.1 parsing and serialization of X.509 certificates, CRL and OCSP. 

## Index

* [Variables](#var)
    * [var attributeTypeNames](#attributeTypeNames)
    * [var oidCommonName](#oidCommonName)
    * [var oidCountry](#oidCountry)
    * [var oidLocality](#oidLocality)
    * [var oidOrganization](#oidOrganization)
    * [var oidOrganizationalUnit](#oidOrganizationalUnit)
    * [var oidPostalCode](#oidPostalCode)
    * [var oidProvince](#oidProvince)
    * [var oidSerialNumber](#oidSerialNumber)
    * [var oidStreetAddress](#oidStreetAddress)
* [Types](#type)
    * [type AlgorithmIdentifier struct](#AlgorithmIdentifier)
    * [type AttributeTypeAndValue struct](#AttributeTypeAndValue)
    * [type AttributeTypeAndValueSET struct](#AttributeTypeAndValueSET)
    * [type CertificateList struct](#CertificateList)
        * [func (certList *CertificateList) HasExpired(now time.Time) bool](#CertificateList.HasExpired)
    * [type Extension struct](#Extension)
    * [type Name struct](#Name)
        * [func (n *Name) FillFromRDNSequence(rdns *RDNSequence)](#Name.FillFromRDNSequence)
        * [func (n Name) String() string](#Name.String)
        * [func (n Name) ToRDNSequence() (ret RDNSequence)](#Name.ToRDNSequence)
        * [func (n Name) appendRDNs(in RDNSequence, values []string, oid asn1.ObjectIdentifier) RDNSequence](#Name.appendRDNs)
    * [type RDNSequence []pkix.RelativeDistinguishedNameSET](#RDNSequence)
        * [func (r RDNSequence) String() string](#RDNSequence.String)
    * [type RelativeDistinguishedNameSET []pkix.AttributeTypeAndValue](#RelativeDistinguishedNameSET)
    * [type RevokedCertificate struct](#RevokedCertificate)
    * [type TBSCertificateList struct](#TBSCertificateList)
* [Functions](#func)
    * [func oidInAttributeTypeAndValue(oid asn1.ObjectIdentifier, atv []AttributeTypeAndValue) bool](#oidInAttributeTypeAndValue)


## <a id="var" href="#var">Variables</a>

```
tags: [package]
```

### <a id="attributeTypeNames" href="#attributeTypeNames">var attributeTypeNames</a>

```
searchKey: pkix.attributeTypeNames
tags: [variable object private]
```

```Go
var attributeTypeNames = ...
```

### <a id="oidCommonName" href="#oidCommonName">var oidCommonName</a>

```
searchKey: pkix.oidCommonName
tags: [variable array number private]
```

```Go
var oidCommonName = []int{2, 5, 4, 3}
```

### <a id="oidCountry" href="#oidCountry">var oidCountry</a>

```
searchKey: pkix.oidCountry
tags: [variable array number private]
```

```Go
var oidCountry = []int{2, 5, 4, 6}
```

### <a id="oidLocality" href="#oidLocality">var oidLocality</a>

```
searchKey: pkix.oidLocality
tags: [variable array number private]
```

```Go
var oidLocality = []int{2, 5, 4, 7}
```

### <a id="oidOrganization" href="#oidOrganization">var oidOrganization</a>

```
searchKey: pkix.oidOrganization
tags: [variable array number private]
```

```Go
var oidOrganization = []int{2, 5, 4, 10}
```

### <a id="oidOrganizationalUnit" href="#oidOrganizationalUnit">var oidOrganizationalUnit</a>

```
searchKey: pkix.oidOrganizationalUnit
tags: [variable array number private]
```

```Go
var oidOrganizationalUnit = []int{2, 5, 4, 11}
```

### <a id="oidPostalCode" href="#oidPostalCode">var oidPostalCode</a>

```
searchKey: pkix.oidPostalCode
tags: [variable array number private]
```

```Go
var oidPostalCode = []int{2, 5, 4, 17}
```

### <a id="oidProvince" href="#oidProvince">var oidProvince</a>

```
searchKey: pkix.oidProvince
tags: [variable array number private]
```

```Go
var oidProvince = []int{2, 5, 4, 8}
```

### <a id="oidSerialNumber" href="#oidSerialNumber">var oidSerialNumber</a>

```
searchKey: pkix.oidSerialNumber
tags: [variable array number private]
```

```Go
var oidSerialNumber = []int{2, 5, 4, 5}
```

### <a id="oidStreetAddress" href="#oidStreetAddress">var oidStreetAddress</a>

```
searchKey: pkix.oidStreetAddress
tags: [variable array number private]
```

```Go
var oidStreetAddress = []int{2, 5, 4, 9}
```

## <a id="type" href="#type">Types</a>

```
tags: [package]
```

### <a id="AlgorithmIdentifier" href="#AlgorithmIdentifier">type AlgorithmIdentifier struct</a>

```
searchKey: pkix.AlgorithmIdentifier
tags: [struct]
```

```Go
type AlgorithmIdentifier struct {
	Algorithm  asn1.ObjectIdentifier
	Parameters asn1.RawValue `asn1:"optional"`
}
```

AlgorithmIdentifier represents the ASN.1 structure of the same name. See RFC 5280, section 4.1.1.2. 

### <a id="AttributeTypeAndValue" href="#AttributeTypeAndValue">type AttributeTypeAndValue struct</a>

```
searchKey: pkix.AttributeTypeAndValue
tags: [struct]
```

```Go
type AttributeTypeAndValue struct {
	Type  asn1.ObjectIdentifier
	Value interface{}
}
```

AttributeTypeAndValue mirrors the ASN.1 structure of the same name in RFC 5280, Section 4.1.2.4. 

### <a id="AttributeTypeAndValueSET" href="#AttributeTypeAndValueSET">type AttributeTypeAndValueSET struct</a>

```
searchKey: pkix.AttributeTypeAndValueSET
tags: [struct]
```

```Go
type AttributeTypeAndValueSET struct {
	Type  asn1.ObjectIdentifier
	Value [][]AttributeTypeAndValue `asn1:"set"`
}
```

AttributeTypeAndValueSET represents a set of ASN.1 sequences of AttributeTypeAndValue sequences from RFC 2986 (PKCS #10). 

### <a id="CertificateList" href="#CertificateList">type CertificateList struct</a>

```
searchKey: pkix.CertificateList
tags: [struct]
```

```Go
type CertificateList struct {
	TBSCertList        TBSCertificateList
	SignatureAlgorithm AlgorithmIdentifier
	SignatureValue     asn1.BitString
}
```

CertificateList represents the ASN.1 structure of the same name. See RFC 5280, section 5.1. Use Certificate.CheckCRLSignature to verify the signature. 

#### <a id="CertificateList.HasExpired" href="#CertificateList.HasExpired">func (certList *CertificateList) HasExpired(now time.Time) bool</a>

```
searchKey: pkix.CertificateList.HasExpired
tags: [method]
```

```Go
func (certList *CertificateList) HasExpired(now time.Time) bool
```

HasExpired reports whether certList should have been updated by now. 

### <a id="Extension" href="#Extension">type Extension struct</a>

```
searchKey: pkix.Extension
tags: [struct]
```

```Go
type Extension struct {
	Id       asn1.ObjectIdentifier
	Critical bool `asn1:"optional"`
	Value    []byte
}
```

Extension represents the ASN.1 structure of the same name. See RFC 5280, section 4.2. 

### <a id="Name" href="#Name">type Name struct</a>

```
searchKey: pkix.Name
tags: [struct]
```

```Go
type Name struct {
	Country, Organization, OrganizationalUnit []string
	Locality, Province                        []string
	StreetAddress, PostalCode                 []string
	SerialNumber, CommonName                  string

	// Names contains all parsed attributes. When parsing distinguished names,
	// this can be used to extract non-standard attributes that are not parsed
	// by this package. When marshaling to RDNSequences, the Names field is
	// ignored, see ExtraNames.
	Names []AttributeTypeAndValue

	// ExtraNames contains attributes to be copied, raw, into any marshaled
	// distinguished names. Values override any attributes with the same OID.
	// The ExtraNames field is not populated when parsing, see Names.
	ExtraNames []AttributeTypeAndValue
}
```

Name represents an X.509 distinguished name. This only includes the common elements of a DN. Note that Name is only an approximation of the X.509 structure. If an accurate representation is needed, asn1.Unmarshal the raw subject or issuer as an RDNSequence. 

#### <a id="Name.FillFromRDNSequence" href="#Name.FillFromRDNSequence">func (n *Name) FillFromRDNSequence(rdns *RDNSequence)</a>

```
searchKey: pkix.Name.FillFromRDNSequence
tags: [method]
```

```Go
func (n *Name) FillFromRDNSequence(rdns *RDNSequence)
```

FillFromRDNSequence populates n from the provided RDNSequence. Multi-entry RDNs are flattened, all entries are added to the relevant n fields, and the grouping is not preserved. 

#### <a id="Name.String" href="#Name.String">func (n Name) String() string</a>

```
searchKey: pkix.Name.String
tags: [function]
```

```Go
func (n Name) String() string
```

String returns the string form of n, roughly following the RFC 2253 Distinguished Names syntax. 

#### <a id="Name.ToRDNSequence" href="#Name.ToRDNSequence">func (n Name) ToRDNSequence() (ret RDNSequence)</a>

```
searchKey: pkix.Name.ToRDNSequence
tags: [function]
```

```Go
func (n Name) ToRDNSequence() (ret RDNSequence)
```

ToRDNSequence converts n into a single RDNSequence. The following attributes are encoded as multi-value RDNs: 

```
- Country
- Organization
- OrganizationalUnit
- Locality
- Province
- StreetAddress
- PostalCode

```
Each ExtraNames entry is encoded as an individual RDN. 

#### <a id="Name.appendRDNs" href="#Name.appendRDNs">func (n Name) appendRDNs(in RDNSequence, values []string, oid asn1.ObjectIdentifier) RDNSequence</a>

```
searchKey: pkix.Name.appendRDNs
tags: [method private]
```

```Go
func (n Name) appendRDNs(in RDNSequence, values []string, oid asn1.ObjectIdentifier) RDNSequence
```

appendRDNs appends a relativeDistinguishedNameSET to the given RDNSequence and returns the new value. The relativeDistinguishedNameSET contains an attributeTypeAndValue for each of the given values. See RFC 5280, A.1, and search for AttributeTypeAndValue. 

### <a id="RDNSequence" href="#RDNSequence">type RDNSequence []pkix.RelativeDistinguishedNameSET</a>

```
searchKey: pkix.RDNSequence
tags: [array array struct]
```

```Go
type RDNSequence []RelativeDistinguishedNameSET
```

#### <a id="RDNSequence.String" href="#RDNSequence.String">func (r RDNSequence) String() string</a>

```
searchKey: pkix.RDNSequence.String
tags: [function]
```

```Go
func (r RDNSequence) String() string
```

String returns a string representation of the sequence r, roughly following the RFC 2253 Distinguished Names syntax. 

### <a id="RelativeDistinguishedNameSET" href="#RelativeDistinguishedNameSET">type RelativeDistinguishedNameSET []pkix.AttributeTypeAndValue</a>

```
searchKey: pkix.RelativeDistinguishedNameSET
tags: [array struct]
```

```Go
type RelativeDistinguishedNameSET []AttributeTypeAndValue
```

### <a id="RevokedCertificate" href="#RevokedCertificate">type RevokedCertificate struct</a>

```
searchKey: pkix.RevokedCertificate
tags: [struct]
```

```Go
type RevokedCertificate struct {
	SerialNumber   *big.Int
	RevocationTime time.Time
	Extensions     []Extension `asn1:"optional"`
}
```

RevokedCertificate represents the ASN.1 structure of the same name. See RFC 5280, section 5.1. 

### <a id="TBSCertificateList" href="#TBSCertificateList">type TBSCertificateList struct</a>

```
searchKey: pkix.TBSCertificateList
tags: [struct]
```

```Go
type TBSCertificateList struct {
	Raw                 asn1.RawContent
	Version             int `asn1:"optional,default:0"`
	Signature           AlgorithmIdentifier
	Issuer              RDNSequence
	ThisUpdate          time.Time
	NextUpdate          time.Time            `asn1:"optional"`
	RevokedCertificates []RevokedCertificate `asn1:"optional"`
	Extensions          []Extension          `asn1:"tag:0,optional,explicit"`
}
```

TBSCertificateList represents the ASN.1 structure of the same name. See RFC 5280, section 5.1. 

## <a id="func" href="#func">Functions</a>

```
tags: [package]
```

### <a id="oidInAttributeTypeAndValue" href="#oidInAttributeTypeAndValue">func oidInAttributeTypeAndValue(oid asn1.ObjectIdentifier, atv []AttributeTypeAndValue) bool</a>

```
searchKey: pkix.oidInAttributeTypeAndValue
tags: [method private]
```

```Go
func oidInAttributeTypeAndValue(oid asn1.ObjectIdentifier, atv []AttributeTypeAndValue) bool
```

oidInAttributeTypeAndValue reports whether a type with the given OID exists in atv. 

