# Package tls

Package tls partially implements TLS 1.2, as specified in RFC 5246, and TLS 1.3, as specified in RFC 8446. 

## Index

* [Constants](#const)
    * [const alertLevelWarning](#alertLevelWarning)
    * [const alertLevelError](#alertLevelError)
    * [const alertCloseNotify](#alertCloseNotify)
    * [const alertUnexpectedMessage](#alertUnexpectedMessage)
    * [const alertBadRecordMAC](#alertBadRecordMAC)
    * [const alertDecryptionFailed](#alertDecryptionFailed)
    * [const alertRecordOverflow](#alertRecordOverflow)
    * [const alertDecompressionFailure](#alertDecompressionFailure)
    * [const alertHandshakeFailure](#alertHandshakeFailure)
    * [const alertBadCertificate](#alertBadCertificate)
    * [const alertUnsupportedCertificate](#alertUnsupportedCertificate)
    * [const alertCertificateRevoked](#alertCertificateRevoked)
    * [const alertCertificateExpired](#alertCertificateExpired)
    * [const alertCertificateUnknown](#alertCertificateUnknown)
    * [const alertIllegalParameter](#alertIllegalParameter)
    * [const alertUnknownCA](#alertUnknownCA)
    * [const alertAccessDenied](#alertAccessDenied)
    * [const alertDecodeError](#alertDecodeError)
    * [const alertDecryptError](#alertDecryptError)
    * [const alertExportRestriction](#alertExportRestriction)
    * [const alertProtocolVersion](#alertProtocolVersion)
    * [const alertInsufficientSecurity](#alertInsufficientSecurity)
    * [const alertInternalError](#alertInternalError)
    * [const alertInappropriateFallback](#alertInappropriateFallback)
    * [const alertUserCanceled](#alertUserCanceled)
    * [const alertNoRenegotiation](#alertNoRenegotiation)
    * [const alertMissingExtension](#alertMissingExtension)
    * [const alertUnsupportedExtension](#alertUnsupportedExtension)
    * [const alertCertificateUnobtainable](#alertCertificateUnobtainable)
    * [const alertUnrecognizedName](#alertUnrecognizedName)
    * [const alertBadCertificateStatusResponse](#alertBadCertificateStatusResponse)
    * [const alertBadCertificateHashValue](#alertBadCertificateHashValue)
    * [const alertUnknownPSKIdentity](#alertUnknownPSKIdentity)
    * [const alertCertificateRequired](#alertCertificateRequired)
    * [const alertNoApplicationProtocol](#alertNoApplicationProtocol)
    * [const serverSignatureContext](#serverSignatureContext)
    * [const clientSignatureContext](#clientSignatureContext)
    * [const suiteECDHE](#suiteECDHE)
    * [const suiteECSign](#suiteECSign)
    * [const suiteTLS12](#suiteTLS12)
    * [const suiteSHA384](#suiteSHA384)
    * [const aeadNonceLength](#aeadNonceLength)
    * [const noncePrefixLength](#noncePrefixLength)
    * [const TLS_RSA_WITH_RC4_128_SHA](#TLS_RSA_WITH_RC4_128_SHA)
    * [const TLS_RSA_WITH_3DES_EDE_CBC_SHA](#TLS_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const TLS_RSA_WITH_AES_128_CBC_SHA](#TLS_RSA_WITH_AES_128_CBC_SHA)
    * [const TLS_RSA_WITH_AES_256_CBC_SHA](#TLS_RSA_WITH_AES_256_CBC_SHA)
    * [const TLS_RSA_WITH_AES_128_CBC_SHA256](#TLS_RSA_WITH_AES_128_CBC_SHA256)
    * [const TLS_RSA_WITH_AES_128_GCM_SHA256](#TLS_RSA_WITH_AES_128_GCM_SHA256)
    * [const TLS_RSA_WITH_AES_256_GCM_SHA384](#TLS_RSA_WITH_AES_256_GCM_SHA384)
    * [const TLS_ECDHE_ECDSA_WITH_RC4_128_SHA](#TLS_ECDHE_ECDSA_WITH_RC4_128_SHA)
    * [const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA](#TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA)
    * [const TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA](#TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA)
    * [const TLS_ECDHE_RSA_WITH_RC4_128_SHA](#TLS_ECDHE_RSA_WITH_RC4_128_SHA)
    * [const TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA](#TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA)
    * [const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA](#TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA)
    * [const TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA](#TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA)
    * [const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256](#TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256)
    * [const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256](#TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256)
    * [const TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256](#TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256)
    * [const TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256](#TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256)
    * [const TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384](#TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384)
    * [const TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384](#TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384)
    * [const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256](#TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256)
    * [const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256](#TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256)
    * [const TLS_AES_128_GCM_SHA256](#TLS_AES_128_GCM_SHA256)
    * [const TLS_AES_256_GCM_SHA384](#TLS_AES_256_GCM_SHA384)
    * [const TLS_CHACHA20_POLY1305_SHA256](#TLS_CHACHA20_POLY1305_SHA256)
    * [const TLS_FALLBACK_SCSV](#TLS_FALLBACK_SCSV)
    * [const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305](#TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305)
    * [const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305](#TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305)
    * [const VersionTLS10](#VersionTLS10)
    * [const VersionTLS11](#VersionTLS11)
    * [const VersionTLS12](#VersionTLS12)
    * [const VersionTLS13](#VersionTLS13)
    * [const VersionSSL30](#VersionSSL30)
    * [const maxPlaintext](#maxPlaintext)
    * [const maxCiphertext](#maxCiphertext)
    * [const maxCiphertextTLS13](#maxCiphertextTLS13)
    * [const recordHeaderLen](#recordHeaderLen)
    * [const maxHandshake](#maxHandshake)
    * [const maxUselessRecords](#maxUselessRecords)
    * [const recordTypeChangeCipherSpec](#recordTypeChangeCipherSpec)
    * [const recordTypeAlert](#recordTypeAlert)
    * [const recordTypeHandshake](#recordTypeHandshake)
    * [const recordTypeApplicationData](#recordTypeApplicationData)
    * [const typeHelloRequest](#typeHelloRequest)
    * [const typeClientHello](#typeClientHello)
    * [const typeServerHello](#typeServerHello)
    * [const typeNewSessionTicket](#typeNewSessionTicket)
    * [const typeEndOfEarlyData](#typeEndOfEarlyData)
    * [const typeEncryptedExtensions](#typeEncryptedExtensions)
    * [const typeCertificate](#typeCertificate)
    * [const typeServerKeyExchange](#typeServerKeyExchange)
    * [const typeCertificateRequest](#typeCertificateRequest)
    * [const typeServerHelloDone](#typeServerHelloDone)
    * [const typeCertificateVerify](#typeCertificateVerify)
    * [const typeClientKeyExchange](#typeClientKeyExchange)
    * [const typeFinished](#typeFinished)
    * [const typeCertificateStatus](#typeCertificateStatus)
    * [const typeKeyUpdate](#typeKeyUpdate)
    * [const typeNextProtocol](#typeNextProtocol)
    * [const typeMessageHash](#typeMessageHash)
    * [const compressionNone](#compressionNone)
    * [const extensionServerName](#extensionServerName)
    * [const extensionStatusRequest](#extensionStatusRequest)
    * [const extensionSupportedCurves](#extensionSupportedCurves)
    * [const extensionSupportedPoints](#extensionSupportedPoints)
    * [const extensionSignatureAlgorithms](#extensionSignatureAlgorithms)
    * [const extensionALPN](#extensionALPN)
    * [const extensionSCT](#extensionSCT)
    * [const extensionSessionTicket](#extensionSessionTicket)
    * [const extensionPreSharedKey](#extensionPreSharedKey)
    * [const extensionEarlyData](#extensionEarlyData)
    * [const extensionSupportedVersions](#extensionSupportedVersions)
    * [const extensionCookie](#extensionCookie)
    * [const extensionPSKModes](#extensionPSKModes)
    * [const extensionCertificateAuthorities](#extensionCertificateAuthorities)
    * [const extensionSignatureAlgorithmsCert](#extensionSignatureAlgorithmsCert)
    * [const extensionKeyShare](#extensionKeyShare)
    * [const extensionRenegotiationInfo](#extensionRenegotiationInfo)
    * [const scsvRenegotiation](#scsvRenegotiation)
    * [const CurveP256](#CurveP256)
    * [const CurveP384](#CurveP384)
    * [const CurveP521](#CurveP521)
    * [const X25519](#X25519)
    * [const pskModePlain](#pskModePlain)
    * [const pskModeDHE](#pskModeDHE)
    * [const pointFormatUncompressed](#pointFormatUncompressed)
    * [const statusTypeOCSP](#statusTypeOCSP)
    * [const certTypeRSASign](#certTypeRSASign)
    * [const certTypeECDSASign](#certTypeECDSASign)
    * [const signaturePKCS1v15](#signaturePKCS1v15)
    * [const signatureRSAPSS](#signatureRSAPSS)
    * [const signatureECDSA](#signatureECDSA)
    * [const signatureEd25519](#signatureEd25519)
    * [const downgradeCanaryTLS12](#downgradeCanaryTLS12)
    * [const downgradeCanaryTLS11](#downgradeCanaryTLS11)
    * [const NoClientCert](#NoClientCert)
    * [const RequestClientCert](#RequestClientCert)
    * [const RequireAnyClientCert](#RequireAnyClientCert)
    * [const VerifyClientCertIfGiven](#VerifyClientCertIfGiven)
    * [const RequireAndVerifyClientCert](#RequireAndVerifyClientCert)
    * [const PKCS1WithSHA256](#PKCS1WithSHA256)
    * [const PKCS1WithSHA384](#PKCS1WithSHA384)
    * [const PKCS1WithSHA512](#PKCS1WithSHA512)
    * [const PSSWithSHA256](#PSSWithSHA256)
    * [const PSSWithSHA384](#PSSWithSHA384)
    * [const PSSWithSHA512](#PSSWithSHA512)
    * [const ECDSAWithP256AndSHA256](#ECDSAWithP256AndSHA256)
    * [const ECDSAWithP384AndSHA384](#ECDSAWithP384AndSHA384)
    * [const ECDSAWithP521AndSHA512](#ECDSAWithP521AndSHA512)
    * [const Ed25519](#Ed25519)
    * [const PKCS1WithSHA1](#PKCS1WithSHA1)
    * [const ECDSAWithSHA1](#ECDSAWithSHA1)
    * [const RenegotiateNever](#RenegotiateNever)
    * [const RenegotiateOnceAsClient](#RenegotiateOnceAsClient)
    * [const RenegotiateFreelyAsClient](#RenegotiateFreelyAsClient)
    * [const ticketKeyNameLen](#ticketKeyNameLen)
    * [const ticketKeyLifetime](#ticketKeyLifetime)
    * [const ticketKeyRotation](#ticketKeyRotation)
    * [const maxSessionTicketLifetime](#maxSessionTicketLifetime)
    * [const keyLogLabelTLS12](#keyLogLabelTLS12)
    * [const keyLogLabelClientHandshake](#keyLogLabelClientHandshake)
    * [const keyLogLabelServerHandshake](#keyLogLabelServerHandshake)
    * [const keyLogLabelClientTraffic](#keyLogLabelClientTraffic)
    * [const keyLogLabelServerTraffic](#keyLogLabelServerTraffic)
    * [const _SignatureScheme_name_0](#_SignatureScheme_name_0)
    * [const _SignatureScheme_name_1](#_SignatureScheme_name_1)
    * [const _SignatureScheme_name_2](#_SignatureScheme_name_2)
    * [const _SignatureScheme_name_3](#_SignatureScheme_name_3)
    * [const _SignatureScheme_name_4](#_SignatureScheme_name_4)
    * [const _SignatureScheme_name_5](#_SignatureScheme_name_5)
    * [const _SignatureScheme_name_6](#_SignatureScheme_name_6)
    * [const _SignatureScheme_name_7](#_SignatureScheme_name_7)
    * [const _SignatureScheme_name_8](#_SignatureScheme_name_8)
    * [const _CurveID_name_0](#_CurveID_name_0)
    * [const _CurveID_name_1](#_CurveID_name_1)
    * [const _ClientAuthType_name](#_ClientAuthType_name)
    * [const tcpMSSEstimate](#tcpMSSEstimate)
    * [const recordSizeBoostThreshold](#recordSizeBoostThreshold)
    * [const maxClientPSKIdentities](#maxClientPSKIdentities)
    * [const resumptionBinderLabel](#resumptionBinderLabel)
    * [const clientHandshakeTrafficLabel](#clientHandshakeTrafficLabel)
    * [const serverHandshakeTrafficLabel](#serverHandshakeTrafficLabel)
    * [const clientApplicationTrafficLabel](#clientApplicationTrafficLabel)
    * [const serverApplicationTrafficLabel](#serverApplicationTrafficLabel)
    * [const exporterLabel](#exporterLabel)
    * [const resumptionLabel](#resumptionLabel)
    * [const trafficUpdateLabel](#trafficUpdateLabel)
    * [const masterSecretLength](#masterSecretLength)
    * [const finishedVerifyLength](#finishedVerifyLength)
    * [const opensslRenegotiate](#opensslRenegotiate)
    * [const opensslSendSentinel](#opensslSendSentinel)
    * [const opensslKeyUpdate](#opensslKeyUpdate)
    * [const opensslSentinel](#opensslSentinel)
    * [const opensslEndOfHandshake](#opensslEndOfHandshake)
    * [const opensslReadKeyUpdate](#opensslReadKeyUpdate)
    * [const sctsBase64](#sctsBase64)
    * [const localFlakes](#localFlakes)
    * [const clientCertificatePEM](#clientCertificatePEM)
    * [const clientECDSACertificatePEM](#clientECDSACertificatePEM)
    * [const clientEd25519CertificatePEM](#clientEd25519CertificatePEM)
* [Variables](#var)
    * [var alertText](#alertText)
    * [var signaturePadding](#signaturePadding)
    * [var rsaSignatureSchemes](#rsaSignatureSchemes)
    * [var supportedUpToTLS12](#supportedUpToTLS12)
    * [var supportedOnlyTLS12](#supportedOnlyTLS12)
    * [var supportedOnlyTLS13](#supportedOnlyTLS13)
    * [var cipherSuites](#cipherSuites)
    * [var cipherSuitesTLS13](#cipherSuitesTLS13)
    * [var cipherSuitesPreferenceOrder](#cipherSuitesPreferenceOrder)
    * [var cipherSuitesPreferenceOrderNoAES](#cipherSuitesPreferenceOrderNoAES)
    * [var disabledCipherSuites](#disabledCipherSuites)
    * [var defaultCipherSuitesLen](#defaultCipherSuitesLen)
    * [var defaultCipherSuites](#defaultCipherSuites)
    * [var defaultCipherSuitesTLS13](#defaultCipherSuitesTLS13)
    * [var defaultCipherSuitesTLS13NoAES](#defaultCipherSuitesTLS13NoAES)
    * [var hasGCMAsmAMD64](#hasGCMAsmAMD64)
    * [var hasGCMAsmARM64](#hasGCMAsmARM64)
    * [var hasGCMAsmS390X](#hasGCMAsmS390X)
    * [var hasAESGCMHardwareSupport](#hasAESGCMHardwareSupport)
    * [var aesgcmCiphers](#aesgcmCiphers)
    * [var nonAESGCMAEADCiphers](#nonAESGCMAEADCiphers)
    * [var directSigning](#directSigning)
    * [var supportedSignatureAlgorithms](#supportedSignatureAlgorithms)
    * [var helloRetryRequestRandom](#helloRetryRequestRandom)
    * [var testingOnlyForceDowngradeCanary](#testingOnlyForceDowngradeCanary)
    * [var deprecatedSessionTicketKey](#deprecatedSessionTicketKey)
    * [var supportedVersions](#supportedVersions)
    * [var defaultCurvePreferences](#defaultCurvePreferences)
    * [var errNoCertificates](#errNoCertificates)
    * [var writerMutex](#writerMutex)
    * [var emptyConfig](#emptyConfig)
    * [var _SignatureScheme_index_8](#_SignatureScheme_index_8)
    * [var _CurveID_index_0](#_CurveID_index_0)
    * [var _ClientAuthType_index](#_ClientAuthType_index)
    * [var outBufPool](#outBufPool)
    * [var errShutdown](#errShutdown)
    * [var errEarlyCloseWrite](#errEarlyCloseWrite)
    * [var errClientKeyExchange](#errClientKeyExchange)
    * [var errServerKeyExchange](#errServerKeyExchange)
    * [var masterSecretLabel](#masterSecretLabel)
    * [var keyExpansionLabel](#keyExpansionLabel)
    * [var clientFinishedLabel](#clientFinishedLabel)
    * [var serverFinishedLabel](#serverFinishedLabel)
    * [var padding255Bad](#padding255Bad)
    * [var padding255Good](#padding255Good)
    * [var paddingTests](#paddingTests)
    * [var certExampleCom](#certExampleCom)
    * [var certWildcardExampleCom](#certWildcardExampleCom)
    * [var certFooExampleCom](#certFooExampleCom)
    * [var serverCommand](#serverCommand)
    * [var hostnameInSNITests](#hostnameInSNITests)
    * [var brokenConnErr](#brokenConnErr)
    * [var getClientCertificateTests](#getClientCertificateTests)
    * [var tests](#tests)
    * [var badProtocolVersions](#badProtocolVersions)
    * [var defaultClientCommand](#defaultClientCommand)
    * [var getConfigForClientTests](#getConfigForClientTests)
    * [var update](#update)
    * [var fast](#fast)
    * [var keyFile](#keyFile)
    * [var localListener](#localListener)
    * [var isConnRefused](#isConnRefused)
    * [var testConfig](#testConfig)
    * [var testRSACertificate](#testRSACertificate)
    * [var testRSACertificateIssuer](#testRSACertificateIssuer)
    * [var testRSAPSSCertificate](#testRSAPSSCertificate)
    * [var testECDSACertificate](#testECDSACertificate)
    * [var testEd25519Certificate](#testEd25519Certificate)
    * [var testSNICertificate](#testSNICertificate)
    * [var testP256Certificate](#testP256Certificate)
    * [var testRSAPrivateKey](#testRSAPrivateKey)
    * [var testECDSAPrivateKey](#testECDSAPrivateKey)
    * [var testP256PrivateKey](#testP256PrivateKey)
    * [var testEd25519PrivateKey](#testEd25519PrivateKey)
    * [var clientKeyPEM](#clientKeyPEM)
    * [var clientECDSAKeyPEM](#clientECDSAKeyPEM)
    * [var clientEd25519KeyPEM](#clientEd25519KeyPEM)
    * [var testSplitPreMasterSecretTests](#testSplitPreMasterSecretTests)
    * [var testKeysFromTests](#testKeysFromTests)
    * [var rsaCertPEM](#rsaCertPEM)
    * [var rsaKeyPEM](#rsaKeyPEM)
    * [var keyPEM](#keyPEM)
    * [var ecdsaCertPEM](#ecdsaCertPEM)
    * [var ecdsaKeyPEM](#ecdsaKeyPEM)
    * [var keyPairTests](#keyPairTests)
* [Types](#type)
    * [type alert uint8](#alert)
        * [func (e alert) String() string](#alert.String)
        * [func (e alert) Error() string](#alert.Error)
    * [type CipherSuite struct](#CipherSuite)
    * [type cipherSuite struct](#cipherSuite)
        * [func selectCipherSuite(ids, supportedIDs []uint16, ok func(*cipherSuite) bool) *cipherSuite](#selectCipherSuite)
        * [func mutualCipherSuite(have []uint16, want uint16) *cipherSuite](#mutualCipherSuite)
        * [func cipherSuiteByID(id uint16) *cipherSuite](#cipherSuiteByID)
    * [type cipherSuiteTLS13 struct](#cipherSuiteTLS13)
        * [func mutualCipherSuiteTLS13(have []uint16, want uint16) *cipherSuiteTLS13](#mutualCipherSuiteTLS13)
        * [func cipherSuiteTLS13ByID(id uint16) *cipherSuiteTLS13](#cipherSuiteTLS13ByID)
        * [func (c *cipherSuiteTLS13) expandLabel(secret []byte, label string, context []byte, length int) []byte](#cipherSuiteTLS13.expandLabel)
        * [func (c *cipherSuiteTLS13) deriveSecret(secret []byte, label string, transcript hash.Hash) []byte](#cipherSuiteTLS13.deriveSecret)
        * [func (c *cipherSuiteTLS13) extract(newSecret, currentSecret []byte) []byte](#cipherSuiteTLS13.extract)
        * [func (c *cipherSuiteTLS13) nextTrafficSecret(trafficSecret []byte) []byte](#cipherSuiteTLS13.nextTrafficSecret)
        * [func (c *cipherSuiteTLS13) trafficKey(trafficSecret []byte) (key, iv []byte)](#cipherSuiteTLS13.trafficKey)
        * [func (c *cipherSuiteTLS13) finishedHash(baseKey []byte, transcript hash.Hash) []byte](#cipherSuiteTLS13.finishedHash)
        * [func (c *cipherSuiteTLS13) exportKeyingMaterial(masterSecret []byte, transcript hash.Hash) func(string, []byte, int) ([]byte, error)](#cipherSuiteTLS13.exportKeyingMaterial)
    * [type aead interface](#aead)
        * [func aeadAESGCM(key, noncePrefix []byte) aead](#aeadAESGCM)
        * [func aeadAESGCMTLS13(key, nonceMask []byte) aead](#aeadAESGCMTLS13)
        * [func aeadChaCha20Poly1305(key, nonceMask []byte) aead](#aeadChaCha20Poly1305)
    * [type prefixNonceAEAD struct](#prefixNonceAEAD)
        * [func (f *prefixNonceAEAD) NonceSize() int](#prefixNonceAEAD.NonceSize)
        * [func (f *prefixNonceAEAD) Overhead() int](#prefixNonceAEAD.Overhead)
        * [func (f *prefixNonceAEAD) explicitNonceLen() int](#prefixNonceAEAD.explicitNonceLen)
        * [func (f *prefixNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte](#prefixNonceAEAD.Seal)
        * [func (f *prefixNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)](#prefixNonceAEAD.Open)
    * [type xorNonceAEAD struct](#xorNonceAEAD)
        * [func (f *xorNonceAEAD) NonceSize() int](#xorNonceAEAD.NonceSize)
        * [func (f *xorNonceAEAD) Overhead() int](#xorNonceAEAD.Overhead)
        * [func (f *xorNonceAEAD) explicitNonceLen() int](#xorNonceAEAD.explicitNonceLen)
        * [func (f *xorNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte](#xorNonceAEAD.Seal)
        * [func (f *xorNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)](#xorNonceAEAD.Open)
    * [type constantTimeHash interface](#constantTimeHash)
    * [type cthWrapper struct](#cthWrapper)
        * [func (c *cthWrapper) Size() int](#cthWrapper.Size)
        * [func (c *cthWrapper) BlockSize() int](#cthWrapper.BlockSize)
        * [func (c *cthWrapper) Reset()](#cthWrapper.Reset)
        * [func (c *cthWrapper) Write(p []byte) (int, error)](#cthWrapper.Write)
        * [func (c *cthWrapper) Sum(b []byte) []byte](#cthWrapper.Sum)
    * [type recordType uint8](#recordType)
    * [type CurveID uint16](#CurveID)
        * [func (i CurveID) String() string](#CurveID.String)
    * [type keyShare struct](#keyShare)
    * [type pskIdentity struct](#pskIdentity)
    * [type ConnectionState struct](#ConnectionState)
        * [func testHandshake(t *testing.T, clientConfig, serverConfig *Config) (serverState, clientState ConnectionState, err error)](#testHandshake)
        * [func (cs *ConnectionState) ExportKeyingMaterial(label string, context []byte, length int) ([]byte, error)](#ConnectionState.ExportKeyingMaterial)
    * [type ClientAuthType int](#ClientAuthType)
        * [func (i ClientAuthType) String() string](#ClientAuthType.String)
    * [type ClientSessionState struct](#ClientSessionState)
    * [type ClientSessionCache interface](#ClientSessionCache)
        * [func NewLRUClientSessionCache(capacity int) ClientSessionCache](#NewLRUClientSessionCache)
    * [type SignatureScheme uint16](#SignatureScheme)
        * [func selectSignatureScheme(vers uint16, c *Certificate, peerAlgs []SignatureScheme) (SignatureScheme, error)](#selectSignatureScheme)
        * [func (i SignatureScheme) String() string](#SignatureScheme.String)
    * [type ClientHelloInfo struct](#ClientHelloInfo)
        * [func clientHelloInfo(ctx context.Context, c *Conn, clientHello *clientHelloMsg) *ClientHelloInfo](#clientHelloInfo)
        * [func (c *ClientHelloInfo) Context() context.Context](#ClientHelloInfo.Context)
        * [func (chi *ClientHelloInfo) SupportsCertificate(c *Certificate) error](#ClientHelloInfo.SupportsCertificate)
    * [type CertificateRequestInfo struct](#CertificateRequestInfo)
        * [func certificateRequestInfoFromMsg(ctx context.Context, vers uint16, certReq *certificateRequestMsg) *CertificateRequestInfo](#certificateRequestInfoFromMsg)
        * [func (c *CertificateRequestInfo) Context() context.Context](#CertificateRequestInfo.Context)
        * [func (cri *CertificateRequestInfo) SupportsCertificate(c *Certificate) error](#CertificateRequestInfo.SupportsCertificate)
    * [type RenegotiationSupport int](#RenegotiationSupport)
    * [type Config struct](#Config)
        * [func defaultConfig() *Config](#defaultConfig)
        * [func (c *Config) ticketKeyFromBytes(b [32]byte) (key ticketKey)](#Config.ticketKeyFromBytes)
        * [func (c *Config) Clone() *Config](#Config.Clone)
        * [func (c *Config) initLegacySessionTicketKeyRLocked()](#Config.initLegacySessionTicketKeyRLocked)
        * [func (c *Config) ticketKeys(configForClient *Config) []ticketKey](#Config.ticketKeys)
        * [func (c *Config) SetSessionTicketKeys(keys [][32]byte)](#Config.SetSessionTicketKeys)
        * [func (c *Config) rand() io.Reader](#Config.rand)
        * [func (c *Config) time() time.Time](#Config.time)
        * [func (c *Config) cipherSuites() []uint16](#Config.cipherSuites)
        * [func (c *Config) supportedVersions() []uint16](#Config.supportedVersions)
        * [func (c *Config) maxSupportedVersion() uint16](#Config.maxSupportedVersion)
        * [func (c *Config) curvePreferences() []CurveID](#Config.curvePreferences)
        * [func (c *Config) supportsCurve(curve CurveID) bool](#Config.supportsCurve)
        * [func (c *Config) mutualVersion(peerVersions []uint16) (uint16, bool)](#Config.mutualVersion)
        * [func (c *Config) getCertificate(clientHello *ClientHelloInfo) (*Certificate, error)](#Config.getCertificate)
        * [func (c *Config) BuildNameToCertificate()](#Config.BuildNameToCertificate)
        * [func (c *Config) writeKeyLog(label string, clientRandom, secret []byte) error](#Config.writeKeyLog)
    * [type ticketKey struct](#ticketKey)
    * [type Certificate struct](#Certificate)
        * [func LoadX509KeyPair(certFile, keyFile string) (Certificate, error)](#LoadX509KeyPair)
        * [func X509KeyPair(certPEMBlock, keyPEMBlock []byte) (Certificate, error)](#X509KeyPair)
        * [func (c *Certificate) leaf() (*x509.Certificate, error)](#Certificate.leaf)
    * [type handshakeMessage interface](#handshakeMessage)
    * [type lruSessionCache struct](#lruSessionCache)
        * [func (c *lruSessionCache) Put(sessionKey string, cs *ClientSessionState)](#lruSessionCache.Put)
        * [func (c *lruSessionCache) Get(sessionKey string) (*ClientSessionState, bool)](#lruSessionCache.Get)
    * [type lruSessionCacheEntry struct](#lruSessionCacheEntry)
    * [type Conn struct](#Conn)
        * [func Server(conn net.Conn, config *Config) *Conn](#Server)
        * [func Client(conn net.Conn, config *Config) *Conn](#Client)
        * [func DialWithDialer(dialer *net.Dialer, network, addr string, config *Config) (*Conn, error)](#DialWithDialer)
        * [func dial(ctx context.Context, netDialer *net.Dialer, network, addr string, config *Config) (*Conn, error)](#dial)
        * [func Dial(network, addr string, config *Config) (*Conn, error)](#Dial)
        * [func (c *Conn) LocalAddr() net.Addr](#Conn.LocalAddr)
        * [func (c *Conn) RemoteAddr() net.Addr](#Conn.RemoteAddr)
        * [func (c *Conn) SetDeadline(t time.Time) error](#Conn.SetDeadline)
        * [func (c *Conn) SetReadDeadline(t time.Time) error](#Conn.SetReadDeadline)
        * [func (c *Conn) SetWriteDeadline(t time.Time) error](#Conn.SetWriteDeadline)
        * [func (c *Conn) newRecordHeaderError(conn net.Conn, msg string) (err RecordHeaderError)](#Conn.newRecordHeaderError)
        * [func (c *Conn) readRecord() error](#Conn.readRecord)
        * [func (c *Conn) readChangeCipherSpec() error](#Conn.readChangeCipherSpec)
        * [func (c *Conn) readRecordOrCCS(expectChangeCipherSpec bool) error](#Conn.readRecordOrCCS)
        * [func (c *Conn) retryReadRecord(expectChangeCipherSpec bool) error](#Conn.retryReadRecord)
        * [func (c *Conn) readFromUntil(r io.Reader, n int) error](#Conn.readFromUntil)
        * [func (c *Conn) sendAlertLocked(err alert) error](#Conn.sendAlertLocked)
        * [func (c *Conn) sendAlert(err alert) error](#Conn.sendAlert)
        * [func (c *Conn) maxPayloadSizeForWrite(typ recordType) int](#Conn.maxPayloadSizeForWrite)
        * [func (c *Conn) write(data []byte) (int, error)](#Conn.write)
        * [func (c *Conn) flush() (int, error)](#Conn.flush)
        * [func (c *Conn) writeRecordLocked(typ recordType, data []byte) (int, error)](#Conn.writeRecordLocked)
        * [func (c *Conn) writeRecord(typ recordType, data []byte) (int, error)](#Conn.writeRecord)
        * [func (c *Conn) readHandshake() (interface{}, error)](#Conn.readHandshake)
        * [func (c *Conn) Write(b []byte) (int, error)](#Conn.Write)
        * [func (c *Conn) handleRenegotiation() error](#Conn.handleRenegotiation)
        * [func (c *Conn) handlePostHandshakeMessage() error](#Conn.handlePostHandshakeMessage)
        * [func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error](#Conn.handleKeyUpdate)
        * [func (c *Conn) Read(b []byte) (int, error)](#Conn.Read)
        * [func (c *Conn) Close() error](#Conn.Close)
        * [func (c *Conn) CloseWrite() error](#Conn.CloseWrite)
        * [func (c *Conn) closeNotify() error](#Conn.closeNotify)
        * [func (c *Conn) Handshake() error](#Conn.Handshake)
        * [func (c *Conn) HandshakeContext(ctx context.Context) error](#Conn.HandshakeContext)
        * [func (c *Conn) handshakeContext(ctx context.Context) (ret error)](#Conn.handshakeContext)
        * [func (c *Conn) ConnectionState() ConnectionState](#Conn.ConnectionState)
        * [func (c *Conn) connectionStateLocked() ConnectionState](#Conn.connectionStateLocked)
        * [func (c *Conn) OCSPResponse() []byte](#Conn.OCSPResponse)
        * [func (c *Conn) VerifyHostname(host string) error](#Conn.VerifyHostname)
        * [func (c *Conn) handshakeComplete() bool](#Conn.handshakeComplete)
        * [func (c *Conn) makeClientHello() (*clientHelloMsg, ecdheParameters, error)](#Conn.makeClientHello)
        * [func (c *Conn) clientHandshake(ctx context.Context) (err error)](#Conn.clientHandshake)
        * [func (c *Conn) loadSession(hello *clientHelloMsg) (cacheKey string,...](#Conn.loadSession)
        * [func (c *Conn) pickTLSVersion(serverHello *serverHelloMsg) error](#Conn.pickTLSVersion)
        * [func (c *Conn) verifyServerCertificate(certificates [][]byte) error](#Conn.verifyServerCertificate)
        * [func (c *Conn) getClientCertificate(cri *CertificateRequestInfo) (*Certificate, error)](#Conn.getClientCertificate)
        * [func (c *Conn) handleNewSessionTicket(msg *newSessionTicketMsgTLS13) error](#Conn.handleNewSessionTicket)
        * [func (c *Conn) serverHandshake(ctx context.Context) error](#Conn.serverHandshake)
        * [func (c *Conn) readClientHello(ctx context.Context) (*clientHelloMsg, error)](#Conn.readClientHello)
        * [func (c *Conn) processCertsFromClient(certificate Certificate) error](#Conn.processCertsFromClient)
        * [func (c *Conn) encryptTicket(state []byte) ([]byte, error)](#Conn.encryptTicket)
        * [func (c *Conn) decryptTicket(encrypted []byte) (plaintext []byte, usedOldKey bool)](#Conn.decryptTicket)
    * [type halfConn struct](#halfConn)
        * [func (hc *halfConn) setErrorLocked(err error) error](#halfConn.setErrorLocked)
        * [func (hc *halfConn) prepareCipherSpec(version uint16, cipher interface{}, mac hash.Hash)](#halfConn.prepareCipherSpec)
        * [func (hc *halfConn) changeCipherSpec() error](#halfConn.changeCipherSpec)
        * [func (hc *halfConn) setTrafficSecret(suite *cipherSuiteTLS13, secret []byte)](#halfConn.setTrafficSecret)
        * [func (hc *halfConn) incSeq()](#halfConn.incSeq)
        * [func (hc *halfConn) explicitNonceLen() int](#halfConn.explicitNonceLen)
        * [func (hc *halfConn) decrypt(record []byte) ([]byte, recordType, error)](#halfConn.decrypt)
        * [func (hc *halfConn) encrypt(record, payload []byte, rand io.Reader) ([]byte, error)](#halfConn.encrypt)
    * [type permanentError struct](#permanentError)
        * [func (e *permanentError) Error() string](#permanentError.Error)
        * [func (e *permanentError) Unwrap() error](#permanentError.Unwrap)
        * [func (e *permanentError) Timeout() bool](#permanentError.Timeout)
        * [func (e *permanentError) Temporary() bool](#permanentError.Temporary)
    * [type cbcMode interface](#cbcMode)
    * [type RecordHeaderError struct](#RecordHeaderError)
        * [func (e RecordHeaderError) Error() string](#RecordHeaderError.Error)
    * [type atLeastReader struct](#atLeastReader)
        * [func (r *atLeastReader) Read(p []byte) (int, error)](#atLeastReader.Read)
    * [type clientHandshakeState struct](#clientHandshakeState)
        * [func (hs *clientHandshakeState) handshake() error](#clientHandshakeState.handshake)
        * [func (hs *clientHandshakeState) pickCipherSuite() error](#clientHandshakeState.pickCipherSuite)
        * [func (hs *clientHandshakeState) doFullHandshake() error](#clientHandshakeState.doFullHandshake)
        * [func (hs *clientHandshakeState) establishKeys() error](#clientHandshakeState.establishKeys)
        * [func (hs *clientHandshakeState) serverResumedSession() bool](#clientHandshakeState.serverResumedSession)
        * [func (hs *clientHandshakeState) processServerHello() (bool, error)](#clientHandshakeState.processServerHello)
        * [func (hs *clientHandshakeState) readFinished(out []byte) error](#clientHandshakeState.readFinished)
        * [func (hs *clientHandshakeState) readSessionTicket() error](#clientHandshakeState.readSessionTicket)
        * [func (hs *clientHandshakeState) sendFinished(out []byte) error](#clientHandshakeState.sendFinished)
    * [type clientHandshakeStateTLS13 struct](#clientHandshakeStateTLS13)
        * [func (hs *clientHandshakeStateTLS13) handshake() error](#clientHandshakeStateTLS13.handshake)
        * [func (hs *clientHandshakeStateTLS13) checkServerHelloOrHRR() error](#clientHandshakeStateTLS13.checkServerHelloOrHRR)
        * [func (hs *clientHandshakeStateTLS13) sendDummyChangeCipherSpec() error](#clientHandshakeStateTLS13.sendDummyChangeCipherSpec)
        * [func (hs *clientHandshakeStateTLS13) processHelloRetryRequest() error](#clientHandshakeStateTLS13.processHelloRetryRequest)
        * [func (hs *clientHandshakeStateTLS13) processServerHello() error](#clientHandshakeStateTLS13.processServerHello)
        * [func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error](#clientHandshakeStateTLS13.establishHandshakeKeys)
        * [func (hs *clientHandshakeStateTLS13) readServerParameters() error](#clientHandshakeStateTLS13.readServerParameters)
        * [func (hs *clientHandshakeStateTLS13) readServerCertificate() error](#clientHandshakeStateTLS13.readServerCertificate)
        * [func (hs *clientHandshakeStateTLS13) readServerFinished() error](#clientHandshakeStateTLS13.readServerFinished)
        * [func (hs *clientHandshakeStateTLS13) sendClientCertificate() error](#clientHandshakeStateTLS13.sendClientCertificate)
        * [func (hs *clientHandshakeStateTLS13) sendClientFinished() error](#clientHandshakeStateTLS13.sendClientFinished)
    * [type marshalingFunction func(b *golang.org/x/crypto/cryptobyte.Builder) error](#marshalingFunction)
        * [func (f marshalingFunction) Marshal(b *cryptobyte.Builder) error](#marshalingFunction.Marshal)
    * [type clientHelloMsg struct](#clientHelloMsg)
        * [func (m *clientHelloMsg) marshal() []byte](#clientHelloMsg.marshal)
        * [func (m *clientHelloMsg) marshalWithoutBinders() []byte](#clientHelloMsg.marshalWithoutBinders)
        * [func (m *clientHelloMsg) updateBinders(pskBinders [][]byte)](#clientHelloMsg.updateBinders)
        * [func (m *clientHelloMsg) unmarshal(data []byte) bool](#clientHelloMsg.unmarshal)
        * [func (*clientHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value](#clientHelloMsg.Generate)
    * [type serverHelloMsg struct](#serverHelloMsg)
        * [func (m *serverHelloMsg) marshal() []byte](#serverHelloMsg.marshal)
        * [func (m *serverHelloMsg) unmarshal(data []byte) bool](#serverHelloMsg.unmarshal)
        * [func (*serverHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value](#serverHelloMsg.Generate)
    * [type encryptedExtensionsMsg struct](#encryptedExtensionsMsg)
        * [func (m *encryptedExtensionsMsg) marshal() []byte](#encryptedExtensionsMsg.marshal)
        * [func (m *encryptedExtensionsMsg) unmarshal(data []byte) bool](#encryptedExtensionsMsg.unmarshal)
        * [func (*encryptedExtensionsMsg) Generate(rand *rand.Rand, size int) reflect.Value](#encryptedExtensionsMsg.Generate)
    * [type endOfEarlyDataMsg struct{}](#endOfEarlyDataMsg)
        * [func (m *endOfEarlyDataMsg) marshal() []byte](#endOfEarlyDataMsg.marshal)
        * [func (m *endOfEarlyDataMsg) unmarshal(data []byte) bool](#endOfEarlyDataMsg.unmarshal)
        * [func (*endOfEarlyDataMsg) Generate(rand *rand.Rand, size int) reflect.Value](#endOfEarlyDataMsg.Generate)
    * [type keyUpdateMsg struct](#keyUpdateMsg)
        * [func (m *keyUpdateMsg) marshal() []byte](#keyUpdateMsg.marshal)
        * [func (m *keyUpdateMsg) unmarshal(data []byte) bool](#keyUpdateMsg.unmarshal)
        * [func (*keyUpdateMsg) Generate(rand *rand.Rand, size int) reflect.Value](#keyUpdateMsg.Generate)
    * [type newSessionTicketMsgTLS13 struct](#newSessionTicketMsgTLS13)
        * [func (m *newSessionTicketMsgTLS13) marshal() []byte](#newSessionTicketMsgTLS13.marshal)
        * [func (m *newSessionTicketMsgTLS13) unmarshal(data []byte) bool](#newSessionTicketMsgTLS13.unmarshal)
        * [func (*newSessionTicketMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value](#newSessionTicketMsgTLS13.Generate)
    * [type certificateRequestMsgTLS13 struct](#certificateRequestMsgTLS13)
        * [func (m *certificateRequestMsgTLS13) marshal() []byte](#certificateRequestMsgTLS13.marshal)
        * [func (m *certificateRequestMsgTLS13) unmarshal(data []byte) bool](#certificateRequestMsgTLS13.unmarshal)
        * [func (*certificateRequestMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value](#certificateRequestMsgTLS13.Generate)
    * [type certificateMsg struct](#certificateMsg)
        * [func (m *certificateMsg) marshal() (x []byte)](#certificateMsg.marshal)
        * [func (m *certificateMsg) unmarshal(data []byte) bool](#certificateMsg.unmarshal)
        * [func (*certificateMsg) Generate(rand *rand.Rand, size int) reflect.Value](#certificateMsg.Generate)
    * [type certificateMsgTLS13 struct](#certificateMsgTLS13)
        * [func (m *certificateMsgTLS13) marshal() []byte](#certificateMsgTLS13.marshal)
        * [func (m *certificateMsgTLS13) unmarshal(data []byte) bool](#certificateMsgTLS13.unmarshal)
        * [func (*certificateMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value](#certificateMsgTLS13.Generate)
    * [type serverKeyExchangeMsg struct](#serverKeyExchangeMsg)
        * [func (m *serverKeyExchangeMsg) marshal() []byte](#serverKeyExchangeMsg.marshal)
        * [func (m *serverKeyExchangeMsg) unmarshal(data []byte) bool](#serverKeyExchangeMsg.unmarshal)
    * [type certificateStatusMsg struct](#certificateStatusMsg)
        * [func (m *certificateStatusMsg) marshal() []byte](#certificateStatusMsg.marshal)
        * [func (m *certificateStatusMsg) unmarshal(data []byte) bool](#certificateStatusMsg.unmarshal)
        * [func (*certificateStatusMsg) Generate(rand *rand.Rand, size int) reflect.Value](#certificateStatusMsg.Generate)
    * [type serverHelloDoneMsg struct{}](#serverHelloDoneMsg)
        * [func (m *serverHelloDoneMsg) marshal() []byte](#serverHelloDoneMsg.marshal)
        * [func (m *serverHelloDoneMsg) unmarshal(data []byte) bool](#serverHelloDoneMsg.unmarshal)
    * [type clientKeyExchangeMsg struct](#clientKeyExchangeMsg)
        * [func (m *clientKeyExchangeMsg) marshal() []byte](#clientKeyExchangeMsg.marshal)
        * [func (m *clientKeyExchangeMsg) unmarshal(data []byte) bool](#clientKeyExchangeMsg.unmarshal)
        * [func (*clientKeyExchangeMsg) Generate(rand *rand.Rand, size int) reflect.Value](#clientKeyExchangeMsg.Generate)
    * [type finishedMsg struct](#finishedMsg)
        * [func (m *finishedMsg) marshal() []byte](#finishedMsg.marshal)
        * [func (m *finishedMsg) unmarshal(data []byte) bool](#finishedMsg.unmarshal)
        * [func (*finishedMsg) Generate(rand *rand.Rand, size int) reflect.Value](#finishedMsg.Generate)
    * [type certificateRequestMsg struct](#certificateRequestMsg)
        * [func (m *certificateRequestMsg) marshal() (x []byte)](#certificateRequestMsg.marshal)
        * [func (m *certificateRequestMsg) unmarshal(data []byte) bool](#certificateRequestMsg.unmarshal)
        * [func (*certificateRequestMsg) Generate(rand *rand.Rand, size int) reflect.Value](#certificateRequestMsg.Generate)
    * [type certificateVerifyMsg struct](#certificateVerifyMsg)
        * [func (m *certificateVerifyMsg) marshal() (x []byte)](#certificateVerifyMsg.marshal)
        * [func (m *certificateVerifyMsg) unmarshal(data []byte) bool](#certificateVerifyMsg.unmarshal)
        * [func (*certificateVerifyMsg) Generate(rand *rand.Rand, size int) reflect.Value](#certificateVerifyMsg.Generate)
    * [type newSessionTicketMsg struct](#newSessionTicketMsg)
        * [func (m *newSessionTicketMsg) marshal() (x []byte)](#newSessionTicketMsg.marshal)
        * [func (m *newSessionTicketMsg) unmarshal(data []byte) bool](#newSessionTicketMsg.unmarshal)
        * [func (*newSessionTicketMsg) Generate(rand *rand.Rand, size int) reflect.Value](#newSessionTicketMsg.Generate)
    * [type helloRequestMsg struct{}](#helloRequestMsg)
        * [func (*helloRequestMsg) marshal() []byte](#helloRequestMsg.marshal)
        * [func (*helloRequestMsg) unmarshal(data []byte) bool](#helloRequestMsg.unmarshal)
    * [type serverHandshakeState struct](#serverHandshakeState)
        * [func (hs *serverHandshakeState) handshake() error](#serverHandshakeState.handshake)
        * [func (hs *serverHandshakeState) processClientHello() error](#serverHandshakeState.processClientHello)
        * [func (hs *serverHandshakeState) pickCipherSuite() error](#serverHandshakeState.pickCipherSuite)
        * [func (hs *serverHandshakeState) cipherSuiteOk(c *cipherSuite) bool](#serverHandshakeState.cipherSuiteOk)
        * [func (hs *serverHandshakeState) checkForResumption() bool](#serverHandshakeState.checkForResumption)
        * [func (hs *serverHandshakeState) doResumeHandshake() error](#serverHandshakeState.doResumeHandshake)
        * [func (hs *serverHandshakeState) doFullHandshake() error](#serverHandshakeState.doFullHandshake)
        * [func (hs *serverHandshakeState) establishKeys() error](#serverHandshakeState.establishKeys)
        * [func (hs *serverHandshakeState) readFinished(out []byte) error](#serverHandshakeState.readFinished)
        * [func (hs *serverHandshakeState) sendSessionTicket() error](#serverHandshakeState.sendSessionTicket)
        * [func (hs *serverHandshakeState) sendFinished(out []byte) error](#serverHandshakeState.sendFinished)
    * [type serverHandshakeStateTLS13 struct](#serverHandshakeStateTLS13)
        * [func (hs *serverHandshakeStateTLS13) handshake() error](#serverHandshakeStateTLS13.handshake)
        * [func (hs *serverHandshakeStateTLS13) processClientHello() error](#serverHandshakeStateTLS13.processClientHello)
        * [func (hs *serverHandshakeStateTLS13) checkForResumption() error](#serverHandshakeStateTLS13.checkForResumption)
        * [func (hs *serverHandshakeStateTLS13) pickCertificate() error](#serverHandshakeStateTLS13.pickCertificate)
        * [func (hs *serverHandshakeStateTLS13) sendDummyChangeCipherSpec() error](#serverHandshakeStateTLS13.sendDummyChangeCipherSpec)
        * [func (hs *serverHandshakeStateTLS13) doHelloRetryRequest(selectedGroup CurveID) error](#serverHandshakeStateTLS13.doHelloRetryRequest)
        * [func (hs *serverHandshakeStateTLS13) sendServerParameters() error](#serverHandshakeStateTLS13.sendServerParameters)
        * [func (hs *serverHandshakeStateTLS13) requestClientCert() bool](#serverHandshakeStateTLS13.requestClientCert)
        * [func (hs *serverHandshakeStateTLS13) sendServerCertificate() error](#serverHandshakeStateTLS13.sendServerCertificate)
        * [func (hs *serverHandshakeStateTLS13) sendServerFinished() error](#serverHandshakeStateTLS13.sendServerFinished)
        * [func (hs *serverHandshakeStateTLS13) shouldSendSessionTickets() bool](#serverHandshakeStateTLS13.shouldSendSessionTickets)
        * [func (hs *serverHandshakeStateTLS13) sendSessionTickets() error](#serverHandshakeStateTLS13.sendSessionTickets)
        * [func (hs *serverHandshakeStateTLS13) readClientCertificate() error](#serverHandshakeStateTLS13.readClientCertificate)
        * [func (hs *serverHandshakeStateTLS13) readClientFinished() error](#serverHandshakeStateTLS13.readClientFinished)
    * [type keyAgreement interface](#keyAgreement)
        * [func rsaKA(version uint16) keyAgreement](#rsaKA)
        * [func ecdheECDSAKA(version uint16) keyAgreement](#ecdheECDSAKA)
        * [func ecdheRSAKA(version uint16) keyAgreement](#ecdheRSAKA)
    * [type rsaKeyAgreement struct{}](#rsaKeyAgreement)
        * [func (ka rsaKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)](#rsaKeyAgreement.generateServerKeyExchange)
        * [func (ka rsaKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)](#rsaKeyAgreement.processClientKeyExchange)
        * [func (ka rsaKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error](#rsaKeyAgreement.processServerKeyExchange)
        * [func (ka rsaKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)](#rsaKeyAgreement.generateClientKeyExchange)
    * [type ecdheKeyAgreement struct](#ecdheKeyAgreement)
        * [func (ka *ecdheKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)](#ecdheKeyAgreement.generateServerKeyExchange)
        * [func (ka *ecdheKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)](#ecdheKeyAgreement.processClientKeyExchange)
        * [func (ka *ecdheKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error](#ecdheKeyAgreement.processServerKeyExchange)
        * [func (ka *ecdheKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)](#ecdheKeyAgreement.generateClientKeyExchange)
    * [type ecdheParameters interface](#ecdheParameters)
        * [func generateECDHEParameters(rand io.Reader, curveID CurveID) (ecdheParameters, error)](#generateECDHEParameters)
    * [type nistParameters struct](#nistParameters)
        * [func (p *nistParameters) CurveID() CurveID](#nistParameters.CurveID)
        * [func (p *nistParameters) PublicKey() []byte](#nistParameters.PublicKey)
        * [func (p *nistParameters) SharedKey(peerPublicKey []byte) []byte](#nistParameters.SharedKey)
    * [type x25519Parameters struct](#x25519Parameters)
        * [func (p *x25519Parameters) CurveID() CurveID](#x25519Parameters.CurveID)
        * [func (p *x25519Parameters) PublicKey() []byte](#x25519Parameters.PublicKey)
        * [func (p *x25519Parameters) SharedKey(peerPublicKey []byte) []byte](#x25519Parameters.SharedKey)
    * [type finishedHash struct](#finishedHash)
        * [func newFinishedHash(version uint16, cipherSuite *cipherSuite) finishedHash](#newFinishedHash)
        * [func (h *finishedHash) Write(msg []byte) (n int, err error)](#finishedHash.Write)
        * [func (h finishedHash) Sum() []byte](#finishedHash.Sum)
        * [func (h finishedHash) clientSum(masterSecret []byte) []byte](#finishedHash.clientSum)
        * [func (h finishedHash) serverSum(masterSecret []byte) []byte](#finishedHash.serverSum)
        * [func (h finishedHash) hashForClientCertificate(sigType uint8, hashAlg crypto.Hash, masterSecret []byte) []byte](#finishedHash.hashForClientCertificate)
        * [func (h *finishedHash) discardHandshakeBuffer()](#finishedHash.discardHandshakeBuffer)
    * [type sessionState struct](#sessionState)
        * [func (m *sessionState) marshal() []byte](#sessionState.marshal)
        * [func (m *sessionState) unmarshal(data []byte) bool](#sessionState.unmarshal)
        * [func (*sessionState) Generate(rand *rand.Rand, size int) reflect.Value](#sessionState.Generate)
    * [type sessionStateTLS13 struct](#sessionStateTLS13)
        * [func (m *sessionStateTLS13) marshal() []byte](#sessionStateTLS13.marshal)
        * [func (m *sessionStateTLS13) unmarshal(data []byte) bool](#sessionStateTLS13.unmarshal)
        * [func (*sessionStateTLS13) Generate(rand *rand.Rand, size int) reflect.Value](#sessionStateTLS13.Generate)
    * [type listener struct](#listener)
        * [func (l *listener) Accept() (net.Conn, error)](#listener.Accept)
    * [type timeoutError struct{}](#timeoutError)
        * [func (timeoutError) Error() string](#timeoutError.Error)
        * [func (timeoutError) Timeout() bool](#timeoutError.Timeout)
        * [func (timeoutError) Temporary() bool](#timeoutError.Temporary)
    * [type Dialer struct](#Dialer)
        * [func (d *Dialer) Dial(network, addr string) (net.Conn, error)](#Dialer.Dial)
        * [func (d *Dialer) netDialer() *net.Dialer](#Dialer.netDialer)
        * [func (d *Dialer) DialContext(ctx context.Context, network, addr string) (net.Conn, error)](#Dialer.DialContext)
    * [type hairpinConn struct](#hairpinConn)
        * [func (conn *hairpinConn) Close() error](#hairpinConn.Close)
    * [type opensslInputEvent int](#opensslInputEvent)
    * [type opensslInput chan tls.opensslInputEvent](#opensslInput)
        * [func (i opensslInput) Read(buf []byte) (n int, err error)](#opensslInput.Read)
    * [type opensslOutputSink struct](#opensslOutputSink)
        * [func newOpensslOutputSink() *opensslOutputSink](#newOpensslOutputSink)
        * [func (o *opensslOutputSink) Write(data []byte) (n int, err error)](#opensslOutputSink.Write)
        * [func (o *opensslOutputSink) String() string](#opensslOutputSink.String)
    * [type clientTest struct](#clientTest)
        * [func (test *clientTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, stdin opensslInput, stdout *opensslOutputSink, err error)](#clientTest.connFromCommand)
        * [func (test *clientTest) dataPath() string](#clientTest.dataPath)
        * [func (test *clientTest) loadData() (flows [][]byte, err error)](#clientTest.loadData)
        * [func (test *clientTest) run(t *testing.T, write bool)](#clientTest.run)
    * [type brokenConn struct](#brokenConn)
        * [func (b *brokenConn) Write(data []byte) (int, error)](#brokenConn.Write)
    * [type writeCountingConn struct](#writeCountingConn)
        * [func (wcc *writeCountingConn) Write(data []byte) (int, error)](#writeCountingConn.Write)
    * [type serverTest struct](#serverTest)
        * [func (test *serverTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, err error)](#serverTest.connFromCommand)
        * [func (test *serverTest) dataPath() string](#serverTest.dataPath)
        * [func (test *serverTest) loadData() (flows [][]byte, err error)](#serverTest.loadData)
        * [func (test *serverTest) run(t *testing.T, write bool)](#serverTest.run)
    * [type recordingConn struct](#recordingConn)
        * [func (r *recordingConn) Read(b []byte) (n int, err error)](#recordingConn.Read)
        * [func (r *recordingConn) Write(b []byte) (n int, err error)](#recordingConn.Write)
        * [func (r *recordingConn) WriteTo(w io.Writer) (int64, error)](#recordingConn.WriteTo)
    * [type zeroSource struct{}](#zeroSource)
        * [func (zeroSource) Read(b []byte) (n int, err error)](#zeroSource.Read)
    * [type testSplitPreMasterSecretTest struct](#testSplitPreMasterSecretTest)
    * [type testKeysFromTest struct](#testKeysFromTest)
    * [type readerFunc func([]byte) (int, error)](#readerFunc)
        * [func (f readerFunc) Read(b []byte) (int, error)](#readerFunc.Read)
    * [type changeImplConn struct](#changeImplConn)
        * [func (w *changeImplConn) Write(p []byte) (n int, err error)](#changeImplConn.Write)
        * [func (w *changeImplConn) Close() error](#changeImplConn.Close)
    * [type slowConn struct](#slowConn)
        * [func (c *slowConn) Write(p []byte) (int, error)](#slowConn.Write)
    * [type brokenSigner struct](#brokenSigner)
        * [func (s brokenSigner) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) (signature []byte, err error)](#brokenSigner.Sign)
* [Functions](#func)
    * [func verifyHandshakeSignature(sigType uint8, pubkey crypto.PublicKey, hashFunc crypto.Hash, signed, sig []byte) error](#verifyHandshakeSignature)
    * [func signedMessage(sigHash crypto.Hash, context string, transcript hash.Hash) []byte](#signedMessage)
    * [func typeAndHashFromSignatureScheme(signatureAlgorithm SignatureScheme) (sigType uint8, hash crypto.Hash, err error)](#typeAndHashFromSignatureScheme)
    * [func legacyTypeAndHashFromPublicKey(pub crypto.PublicKey) (sigType uint8, hash crypto.Hash, err error)](#legacyTypeAndHashFromPublicKey)
    * [func signatureSchemesForCertificate(version uint16, cert *Certificate) []SignatureScheme](#signatureSchemesForCertificate)
    * [func unsupportedCertificateError(cert *Certificate) error](#unsupportedCertificateError)
    * [func CipherSuites() []*CipherSuite](#CipherSuites)
    * [func InsecureCipherSuites() []*CipherSuite](#InsecureCipherSuites)
    * [func CipherSuiteName(id uint16) string](#CipherSuiteName)
    * [func aesgcmPreferred(ciphers []uint16) bool](#aesgcmPreferred)
    * [func cipherRC4(key, iv []byte, isRead bool) interface{}](#cipherRC4)
    * [func cipher3DES(key, iv []byte, isRead bool) interface{}](#cipher3DES)
    * [func cipherAES(key, iv []byte, isRead bool) interface{}](#cipherAES)
    * [func macSHA1(key []byte) hash.Hash](#macSHA1)
    * [func macSHA256(key []byte) hash.Hash](#macSHA256)
    * [func newConstantTimeHash(h func() hash.Hash) func() hash.Hash](#newConstantTimeHash)
    * [func tls10MAC(h hash.Hash, out, seq, header, data, extra []byte) []byte](#tls10MAC)
    * [func requiresClientCert(c ClientAuthType) bool](#requiresClientCert)
    * [func supportedVersionsFromMax(maxVersion uint16) []uint16](#supportedVersionsFromMax)
    * [func unexpectedMessageError(wanted, got interface{}) error](#unexpectedMessageError)
    * [func isSupportedSignatureAlgorithm(sigAlg SignatureScheme, supportedSignatureAlgorithms []SignatureScheme) bool](#isSupportedSignatureAlgorithm)
    * [func _()](#_)
    * [func _()](#_)
    * [func _()](#_)
    * [func extractPadding(payload []byte) (toRemove int, good byte)](#extractPadding)
    * [func roundUp(a, b int) int](#roundUp)
    * [func sliceForAppend(in []byte, n int) (head, tail []byte)](#sliceForAppend)
    * [func checkALPN(clientProtos []string, serverProto string) error](#checkALPN)
    * [func clientSessionCacheKey(serverAddr net.Addr, config *Config) string](#clientSessionCacheKey)
    * [func hostnameInSNI(name string) string](#hostnameInSNI)
    * [func addBytesWithLength(b *cryptobyte.Builder, v []byte, n int)](#addBytesWithLength)
    * [func addUint64(b *cryptobyte.Builder, v uint64)](#addUint64)
    * [func readUint64(s *cryptobyte.String, out *uint64) bool](#readUint64)
    * [func readUint8LengthPrefixed(s *cryptobyte.String, out *[]byte) bool](#readUint8LengthPrefixed)
    * [func readUint16LengthPrefixed(s *cryptobyte.String, out *[]byte) bool](#readUint16LengthPrefixed)
    * [func readUint24LengthPrefixed(s *cryptobyte.String, out *[]byte) bool](#readUint24LengthPrefixed)
    * [func marshalCertificate(b *cryptobyte.Builder, certificate Certificate)](#marshalCertificate)
    * [func unmarshalCertificate(s *cryptobyte.String, certificate *Certificate) bool](#unmarshalCertificate)
    * [func negotiateALPN(serverProtos, clientProtos []string) (string, error)](#negotiateALPN)
    * [func supportsECDHE(c *Config, supportedCurves []CurveID, supportedPoints []uint8) bool](#supportsECDHE)
    * [func cloneHash(in hash.Hash, h crypto.Hash) hash.Hash](#cloneHash)
    * [func illegalClientHelloChange(ch, ch1 *clientHelloMsg) bool](#illegalClientHelloChange)
    * [func sha1Hash(slices [][]byte) []byte](#sha1Hash)
    * [func md5SHA1Hash(slices [][]byte) []byte](#md5SHA1Hash)
    * [func hashForServerKeyExchange(sigType uint8, hashFunc crypto.Hash, version uint16, slices ...[]byte) []byte](#hashForServerKeyExchange)
    * [func curveForCurveID(id CurveID) (elliptic.Curve, bool)](#curveForCurveID)
    * [func splitPreMasterSecret(secret []byte) (s1, s2 []byte)](#splitPreMasterSecret)
    * [func pHash(result, secret, seed []byte, hash func() hash.Hash)](#pHash)
    * [func prf10(result, secret, label, seed []byte)](#prf10)
    * [func prf12(hashFunc func() hash.Hash) func(result, secret, label, seed []byte)](#prf12)
    * [func prfAndHashForVersion(version uint16, suite *cipherSuite) (func(result, secret, label, seed []byte), crypto.Hash)](#prfAndHashForVersion)
    * [func prfForVersion(version uint16, suite *cipherSuite) func(result, secret, label, seed []byte)](#prfForVersion)
    * [func masterFromPreMasterSecret(version uint16, suite *cipherSuite, preMasterSecret, clientRandom, serverRandom []byte) []byte](#masterFromPreMasterSecret)
    * [func keysFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte, macLen, keyLen, ivLen int) (clientMAC, serverMAC, clientKey, serverKey, clientIV, serverIV []byte)](#keysFromMasterSecret)
    * [func noExportedKeyingMaterial(label string, context []byte, length int) ([]byte, error)](#noExportedKeyingMaterial)
    * [func ekmFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte) func(string, []byte, int) ([]byte, error)](#ekmFromMasterSecret)
    * [func NewListener(inner net.Listener, config *Config) net.Listener](#NewListener)
    * [func Listen(network, laddr string, config *Config) (net.Listener, error)](#Listen)
    * [func parsePrivateKey(der []byte) (crypto.PrivateKey, error)](#parsePrivateKey)
    * [func TestSignatureSelection(t *testing.T)](#TestSignatureSelection)
    * [func TestLegacyTypeAndHash(t *testing.T)](#TestLegacyTypeAndHash)
    * [func TestSupportedSignatureAlgorithms(t *testing.T)](#TestSupportedSignatureAlgorithms)
    * [func TestRoundUp(t *testing.T)](#TestRoundUp)
    * [func TestRemovePadding(t *testing.T)](#TestRemovePadding)
    * [func TestCertificateSelection(t *testing.T)](#TestCertificateSelection)
    * [func runDynamicRecordSizingTest(t *testing.T, config *Config)](#runDynamicRecordSizingTest)
    * [func TestDynamicRecordSizingWithStreamCipher(t *testing.T)](#TestDynamicRecordSizingWithStreamCipher)
    * [func TestDynamicRecordSizingWithCBC(t *testing.T)](#TestDynamicRecordSizingWithCBC)
    * [func TestDynamicRecordSizingWithAEAD(t *testing.T)](#TestDynamicRecordSizingWithAEAD)
    * [func TestDynamicRecordSizingWithTLSv13(t *testing.T)](#TestDynamicRecordSizingWithTLSv13)
    * [func TestHairpinInClose(t *testing.T)](#TestHairpinInClose)
    * [func peekError(conn net.Conn) error](#peekError)
    * [func runClientTestForVersion(t *testing.T, template *clientTest, version, option string)](#runClientTestForVersion)
    * [func runClientTestTLS10(t *testing.T, template *clientTest)](#runClientTestTLS10)
    * [func runClientTestTLS11(t *testing.T, template *clientTest)](#runClientTestTLS11)
    * [func runClientTestTLS12(t *testing.T, template *clientTest)](#runClientTestTLS12)
    * [func runClientTestTLS13(t *testing.T, template *clientTest)](#runClientTestTLS13)
    * [func TestHandshakeClientRSARC4(t *testing.T)](#TestHandshakeClientRSARC4)
    * [func TestHandshakeClientRSAAES128GCM(t *testing.T)](#TestHandshakeClientRSAAES128GCM)
    * [func TestHandshakeClientRSAAES256GCM(t *testing.T)](#TestHandshakeClientRSAAES256GCM)
    * [func TestHandshakeClientECDHERSAAES(t *testing.T)](#TestHandshakeClientECDHERSAAES)
    * [func TestHandshakeClientECDHEECDSAAES(t *testing.T)](#TestHandshakeClientECDHEECDSAAES)
    * [func TestHandshakeClientECDHEECDSAAESGCM(t *testing.T)](#TestHandshakeClientECDHEECDSAAESGCM)
    * [func TestHandshakeClientAES256GCMSHA384(t *testing.T)](#TestHandshakeClientAES256GCMSHA384)
    * [func TestHandshakeClientAES128CBCSHA256(t *testing.T)](#TestHandshakeClientAES128CBCSHA256)
    * [func TestHandshakeClientECDHERSAAES128CBCSHA256(t *testing.T)](#TestHandshakeClientECDHERSAAES128CBCSHA256)
    * [func TestHandshakeClientECDHEECDSAAES128CBCSHA256(t *testing.T)](#TestHandshakeClientECDHEECDSAAES128CBCSHA256)
    * [func TestHandshakeClientX25519(t *testing.T)](#TestHandshakeClientX25519)
    * [func TestHandshakeClientP256(t *testing.T)](#TestHandshakeClientP256)
    * [func TestHandshakeClientHelloRetryRequest(t *testing.T)](#TestHandshakeClientHelloRetryRequest)
    * [func TestHandshakeClientECDHERSAChaCha20(t *testing.T)](#TestHandshakeClientECDHERSAChaCha20)
    * [func TestHandshakeClientECDHEECDSAChaCha20(t *testing.T)](#TestHandshakeClientECDHEECDSAChaCha20)
    * [func TestHandshakeClientAES128SHA256(t *testing.T)](#TestHandshakeClientAES128SHA256)
    * [func TestHandshakeClientAES256SHA384(t *testing.T)](#TestHandshakeClientAES256SHA384)
    * [func TestHandshakeClientCHACHA20SHA256(t *testing.T)](#TestHandshakeClientCHACHA20SHA256)
    * [func TestHandshakeClientECDSATLS13(t *testing.T)](#TestHandshakeClientECDSATLS13)
    * [func TestHandshakeClientEd25519(t *testing.T)](#TestHandshakeClientEd25519)
    * [func TestHandshakeClientCertRSA(t *testing.T)](#TestHandshakeClientCertRSA)
    * [func TestHandshakeClientCertECDSA(t *testing.T)](#TestHandshakeClientCertECDSA)
    * [func TestHandshakeClientCertRSAPSS(t *testing.T)](#TestHandshakeClientCertRSAPSS)
    * [func TestHandshakeClientCertRSAPKCS1v15(t *testing.T)](#TestHandshakeClientCertRSAPKCS1v15)
    * [func TestClientKeyUpdate(t *testing.T)](#TestClientKeyUpdate)
    * [func TestResumption(t *testing.T)](#TestResumption)
    * [func testResumption(t *testing.T, version uint16)](#testResumption)
    * [func TestLRUClientSessionCache(t *testing.T)](#TestLRUClientSessionCache)
    * [func TestKeyLogTLS12(t *testing.T)](#TestKeyLogTLS12)
    * [func TestKeyLogTLS13(t *testing.T)](#TestKeyLogTLS13)
    * [func TestHandshakeClientALPNMatch(t *testing.T)](#TestHandshakeClientALPNMatch)
    * [func TestServerSelectingUnconfiguredApplicationProtocol(t *testing.T)](#TestServerSelectingUnconfiguredApplicationProtocol)
    * [func TestHandshakClientSCTs(t *testing.T)](#TestHandshakClientSCTs)
    * [func TestRenegotiationRejected(t *testing.T)](#TestRenegotiationRejected)
    * [func TestRenegotiateOnce(t *testing.T)](#TestRenegotiateOnce)
    * [func TestRenegotiateTwice(t *testing.T)](#TestRenegotiateTwice)
    * [func TestRenegotiateTwiceRejected(t *testing.T)](#TestRenegotiateTwiceRejected)
    * [func TestHandshakeClientExportKeyingMaterial(t *testing.T)](#TestHandshakeClientExportKeyingMaterial)
    * [func TestHostnameInSNI(t *testing.T)](#TestHostnameInSNI)
    * [func TestServerSelectingUnconfiguredCipherSuite(t *testing.T)](#TestServerSelectingUnconfiguredCipherSuite)
    * [func TestVerifyConnection(t *testing.T)](#TestVerifyConnection)
    * [func testVerifyConnection(t *testing.T, version uint16)](#testVerifyConnection)
    * [func TestVerifyPeerCertificate(t *testing.T)](#TestVerifyPeerCertificate)
    * [func testVerifyPeerCertificate(t *testing.T, version uint16)](#testVerifyPeerCertificate)
    * [func TestFailedWrite(t *testing.T)](#TestFailedWrite)
    * [func TestBuffering(t *testing.T)](#TestBuffering)
    * [func testBuffering(t *testing.T, version uint16)](#testBuffering)
    * [func TestAlertFlushing(t *testing.T)](#TestAlertFlushing)
    * [func TestHandshakeRace(t *testing.T)](#TestHandshakeRace)
    * [func TestGetClientCertificate(t *testing.T)](#TestGetClientCertificate)
    * [func testGetClientCertificate(t *testing.T, version uint16)](#testGetClientCertificate)
    * [func TestRSAPSSKeyError(t *testing.T)](#TestRSAPSSKeyError)
    * [func TestCloseClientConnectionOnIdleServer(t *testing.T)](#TestCloseClientConnectionOnIdleServer)
    * [func testDowngradeCanary(t *testing.T, clientVersion, serverVersion uint16) error](#testDowngradeCanary)
    * [func TestDowngradeCanary(t *testing.T)](#TestDowngradeCanary)
    * [func TestResumptionKeepsOCSPAndSCT(t *testing.T)](#TestResumptionKeepsOCSPAndSCT)
    * [func testResumptionKeepsOCSPAndSCT(t *testing.T, ver uint16)](#testResumptionKeepsOCSPAndSCT)
    * [func TestClientHandshakeContextCancellation(t *testing.T)](#TestClientHandshakeContextCancellation)
    * [func TestMarshalUnmarshal(t *testing.T)](#TestMarshalUnmarshal)
    * [func TestFuzz(t *testing.T)](#TestFuzz)
    * [func randomBytes(n int, rand *rand.Rand) []byte](#randomBytes)
    * [func randomString(n int, rand *rand.Rand) string](#randomString)
    * [func TestRejectEmptySCTList(t *testing.T)](#TestRejectEmptySCTList)
    * [func TestRejectEmptySCT(t *testing.T)](#TestRejectEmptySCT)
    * [func testClientHello(t *testing.T, serverConfig *Config, m handshakeMessage)](#testClientHello)
    * [func testClientHelloFailure(t *testing.T, serverConfig *Config, m handshakeMessage, expectedSubStr string)](#testClientHelloFailure)
    * [func TestSimpleError(t *testing.T)](#TestSimpleError)
    * [func TestRejectBadProtocolVersion(t *testing.T)](#TestRejectBadProtocolVersion)
    * [func TestNoSuiteOverlap(t *testing.T)](#TestNoSuiteOverlap)
    * [func TestNoCompressionOverlap(t *testing.T)](#TestNoCompressionOverlap)
    * [func TestNoRC4ByDefault(t *testing.T)](#TestNoRC4ByDefault)
    * [func TestRejectSNIWithTrailingDot(t *testing.T)](#TestRejectSNIWithTrailingDot)
    * [func TestDontSelectECDSAWithRSAKey(t *testing.T)](#TestDontSelectECDSAWithRSAKey)
    * [func TestDontSelectRSAWithECDSAKey(t *testing.T)](#TestDontSelectRSAWithECDSAKey)
    * [func TestRenegotiationExtension(t *testing.T)](#TestRenegotiationExtension)
    * [func TestTLS12OnlyCipherSuites(t *testing.T)](#TestTLS12OnlyCipherSuites)
    * [func TestTLSPointFormats(t *testing.T)](#TestTLSPointFormats)
    * [func TestAlertForwarding(t *testing.T)](#TestAlertForwarding)
    * [func TestClose(t *testing.T)](#TestClose)
    * [func TestVersion(t *testing.T)](#TestVersion)
    * [func TestCipherSuitePreference(t *testing.T)](#TestCipherSuitePreference)
    * [func TestSCTHandshake(t *testing.T)](#TestSCTHandshake)
    * [func testSCTHandshake(t *testing.T, version uint16)](#testSCTHandshake)
    * [func TestCrossVersionResume(t *testing.T)](#TestCrossVersionResume)
    * [func testCrossVersionResume(t *testing.T, version uint16)](#testCrossVersionResume)
    * [func runServerTestForVersion(t *testing.T, template *serverTest, version, option string)](#runServerTestForVersion)
    * [func runServerTestTLS10(t *testing.T, template *serverTest)](#runServerTestTLS10)
    * [func runServerTestTLS11(t *testing.T, template *serverTest)](#runServerTestTLS11)
    * [func runServerTestTLS12(t *testing.T, template *serverTest)](#runServerTestTLS12)
    * [func runServerTestTLS13(t *testing.T, template *serverTest)](#runServerTestTLS13)
    * [func TestHandshakeServerRSARC4(t *testing.T)](#TestHandshakeServerRSARC4)
    * [func TestHandshakeServerRSA3DES(t *testing.T)](#TestHandshakeServerRSA3DES)
    * [func TestHandshakeServerRSAAES(t *testing.T)](#TestHandshakeServerRSAAES)
    * [func TestHandshakeServerAESGCM(t *testing.T)](#TestHandshakeServerAESGCM)
    * [func TestHandshakeServerAES256GCMSHA384(t *testing.T)](#TestHandshakeServerAES256GCMSHA384)
    * [func TestHandshakeServerAES128SHA256(t *testing.T)](#TestHandshakeServerAES128SHA256)
    * [func TestHandshakeServerAES256SHA384(t *testing.T)](#TestHandshakeServerAES256SHA384)
    * [func TestHandshakeServerCHACHA20SHA256(t *testing.T)](#TestHandshakeServerCHACHA20SHA256)
    * [func TestHandshakeServerECDHEECDSAAES(t *testing.T)](#TestHandshakeServerECDHEECDSAAES)
    * [func TestHandshakeServerX25519(t *testing.T)](#TestHandshakeServerX25519)
    * [func TestHandshakeServerP256(t *testing.T)](#TestHandshakeServerP256)
    * [func TestHandshakeServerHelloRetryRequest(t *testing.T)](#TestHandshakeServerHelloRetryRequest)
    * [func TestHandshakeServerALPN(t *testing.T)](#TestHandshakeServerALPN)
    * [func TestHandshakeServerALPNNoMatch(t *testing.T)](#TestHandshakeServerALPNNoMatch)
    * [func TestHandshakeServerALPNNotConfigured(t *testing.T)](#TestHandshakeServerALPNNotConfigured)
    * [func TestHandshakeServerALPNFallback(t *testing.T)](#TestHandshakeServerALPNFallback)
    * [func TestHandshakeServerSNI(t *testing.T)](#TestHandshakeServerSNI)
    * [func TestHandshakeServerSNIGetCertificate(t *testing.T)](#TestHandshakeServerSNIGetCertificate)
    * [func TestHandshakeServerSNIGetCertificateNotFound(t *testing.T)](#TestHandshakeServerSNIGetCertificateNotFound)
    * [func TestHandshakeServerSNIGetCertificateError(t *testing.T)](#TestHandshakeServerSNIGetCertificateError)
    * [func TestHandshakeServerEmptyCertificates(t *testing.T)](#TestHandshakeServerEmptyCertificates)
    * [func TestServerResumption(t *testing.T)](#TestServerResumption)
    * [func TestServerResumptionDisabled(t *testing.T)](#TestServerResumptionDisabled)
    * [func TestFallbackSCSV(t *testing.T)](#TestFallbackSCSV)
    * [func TestHandshakeServerExportKeyingMaterial(t *testing.T)](#TestHandshakeServerExportKeyingMaterial)
    * [func TestHandshakeServerRSAPKCS1v15(t *testing.T)](#TestHandshakeServerRSAPKCS1v15)
    * [func TestHandshakeServerRSAPSS(t *testing.T)](#TestHandshakeServerRSAPSS)
    * [func TestHandshakeServerEd25519(t *testing.T)](#TestHandshakeServerEd25519)
    * [func benchmarkHandshakeServer(b *testing.B, version uint16, cipherSuite uint16, curve CurveID, cert []byte, key crypto.PrivateKey)](#benchmarkHandshakeServer)
    * [func BenchmarkHandshakeServer(b *testing.B)](#BenchmarkHandshakeServer)
    * [func TestClientAuth(t *testing.T)](#TestClientAuth)
    * [func TestSNIGivenOnFailure(t *testing.T)](#TestSNIGivenOnFailure)
    * [func TestGetConfigForClient(t *testing.T)](#TestGetConfigForClient)
    * [func TestCloseServerConnectionOnIdleClient(t *testing.T)](#TestCloseServerConnectionOnIdleClient)
    * [func TestCloneHash(t *testing.T)](#TestCloneHash)
    * [func expectError(t *testing.T, err error, sub string)](#expectError)
    * [func TestKeyTooSmallForRSAPSS(t *testing.T)](#TestKeyTooSmallForRSAPSS)
    * [func TestMultipleCertificates(t *testing.T)](#TestMultipleCertificates)
    * [func TestAESCipherReordering(t *testing.T)](#TestAESCipherReordering)
    * [func TestAESCipherReorderingTLS13(t *testing.T)](#TestAESCipherReorderingTLS13)
    * [func TestServerHandshakeContextCancellation(t *testing.T)](#TestServerHandshakeContextCancellation)
    * [func TestHandshakeContextHierarchy(t *testing.T)](#TestHandshakeContextHierarchy)
    * [func runTestAndUpdateIfNeeded(t *testing.T, name string, run func(t *testing.T, update bool), wait bool)](#runTestAndUpdateIfNeeded)
    * [func checkOpenSSLVersion() error](#checkOpenSSLVersion)
    * [func parseTestData(r io.Reader) (flows [][]byte, err error)](#parseTestData)
    * [func tempFile(contents string) string](#tempFile)
    * [func localServer(l net.Listener)](#localServer)
    * [func localPipe(t testing.TB) (net.Conn, net.Conn)](#localPipe)
    * [func allCipherSuites() []uint16](#allCipherSuites)
    * [func TestMain(m *testing.M)](#TestMain)
    * [func runMain(m *testing.M) int](#runMain)
    * [func fromHex(s string) []byte](#fromHex)
    * [func init()](#init)
    * [func parseVector(v string) []byte](#parseVector)
    * [func TestDeriveSecret(t *testing.T)](#TestDeriveSecret)
    * [func TestTrafficKey(t *testing.T)](#TestTrafficKey)
    * [func TestExtract(t *testing.T)](#TestExtract)
    * [func TestLinkerGC(t *testing.T)](#TestLinkerGC)
    * [func TestSplitPreMasterSecret(t *testing.T)](#TestSplitPreMasterSecret)
    * [func TestKeysFromPreMasterSecret(t *testing.T)](#TestKeysFromPreMasterSecret)
    * [func TestX509KeyPair(t *testing.T)](#TestX509KeyPair)
    * [func TestX509KeyPairErrors(t *testing.T)](#TestX509KeyPairErrors)
    * [func TestX509MixedKeyPair(t *testing.T)](#TestX509MixedKeyPair)
    * [func newLocalListener(t testing.TB) net.Listener](#newLocalListener)
    * [func TestDialTimeout(t *testing.T)](#TestDialTimeout)
    * [func TestDeadlineOnWrite(t *testing.T)](#TestDeadlineOnWrite)
    * [func TestDialer(t *testing.T)](#TestDialer)
    * [func isTimeoutError(err error) bool](#isTimeoutError)
    * [func TestConnReadNonzeroAndEOF(t *testing.T)](#TestConnReadNonzeroAndEOF)
    * [func testConnReadNonzeroAndEOF(t *testing.T, delay time.Duration) error](#testConnReadNonzeroAndEOF)
    * [func TestTLSUniqueMatches(t *testing.T)](#TestTLSUniqueMatches)
    * [func TestVerifyHostname(t *testing.T)](#TestVerifyHostname)
    * [func TestConnCloseBreakingWrite(t *testing.T)](#TestConnCloseBreakingWrite)
    * [func TestConnCloseWrite(t *testing.T)](#TestConnCloseWrite)
    * [func TestWarningAlertFlood(t *testing.T)](#TestWarningAlertFlood)
    * [func TestCloneFuncFields(t *testing.T)](#TestCloneFuncFields)
    * [func TestCloneNonFuncFields(t *testing.T)](#TestCloneNonFuncFields)
    * [func TestCloneNilConfig(t *testing.T)](#TestCloneNilConfig)
    * [func throughput(b *testing.B, version uint16, totalBytes int64, dynamicRecordSizingDisabled bool)](#throughput)
    * [func BenchmarkThroughput(b *testing.B)](#BenchmarkThroughput)
    * [func latency(b *testing.B, version uint16, bps int, dynamicRecordSizingDisabled bool)](#latency)
    * [func BenchmarkLatency(b *testing.B)](#BenchmarkLatency)
    * [func TestConnectionStateMarshal(t *testing.T)](#TestConnectionStateMarshal)
    * [func TestConnectionState(t *testing.T)](#TestConnectionState)
    * [func TestBuildNameToCertificate_doesntModifyCertificates(t *testing.T)](#TestBuildNameToCertificate_doesntModifyCertificates)
    * [func testingKey(s string) string](#testingKey)
    * [func TestClientHelloInfo_SupportsCertificate(t *testing.T)](#TestClientHelloInfo_SupportsCertificate)
    * [func TestCipherSuites(t *testing.T)](#TestCipherSuites)
    * [func http2isBadCipher(cipher uint16) bool](#http2isBadCipher)
    * [func TestPKCS1OnlyCert(t *testing.T)](#TestPKCS1OnlyCert)


## <a id="const" href="#const">Constants</a>

```
tags: [exported]
```

### <a id="alertLevelWarning" href="#alertLevelWarning">const alertLevelWarning</a>

```
searchKey: tls.alertLevelWarning
```

```Go
const alertLevelWarning = 1
```

alert level 

### <a id="alertLevelError" href="#alertLevelError">const alertLevelError</a>

```
searchKey: tls.alertLevelError
```

```Go
const alertLevelError = 2
```

### <a id="alertCloseNotify" href="#alertCloseNotify">const alertCloseNotify</a>

```
searchKey: tls.alertCloseNotify
```

```Go
const alertCloseNotify alert = 0
```

### <a id="alertUnexpectedMessage" href="#alertUnexpectedMessage">const alertUnexpectedMessage</a>

```
searchKey: tls.alertUnexpectedMessage
```

```Go
const alertUnexpectedMessage alert = 10
```

### <a id="alertBadRecordMAC" href="#alertBadRecordMAC">const alertBadRecordMAC</a>

```
searchKey: tls.alertBadRecordMAC
```

```Go
const alertBadRecordMAC alert = 20
```

### <a id="alertDecryptionFailed" href="#alertDecryptionFailed">const alertDecryptionFailed</a>

```
searchKey: tls.alertDecryptionFailed
```

```Go
const alertDecryptionFailed alert = 21
```

### <a id="alertRecordOverflow" href="#alertRecordOverflow">const alertRecordOverflow</a>

```
searchKey: tls.alertRecordOverflow
```

```Go
const alertRecordOverflow alert = 22
```

### <a id="alertDecompressionFailure" href="#alertDecompressionFailure">const alertDecompressionFailure</a>

```
searchKey: tls.alertDecompressionFailure
```

```Go
const alertDecompressionFailure alert = 30
```

### <a id="alertHandshakeFailure" href="#alertHandshakeFailure">const alertHandshakeFailure</a>

```
searchKey: tls.alertHandshakeFailure
```

```Go
const alertHandshakeFailure alert = 40
```

### <a id="alertBadCertificate" href="#alertBadCertificate">const alertBadCertificate</a>

```
searchKey: tls.alertBadCertificate
```

```Go
const alertBadCertificate alert = 42
```

### <a id="alertUnsupportedCertificate" href="#alertUnsupportedCertificate">const alertUnsupportedCertificate</a>

```
searchKey: tls.alertUnsupportedCertificate
```

```Go
const alertUnsupportedCertificate alert = 43
```

### <a id="alertCertificateRevoked" href="#alertCertificateRevoked">const alertCertificateRevoked</a>

```
searchKey: tls.alertCertificateRevoked
```

```Go
const alertCertificateRevoked alert = 44
```

### <a id="alertCertificateExpired" href="#alertCertificateExpired">const alertCertificateExpired</a>

```
searchKey: tls.alertCertificateExpired
```

```Go
const alertCertificateExpired alert = 45
```

### <a id="alertCertificateUnknown" href="#alertCertificateUnknown">const alertCertificateUnknown</a>

```
searchKey: tls.alertCertificateUnknown
```

```Go
const alertCertificateUnknown alert = 46
```

### <a id="alertIllegalParameter" href="#alertIllegalParameter">const alertIllegalParameter</a>

```
searchKey: tls.alertIllegalParameter
```

```Go
const alertIllegalParameter alert = 47
```

### <a id="alertUnknownCA" href="#alertUnknownCA">const alertUnknownCA</a>

```
searchKey: tls.alertUnknownCA
```

```Go
const alertUnknownCA alert = 48
```

### <a id="alertAccessDenied" href="#alertAccessDenied">const alertAccessDenied</a>

```
searchKey: tls.alertAccessDenied
```

```Go
const alertAccessDenied alert = 49
```

### <a id="alertDecodeError" href="#alertDecodeError">const alertDecodeError</a>

```
searchKey: tls.alertDecodeError
```

```Go
const alertDecodeError alert = 50
```

### <a id="alertDecryptError" href="#alertDecryptError">const alertDecryptError</a>

```
searchKey: tls.alertDecryptError
```

```Go
const alertDecryptError alert = 51
```

### <a id="alertExportRestriction" href="#alertExportRestriction">const alertExportRestriction</a>

```
searchKey: tls.alertExportRestriction
```

```Go
const alertExportRestriction alert = 60
```

### <a id="alertProtocolVersion" href="#alertProtocolVersion">const alertProtocolVersion</a>

```
searchKey: tls.alertProtocolVersion
```

```Go
const alertProtocolVersion alert = 70
```

### <a id="alertInsufficientSecurity" href="#alertInsufficientSecurity">const alertInsufficientSecurity</a>

```
searchKey: tls.alertInsufficientSecurity
```

```Go
const alertInsufficientSecurity alert = 71
```

### <a id="alertInternalError" href="#alertInternalError">const alertInternalError</a>

```
searchKey: tls.alertInternalError
```

```Go
const alertInternalError alert = 80
```

### <a id="alertInappropriateFallback" href="#alertInappropriateFallback">const alertInappropriateFallback</a>

```
searchKey: tls.alertInappropriateFallback
```

```Go
const alertInappropriateFallback alert = 86
```

### <a id="alertUserCanceled" href="#alertUserCanceled">const alertUserCanceled</a>

```
searchKey: tls.alertUserCanceled
```

```Go
const alertUserCanceled alert = 90
```

### <a id="alertNoRenegotiation" href="#alertNoRenegotiation">const alertNoRenegotiation</a>

```
searchKey: tls.alertNoRenegotiation
```

```Go
const alertNoRenegotiation alert = 100
```

### <a id="alertMissingExtension" href="#alertMissingExtension">const alertMissingExtension</a>

```
searchKey: tls.alertMissingExtension
```

```Go
const alertMissingExtension alert = 109
```

### <a id="alertUnsupportedExtension" href="#alertUnsupportedExtension">const alertUnsupportedExtension</a>

```
searchKey: tls.alertUnsupportedExtension
```

```Go
const alertUnsupportedExtension alert = 110
```

### <a id="alertCertificateUnobtainable" href="#alertCertificateUnobtainable">const alertCertificateUnobtainable</a>

```
searchKey: tls.alertCertificateUnobtainable
```

```Go
const alertCertificateUnobtainable alert = 111
```

### <a id="alertUnrecognizedName" href="#alertUnrecognizedName">const alertUnrecognizedName</a>

```
searchKey: tls.alertUnrecognizedName
```

```Go
const alertUnrecognizedName alert = 112
```

### <a id="alertBadCertificateStatusResponse" href="#alertBadCertificateStatusResponse">const alertBadCertificateStatusResponse</a>

```
searchKey: tls.alertBadCertificateStatusResponse
```

```Go
const alertBadCertificateStatusResponse alert = 113
```

### <a id="alertBadCertificateHashValue" href="#alertBadCertificateHashValue">const alertBadCertificateHashValue</a>

```
searchKey: tls.alertBadCertificateHashValue
```

```Go
const alertBadCertificateHashValue alert = 114
```

### <a id="alertUnknownPSKIdentity" href="#alertUnknownPSKIdentity">const alertUnknownPSKIdentity</a>

```
searchKey: tls.alertUnknownPSKIdentity
```

```Go
const alertUnknownPSKIdentity alert = 115
```

### <a id="alertCertificateRequired" href="#alertCertificateRequired">const alertCertificateRequired</a>

```
searchKey: tls.alertCertificateRequired
```

```Go
const alertCertificateRequired alert = 116
```

### <a id="alertNoApplicationProtocol" href="#alertNoApplicationProtocol">const alertNoApplicationProtocol</a>

```
searchKey: tls.alertNoApplicationProtocol
```

```Go
const alertNoApplicationProtocol alert = 120
```

### <a id="serverSignatureContext" href="#serverSignatureContext">const serverSignatureContext</a>

```
searchKey: tls.serverSignatureContext
```

```Go
const serverSignatureContext = "TLS 1.3, server CertificateVerify\x00"
```

### <a id="clientSignatureContext" href="#clientSignatureContext">const clientSignatureContext</a>

```
searchKey: tls.clientSignatureContext
```

```Go
const clientSignatureContext = "TLS 1.3, client CertificateVerify\x00"
```

### <a id="suiteECDHE" href="#suiteECDHE">const suiteECDHE</a>

```
searchKey: tls.suiteECDHE
```

```Go
const suiteECDHE = 1 << iota
```

suiteECDHE indicates that the cipher suite involves elliptic curve Diffie-Hellman. This means that it should only be selected when the client indicates that it supports ECC with a curve and point format that we're happy with. 

### <a id="suiteECSign" href="#suiteECSign">const suiteECSign</a>

```
searchKey: tls.suiteECSign
```

```Go
const suiteECSign
```

suiteECSign indicates that the cipher suite involves an ECDSA or EdDSA signature and therefore may only be selected when the server's certificate is ECDSA or EdDSA. If this is not set then the cipher suite is RSA based. 

### <a id="suiteTLS12" href="#suiteTLS12">const suiteTLS12</a>

```
searchKey: tls.suiteTLS12
```

```Go
const suiteTLS12
```

suiteTLS12 indicates that the cipher suite should only be advertised and accepted when using TLS 1.2. 

### <a id="suiteSHA384" href="#suiteSHA384">const suiteSHA384</a>

```
searchKey: tls.suiteSHA384
```

```Go
const suiteSHA384
```

suiteSHA384 indicates that the cipher suite uses SHA384 as the handshake hash. 

### <a id="aeadNonceLength" href="#aeadNonceLength">const aeadNonceLength</a>

```
searchKey: tls.aeadNonceLength
```

```Go
const aeadNonceLength = 12
```

### <a id="noncePrefixLength" href="#noncePrefixLength">const noncePrefixLength</a>

```
searchKey: tls.noncePrefixLength
```

```Go
const noncePrefixLength = 4
```

### <a id="TLS_RSA_WITH_RC4_128_SHA" href="#TLS_RSA_WITH_RC4_128_SHA">const TLS_RSA_WITH_RC4_128_SHA</a>

```
searchKey: tls.TLS_RSA_WITH_RC4_128_SHA
tags: [exported]
```

```Go
const TLS_RSA_WITH_RC4_128_SHA uint16 = 0x0005
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

TLS 1.0 - 1.2 cipher suites. 

### <a id="TLS_RSA_WITH_3DES_EDE_CBC_SHA" href="#TLS_RSA_WITH_3DES_EDE_CBC_SHA">const TLS_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: tls.TLS_RSA_WITH_3DES_EDE_CBC_SHA
tags: [exported]
```

```Go
const TLS_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0x000a
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_RSA_WITH_AES_128_CBC_SHA" href="#TLS_RSA_WITH_AES_128_CBC_SHA">const TLS_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: tls.TLS_RSA_WITH_AES_128_CBC_SHA
tags: [exported]
```

```Go
const TLS_RSA_WITH_AES_128_CBC_SHA uint16 = 0x002f
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_RSA_WITH_AES_256_CBC_SHA" href="#TLS_RSA_WITH_AES_256_CBC_SHA">const TLS_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: tls.TLS_RSA_WITH_AES_256_CBC_SHA
tags: [exported]
```

```Go
const TLS_RSA_WITH_AES_256_CBC_SHA uint16 = 0x0035
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_RSA_WITH_AES_128_CBC_SHA256" href="#TLS_RSA_WITH_AES_128_CBC_SHA256">const TLS_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: tls.TLS_RSA_WITH_AES_128_CBC_SHA256
tags: [exported]
```

```Go
const TLS_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0x003c
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_RSA_WITH_AES_128_GCM_SHA256" href="#TLS_RSA_WITH_AES_128_GCM_SHA256">const TLS_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: tls.TLS_RSA_WITH_AES_128_GCM_SHA256
tags: [exported]
```

```Go
const TLS_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0x009c
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_RSA_WITH_AES_256_GCM_SHA384" href="#TLS_RSA_WITH_AES_256_GCM_SHA384">const TLS_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: tls.TLS_RSA_WITH_AES_256_GCM_SHA384
tags: [exported]
```

```Go
const TLS_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0x009d
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_RC4_128_SHA" href="#TLS_ECDHE_ECDSA_WITH_RC4_128_SHA">const TLS_ECDHE_ECDSA_WITH_RC4_128_SHA</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_RC4_128_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_RC4_128_SHA uint16 = 0xc007
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA" href="#TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA">const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA uint16 = 0xc009
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA" href="#TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA">const TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_AES_256_CBC_SHA uint16 = 0xc00a
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_RC4_128_SHA" href="#TLS_ECDHE_RSA_WITH_RC4_128_SHA">const TLS_ECDHE_RSA_WITH_RC4_128_SHA</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_RC4_128_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_RC4_128_SHA uint16 = 0xc011
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA" href="#TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA">const TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_3DES_EDE_CBC_SHA uint16 = 0xc012
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA" href="#TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA">const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA uint16 = 0xc013
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA" href="#TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA">const TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA uint16 = 0xc014
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256" href="#TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256">const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_AES_128_CBC_SHA256 uint16 = 0xc023
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256" href="#TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256">const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256 uint16 = 0xc027
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256" href="#TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256">const TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 uint16 = 0xc02f
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256" href="#TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256">const TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256 uint16 = 0xc02b
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384" href="#TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384">const TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 uint16 = 0xc030
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384" href="#TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384">const TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_AES_256_GCM_SHA384 uint16 = 0xc02c
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256" href="#TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256">const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xcca8
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256" href="#TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256">const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256 uint16 = 0xcca9
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_AES_128_GCM_SHA256" href="#TLS_AES_128_GCM_SHA256">const TLS_AES_128_GCM_SHA256</a>

```
searchKey: tls.TLS_AES_128_GCM_SHA256
tags: [exported]
```

```Go
const TLS_AES_128_GCM_SHA256 uint16 = 0x1301
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

TLS 1.3 cipher suites. 

### <a id="TLS_AES_256_GCM_SHA384" href="#TLS_AES_256_GCM_SHA384">const TLS_AES_256_GCM_SHA384</a>

```
searchKey: tls.TLS_AES_256_GCM_SHA384
tags: [exported]
```

```Go
const TLS_AES_256_GCM_SHA384 uint16 = 0x1302
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_CHACHA20_POLY1305_SHA256" href="#TLS_CHACHA20_POLY1305_SHA256">const TLS_CHACHA20_POLY1305_SHA256</a>

```
searchKey: tls.TLS_CHACHA20_POLY1305_SHA256
tags: [exported]
```

```Go
const TLS_CHACHA20_POLY1305_SHA256 uint16 = 0x1303
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="TLS_FALLBACK_SCSV" href="#TLS_FALLBACK_SCSV">const TLS_FALLBACK_SCSV</a>

```
searchKey: tls.TLS_FALLBACK_SCSV
tags: [exported]
```

```Go
const TLS_FALLBACK_SCSV uint16 = 0x5600
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

TLS_FALLBACK_SCSV isn't a standard cipher suite but an indicator that the client is doing version fallback. See RFC 7507. 

### <a id="TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305" href="#TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305">const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305</a>

```
searchKey: tls.TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305
tags: [exported]
```

```Go
const TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305 = TLS_ECDHE_RSA_WITH_CHACHA20_POLY1305_SHA256
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

Legacy names for the corresponding cipher suites with the correct _SHA256 suffix, retained for backward compatibility. 

### <a id="TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305" href="#TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305">const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305</a>

```
searchKey: tls.TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305
tags: [exported]
```

```Go
const TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305 = TLS_ECDHE_ECDSA_WITH_CHACHA20_POLY1305_SHA256
```

A list of cipher suite IDs that are, or have been, implemented by this package. 

See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml) 

### <a id="VersionTLS10" href="#VersionTLS10">const VersionTLS10</a>

```
searchKey: tls.VersionTLS10
tags: [exported]
```

```Go
const VersionTLS10 = 0x0301
```

### <a id="VersionTLS11" href="#VersionTLS11">const VersionTLS11</a>

```
searchKey: tls.VersionTLS11
tags: [exported]
```

```Go
const VersionTLS11 = 0x0302
```

### <a id="VersionTLS12" href="#VersionTLS12">const VersionTLS12</a>

```
searchKey: tls.VersionTLS12
tags: [exported]
```

```Go
const VersionTLS12 = 0x0303
```

### <a id="VersionTLS13" href="#VersionTLS13">const VersionTLS13</a>

```
searchKey: tls.VersionTLS13
tags: [exported]
```

```Go
const VersionTLS13 = 0x0304
```

### <a id="VersionSSL30" href="#VersionSSL30">const VersionSSL30</a>

```
searchKey: tls.VersionSSL30
tags: [exported deprecated]
```

```Go
const VersionSSL30 = 0x0300
```

Deprecated: SSLv3 is cryptographically broken, and is no longer supported by this package. See golang.org/issue/32716. 

### <a id="maxPlaintext" href="#maxPlaintext">const maxPlaintext</a>

```
searchKey: tls.maxPlaintext
```

```Go
const maxPlaintext = 16384 // maximum plaintext payload length

```

### <a id="maxCiphertext" href="#maxCiphertext">const maxCiphertext</a>

```
searchKey: tls.maxCiphertext
```

```Go
const maxCiphertext = 16384 + 2048 // maximum ciphertext payload length

```

### <a id="maxCiphertextTLS13" href="#maxCiphertextTLS13">const maxCiphertextTLS13</a>

```
searchKey: tls.maxCiphertextTLS13
```

```Go
const maxCiphertextTLS13 = 16384 + 256 // maximum ciphertext length in TLS 1.3

```

### <a id="recordHeaderLen" href="#recordHeaderLen">const recordHeaderLen</a>

```
searchKey: tls.recordHeaderLen
```

```Go
const recordHeaderLen = 5 // record header length

```

### <a id="maxHandshake" href="#maxHandshake">const maxHandshake</a>

```
searchKey: tls.maxHandshake
```

```Go
const maxHandshake = 65536 // maximum handshake we support (protocol max is 16 MB)

```

### <a id="maxUselessRecords" href="#maxUselessRecords">const maxUselessRecords</a>

```
searchKey: tls.maxUselessRecords
```

```Go
const maxUselessRecords = 16 // maximum number of consecutive non-advancing records

```

### <a id="recordTypeChangeCipherSpec" href="#recordTypeChangeCipherSpec">const recordTypeChangeCipherSpec</a>

```
searchKey: tls.recordTypeChangeCipherSpec
```

```Go
const recordTypeChangeCipherSpec recordType = 20
```

### <a id="recordTypeAlert" href="#recordTypeAlert">const recordTypeAlert</a>

```
searchKey: tls.recordTypeAlert
```

```Go
const recordTypeAlert recordType = 21
```

### <a id="recordTypeHandshake" href="#recordTypeHandshake">const recordTypeHandshake</a>

```
searchKey: tls.recordTypeHandshake
```

```Go
const recordTypeHandshake recordType = 22
```

### <a id="recordTypeApplicationData" href="#recordTypeApplicationData">const recordTypeApplicationData</a>

```
searchKey: tls.recordTypeApplicationData
```

```Go
const recordTypeApplicationData recordType = 23
```

### <a id="typeHelloRequest" href="#typeHelloRequest">const typeHelloRequest</a>

```
searchKey: tls.typeHelloRequest
```

```Go
const typeHelloRequest uint8 = 0
```

TLS handshake message types. 

### <a id="typeClientHello" href="#typeClientHello">const typeClientHello</a>

```
searchKey: tls.typeClientHello
```

```Go
const typeClientHello uint8 = 1
```

TLS handshake message types. 

### <a id="typeServerHello" href="#typeServerHello">const typeServerHello</a>

```
searchKey: tls.typeServerHello
```

```Go
const typeServerHello uint8 = 2
```

TLS handshake message types. 

### <a id="typeNewSessionTicket" href="#typeNewSessionTicket">const typeNewSessionTicket</a>

```
searchKey: tls.typeNewSessionTicket
```

```Go
const typeNewSessionTicket uint8 = 4
```

TLS handshake message types. 

### <a id="typeEndOfEarlyData" href="#typeEndOfEarlyData">const typeEndOfEarlyData</a>

```
searchKey: tls.typeEndOfEarlyData
```

```Go
const typeEndOfEarlyData uint8 = 5
```

TLS handshake message types. 

### <a id="typeEncryptedExtensions" href="#typeEncryptedExtensions">const typeEncryptedExtensions</a>

```
searchKey: tls.typeEncryptedExtensions
```

```Go
const typeEncryptedExtensions uint8 = 8
```

TLS handshake message types. 

### <a id="typeCertificate" href="#typeCertificate">const typeCertificate</a>

```
searchKey: tls.typeCertificate
```

```Go
const typeCertificate uint8 = 11
```

TLS handshake message types. 

### <a id="typeServerKeyExchange" href="#typeServerKeyExchange">const typeServerKeyExchange</a>

```
searchKey: tls.typeServerKeyExchange
```

```Go
const typeServerKeyExchange uint8 = 12
```

TLS handshake message types. 

### <a id="typeCertificateRequest" href="#typeCertificateRequest">const typeCertificateRequest</a>

```
searchKey: tls.typeCertificateRequest
```

```Go
const typeCertificateRequest uint8 = 13
```

TLS handshake message types. 

### <a id="typeServerHelloDone" href="#typeServerHelloDone">const typeServerHelloDone</a>

```
searchKey: tls.typeServerHelloDone
```

```Go
const typeServerHelloDone uint8 = 14
```

TLS handshake message types. 

### <a id="typeCertificateVerify" href="#typeCertificateVerify">const typeCertificateVerify</a>

```
searchKey: tls.typeCertificateVerify
```

```Go
const typeCertificateVerify uint8 = 15
```

TLS handshake message types. 

### <a id="typeClientKeyExchange" href="#typeClientKeyExchange">const typeClientKeyExchange</a>

```
searchKey: tls.typeClientKeyExchange
```

```Go
const typeClientKeyExchange uint8 = 16
```

TLS handshake message types. 

### <a id="typeFinished" href="#typeFinished">const typeFinished</a>

```
searchKey: tls.typeFinished
```

```Go
const typeFinished uint8 = 20
```

TLS handshake message types. 

### <a id="typeCertificateStatus" href="#typeCertificateStatus">const typeCertificateStatus</a>

```
searchKey: tls.typeCertificateStatus
```

```Go
const typeCertificateStatus uint8 = 22
```

TLS handshake message types. 

### <a id="typeKeyUpdate" href="#typeKeyUpdate">const typeKeyUpdate</a>

```
searchKey: tls.typeKeyUpdate
```

```Go
const typeKeyUpdate uint8 = 24
```

TLS handshake message types. 

### <a id="typeNextProtocol" href="#typeNextProtocol">const typeNextProtocol</a>

```
searchKey: tls.typeNextProtocol
```

```Go
const typeNextProtocol uint8 = 67 // Not IANA assigned

```

TLS handshake message types. 

### <a id="typeMessageHash" href="#typeMessageHash">const typeMessageHash</a>

```
searchKey: tls.typeMessageHash
```

```Go
const typeMessageHash uint8 = 254 // synthetic message

```

TLS handshake message types. 

### <a id="compressionNone" href="#compressionNone">const compressionNone</a>

```
searchKey: tls.compressionNone
```

```Go
const compressionNone uint8 = 0
```

TLS compression types. 

### <a id="extensionServerName" href="#extensionServerName">const extensionServerName</a>

```
searchKey: tls.extensionServerName
```

```Go
const extensionServerName uint16 = 0
```

TLS extension numbers 

### <a id="extensionStatusRequest" href="#extensionStatusRequest">const extensionStatusRequest</a>

```
searchKey: tls.extensionStatusRequest
```

```Go
const extensionStatusRequest uint16 = 5
```

TLS extension numbers 

### <a id="extensionSupportedCurves" href="#extensionSupportedCurves">const extensionSupportedCurves</a>

```
searchKey: tls.extensionSupportedCurves
```

```Go
const extensionSupportedCurves uint16 // supported_groups in TLS 1.3, see RFC 8446, Section 4.2.7
 = ...
```

TLS extension numbers 

### <a id="extensionSupportedPoints" href="#extensionSupportedPoints">const extensionSupportedPoints</a>

```
searchKey: tls.extensionSupportedPoints
```

```Go
const extensionSupportedPoints uint16 = 11
```

TLS extension numbers 

### <a id="extensionSignatureAlgorithms" href="#extensionSignatureAlgorithms">const extensionSignatureAlgorithms</a>

```
searchKey: tls.extensionSignatureAlgorithms
```

```Go
const extensionSignatureAlgorithms uint16 = 13
```

TLS extension numbers 

### <a id="extensionALPN" href="#extensionALPN">const extensionALPN</a>

```
searchKey: tls.extensionALPN
```

```Go
const extensionALPN uint16 = 16
```

TLS extension numbers 

### <a id="extensionSCT" href="#extensionSCT">const extensionSCT</a>

```
searchKey: tls.extensionSCT
```

```Go
const extensionSCT uint16 = 18
```

TLS extension numbers 

### <a id="extensionSessionTicket" href="#extensionSessionTicket">const extensionSessionTicket</a>

```
searchKey: tls.extensionSessionTicket
```

```Go
const extensionSessionTicket uint16 = 35
```

TLS extension numbers 

### <a id="extensionPreSharedKey" href="#extensionPreSharedKey">const extensionPreSharedKey</a>

```
searchKey: tls.extensionPreSharedKey
```

```Go
const extensionPreSharedKey uint16 = 41
```

TLS extension numbers 

### <a id="extensionEarlyData" href="#extensionEarlyData">const extensionEarlyData</a>

```
searchKey: tls.extensionEarlyData
```

```Go
const extensionEarlyData uint16 = 42
```

TLS extension numbers 

### <a id="extensionSupportedVersions" href="#extensionSupportedVersions">const extensionSupportedVersions</a>

```
searchKey: tls.extensionSupportedVersions
```

```Go
const extensionSupportedVersions uint16 = 43
```

TLS extension numbers 

### <a id="extensionCookie" href="#extensionCookie">const extensionCookie</a>

```
searchKey: tls.extensionCookie
```

```Go
const extensionCookie uint16 = 44
```

TLS extension numbers 

### <a id="extensionPSKModes" href="#extensionPSKModes">const extensionPSKModes</a>

```
searchKey: tls.extensionPSKModes
```

```Go
const extensionPSKModes uint16 = 45
```

TLS extension numbers 

### <a id="extensionCertificateAuthorities" href="#extensionCertificateAuthorities">const extensionCertificateAuthorities</a>

```
searchKey: tls.extensionCertificateAuthorities
```

```Go
const extensionCertificateAuthorities uint16 = 47
```

TLS extension numbers 

### <a id="extensionSignatureAlgorithmsCert" href="#extensionSignatureAlgorithmsCert">const extensionSignatureAlgorithmsCert</a>

```
searchKey: tls.extensionSignatureAlgorithmsCert
```

```Go
const extensionSignatureAlgorithmsCert uint16 = 50
```

TLS extension numbers 

### <a id="extensionKeyShare" href="#extensionKeyShare">const extensionKeyShare</a>

```
searchKey: tls.extensionKeyShare
```

```Go
const extensionKeyShare uint16 = 51
```

TLS extension numbers 

### <a id="extensionRenegotiationInfo" href="#extensionRenegotiationInfo">const extensionRenegotiationInfo</a>

```
searchKey: tls.extensionRenegotiationInfo
```

```Go
const extensionRenegotiationInfo uint16 = 0xff01
```

TLS extension numbers 

### <a id="scsvRenegotiation" href="#scsvRenegotiation">const scsvRenegotiation</a>

```
searchKey: tls.scsvRenegotiation
```

```Go
const scsvRenegotiation uint16 = 0x00ff
```

TLS signaling cipher suite values 

### <a id="CurveP256" href="#CurveP256">const CurveP256</a>

```
searchKey: tls.CurveP256
tags: [exported]
```

```Go
const CurveP256 CurveID = 23
```

### <a id="CurveP384" href="#CurveP384">const CurveP384</a>

```
searchKey: tls.CurveP384
tags: [exported]
```

```Go
const CurveP384 CurveID = 24
```

### <a id="CurveP521" href="#CurveP521">const CurveP521</a>

```
searchKey: tls.CurveP521
tags: [exported]
```

```Go
const CurveP521 CurveID = 25
```

### <a id="X25519" href="#X25519">const X25519</a>

```
searchKey: tls.X25519
tags: [exported]
```

```Go
const X25519 CurveID = 29
```

### <a id="pskModePlain" href="#pskModePlain">const pskModePlain</a>

```
searchKey: tls.pskModePlain
```

```Go
const pskModePlain uint8 = 0
```

TLS 1.3 PSK Key Exchange Modes. See RFC 8446, Section 4.2.9. 

### <a id="pskModeDHE" href="#pskModeDHE">const pskModeDHE</a>

```
searchKey: tls.pskModeDHE
```

```Go
const pskModeDHE uint8 = 1
```

TLS 1.3 PSK Key Exchange Modes. See RFC 8446, Section 4.2.9. 

### <a id="pointFormatUncompressed" href="#pointFormatUncompressed">const pointFormatUncompressed</a>

```
searchKey: tls.pointFormatUncompressed
```

```Go
const pointFormatUncompressed uint8 = 0
```

TLS Elliptic Curve Point Formats [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-9](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-9) 

### <a id="statusTypeOCSP" href="#statusTypeOCSP">const statusTypeOCSP</a>

```
searchKey: tls.statusTypeOCSP
```

```Go
const statusTypeOCSP uint8 = 1
```

TLS CertificateStatusType (RFC 3546) 

### <a id="certTypeRSASign" href="#certTypeRSASign">const certTypeRSASign</a>

```
searchKey: tls.certTypeRSASign
```

```Go
const certTypeRSASign = 1
```

Certificate types (for certificateRequestMsg) 

### <a id="certTypeECDSASign" href="#certTypeECDSASign">const certTypeECDSASign</a>

```
searchKey: tls.certTypeECDSASign
```

```Go
const certTypeECDSASign = 64 // ECDSA or EdDSA keys, see RFC 8422, Section 3.

```

Certificate types (for certificateRequestMsg) 

### <a id="signaturePKCS1v15" href="#signaturePKCS1v15">const signaturePKCS1v15</a>

```
searchKey: tls.signaturePKCS1v15
```

```Go
const signaturePKCS1v15 uint8 = iota + 225
```

Signature algorithms (for internal signaling use). Starting at 225 to avoid overlap with TLS 1.2 codepoints (RFC 5246, Appendix A.4.1), with which these have nothing to do. 

### <a id="signatureRSAPSS" href="#signatureRSAPSS">const signatureRSAPSS</a>

```
searchKey: tls.signatureRSAPSS
```

```Go
const signatureRSAPSS
```

Signature algorithms (for internal signaling use). Starting at 225 to avoid overlap with TLS 1.2 codepoints (RFC 5246, Appendix A.4.1), with which these have nothing to do. 

### <a id="signatureECDSA" href="#signatureECDSA">const signatureECDSA</a>

```
searchKey: tls.signatureECDSA
```

```Go
const signatureECDSA
```

Signature algorithms (for internal signaling use). Starting at 225 to avoid overlap with TLS 1.2 codepoints (RFC 5246, Appendix A.4.1), with which these have nothing to do. 

### <a id="signatureEd25519" href="#signatureEd25519">const signatureEd25519</a>

```
searchKey: tls.signatureEd25519
```

```Go
const signatureEd25519
```

Signature algorithms (for internal signaling use). Starting at 225 to avoid overlap with TLS 1.2 codepoints (RFC 5246, Appendix A.4.1), with which these have nothing to do. 

### <a id="downgradeCanaryTLS12" href="#downgradeCanaryTLS12">const downgradeCanaryTLS12</a>

```
searchKey: tls.downgradeCanaryTLS12
```

```Go
const downgradeCanaryTLS12 = "DOWNGRD\x01"
```

downgradeCanaryTLS12 or downgradeCanaryTLS11 is embedded in the server random as a downgrade protection if the server would be capable of negotiating a higher version. See RFC 8446, Section 4.1.3. 

### <a id="downgradeCanaryTLS11" href="#downgradeCanaryTLS11">const downgradeCanaryTLS11</a>

```
searchKey: tls.downgradeCanaryTLS11
```

```Go
const downgradeCanaryTLS11 = "DOWNGRD\x00"
```

### <a id="NoClientCert" href="#NoClientCert">const NoClientCert</a>

```
searchKey: tls.NoClientCert
tags: [exported]
```

```Go
const NoClientCert ClientAuthType = iota
```

NoClientCert indicates that no client certificate should be requested during the handshake, and if any certificates are sent they will not be verified. 

### <a id="RequestClientCert" href="#RequestClientCert">const RequestClientCert</a>

```
searchKey: tls.RequestClientCert
tags: [exported]
```

```Go
const RequestClientCert
```

RequestClientCert indicates that a client certificate should be requested during the handshake, but does not require that the client send any certificates. 

### <a id="RequireAnyClientCert" href="#RequireAnyClientCert">const RequireAnyClientCert</a>

```
searchKey: tls.RequireAnyClientCert
tags: [exported]
```

```Go
const RequireAnyClientCert
```

RequireAnyClientCert indicates that a client certificate should be requested during the handshake, and that at least one certificate is required to be sent by the client, but that certificate is not required to be valid. 

### <a id="VerifyClientCertIfGiven" href="#VerifyClientCertIfGiven">const VerifyClientCertIfGiven</a>

```
searchKey: tls.VerifyClientCertIfGiven
tags: [exported]
```

```Go
const VerifyClientCertIfGiven
```

VerifyClientCertIfGiven indicates that a client certificate should be requested during the handshake, but does not require that the client sends a certificate. If the client does send a certificate it is required to be valid. 

### <a id="RequireAndVerifyClientCert" href="#RequireAndVerifyClientCert">const RequireAndVerifyClientCert</a>

```
searchKey: tls.RequireAndVerifyClientCert
tags: [exported]
```

```Go
const RequireAndVerifyClientCert
```

RequireAndVerifyClientCert indicates that a client certificate should be requested during the handshake, and that at least one valid certificate is required to be sent by the client. 

### <a id="PKCS1WithSHA256" href="#PKCS1WithSHA256">const PKCS1WithSHA256</a>

```
searchKey: tls.PKCS1WithSHA256
tags: [exported]
```

```Go
const PKCS1WithSHA256 SignatureScheme = 0x0401
```

RSASSA-PKCS1-v1_5 algorithms. 

### <a id="PKCS1WithSHA384" href="#PKCS1WithSHA384">const PKCS1WithSHA384</a>

```
searchKey: tls.PKCS1WithSHA384
tags: [exported]
```

```Go
const PKCS1WithSHA384 SignatureScheme = 0x0501
```

### <a id="PKCS1WithSHA512" href="#PKCS1WithSHA512">const PKCS1WithSHA512</a>

```
searchKey: tls.PKCS1WithSHA512
tags: [exported]
```

```Go
const PKCS1WithSHA512 SignatureScheme = 0x0601
```

### <a id="PSSWithSHA256" href="#PSSWithSHA256">const PSSWithSHA256</a>

```
searchKey: tls.PSSWithSHA256
tags: [exported]
```

```Go
const PSSWithSHA256 SignatureScheme = 0x0804
```

RSASSA-PSS algorithms with public key OID rsaEncryption. 

### <a id="PSSWithSHA384" href="#PSSWithSHA384">const PSSWithSHA384</a>

```
searchKey: tls.PSSWithSHA384
tags: [exported]
```

```Go
const PSSWithSHA384 SignatureScheme = 0x0805
```

### <a id="PSSWithSHA512" href="#PSSWithSHA512">const PSSWithSHA512</a>

```
searchKey: tls.PSSWithSHA512
tags: [exported]
```

```Go
const PSSWithSHA512 SignatureScheme = 0x0806
```

### <a id="ECDSAWithP256AndSHA256" href="#ECDSAWithP256AndSHA256">const ECDSAWithP256AndSHA256</a>

```
searchKey: tls.ECDSAWithP256AndSHA256
tags: [exported]
```

```Go
const ECDSAWithP256AndSHA256 SignatureScheme = 0x0403
```

ECDSA algorithms. Only constrained to a specific curve in TLS 1.3. 

### <a id="ECDSAWithP384AndSHA384" href="#ECDSAWithP384AndSHA384">const ECDSAWithP384AndSHA384</a>

```
searchKey: tls.ECDSAWithP384AndSHA384
tags: [exported]
```

```Go
const ECDSAWithP384AndSHA384 SignatureScheme = 0x0503
```

### <a id="ECDSAWithP521AndSHA512" href="#ECDSAWithP521AndSHA512">const ECDSAWithP521AndSHA512</a>

```
searchKey: tls.ECDSAWithP521AndSHA512
tags: [exported]
```

```Go
const ECDSAWithP521AndSHA512 SignatureScheme = 0x0603
```

### <a id="Ed25519" href="#Ed25519">const Ed25519</a>

```
searchKey: tls.Ed25519
tags: [exported]
```

```Go
const Ed25519 SignatureScheme = 0x0807
```

EdDSA algorithms. 

### <a id="PKCS1WithSHA1" href="#PKCS1WithSHA1">const PKCS1WithSHA1</a>

```
searchKey: tls.PKCS1WithSHA1
tags: [exported]
```

```Go
const PKCS1WithSHA1 SignatureScheme = 0x0201
```

Legacy signature and hash algorithms for TLS 1.2. 

### <a id="ECDSAWithSHA1" href="#ECDSAWithSHA1">const ECDSAWithSHA1</a>

```
searchKey: tls.ECDSAWithSHA1
tags: [exported]
```

```Go
const ECDSAWithSHA1 SignatureScheme = 0x0203
```

### <a id="RenegotiateNever" href="#RenegotiateNever">const RenegotiateNever</a>

```
searchKey: tls.RenegotiateNever
tags: [exported]
```

```Go
const RenegotiateNever RenegotiationSupport = iota
```

RenegotiateNever disables renegotiation. 

### <a id="RenegotiateOnceAsClient" href="#RenegotiateOnceAsClient">const RenegotiateOnceAsClient</a>

```
searchKey: tls.RenegotiateOnceAsClient
tags: [exported]
```

```Go
const RenegotiateOnceAsClient
```

RenegotiateOnceAsClient allows a remote server to request renegotiation once per connection. 

### <a id="RenegotiateFreelyAsClient" href="#RenegotiateFreelyAsClient">const RenegotiateFreelyAsClient</a>

```
searchKey: tls.RenegotiateFreelyAsClient
tags: [exported]
```

```Go
const RenegotiateFreelyAsClient
```

RenegotiateFreelyAsClient allows a remote server to repeatedly request renegotiation. 

### <a id="ticketKeyNameLen" href="#ticketKeyNameLen">const ticketKeyNameLen</a>

```
searchKey: tls.ticketKeyNameLen
```

```Go
const ticketKeyNameLen = 16
```

ticketKeyNameLen is the number of bytes of identifier that is prepended to an encrypted session ticket in order to identify the key used to encrypt it. 

### <a id="ticketKeyLifetime" href="#ticketKeyLifetime">const ticketKeyLifetime</a>

```
searchKey: tls.ticketKeyLifetime
```

```Go
const ticketKeyLifetime = 7 * 24 * time.Hour // 7 days

```

ticketKeyLifetime is how long a ticket key remains valid and can be used to resume a client connection. 

### <a id="ticketKeyRotation" href="#ticketKeyRotation">const ticketKeyRotation</a>

```
searchKey: tls.ticketKeyRotation
```

```Go
const ticketKeyRotation = 24 * time.Hour
```

ticketKeyRotation is how often the server should rotate the session ticket key that is used for new tickets. 

### <a id="maxSessionTicketLifetime" href="#maxSessionTicketLifetime">const maxSessionTicketLifetime</a>

```
searchKey: tls.maxSessionTicketLifetime
```

```Go
const maxSessionTicketLifetime = 7 * 24 * time.Hour
```

maxSessionTicketLifetime is the maximum allowed lifetime of a TLS 1.3 session ticket, and the lifetime we set for tickets we send. 

### <a id="keyLogLabelTLS12" href="#keyLogLabelTLS12">const keyLogLabelTLS12</a>

```
searchKey: tls.keyLogLabelTLS12
```

```Go
const keyLogLabelTLS12 = "CLIENT_RANDOM"
```

### <a id="keyLogLabelClientHandshake" href="#keyLogLabelClientHandshake">const keyLogLabelClientHandshake</a>

```
searchKey: tls.keyLogLabelClientHandshake
```

```Go
const keyLogLabelClientHandshake = "CLIENT_HANDSHAKE_TRAFFIC_SECRET"
```

### <a id="keyLogLabelServerHandshake" href="#keyLogLabelServerHandshake">const keyLogLabelServerHandshake</a>

```
searchKey: tls.keyLogLabelServerHandshake
```

```Go
const keyLogLabelServerHandshake = "SERVER_HANDSHAKE_TRAFFIC_SECRET"
```

### <a id="keyLogLabelClientTraffic" href="#keyLogLabelClientTraffic">const keyLogLabelClientTraffic</a>

```
searchKey: tls.keyLogLabelClientTraffic
```

```Go
const keyLogLabelClientTraffic = "CLIENT_TRAFFIC_SECRET_0"
```

### <a id="keyLogLabelServerTraffic" href="#keyLogLabelServerTraffic">const keyLogLabelServerTraffic</a>

```
searchKey: tls.keyLogLabelServerTraffic
```

```Go
const keyLogLabelServerTraffic = "SERVER_TRAFFIC_SECRET_0"
```

### <a id="_SignatureScheme_name_0" href="#_SignatureScheme_name_0">const _SignatureScheme_name_0</a>

```
searchKey: tls._SignatureScheme_name_0
```

```Go
const _SignatureScheme_name_0 = "PKCS1WithSHA1"
```

### <a id="_SignatureScheme_name_1" href="#_SignatureScheme_name_1">const _SignatureScheme_name_1</a>

```
searchKey: tls._SignatureScheme_name_1
```

```Go
const _SignatureScheme_name_1 = "ECDSAWithSHA1"
```

### <a id="_SignatureScheme_name_2" href="#_SignatureScheme_name_2">const _SignatureScheme_name_2</a>

```
searchKey: tls._SignatureScheme_name_2
```

```Go
const _SignatureScheme_name_2 = "PKCS1WithSHA256"
```

### <a id="_SignatureScheme_name_3" href="#_SignatureScheme_name_3">const _SignatureScheme_name_3</a>

```
searchKey: tls._SignatureScheme_name_3
```

```Go
const _SignatureScheme_name_3 = "ECDSAWithP256AndSHA256"
```

### <a id="_SignatureScheme_name_4" href="#_SignatureScheme_name_4">const _SignatureScheme_name_4</a>

```
searchKey: tls._SignatureScheme_name_4
```

```Go
const _SignatureScheme_name_4 = "PKCS1WithSHA384"
```

### <a id="_SignatureScheme_name_5" href="#_SignatureScheme_name_5">const _SignatureScheme_name_5</a>

```
searchKey: tls._SignatureScheme_name_5
```

```Go
const _SignatureScheme_name_5 = "ECDSAWithP384AndSHA384"
```

### <a id="_SignatureScheme_name_6" href="#_SignatureScheme_name_6">const _SignatureScheme_name_6</a>

```
searchKey: tls._SignatureScheme_name_6
```

```Go
const _SignatureScheme_name_6 = "PKCS1WithSHA512"
```

### <a id="_SignatureScheme_name_7" href="#_SignatureScheme_name_7">const _SignatureScheme_name_7</a>

```
searchKey: tls._SignatureScheme_name_7
```

```Go
const _SignatureScheme_name_7 = "ECDSAWithP521AndSHA512"
```

### <a id="_SignatureScheme_name_8" href="#_SignatureScheme_name_8">const _SignatureScheme_name_8</a>

```
searchKey: tls._SignatureScheme_name_8
```

```Go
const _SignatureScheme_name_8 = "PSSWithSHA256PSSWithSHA384PSSWithSHA512Ed25519"
```

### <a id="_CurveID_name_0" href="#_CurveID_name_0">const _CurveID_name_0</a>

```
searchKey: tls._CurveID_name_0
```

```Go
const _CurveID_name_0 = "CurveP256CurveP384CurveP521"
```

### <a id="_CurveID_name_1" href="#_CurveID_name_1">const _CurveID_name_1</a>

```
searchKey: tls._CurveID_name_1
```

```Go
const _CurveID_name_1 = "X25519"
```

### <a id="_ClientAuthType_name" href="#_ClientAuthType_name">const _ClientAuthType_name</a>

```
searchKey: tls._ClientAuthType_name
```

```Go
const _ClientAuthType_name = ...
```

### <a id="tcpMSSEstimate" href="#tcpMSSEstimate">const tcpMSSEstimate</a>

```
searchKey: tls.tcpMSSEstimate
```

```Go
const tcpMSSEstimate = 1208
```

tcpMSSEstimate is a conservative estimate of the TCP maximum segment size (MSS). A constant is used, rather than querying the kernel for the actual MSS, to avoid complexity. The value here is the IPv6 minimum MTU (1280 bytes) minus the overhead of an IPv6 header (40 bytes) and a TCP header with timestamps (32 bytes). 

### <a id="recordSizeBoostThreshold" href="#recordSizeBoostThreshold">const recordSizeBoostThreshold</a>

```
searchKey: tls.recordSizeBoostThreshold
```

```Go
const recordSizeBoostThreshold = 128 * 1024
```

recordSizeBoostThreshold is the number of bytes of application data sent after which the TLS record size will be increased to the maximum. 

### <a id="maxClientPSKIdentities" href="#maxClientPSKIdentities">const maxClientPSKIdentities</a>

```
searchKey: tls.maxClientPSKIdentities
```

```Go
const maxClientPSKIdentities = 5
```

maxClientPSKIdentities is the number of client PSK identities the server will attempt to validate. It will ignore the rest not to let cheap ClientHello messages cause too much work in session ticket decryption attempts. 

### <a id="resumptionBinderLabel" href="#resumptionBinderLabel">const resumptionBinderLabel</a>

```
searchKey: tls.resumptionBinderLabel
```

```Go
const resumptionBinderLabel = "res binder"
```

### <a id="clientHandshakeTrafficLabel" href="#clientHandshakeTrafficLabel">const clientHandshakeTrafficLabel</a>

```
searchKey: tls.clientHandshakeTrafficLabel
```

```Go
const clientHandshakeTrafficLabel = "c hs traffic"
```

### <a id="serverHandshakeTrafficLabel" href="#serverHandshakeTrafficLabel">const serverHandshakeTrafficLabel</a>

```
searchKey: tls.serverHandshakeTrafficLabel
```

```Go
const serverHandshakeTrafficLabel = "s hs traffic"
```

### <a id="clientApplicationTrafficLabel" href="#clientApplicationTrafficLabel">const clientApplicationTrafficLabel</a>

```
searchKey: tls.clientApplicationTrafficLabel
```

```Go
const clientApplicationTrafficLabel = "c ap traffic"
```

### <a id="serverApplicationTrafficLabel" href="#serverApplicationTrafficLabel">const serverApplicationTrafficLabel</a>

```
searchKey: tls.serverApplicationTrafficLabel
```

```Go
const serverApplicationTrafficLabel = "s ap traffic"
```

### <a id="exporterLabel" href="#exporterLabel">const exporterLabel</a>

```
searchKey: tls.exporterLabel
```

```Go
const exporterLabel = "exp master"
```

### <a id="resumptionLabel" href="#resumptionLabel">const resumptionLabel</a>

```
searchKey: tls.resumptionLabel
```

```Go
const resumptionLabel = "res master"
```

### <a id="trafficUpdateLabel" href="#trafficUpdateLabel">const trafficUpdateLabel</a>

```
searchKey: tls.trafficUpdateLabel
```

```Go
const trafficUpdateLabel = "traffic upd"
```

### <a id="masterSecretLength" href="#masterSecretLength">const masterSecretLength</a>

```
searchKey: tls.masterSecretLength
```

```Go
const masterSecretLength = 48 // Length of a master secret in TLS 1.1.

```

### <a id="finishedVerifyLength" href="#finishedVerifyLength">const finishedVerifyLength</a>

```
searchKey: tls.finishedVerifyLength
```

```Go
const finishedVerifyLength = 12 // Length of verify_data in a Finished message.

```

### <a id="opensslRenegotiate" href="#opensslRenegotiate">const opensslRenegotiate</a>

```
searchKey: tls.opensslRenegotiate
```

```Go
const opensslRenegotiate opensslInputEvent = iota
```

opensslRenegotiate causes OpenSSL to request a renegotiation of the connection. 

### <a id="opensslSendSentinel" href="#opensslSendSentinel">const opensslSendSentinel</a>

```
searchKey: tls.opensslSendSentinel
```

```Go
const opensslSendSentinel
```

opensslSendBanner causes OpenSSL to send the contents of opensslSentinel on the connection. 

### <a id="opensslKeyUpdate" href="#opensslKeyUpdate">const opensslKeyUpdate</a>

```
searchKey: tls.opensslKeyUpdate
```

```Go
const opensslKeyUpdate
```

opensslKeyUpdate causes OpenSSL to send a key update message to the client and request one back. 

### <a id="opensslSentinel" href="#opensslSentinel">const opensslSentinel</a>

```
searchKey: tls.opensslSentinel
```

```Go
const opensslSentinel = "SENTINEL\n"
```

### <a id="opensslEndOfHandshake" href="#opensslEndOfHandshake">const opensslEndOfHandshake</a>

```
searchKey: tls.opensslEndOfHandshake
```

```Go
const opensslEndOfHandshake = "SSL_accept:SSLv3/TLS write finished"
```

opensslEndOfHandshake is a message that the “openssl s_server” tool will print when a handshake completes if run with “-state”. 

### <a id="opensslReadKeyUpdate" href="#opensslReadKeyUpdate">const opensslReadKeyUpdate</a>

```
searchKey: tls.opensslReadKeyUpdate
```

```Go
const opensslReadKeyUpdate = "SSL_accept:TLSv1.3 read client key update"
```

opensslReadKeyUpdate is a message that the “openssl s_server” tool will print when a KeyUpdate message is received if run with “-state”. 

### <a id="sctsBase64" href="#sctsBase64">const sctsBase64</a>

```
searchKey: tls.sctsBase64
```

```Go
const sctsBase64 = ...
```

sctsBase64 contains data from `openssl s_client -serverinfo 18 -connect ritter.vg:443` 

### <a id="localFlakes" href="#localFlakes">const localFlakes</a>

```
searchKey: tls.localFlakes
```

```Go
const localFlakes = 0 // change to 1 or 2 to exercise localServer/localPipe handling of mismatches

```

### <a id="clientCertificatePEM" href="#clientCertificatePEM">const clientCertificatePEM</a>

```
searchKey: tls.clientCertificatePEM
```

```Go
const clientCertificatePEM = ...
```

### <a id="clientECDSACertificatePEM" href="#clientECDSACertificatePEM">const clientECDSACertificatePEM</a>

```
searchKey: tls.clientECDSACertificatePEM
```

```Go
const clientECDSACertificatePEM = ...
```

### <a id="clientEd25519CertificatePEM" href="#clientEd25519CertificatePEM">const clientEd25519CertificatePEM</a>

```
searchKey: tls.clientEd25519CertificatePEM
```

```Go
const clientEd25519CertificatePEM = ...
```

## <a id="var" href="#var">Variables</a>

```
tags: [exported]
```

### <a id="alertText" href="#alertText">var alertText</a>

```
searchKey: tls.alertText
```

```Go
var alertText = ...
```

### <a id="signaturePadding" href="#signaturePadding">var signaturePadding</a>

```
searchKey: tls.signaturePadding
```

```Go
var signaturePadding = ...
```

### <a id="rsaSignatureSchemes" href="#rsaSignatureSchemes">var rsaSignatureSchemes</a>

```
searchKey: tls.rsaSignatureSchemes
```

```Go
var rsaSignatureSchemes = ...
```

### <a id="supportedUpToTLS12" href="#supportedUpToTLS12">var supportedUpToTLS12</a>

```
searchKey: tls.supportedUpToTLS12
```

```Go
var supportedUpToTLS12 = []uint16{VersionTLS10, VersionTLS11, VersionTLS12}
```

### <a id="supportedOnlyTLS12" href="#supportedOnlyTLS12">var supportedOnlyTLS12</a>

```
searchKey: tls.supportedOnlyTLS12
```

```Go
var supportedOnlyTLS12 = []uint16{VersionTLS12}
```

### <a id="supportedOnlyTLS13" href="#supportedOnlyTLS13">var supportedOnlyTLS13</a>

```
searchKey: tls.supportedOnlyTLS13
```

```Go
var supportedOnlyTLS13 = []uint16{VersionTLS13}
```

### <a id="cipherSuites" href="#cipherSuites">var cipherSuites</a>

```
searchKey: tls.cipherSuites
```

```Go
var cipherSuites = ...
```

### <a id="cipherSuitesTLS13" href="#cipherSuitesTLS13">var cipherSuitesTLS13</a>

```
searchKey: tls.cipherSuitesTLS13
```

```Go
var cipherSuitesTLS13 = ...
```

### <a id="cipherSuitesPreferenceOrder" href="#cipherSuitesPreferenceOrder">var cipherSuitesPreferenceOrder</a>

```
searchKey: tls.cipherSuitesPreferenceOrder
```

```Go
var cipherSuitesPreferenceOrder = ...
```

cipherSuitesPreferenceOrder is the order in which we'll select (on the server) or advertise (on the client) TLS 1.0–1.2 cipher suites. 

Cipher suites are filtered but not reordered based on the application and peer's preferences, meaning we'll never select a suite lower in this list if any higher one is available. This makes it more defensible to keep weaker cipher suites enabled, especially on the server side where we get the last word, since there are no known downgrade attacks on cipher suites selection. 

The list is sorted by applying the following priority rules, stopping at the first (most important) applicable one: 

```
- Anything else comes before RC4

    RC4 has practically exploitable biases. See [https://www.rc4nomore.com](https://www.rc4nomore.com).

- Anything else comes before CBC_SHA256

    SHA-256 variants of the CBC ciphersuites don't implement any Lucky13
    countermeasures. See [http://www.isg.rhul.ac.uk/tls/Lucky13.html](http://www.isg.rhul.ac.uk/tls/Lucky13.html) and
    [https://www.imperialviolet.org/2013/02/04/luckythirteen.html](https://www.imperialviolet.org/2013/02/04/luckythirteen.html).

- Anything else comes before 3DES

    3DES has 64-bit blocks, which makes it fundamentally susceptible to
    birthday attacks. See [https://sweet32.info](https://sweet32.info).

- ECDHE comes before anything else

    Once we got the broken stuff out of the way, the most important
    property a cipher suite can have is forward secrecy. We don't
    implement FFDHE, so that means ECDHE.

- AEADs come before CBC ciphers

    Even with Lucky13 countermeasures, MAC-then-Encrypt CBC cipher suites
    are fundamentally fragile, and suffered from an endless sequence of
    padding oracle attacks. See [https://eprint.iacr.org/2015/1129](https://eprint.iacr.org/2015/1129),
    [https://www.imperialviolet.org/2014/12/08/poodleagain.html](https://www.imperialviolet.org/2014/12/08/poodleagain.html), and
    [https://blog.cloudflare.com/yet-another-padding-oracle-in-openssl-cbc-ciphersuites/](https://blog.cloudflare.com/yet-another-padding-oracle-in-openssl-cbc-ciphersuites/).

- AES comes before ChaCha20

    When AES hardware is available, AES-128-GCM and AES-256-GCM are faster
    than ChaCha20Poly1305.

    When AES hardware is not available, AES-128-GCM is one or more of: much
    slower, way more complex, and less safe (because not constant time)
    than ChaCha20Poly1305.

    We use this list if we think both peers have AES hardware, and
    cipherSuitesPreferenceOrderNoAES otherwise.

- AES-128 comes before AES-256

    The only potential advantages of AES-256 are better multi-target
    margins, and hypothetical post-quantum properties. Neither apply to
    TLS, and AES-256 is slower due to its four extra rounds (which don't
    contribute to the advantages above).

- ECDSA comes before RSA

    The relative order of ECDSA and RSA cipher suites doesn't matter,
    as they depend on the certificate. Pick one to get a stable order.

```
### <a id="cipherSuitesPreferenceOrderNoAES" href="#cipherSuitesPreferenceOrderNoAES">var cipherSuitesPreferenceOrderNoAES</a>

```
searchKey: tls.cipherSuitesPreferenceOrderNoAES
```

```Go
var cipherSuitesPreferenceOrderNoAES = ...
```

### <a id="disabledCipherSuites" href="#disabledCipherSuites">var disabledCipherSuites</a>

```
searchKey: tls.disabledCipherSuites
```

```Go
var disabledCipherSuites = ...
```

disabledCipherSuites are not used unless explicitly listed in Config.CipherSuites. They MUST be at the end of cipherSuitesPreferenceOrder. 

### <a id="defaultCipherSuitesLen" href="#defaultCipherSuitesLen">var defaultCipherSuitesLen</a>

```
searchKey: tls.defaultCipherSuitesLen
```

```Go
var defaultCipherSuitesLen = len(cipherSuitesPreferenceOrder) - len(disabledCipherSuites)
```

### <a id="defaultCipherSuites" href="#defaultCipherSuites">var defaultCipherSuites</a>

```
searchKey: tls.defaultCipherSuites
```

```Go
var defaultCipherSuites = cipherSuitesPreferenceOrder[:defaultCipherSuitesLen]
```

### <a id="defaultCipherSuitesTLS13" href="#defaultCipherSuitesTLS13">var defaultCipherSuitesTLS13</a>

```
searchKey: tls.defaultCipherSuitesTLS13
```

```Go
var defaultCipherSuitesTLS13 = ...
```

defaultCipherSuitesTLS13 is also the preference order, since there are no disabled by default TLS 1.3 cipher suites. The same AES vs ChaCha20 logic as cipherSuitesPreferenceOrder applies. 

### <a id="defaultCipherSuitesTLS13NoAES" href="#defaultCipherSuitesTLS13NoAES">var defaultCipherSuitesTLS13NoAES</a>

```
searchKey: tls.defaultCipherSuitesTLS13NoAES
```

```Go
var defaultCipherSuitesTLS13NoAES = ...
```

### <a id="hasGCMAsmAMD64" href="#hasGCMAsmAMD64">var hasGCMAsmAMD64</a>

```
searchKey: tls.hasGCMAsmAMD64
```

```Go
var hasGCMAsmAMD64 = cpu.X86.HasAES && cpu.X86.HasPCLMULQDQ
```

### <a id="hasGCMAsmARM64" href="#hasGCMAsmARM64">var hasGCMAsmARM64</a>

```
searchKey: tls.hasGCMAsmARM64
```

```Go
var hasGCMAsmARM64 = cpu.ARM64.HasAES && cpu.ARM64.HasPMULL
```

### <a id="hasGCMAsmS390X" href="#hasGCMAsmS390X">var hasGCMAsmS390X</a>

```
searchKey: tls.hasGCMAsmS390X
```

```Go
var hasGCMAsmS390X = ...
```

Keep in sync with crypto/aes/cipher_s390x.go. 

### <a id="hasAESGCMHardwareSupport" href="#hasAESGCMHardwareSupport">var hasAESGCMHardwareSupport</a>

```
searchKey: tls.hasAESGCMHardwareSupport
```

```Go
var hasAESGCMHardwareSupport = ...
```

### <a id="aesgcmCiphers" href="#aesgcmCiphers">var aesgcmCiphers</a>

```
searchKey: tls.aesgcmCiphers
```

```Go
var aesgcmCiphers = ...
```

### <a id="nonAESGCMAEADCiphers" href="#nonAESGCMAEADCiphers">var nonAESGCMAEADCiphers</a>

```
searchKey: tls.nonAESGCMAEADCiphers
```

```Go
var nonAESGCMAEADCiphers = ...
```

### <a id="directSigning" href="#directSigning">var directSigning</a>

```
searchKey: tls.directSigning
```

```Go
var directSigning crypto.Hash = 0
```

directSigning is a standard Hash value that signals that no pre-hashing should be performed, and that the input should be signed directly. It is the hash function associated with the Ed25519 signature scheme. 

### <a id="supportedSignatureAlgorithms" href="#supportedSignatureAlgorithms">var supportedSignatureAlgorithms</a>

```
searchKey: tls.supportedSignatureAlgorithms
```

```Go
var supportedSignatureAlgorithms = ...
```

supportedSignatureAlgorithms contains the signature and hash algorithms that the code advertises as supported in a TLS 1.2+ ClientHello and in a TLS 1.2+ CertificateRequest. The two fields are merged to match with TLS 1.3. Note that in TLS 1.2, the ECDSA algorithms are not constrained to P-256, etc. 

### <a id="helloRetryRequestRandom" href="#helloRetryRequestRandom">var helloRetryRequestRandom</a>

```
searchKey: tls.helloRetryRequestRandom
```

```Go
var helloRetryRequestRandom = ...
```

helloRetryRequestRandom is set as the Random value of a ServerHello to signal that the message is actually a HelloRetryRequest. 

### <a id="testingOnlyForceDowngradeCanary" href="#testingOnlyForceDowngradeCanary">var testingOnlyForceDowngradeCanary</a>

```
searchKey: tls.testingOnlyForceDowngradeCanary
```

```Go
var testingOnlyForceDowngradeCanary bool
```

testingOnlyForceDowngradeCanary is set in tests to force the server side to include downgrade canaries even if it's using its highers supported version. 

### <a id="deprecatedSessionTicketKey" href="#deprecatedSessionTicketKey">var deprecatedSessionTicketKey</a>

```
searchKey: tls.deprecatedSessionTicketKey
```

```Go
var deprecatedSessionTicketKey = []byte("DEPRECATED")
```

deprecatedSessionTicketKey is set as the prefix of SessionTicketKey if it was randomized for backwards compatibility but is not in use. 

### <a id="supportedVersions" href="#supportedVersions">var supportedVersions</a>

```
searchKey: tls.supportedVersions
```

```Go
var supportedVersions = []uint16{
	VersionTLS13,
	VersionTLS12,
	VersionTLS11,
	VersionTLS10,
}
```

### <a id="defaultCurvePreferences" href="#defaultCurvePreferences">var defaultCurvePreferences</a>

```
searchKey: tls.defaultCurvePreferences
```

```Go
var defaultCurvePreferences = []CurveID{X25519, CurveP256, CurveP384, CurveP521}
```

### <a id="errNoCertificates" href="#errNoCertificates">var errNoCertificates</a>

```
searchKey: tls.errNoCertificates
```

```Go
var errNoCertificates = errors.New("tls: no certificates configured")
```

### <a id="writerMutex" href="#writerMutex">var writerMutex</a>

```
searchKey: tls.writerMutex
```

```Go
var writerMutex sync.Mutex
```

writerMutex protects all KeyLogWriters globally. It is rarely enabled, and is only for debugging, so a global mutex saves space. 

### <a id="emptyConfig" href="#emptyConfig">var emptyConfig</a>

```
searchKey: tls.emptyConfig
```

```Go
var emptyConfig Config
```

### <a id="_SignatureScheme_index_8" href="#_SignatureScheme_index_8">var _SignatureScheme_index_8</a>

```
searchKey: tls._SignatureScheme_index_8
```

```Go
var _SignatureScheme_index_8 = [...]uint8{0, 13, 26, 39, 46}
```

### <a id="_CurveID_index_0" href="#_CurveID_index_0">var _CurveID_index_0</a>

```
searchKey: tls._CurveID_index_0
```

```Go
var _CurveID_index_0 = [...]uint8{0, 9, 18, 27}
```

### <a id="_ClientAuthType_index" href="#_ClientAuthType_index">var _ClientAuthType_index</a>

```
searchKey: tls._ClientAuthType_index
```

```Go
var _ClientAuthType_index = [...]uint8{0, 12, 29, 49, 72, 98}
```

### <a id="outBufPool" href="#outBufPool">var outBufPool</a>

```
searchKey: tls.outBufPool
```

```Go
var outBufPool = sync.Pool{
	New: func() interface{} {
		return new([]byte)
	},
}
```

outBufPool pools the record-sized scratch buffers used by writeRecordLocked. 

### <a id="errShutdown" href="#errShutdown">var errShutdown</a>

```
searchKey: tls.errShutdown
```

```Go
var errShutdown = errors.New("tls: protocol is shutdown")
```

### <a id="errEarlyCloseWrite" href="#errEarlyCloseWrite">var errEarlyCloseWrite</a>

```
searchKey: tls.errEarlyCloseWrite
```

```Go
var errEarlyCloseWrite = errors.New("tls: CloseWrite called before handshake complete")
```

### <a id="errClientKeyExchange" href="#errClientKeyExchange">var errClientKeyExchange</a>

```
searchKey: tls.errClientKeyExchange
```

```Go
var errClientKeyExchange = errors.New("tls: invalid ClientKeyExchange message")
```

### <a id="errServerKeyExchange" href="#errServerKeyExchange">var errServerKeyExchange</a>

```
searchKey: tls.errServerKeyExchange
```

```Go
var errServerKeyExchange = errors.New("tls: invalid ServerKeyExchange message")
```

### <a id="masterSecretLabel" href="#masterSecretLabel">var masterSecretLabel</a>

```
searchKey: tls.masterSecretLabel
```

```Go
var masterSecretLabel = []byte("master secret")
```

### <a id="keyExpansionLabel" href="#keyExpansionLabel">var keyExpansionLabel</a>

```
searchKey: tls.keyExpansionLabel
```

```Go
var keyExpansionLabel = []byte("key expansion")
```

### <a id="clientFinishedLabel" href="#clientFinishedLabel">var clientFinishedLabel</a>

```
searchKey: tls.clientFinishedLabel
```

```Go
var clientFinishedLabel = []byte("client finished")
```

### <a id="serverFinishedLabel" href="#serverFinishedLabel">var serverFinishedLabel</a>

```
searchKey: tls.serverFinishedLabel
```

```Go
var serverFinishedLabel = []byte("server finished")
```

### <a id="padding255Bad" href="#padding255Bad">var padding255Bad</a>

```
searchKey: tls.padding255Bad
```

```Go
var padding255Bad = [256]byte{}
```

will be initialized with {0, 255, 255, ..., 255} 

### <a id="padding255Good" href="#padding255Good">var padding255Good</a>

```
searchKey: tls.padding255Good
```

```Go
var padding255Good = [256]byte{255}
```

will be initialized with {255, 255, 255, ..., 255} 

### <a id="paddingTests" href="#paddingTests">var paddingTests</a>

```
searchKey: tls.paddingTests
```

```Go
var paddingTests = ...
```

### <a id="certExampleCom" href="#certExampleCom">var certExampleCom</a>

```
searchKey: tls.certExampleCom
```

```Go
var certExampleCom = ...
```

### <a id="certWildcardExampleCom" href="#certWildcardExampleCom">var certWildcardExampleCom</a>

```
searchKey: tls.certWildcardExampleCom
```

```Go
var certWildcardExampleCom = ...
```

### <a id="certFooExampleCom" href="#certFooExampleCom">var certFooExampleCom</a>

```
searchKey: tls.certFooExampleCom
```

```Go
var certFooExampleCom = ...
```

### <a id="serverCommand" href="#serverCommand">var serverCommand</a>

```
searchKey: tls.serverCommand
```

```Go
var serverCommand = []string{"openssl", "s_server", "-no_ticket", "-num_tickets", "0"}
```

### <a id="hostnameInSNITests" href="#hostnameInSNITests">var hostnameInSNITests</a>

```
searchKey: tls.hostnameInSNITests
```

```Go
var hostnameInSNITests = ...
```

### <a id="brokenConnErr" href="#brokenConnErr">var brokenConnErr</a>

```
searchKey: tls.brokenConnErr
```

```Go
var brokenConnErr = errors.New("too many writes to brokenConn")
```

brokenConnErr is the error that brokenConn returns once exhausted. 

### <a id="getClientCertificateTests" href="#getClientCertificateTests">var getClientCertificateTests</a>

```
searchKey: tls.getClientCertificateTests
```

```Go
var getClientCertificateTests = ...
```

### <a id="tests" href="#tests">var tests</a>

```
searchKey: tls.tests
```

```Go
var tests = ...
```

### <a id="badProtocolVersions" href="#badProtocolVersions">var badProtocolVersions</a>

```
searchKey: tls.badProtocolVersions
```

```Go
var badProtocolVersions = []uint16{0x0000, 0x0005, 0x0100, 0x0105, 0x0200, 0x0205, VersionSSL30}
```

### <a id="defaultClientCommand" href="#defaultClientCommand">var defaultClientCommand</a>

```
searchKey: tls.defaultClientCommand
```

```Go
var defaultClientCommand = []string{"openssl", "s_client", "-no_ticket"}
```

### <a id="getConfigForClientTests" href="#getConfigForClientTests">var getConfigForClientTests</a>

```
searchKey: tls.getConfigForClientTests
```

```Go
var getConfigForClientTests = ...
```

### <a id="update" href="#update">var update</a>

```
searchKey: tls.update
```

```Go
var update = flag.Bool("update", false, "update golden files on failure")
```

### <a id="fast" href="#fast">var fast</a>

```
searchKey: tls.fast
```

```Go
var fast = flag.Bool("fast", false, "impose a quick, possibly flaky timeout on recorded tests")
```

### <a id="keyFile" href="#keyFile">var keyFile</a>

```
searchKey: tls.keyFile
```

```Go
var keyFile = flag.String("keylog", "", "destination file for KeyLogWriter")
```

### <a id="localListener" href="#localListener">var localListener</a>

```
searchKey: tls.localListener
```

```Go
var localListener struct {
	mu   sync.Mutex
	addr net.Addr
	ch   chan net.Conn
}
```

localListener is set up by TestMain and used by localPipe to create Conn pairs like net.Pipe, but connected by an actual buffered TCP connection. 

### <a id="isConnRefused" href="#isConnRefused">var isConnRefused</a>

```
searchKey: tls.isConnRefused
```

```Go
var isConnRefused = func(err error) bool { return false }
```

### <a id="testConfig" href="#testConfig">var testConfig</a>

```
searchKey: tls.testConfig
```

```Go
var testConfig *Config
```

### <a id="testRSACertificate" href="#testRSACertificate">var testRSACertificate</a>

```
searchKey: tls.testRSACertificate
```

```Go
var testRSACertificate = ...
```

### <a id="testRSACertificateIssuer" href="#testRSACertificateIssuer">var testRSACertificateIssuer</a>

```
searchKey: tls.testRSACertificateIssuer
```

```Go
var testRSACertificateIssuer = ...
```

### <a id="testRSAPSSCertificate" href="#testRSAPSSCertificate">var testRSAPSSCertificate</a>

```
searchKey: tls.testRSAPSSCertificate
```

```Go
var testRSAPSSCertificate = ...
```

testRSAPSSCertificate has signatureAlgorithm rsassaPss, but subjectPublicKeyInfo algorithm rsaEncryption, for use with the rsa_pss_rsae_* SignatureSchemes. See also TestRSAPSSKeyError. testRSAPSSCertificate is self-signed. 

### <a id="testECDSACertificate" href="#testECDSACertificate">var testECDSACertificate</a>

```
searchKey: tls.testECDSACertificate
```

```Go
var testECDSACertificate = ...
```

### <a id="testEd25519Certificate" href="#testEd25519Certificate">var testEd25519Certificate</a>

```
searchKey: tls.testEd25519Certificate
```

```Go
var testEd25519Certificate = ...
```

### <a id="testSNICertificate" href="#testSNICertificate">var testSNICertificate</a>

```
searchKey: tls.testSNICertificate
```

```Go
var testSNICertificate = ...
```

### <a id="testP256Certificate" href="#testP256Certificate">var testP256Certificate</a>

```
searchKey: tls.testP256Certificate
```

```Go
var testP256Certificate = ...
```

### <a id="testRSAPrivateKey" href="#testRSAPrivateKey">var testRSAPrivateKey</a>

```
searchKey: tls.testRSAPrivateKey
```

```Go
var testRSAPrivateKey, _ = ...
```

### <a id="testECDSAPrivateKey" href="#testECDSAPrivateKey">var testECDSAPrivateKey</a>

```
searchKey: tls.testECDSAPrivateKey
```

```Go
var testECDSAPrivateKey, _ = ...
```

### <a id="testP256PrivateKey" href="#testP256PrivateKey">var testP256PrivateKey</a>

```
searchKey: tls.testP256PrivateKey
```

```Go
var testP256PrivateKey, _ = ...
```

### <a id="testEd25519PrivateKey" href="#testEd25519PrivateKey">var testEd25519PrivateKey</a>

```
searchKey: tls.testEd25519PrivateKey
```

```Go
var testEd25519PrivateKey = ...
```

### <a id="clientKeyPEM" href="#clientKeyPEM">var clientKeyPEM</a>

```
searchKey: tls.clientKeyPEM
```

```Go
var clientKeyPEM = ...
```

### <a id="clientECDSAKeyPEM" href="#clientECDSAKeyPEM">var clientECDSAKeyPEM</a>

```
searchKey: tls.clientECDSAKeyPEM
```

```Go
var clientECDSAKeyPEM = ...
```

### <a id="clientEd25519KeyPEM" href="#clientEd25519KeyPEM">var clientEd25519KeyPEM</a>

```
searchKey: tls.clientEd25519KeyPEM
```

```Go
var clientEd25519KeyPEM = ...
```

### <a id="testSplitPreMasterSecretTests" href="#testSplitPreMasterSecretTests">var testSplitPreMasterSecretTests</a>

```
searchKey: tls.testSplitPreMasterSecretTests
```

```Go
var testSplitPreMasterSecretTests = ...
```

### <a id="testKeysFromTests" href="#testKeysFromTests">var testKeysFromTests</a>

```
searchKey: tls.testKeysFromTests
```

```Go
var testKeysFromTests = ...
```

These test vectors were generated from GnuTLS using `gnutls-cli --insecure -d 9 ` 

### <a id="rsaCertPEM" href="#rsaCertPEM">var rsaCertPEM</a>

```
searchKey: tls.rsaCertPEM
```

```Go
var rsaCertPEM = ...
```

### <a id="rsaKeyPEM" href="#rsaKeyPEM">var rsaKeyPEM</a>

```
searchKey: tls.rsaKeyPEM
```

```Go
var rsaKeyPEM = ...
```

### <a id="keyPEM" href="#keyPEM">var keyPEM</a>

```
searchKey: tls.keyPEM
```

```Go
var keyPEM = ...
```

keyPEM is the same as rsaKeyPEM, but declares itself as just "PRIVATE KEY", not "RSA PRIVATE KEY".  [https://golang.org/issue/4477](https://golang.org/issue/4477) 

### <a id="ecdsaCertPEM" href="#ecdsaCertPEM">var ecdsaCertPEM</a>

```
searchKey: tls.ecdsaCertPEM
```

```Go
var ecdsaCertPEM = ...
```

### <a id="ecdsaKeyPEM" href="#ecdsaKeyPEM">var ecdsaKeyPEM</a>

```
searchKey: tls.ecdsaKeyPEM
```

```Go
var ecdsaKeyPEM = ...
```

### <a id="keyPairTests" href="#keyPairTests">var keyPairTests</a>

```
searchKey: tls.keyPairTests
```

```Go
var keyPairTests = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [exported]
```

### <a id="alert" href="#alert">type alert uint8</a>

```
searchKey: tls.alert
```

```Go
type alert uint8
```

#### <a id="alert.String" href="#alert.String">func (e alert) String() string</a>

```
searchKey: tls.alert.String
```

```Go
func (e alert) String() string
```

#### <a id="alert.Error" href="#alert.Error">func (e alert) Error() string</a>

```
searchKey: tls.alert.Error
```

```Go
func (e alert) Error() string
```

### <a id="CipherSuite" href="#CipherSuite">type CipherSuite struct</a>

```
searchKey: tls.CipherSuite
tags: [exported]
```

```Go
type CipherSuite struct {
	ID   uint16
	Name string

	// Supported versions is the list of TLS protocol versions that can
	// negotiate this cipher suite.
	SupportedVersions []uint16

	// Insecure is true if the cipher suite has known security issues
	// due to its primitives, design, or implementation.
	Insecure bool
}
```

CipherSuite is a TLS cipher suite. Note that most functions in this package accept and expose cipher suite IDs instead of this type. 

### <a id="cipherSuite" href="#cipherSuite">type cipherSuite struct</a>

```
searchKey: tls.cipherSuite
```

```Go
type cipherSuite struct {
	id uint16
	// the lengths, in bytes, of the key material needed for each component.
	keyLen int
	macLen int
	ivLen  int
	ka     func(version uint16) keyAgreement
	// flags is a bitmask of the suite* values, above.
	flags  int
	cipher func(key, iv []byte, isRead bool) interface{}
	mac    func(key []byte) hash.Hash
	aead   func(key, fixedNonce []byte) aead
}
```

A cipherSuite is a TLS 1.0–1.2 cipher suite, and defines the key exchange mechanism, as well as the cipher+MAC pair or the AEAD. 

#### <a id="selectCipherSuite" href="#selectCipherSuite">func selectCipherSuite(ids, supportedIDs []uint16, ok func(*cipherSuite) bool) *cipherSuite</a>

```
searchKey: tls.selectCipherSuite
```

```Go
func selectCipherSuite(ids, supportedIDs []uint16, ok func(*cipherSuite) bool) *cipherSuite
```

selectCipherSuite returns the first TLS 1.0–1.2 cipher suite from ids which is also in supportedIDs and passes the ok filter. 

#### <a id="mutualCipherSuite" href="#mutualCipherSuite">func mutualCipherSuite(have []uint16, want uint16) *cipherSuite</a>

```
searchKey: tls.mutualCipherSuite
```

```Go
func mutualCipherSuite(have []uint16, want uint16) *cipherSuite
```

mutualCipherSuite returns a cipherSuite given a list of supported ciphersuites and the id requested by the peer. 

#### <a id="cipherSuiteByID" href="#cipherSuiteByID">func cipherSuiteByID(id uint16) *cipherSuite</a>

```
searchKey: tls.cipherSuiteByID
```

```Go
func cipherSuiteByID(id uint16) *cipherSuite
```

### <a id="cipherSuiteTLS13" href="#cipherSuiteTLS13">type cipherSuiteTLS13 struct</a>

```
searchKey: tls.cipherSuiteTLS13
```

```Go
type cipherSuiteTLS13 struct {
	id     uint16
	keyLen int
	aead   func(key, fixedNonce []byte) aead
	hash   crypto.Hash
}
```

A cipherSuiteTLS13 defines only the pair of the AEAD algorithm and hash algorithm to be used with HKDF. See RFC 8446, Appendix B.4. 

#### <a id="mutualCipherSuiteTLS13" href="#mutualCipherSuiteTLS13">func mutualCipherSuiteTLS13(have []uint16, want uint16) *cipherSuiteTLS13</a>

```
searchKey: tls.mutualCipherSuiteTLS13
```

```Go
func mutualCipherSuiteTLS13(have []uint16, want uint16) *cipherSuiteTLS13
```

#### <a id="cipherSuiteTLS13ByID" href="#cipherSuiteTLS13ByID">func cipherSuiteTLS13ByID(id uint16) *cipherSuiteTLS13</a>

```
searchKey: tls.cipherSuiteTLS13ByID
```

```Go
func cipherSuiteTLS13ByID(id uint16) *cipherSuiteTLS13
```

#### <a id="cipherSuiteTLS13.expandLabel" href="#cipherSuiteTLS13.expandLabel">func (c *cipherSuiteTLS13) expandLabel(secret []byte, label string, context []byte, length int) []byte</a>

```
searchKey: tls.cipherSuiteTLS13.expandLabel
```

```Go
func (c *cipherSuiteTLS13) expandLabel(secret []byte, label string, context []byte, length int) []byte
```

expandLabel implements HKDF-Expand-Label from RFC 8446, Section 7.1. 

#### <a id="cipherSuiteTLS13.deriveSecret" href="#cipherSuiteTLS13.deriveSecret">func (c *cipherSuiteTLS13) deriveSecret(secret []byte, label string, transcript hash.Hash) []byte</a>

```
searchKey: tls.cipherSuiteTLS13.deriveSecret
```

```Go
func (c *cipherSuiteTLS13) deriveSecret(secret []byte, label string, transcript hash.Hash) []byte
```

deriveSecret implements Derive-Secret from RFC 8446, Section 7.1. 

#### <a id="cipherSuiteTLS13.extract" href="#cipherSuiteTLS13.extract">func (c *cipherSuiteTLS13) extract(newSecret, currentSecret []byte) []byte</a>

```
searchKey: tls.cipherSuiteTLS13.extract
```

```Go
func (c *cipherSuiteTLS13) extract(newSecret, currentSecret []byte) []byte
```

extract implements HKDF-Extract with the cipher suite hash. 

#### <a id="cipherSuiteTLS13.nextTrafficSecret" href="#cipherSuiteTLS13.nextTrafficSecret">func (c *cipherSuiteTLS13) nextTrafficSecret(trafficSecret []byte) []byte</a>

```
searchKey: tls.cipherSuiteTLS13.nextTrafficSecret
```

```Go
func (c *cipherSuiteTLS13) nextTrafficSecret(trafficSecret []byte) []byte
```

nextTrafficSecret generates the next traffic secret, given the current one, according to RFC 8446, Section 7.2. 

#### <a id="cipherSuiteTLS13.trafficKey" href="#cipherSuiteTLS13.trafficKey">func (c *cipherSuiteTLS13) trafficKey(trafficSecret []byte) (key, iv []byte)</a>

```
searchKey: tls.cipherSuiteTLS13.trafficKey
```

```Go
func (c *cipherSuiteTLS13) trafficKey(trafficSecret []byte) (key, iv []byte)
```

trafficKey generates traffic keys according to RFC 8446, Section 7.3. 

#### <a id="cipherSuiteTLS13.finishedHash" href="#cipherSuiteTLS13.finishedHash">func (c *cipherSuiteTLS13) finishedHash(baseKey []byte, transcript hash.Hash) []byte</a>

```
searchKey: tls.cipherSuiteTLS13.finishedHash
```

```Go
func (c *cipherSuiteTLS13) finishedHash(baseKey []byte, transcript hash.Hash) []byte
```

finishedHash generates the Finished verify_data or PskBinderEntry according to RFC 8446, Section 4.4.4. See sections 4.4 and 4.2.11.2 for the baseKey selection. 

#### <a id="cipherSuiteTLS13.exportKeyingMaterial" href="#cipherSuiteTLS13.exportKeyingMaterial">func (c *cipherSuiteTLS13) exportKeyingMaterial(masterSecret []byte, transcript hash.Hash) func(string, []byte, int) ([]byte, error)</a>

```
searchKey: tls.cipherSuiteTLS13.exportKeyingMaterial
```

```Go
func (c *cipherSuiteTLS13) exportKeyingMaterial(masterSecret []byte, transcript hash.Hash) func(string, []byte, int) ([]byte, error)
```

exportKeyingMaterial implements RFC5705 exporters for TLS 1.3 according to RFC 8446, Section 7.5. 

### <a id="aead" href="#aead">type aead interface</a>

```
searchKey: tls.aead
```

```Go
type aead interface {
	cipher.AEAD

	// explicitNonceLen returns the number of bytes of explicit nonce
	// included in each record. This is eight for older AEADs and
	// zero for modern ones.
	explicitNonceLen() int
}
```

#### <a id="aeadAESGCM" href="#aeadAESGCM">func aeadAESGCM(key, noncePrefix []byte) aead</a>

```
searchKey: tls.aeadAESGCM
```

```Go
func aeadAESGCM(key, noncePrefix []byte) aead
```

#### <a id="aeadAESGCMTLS13" href="#aeadAESGCMTLS13">func aeadAESGCMTLS13(key, nonceMask []byte) aead</a>

```
searchKey: tls.aeadAESGCMTLS13
```

```Go
func aeadAESGCMTLS13(key, nonceMask []byte) aead
```

#### <a id="aeadChaCha20Poly1305" href="#aeadChaCha20Poly1305">func aeadChaCha20Poly1305(key, nonceMask []byte) aead</a>

```
searchKey: tls.aeadChaCha20Poly1305
```

```Go
func aeadChaCha20Poly1305(key, nonceMask []byte) aead
```

### <a id="prefixNonceAEAD" href="#prefixNonceAEAD">type prefixNonceAEAD struct</a>

```
searchKey: tls.prefixNonceAEAD
```

```Go
type prefixNonceAEAD struct {
	// nonce contains the fixed part of the nonce in the first four bytes.
	nonce [aeadNonceLength]byte
	aead  cipher.AEAD
}
```

prefixNonceAEAD wraps an AEAD and prefixes a fixed portion of the nonce to each call. 

#### <a id="prefixNonceAEAD.NonceSize" href="#prefixNonceAEAD.NonceSize">func (f *prefixNonceAEAD) NonceSize() int</a>

```
searchKey: tls.prefixNonceAEAD.NonceSize
```

```Go
func (f *prefixNonceAEAD) NonceSize() int
```

#### <a id="prefixNonceAEAD.Overhead" href="#prefixNonceAEAD.Overhead">func (f *prefixNonceAEAD) Overhead() int</a>

```
searchKey: tls.prefixNonceAEAD.Overhead
```

```Go
func (f *prefixNonceAEAD) Overhead() int
```

#### <a id="prefixNonceAEAD.explicitNonceLen" href="#prefixNonceAEAD.explicitNonceLen">func (f *prefixNonceAEAD) explicitNonceLen() int</a>

```
searchKey: tls.prefixNonceAEAD.explicitNonceLen
```

```Go
func (f *prefixNonceAEAD) explicitNonceLen() int
```

#### <a id="prefixNonceAEAD.Seal" href="#prefixNonceAEAD.Seal">func (f *prefixNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte</a>

```
searchKey: tls.prefixNonceAEAD.Seal
```

```Go
func (f *prefixNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte
```

#### <a id="prefixNonceAEAD.Open" href="#prefixNonceAEAD.Open">func (f *prefixNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)</a>

```
searchKey: tls.prefixNonceAEAD.Open
```

```Go
func (f *prefixNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)
```

### <a id="xorNonceAEAD" href="#xorNonceAEAD">type xorNonceAEAD struct</a>

```
searchKey: tls.xorNonceAEAD
```

```Go
type xorNonceAEAD struct {
	nonceMask [aeadNonceLength]byte
	aead      cipher.AEAD
}
```

xoredNonceAEAD wraps an AEAD by XORing in a fixed pattern to the nonce before each call. 

#### <a id="xorNonceAEAD.NonceSize" href="#xorNonceAEAD.NonceSize">func (f *xorNonceAEAD) NonceSize() int</a>

```
searchKey: tls.xorNonceAEAD.NonceSize
```

```Go
func (f *xorNonceAEAD) NonceSize() int
```

#### <a id="xorNonceAEAD.Overhead" href="#xorNonceAEAD.Overhead">func (f *xorNonceAEAD) Overhead() int</a>

```
searchKey: tls.xorNonceAEAD.Overhead
```

```Go
func (f *xorNonceAEAD) Overhead() int
```

#### <a id="xorNonceAEAD.explicitNonceLen" href="#xorNonceAEAD.explicitNonceLen">func (f *xorNonceAEAD) explicitNonceLen() int</a>

```
searchKey: tls.xorNonceAEAD.explicitNonceLen
```

```Go
func (f *xorNonceAEAD) explicitNonceLen() int
```

#### <a id="xorNonceAEAD.Seal" href="#xorNonceAEAD.Seal">func (f *xorNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte</a>

```
searchKey: tls.xorNonceAEAD.Seal
```

```Go
func (f *xorNonceAEAD) Seal(out, nonce, plaintext, additionalData []byte) []byte
```

#### <a id="xorNonceAEAD.Open" href="#xorNonceAEAD.Open">func (f *xorNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)</a>

```
searchKey: tls.xorNonceAEAD.Open
```

```Go
func (f *xorNonceAEAD) Open(out, nonce, ciphertext, additionalData []byte) ([]byte, error)
```

### <a id="constantTimeHash" href="#constantTimeHash">type constantTimeHash interface</a>

```
searchKey: tls.constantTimeHash
```

```Go
type constantTimeHash interface {
	hash.Hash
	ConstantTimeSum(b []byte) []byte
}
```

### <a id="cthWrapper" href="#cthWrapper">type cthWrapper struct</a>

```
searchKey: tls.cthWrapper
```

```Go
type cthWrapper struct {
	h constantTimeHash
}
```

cthWrapper wraps any hash.Hash that implements ConstantTimeSum, and replaces with that all calls to Sum. It's used to obtain a ConstantTimeSum-based HMAC. 

#### <a id="cthWrapper.Size" href="#cthWrapper.Size">func (c *cthWrapper) Size() int</a>

```
searchKey: tls.cthWrapper.Size
```

```Go
func (c *cthWrapper) Size() int
```

#### <a id="cthWrapper.BlockSize" href="#cthWrapper.BlockSize">func (c *cthWrapper) BlockSize() int</a>

```
searchKey: tls.cthWrapper.BlockSize
```

```Go
func (c *cthWrapper) BlockSize() int
```

#### <a id="cthWrapper.Reset" href="#cthWrapper.Reset">func (c *cthWrapper) Reset()</a>

```
searchKey: tls.cthWrapper.Reset
```

```Go
func (c *cthWrapper) Reset()
```

#### <a id="cthWrapper.Write" href="#cthWrapper.Write">func (c *cthWrapper) Write(p []byte) (int, error)</a>

```
searchKey: tls.cthWrapper.Write
```

```Go
func (c *cthWrapper) Write(p []byte) (int, error)
```

#### <a id="cthWrapper.Sum" href="#cthWrapper.Sum">func (c *cthWrapper) Sum(b []byte) []byte</a>

```
searchKey: tls.cthWrapper.Sum
```

```Go
func (c *cthWrapper) Sum(b []byte) []byte
```

### <a id="recordType" href="#recordType">type recordType uint8</a>

```
searchKey: tls.recordType
```

```Go
type recordType uint8
```

TLS record types. 

### <a id="CurveID" href="#CurveID">type CurveID uint16</a>

```
searchKey: tls.CurveID
tags: [exported]
```

```Go
type CurveID uint16
```

CurveID is the type of a TLS identifier for an elliptic curve. See [https://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-8](https://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-8). 

In TLS 1.3, this type is called NamedGroup, but at this time this library only supports Elliptic Curve based groups. See RFC 8446, Section 4.2.7. 

#### <a id="CurveID.String" href="#CurveID.String">func (i CurveID) String() string</a>

```
searchKey: tls.CurveID.String
tags: [exported]
```

```Go
func (i CurveID) String() string
```

### <a id="keyShare" href="#keyShare">type keyShare struct</a>

```
searchKey: tls.keyShare
```

```Go
type keyShare struct {
	group CurveID
	data  []byte
}
```

TLS 1.3 Key Share. See RFC 8446, Section 4.2.8. 

### <a id="pskIdentity" href="#pskIdentity">type pskIdentity struct</a>

```
searchKey: tls.pskIdentity
```

```Go
type pskIdentity struct {
	label               []byte
	obfuscatedTicketAge uint32
}
```

TLS 1.3 PSK Identity. Can be a Session Ticket, or a reference to a saved session. See RFC 8446, Section 4.2.11. 

### <a id="ConnectionState" href="#ConnectionState">type ConnectionState struct</a>

```
searchKey: tls.ConnectionState
tags: [exported]
```

```Go
type ConnectionState struct {
	// Version is the TLS version used by the connection (e.g. VersionTLS12).
	Version uint16

	// HandshakeComplete is true if the handshake has concluded.
	HandshakeComplete bool

	// DidResume is true if this connection was successfully resumed from a
	// previous session with a session ticket or similar mechanism.
	DidResume bool

	// CipherSuite is the cipher suite negotiated for the connection (e.g.
	// TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_AES_128_GCM_SHA256).
	CipherSuite uint16

	// NegotiatedProtocol is the application protocol negotiated with ALPN.
	NegotiatedProtocol string

	// NegotiatedProtocolIsMutual used to indicate a mutual NPN negotiation.
	//
	// Deprecated: this value is always true.
	NegotiatedProtocolIsMutual bool

	// ServerName is the value of the Server Name Indication extension sent by
	// the client. It's available both on the server and on the client side.
	ServerName string

	// PeerCertificates are the parsed certificates sent by the peer, in the
	// order in which they were sent. The first element is the leaf certificate
	// that the connection is verified against.
	//
	// On the client side, it can't be empty. On the server side, it can be
	// empty if Config.ClientAuth is not RequireAnyClientCert or
	// RequireAndVerifyClientCert.
	PeerCertificates []*x509.Certificate

	// VerifiedChains is a list of one or more chains where the first element is
	// PeerCertificates[0] and the last element is from Config.RootCAs (on the
	// client side) or Config.ClientCAs (on the server side).
	//
	// On the client side, it's set if Config.InsecureSkipVerify is false. On
	// the server side, it's set if Config.ClientAuth is VerifyClientCertIfGiven
	// (and the peer provided a certificate) or RequireAndVerifyClientCert.
	VerifiedChains [][]*x509.Certificate

	// SignedCertificateTimestamps is a list of SCTs provided by the peer
	// through the TLS handshake for the leaf certificate, if any.
	SignedCertificateTimestamps [][]byte

	// OCSPResponse is a stapled Online Certificate Status Protocol (OCSP)
	// response provided by the peer for the leaf certificate, if any.
	OCSPResponse []byte

	// TLSUnique contains the "tls-unique" channel binding value (see RFC 5929,
	// Section 3). This value will be nil for TLS 1.3 connections and for all
	// resumed connections.
	//
	// Deprecated: there are conditions in which this value might not be unique
	// to a connection. See the Security Considerations sections of RFC 5705 and
	// RFC 7627, and https://mitls.org/pages/attacks/3SHAKE#channelbindings.
	TLSUnique []byte

	// ekm is a closure exposed via ExportKeyingMaterial.
	ekm func(label string, context []byte, length int) ([]byte, error)
}
```

ConnectionState records basic TLS details about the connection. 

#### <a id="testHandshake" href="#testHandshake">func testHandshake(t *testing.T, clientConfig, serverConfig *Config) (serverState, clientState ConnectionState, err error)</a>

```
searchKey: tls.testHandshake
```

```Go
func testHandshake(t *testing.T, clientConfig, serverConfig *Config) (serverState, clientState ConnectionState, err error)
```

#### <a id="ConnectionState.ExportKeyingMaterial" href="#ConnectionState.ExportKeyingMaterial">func (cs *ConnectionState) ExportKeyingMaterial(label string, context []byte, length int) ([]byte, error)</a>

```
searchKey: tls.ConnectionState.ExportKeyingMaterial
tags: [exported]
```

```Go
func (cs *ConnectionState) ExportKeyingMaterial(label string, context []byte, length int) ([]byte, error)
```

ExportKeyingMaterial returns length bytes of exported key material in a new slice as defined in RFC 5705. If context is nil, it is not used as part of the seed. If the connection was set to allow renegotiation via Config.Renegotiation, this function will return an error. 

### <a id="ClientAuthType" href="#ClientAuthType">type ClientAuthType int</a>

```
searchKey: tls.ClientAuthType
tags: [exported]
```

```Go
type ClientAuthType int
```

ClientAuthType declares the policy the server will follow for TLS Client Authentication. 

#### <a id="ClientAuthType.String" href="#ClientAuthType.String">func (i ClientAuthType) String() string</a>

```
searchKey: tls.ClientAuthType.String
tags: [exported]
```

```Go
func (i ClientAuthType) String() string
```

### <a id="ClientSessionState" href="#ClientSessionState">type ClientSessionState struct</a>

```
searchKey: tls.ClientSessionState
tags: [exported]
```

```Go
type ClientSessionState struct {
	sessionTicket      []uint8               // Encrypted ticket used for session resumption with server
	vers               uint16                // TLS version negotiated for the session
	cipherSuite        uint16                // Ciphersuite negotiated for the session
	masterSecret       []byte                // Full handshake MasterSecret, or TLS 1.3 resumption_master_secret
	serverCertificates []*x509.Certificate   // Certificate chain presented by the server
	verifiedChains     [][]*x509.Certificate // Certificate chains we built for verification
	receivedAt         time.Time             // When the session ticket was received from the server
	ocspResponse       []byte                // Stapled OCSP response presented by the server
	scts               [][]byte              // SCTs presented by the server

	// TLS 1.3 fields.
	nonce  []byte    // Ticket nonce sent by the server, to derive PSK
	useBy  time.Time // Expiration of the ticket lifetime as set by the server
	ageAdd uint32    // Random obfuscation factor for sending the ticket age
}
```

ClientSessionState contains the state needed by clients to resume TLS sessions. 

### <a id="ClientSessionCache" href="#ClientSessionCache">type ClientSessionCache interface</a>

```
searchKey: tls.ClientSessionCache
tags: [exported]
```

```Go
type ClientSessionCache interface {
	// Get searches for a ClientSessionState associated with the given key.
	// On return, ok is true if one was found.
	Get(sessionKey string) (session *ClientSessionState, ok bool)

	// Put adds the ClientSessionState to the cache with the given key. It might
	// get called multiple times in a connection if a TLS 1.3 server provides
	// more than one session ticket. If called with a nil *ClientSessionState,
	// it should remove the cache entry.
	Put(sessionKey string, cs *ClientSessionState)
}
```

ClientSessionCache is a cache of ClientSessionState objects that can be used by a client to resume a TLS session with a given server. ClientSessionCache implementations should expect to be called concurrently from different goroutines. Up to TLS 1.2, only ticket-based resumption is supported, not SessionID-based resumption. In TLS 1.3 they were merged into PSK modes, which are supported via this interface. 

#### <a id="NewLRUClientSessionCache" href="#NewLRUClientSessionCache">func NewLRUClientSessionCache(capacity int) ClientSessionCache</a>

```
searchKey: tls.NewLRUClientSessionCache
tags: [exported]
```

```Go
func NewLRUClientSessionCache(capacity int) ClientSessionCache
```

NewLRUClientSessionCache returns a ClientSessionCache with the given capacity that uses an LRU strategy. If capacity is < 1, a default capacity is used instead. 

### <a id="SignatureScheme" href="#SignatureScheme">type SignatureScheme uint16</a>

```
searchKey: tls.SignatureScheme
tags: [exported]
```

```Go
type SignatureScheme uint16
```

SignatureScheme identifies a signature algorithm supported by TLS. See RFC 8446, Section 4.2.3. 

#### <a id="selectSignatureScheme" href="#selectSignatureScheme">func selectSignatureScheme(vers uint16, c *Certificate, peerAlgs []SignatureScheme) (SignatureScheme, error)</a>

```
searchKey: tls.selectSignatureScheme
```

```Go
func selectSignatureScheme(vers uint16, c *Certificate, peerAlgs []SignatureScheme) (SignatureScheme, error)
```

selectSignatureScheme picks a SignatureScheme from the peer's preference list that works with the selected certificate. It's only called for protocol versions that support signature algorithms, so TLS 1.2 and 1.3. 

#### <a id="SignatureScheme.String" href="#SignatureScheme.String">func (i SignatureScheme) String() string</a>

```
searchKey: tls.SignatureScheme.String
tags: [exported]
```

```Go
func (i SignatureScheme) String() string
```

### <a id="ClientHelloInfo" href="#ClientHelloInfo">type ClientHelloInfo struct</a>

```
searchKey: tls.ClientHelloInfo
tags: [exported]
```

```Go
type ClientHelloInfo struct {
	// CipherSuites lists the CipherSuites supported by the client (e.g.
	// TLS_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256).
	CipherSuites []uint16

	// ServerName indicates the name of the server requested by the client
	// in order to support virtual hosting. ServerName is only set if the
	// client is using SNI (see RFC 4366, Section 3.1).
	ServerName string

	// SupportedCurves lists the elliptic curves supported by the client.
	// SupportedCurves is set only if the Supported Elliptic Curves
	// Extension is being used (see RFC 4492, Section 5.1.1).
	SupportedCurves []CurveID

	// SupportedPoints lists the point formats supported by the client.
	// SupportedPoints is set only if the Supported Point Formats Extension
	// is being used (see RFC 4492, Section 5.1.2).
	SupportedPoints []uint8

	// SignatureSchemes lists the signature and hash schemes that the client
	// is willing to verify. SignatureSchemes is set only if the Signature
	// Algorithms Extension is being used (see RFC 5246, Section 7.4.1.4.1).
	SignatureSchemes []SignatureScheme

	// SupportedProtos lists the application protocols supported by the client.
	// SupportedProtos is set only if the Application-Layer Protocol
	// Negotiation Extension is being used (see RFC 7301, Section 3.1).
	//
	// Servers can select a protocol by setting Config.NextProtos in a
	// GetConfigForClient return value.
	SupportedProtos []string

	// SupportedVersions lists the TLS versions supported by the client.
	// For TLS versions less than 1.3, this is extrapolated from the max
	// version advertised by the client, so values other than the greatest
	// might be rejected if used.
	SupportedVersions []uint16

	// Conn is the underlying net.Conn for the connection. Do not read
	// from, or write to, this connection; that will cause the TLS
	// connection to fail.
	Conn net.Conn

	// config is embedded by the GetCertificate or GetConfigForClient caller,
	// for use with SupportsCertificate.
	config *Config

	// ctx is the context of the handshake that is in progress.
	ctx context.Context
}
```

ClientHelloInfo contains information from a ClientHello message in order to guide application logic in the GetCertificate and GetConfigForClient callbacks. 

#### <a id="clientHelloInfo" href="#clientHelloInfo">func clientHelloInfo(ctx context.Context, c *Conn, clientHello *clientHelloMsg) *ClientHelloInfo</a>

```
searchKey: tls.clientHelloInfo
```

```Go
func clientHelloInfo(ctx context.Context, c *Conn, clientHello *clientHelloMsg) *ClientHelloInfo
```

#### <a id="ClientHelloInfo.Context" href="#ClientHelloInfo.Context">func (c *ClientHelloInfo) Context() context.Context</a>

```
searchKey: tls.ClientHelloInfo.Context
tags: [exported]
```

```Go
func (c *ClientHelloInfo) Context() context.Context
```

Context returns the context of the handshake that is in progress. This context is a child of the context passed to HandshakeContext, if any, and is canceled when the handshake concludes. 

#### <a id="ClientHelloInfo.SupportsCertificate" href="#ClientHelloInfo.SupportsCertificate">func (chi *ClientHelloInfo) SupportsCertificate(c *Certificate) error</a>

```
searchKey: tls.ClientHelloInfo.SupportsCertificate
tags: [exported]
```

```Go
func (chi *ClientHelloInfo) SupportsCertificate(c *Certificate) error
```

SupportsCertificate returns nil if the provided certificate is supported by the client that sent the ClientHello. Otherwise, it returns an error describing the reason for the incompatibility. 

If this ClientHelloInfo was passed to a GetConfigForClient or GetCertificate callback, this method will take into account the associated Config. Note that if GetConfigForClient returns a different Config, the change can't be accounted for by this method. 

This function will call x509.ParseCertificate unless c.Leaf is set, which can incur a significant performance cost. 

### <a id="CertificateRequestInfo" href="#CertificateRequestInfo">type CertificateRequestInfo struct</a>

```
searchKey: tls.CertificateRequestInfo
tags: [exported]
```

```Go
type CertificateRequestInfo struct {
	// AcceptableCAs contains zero or more, DER-encoded, X.501
	// Distinguished Names. These are the names of root or intermediate CAs
	// that the server wishes the returned certificate to be signed by. An
	// empty slice indicates that the server has no preference.
	AcceptableCAs [][]byte

	// SignatureSchemes lists the signature schemes that the server is
	// willing to verify.
	SignatureSchemes []SignatureScheme

	// Version is the TLS version that was negotiated for this connection.
	Version uint16

	// ctx is the context of the handshake that is in progress.
	ctx context.Context
}
```

CertificateRequestInfo contains information from a server's CertificateRequest message, which is used to demand a certificate and proof of control from a client. 

#### <a id="certificateRequestInfoFromMsg" href="#certificateRequestInfoFromMsg">func certificateRequestInfoFromMsg(ctx context.Context, vers uint16, certReq *certificateRequestMsg) *CertificateRequestInfo</a>

```
searchKey: tls.certificateRequestInfoFromMsg
```

```Go
func certificateRequestInfoFromMsg(ctx context.Context, vers uint16, certReq *certificateRequestMsg) *CertificateRequestInfo
```

certificateRequestInfoFromMsg generates a CertificateRequestInfo from a TLS <= 1.2 CertificateRequest, making an effort to fill in missing information. 

#### <a id="CertificateRequestInfo.Context" href="#CertificateRequestInfo.Context">func (c *CertificateRequestInfo) Context() context.Context</a>

```
searchKey: tls.CertificateRequestInfo.Context
tags: [exported]
```

```Go
func (c *CertificateRequestInfo) Context() context.Context
```

Context returns the context of the handshake that is in progress. This context is a child of the context passed to HandshakeContext, if any, and is canceled when the handshake concludes. 

#### <a id="CertificateRequestInfo.SupportsCertificate" href="#CertificateRequestInfo.SupportsCertificate">func (cri *CertificateRequestInfo) SupportsCertificate(c *Certificate) error</a>

```
searchKey: tls.CertificateRequestInfo.SupportsCertificate
tags: [exported]
```

```Go
func (cri *CertificateRequestInfo) SupportsCertificate(c *Certificate) error
```

SupportsCertificate returns nil if the provided certificate is supported by the server that sent the CertificateRequest. Otherwise, it returns an error describing the reason for the incompatibility. 

### <a id="RenegotiationSupport" href="#RenegotiationSupport">type RenegotiationSupport int</a>

```
searchKey: tls.RenegotiationSupport
tags: [exported]
```

```Go
type RenegotiationSupport int
```

RenegotiationSupport enumerates the different levels of support for TLS renegotiation. TLS renegotiation is the act of performing subsequent handshakes on a connection after the first. This significantly complicates the state machine and has been the source of numerous, subtle security issues. Initiating a renegotiation is not supported, but support for accepting renegotiation requests may be enabled. 

Even when enabled, the server may not change its identity between handshakes (i.e. the leaf certificate must be the same). Additionally, concurrent handshake and application data flow is not permitted so renegotiation can only be used with protocols that synchronise with the renegotiation, such as HTTPS. 

Renegotiation is not defined in TLS 1.3. 

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: tls.Config
tags: [exported]
```

```Go
type Config struct {
	// Rand provides the source of entropy for nonces and RSA blinding.
	// If Rand is nil, TLS uses the cryptographic random reader in package
	// crypto/rand.
	// The Reader must be safe for use by multiple goroutines.
	Rand io.Reader

	// Time returns the current time as the number of seconds since the epoch.
	// If Time is nil, TLS uses time.Now.
	Time func() time.Time

	// Certificates contains one or more certificate chains to present to the
	// other side of the connection. The first certificate compatible with the
	// peer's requirements is selected automatically.
	//
	// Server configurations must set one of Certificates, GetCertificate or
	// GetConfigForClient. Clients doing client-authentication may set either
	// Certificates or GetClientCertificate.
	//
	// Note: if there are multiple Certificates, and they don't have the
	// optional field Leaf set, certificate selection will incur a significant
	// per-handshake performance cost.
	Certificates []Certificate

	// NameToCertificate maps from a certificate name to an element of
	// Certificates. Note that a certificate name can be of the form
	// '*.example.com' and so doesn't have to be a domain name as such.
	//
	// Deprecated: NameToCertificate only allows associating a single
	// certificate with a given name. Leave this field nil to let the library
	// select the first compatible chain from Certificates.
	NameToCertificate map[string]*Certificate

	// GetCertificate returns a Certificate based on the given
	// ClientHelloInfo. It will only be called if the client supplies SNI
	// information or if Certificates is empty.
	//
	// If GetCertificate is nil or returns nil, then the certificate is
	// retrieved from NameToCertificate. If NameToCertificate is nil, the
	// best element of Certificates will be used.
	GetCertificate func(*ClientHelloInfo) (*Certificate, error)

	// GetClientCertificate, if not nil, is called when a server requests a
	// certificate from a client. If set, the contents of Certificates will
	// be ignored.
	//
	// If GetClientCertificate returns an error, the handshake will be
	// aborted and that error will be returned. Otherwise
	// GetClientCertificate must return a non-nil Certificate. If
	// Certificate.Certificate is empty then no certificate will be sent to
	// the server. If this is unacceptable to the server then it may abort
	// the handshake.
	//
	// GetClientCertificate may be called multiple times for the same
	// connection if renegotiation occurs or if TLS 1.3 is in use.
	GetClientCertificate func(*CertificateRequestInfo) (*Certificate, error)

	// GetConfigForClient, if not nil, is called after a ClientHello is
	// received from a client. It may return a non-nil Config in order to
	// change the Config that will be used to handle this connection. If
	// the returned Config is nil, the original Config will be used. The
	// Config returned by this callback may not be subsequently modified.
	//
	// If GetConfigForClient is nil, the Config passed to Server() will be
	// used for all connections.
	//
	// If SessionTicketKey was explicitly set on the returned Config, or if
	// SetSessionTicketKeys was called on the returned Config, those keys will
	// be used. Otherwise, the original Config keys will be used (and possibly
	// rotated if they are automatically managed).
	GetConfigForClient func(*ClientHelloInfo) (*Config, error)

	// VerifyPeerCertificate, if not nil, is called after normal
	// certificate verification by either a TLS client or server. It
	// receives the raw ASN.1 certificates provided by the peer and also
	// any verified chains that normal processing found. If it returns a
	// non-nil error, the handshake is aborted and that error results.
	//
	// If normal verification fails then the handshake will abort before
	// considering this callback. If normal verification is disabled by
	// setting InsecureSkipVerify, or (for a server) when ClientAuth is
	// RequestClientCert or RequireAnyClientCert, then this callback will
	// be considered but the verifiedChains argument will always be nil.
	VerifyPeerCertificate func(rawCerts [][]byte, verifiedChains [][]*x509.Certificate) error

	// VerifyConnection, if not nil, is called after normal certificate
	// verification and after VerifyPeerCertificate by either a TLS client
	// or server. If it returns a non-nil error, the handshake is aborted
	// and that error results.
	//
	// If normal verification fails then the handshake will abort before
	// considering this callback. This callback will run for all connections
	// regardless of InsecureSkipVerify or ClientAuth settings.
	VerifyConnection func(ConnectionState) error

	// RootCAs defines the set of root certificate authorities
	// that clients use when verifying server certificates.
	// If RootCAs is nil, TLS uses the host's root CA set.
	RootCAs *x509.CertPool

	// NextProtos is a list of supported application level protocols, in
	// order of preference. If both peers support ALPN, the selected
	// protocol will be one from this list, and the connection will fail
	// if there is no mutually supported protocol. If NextProtos is empty
	// or the peer doesn't support ALPN, the connection will succeed and
	// ConnectionState.NegotiatedProtocol will be empty.
	NextProtos []string

	// ServerName is used to verify the hostname on the returned
	// certificates unless InsecureSkipVerify is given. It is also included
	// in the client's handshake to support virtual hosting unless it is
	// an IP address.
	ServerName string

	// ClientAuth determines the server's policy for
	// TLS Client Authentication. The default is NoClientCert.
	ClientAuth ClientAuthType

	// ClientCAs defines the set of root certificate authorities
	// that servers use if required to verify a client certificate
	// by the policy in ClientAuth.
	ClientCAs *x509.CertPool

	// InsecureSkipVerify controls whether a client verifies the server's
	// certificate chain and host name. If InsecureSkipVerify is true, crypto/tls
	// accepts any certificate presented by the server and any host name in that
	// certificate. In this mode, TLS is susceptible to machine-in-the-middle
	// attacks unless custom verification is used. This should be used only for
	// testing or in combination with VerifyConnection or VerifyPeerCertificate.
	InsecureSkipVerify bool

	// CipherSuites is a list of enabled TLS 1.0–1.2 cipher suites. The order of
	// the list is ignored. Note that TLS 1.3 ciphersuites are not configurable.
	//
	// If CipherSuites is nil, a safe default list is used. The default cipher
	// suites might change over time.
	CipherSuites []uint16

	// PreferServerCipherSuites is a legacy field and has no effect.
	//
	// It used to control whether the server would follow the client's or the
	// server's preference. Servers now select the best mutually supported
	// cipher suite based on logic that takes into account inferred client
	// hardware, server hardware, and security.
	//
	// Deprected: PreferServerCipherSuites is ignored.
	PreferServerCipherSuites bool

	// SessionTicketsDisabled may be set to true to disable session ticket and
	// PSK (resumption) support. Note that on clients, session ticket support is
	// also disabled if ClientSessionCache is nil.
	SessionTicketsDisabled bool

	// SessionTicketKey is used by TLS servers to provide session resumption.
	// See RFC 5077 and the PSK mode of RFC 8446. If zero, it will be filled
	// with random data before the first server handshake.
	//
	// Deprecated: if this field is left at zero, session ticket keys will be
	// automatically rotated every day and dropped after seven days. For
	// customizing the rotation schedule or synchronizing servers that are
	// terminating connections for the same host, use SetSessionTicketKeys.
	SessionTicketKey [32]byte

	// ClientSessionCache is a cache of ClientSessionState entries for TLS
	// session resumption. It is only used by clients.
	ClientSessionCache ClientSessionCache

	// MinVersion contains the minimum TLS version that is acceptable.
	// If zero, TLS 1.0 is currently taken as the minimum.
	MinVersion uint16

	// MaxVersion contains the maximum TLS version that is acceptable.
	// If zero, the maximum version supported by this package is used,
	// which is currently TLS 1.3.
	MaxVersion uint16

	// CurvePreferences contains the elliptic curves that will be used in
	// an ECDHE handshake, in preference order. If empty, the default will
	// be used. The client will use the first preference as the type for
	// its key share in TLS 1.3. This may change in the future.
	CurvePreferences []CurveID

	// DynamicRecordSizingDisabled disables adaptive sizing of TLS records.
	// When true, the largest possible TLS record size is always used. When
	// false, the size of TLS records may be adjusted in an attempt to
	// improve latency.
	DynamicRecordSizingDisabled bool

	// Renegotiation controls what types of renegotiation are supported.
	// The default, none, is correct for the vast majority of applications.
	Renegotiation RenegotiationSupport

	// KeyLogWriter optionally specifies a destination for TLS master secrets
	// in NSS key log format that can be used to allow external programs
	// such as Wireshark to decrypt TLS connections.
	// See https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/Key_Log_Format.
	// Use of KeyLogWriter compromises security and should only be
	// used for debugging.
	KeyLogWriter io.Writer

	// mutex protects sessionTicketKeys and autoSessionTicketKeys.
	mutex sync.RWMutex
	// sessionTicketKeys contains zero or more ticket keys. If set, it means the
	// the keys were set with SessionTicketKey or SetSessionTicketKeys. The
	// first key is used for new tickets and any subsequent keys can be used to
	// decrypt old tickets. The slice contents are not protected by the mutex
	// and are immutable.
	sessionTicketKeys []ticketKey
	// autoSessionTicketKeys is like sessionTicketKeys but is owned by the
	// auto-rotation logic. See Config.ticketKeys.
	autoSessionTicketKeys []ticketKey
}
```

A Config structure is used to configure a TLS client or server. After one has been passed to a TLS function it must not be modified. A Config may be reused; the tls package will also not modify it. 

#### <a id="defaultConfig" href="#defaultConfig">func defaultConfig() *Config</a>

```
searchKey: tls.defaultConfig
```

```Go
func defaultConfig() *Config
```

#### <a id="Config.ticketKeyFromBytes" href="#Config.ticketKeyFromBytes">func (c *Config) ticketKeyFromBytes(b [32]byte) (key ticketKey)</a>

```
searchKey: tls.Config.ticketKeyFromBytes
```

```Go
func (c *Config) ticketKeyFromBytes(b [32]byte) (key ticketKey)
```

ticketKeyFromBytes converts from the external representation of a session ticket key to a ticketKey. Externally, session ticket keys are 32 random bytes and this function expands that into sufficient name and key material. 

#### <a id="Config.Clone" href="#Config.Clone">func (c *Config) Clone() *Config</a>

```
searchKey: tls.Config.Clone
tags: [exported]
```

```Go
func (c *Config) Clone() *Config
```

Clone returns a shallow clone of c or nil if c is nil. It is safe to clone a Config that is being used concurrently by a TLS client or server. 

#### <a id="Config.initLegacySessionTicketKeyRLocked" href="#Config.initLegacySessionTicketKeyRLocked">func (c *Config) initLegacySessionTicketKeyRLocked()</a>

```
searchKey: tls.Config.initLegacySessionTicketKeyRLocked
```

```Go
func (c *Config) initLegacySessionTicketKeyRLocked()
```

initLegacySessionTicketKeyRLocked ensures the legacy SessionTicketKey field is randomized if empty, and that sessionTicketKeys is populated from it otherwise. 

#### <a id="Config.ticketKeys" href="#Config.ticketKeys">func (c *Config) ticketKeys(configForClient *Config) []ticketKey</a>

```
searchKey: tls.Config.ticketKeys
```

```Go
func (c *Config) ticketKeys(configForClient *Config) []ticketKey
```

ticketKeys returns the ticketKeys for this connection. If configForClient has explicitly set keys, those will be returned. Otherwise, the keys on c will be used and may be rotated if auto-managed. During rotation, any expired session ticket keys are deleted from c.sessionTicketKeys. If the session ticket key that is currently encrypting tickets (ie. the first ticketKey in c.sessionTicketKeys) is not fresh, then a new session ticket key will be created and prepended to c.sessionTicketKeys. 

#### <a id="Config.SetSessionTicketKeys" href="#Config.SetSessionTicketKeys">func (c *Config) SetSessionTicketKeys(keys [][32]byte)</a>

```
searchKey: tls.Config.SetSessionTicketKeys
tags: [exported]
```

```Go
func (c *Config) SetSessionTicketKeys(keys [][32]byte)
```

SetSessionTicketKeys updates the session ticket keys for a server. 

The first key will be used when creating new tickets, while all keys can be used for decrypting tickets. It is safe to call this function while the server is running in order to rotate the session ticket keys. The function will panic if keys is empty. 

Calling this function will turn off automatic session ticket key rotation. 

If multiple servers are terminating connections for the same host they should all have the same session ticket keys. If the session ticket keys leaks, previously recorded and future TLS connections using those keys might be compromised. 

#### <a id="Config.rand" href="#Config.rand">func (c *Config) rand() io.Reader</a>

```
searchKey: tls.Config.rand
```

```Go
func (c *Config) rand() io.Reader
```

#### <a id="Config.time" href="#Config.time">func (c *Config) time() time.Time</a>

```
searchKey: tls.Config.time
```

```Go
func (c *Config) time() time.Time
```

#### <a id="Config.cipherSuites" href="#Config.cipherSuites">func (c *Config) cipherSuites() []uint16</a>

```
searchKey: tls.Config.cipherSuites
```

```Go
func (c *Config) cipherSuites() []uint16
```

#### <a id="Config.supportedVersions" href="#Config.supportedVersions">func (c *Config) supportedVersions() []uint16</a>

```
searchKey: tls.Config.supportedVersions
```

```Go
func (c *Config) supportedVersions() []uint16
```

#### <a id="Config.maxSupportedVersion" href="#Config.maxSupportedVersion">func (c *Config) maxSupportedVersion() uint16</a>

```
searchKey: tls.Config.maxSupportedVersion
```

```Go
func (c *Config) maxSupportedVersion() uint16
```

#### <a id="Config.curvePreferences" href="#Config.curvePreferences">func (c *Config) curvePreferences() []CurveID</a>

```
searchKey: tls.Config.curvePreferences
```

```Go
func (c *Config) curvePreferences() []CurveID
```

#### <a id="Config.supportsCurve" href="#Config.supportsCurve">func (c *Config) supportsCurve(curve CurveID) bool</a>

```
searchKey: tls.Config.supportsCurve
```

```Go
func (c *Config) supportsCurve(curve CurveID) bool
```

#### <a id="Config.mutualVersion" href="#Config.mutualVersion">func (c *Config) mutualVersion(peerVersions []uint16) (uint16, bool)</a>

```
searchKey: tls.Config.mutualVersion
```

```Go
func (c *Config) mutualVersion(peerVersions []uint16) (uint16, bool)
```

mutualVersion returns the protocol version to use given the advertised versions of the peer. Priority is given to the peer preference order. 

#### <a id="Config.getCertificate" href="#Config.getCertificate">func (c *Config) getCertificate(clientHello *ClientHelloInfo) (*Certificate, error)</a>

```
searchKey: tls.Config.getCertificate
```

```Go
func (c *Config) getCertificate(clientHello *ClientHelloInfo) (*Certificate, error)
```

getCertificate returns the best certificate for the given ClientHelloInfo, defaulting to the first element of c.Certificates. 

#### <a id="Config.BuildNameToCertificate" href="#Config.BuildNameToCertificate">func (c *Config) BuildNameToCertificate()</a>

```
searchKey: tls.Config.BuildNameToCertificate
tags: [exported deprecated]
```

```Go
func (c *Config) BuildNameToCertificate()
```

BuildNameToCertificate parses c.Certificates and builds c.NameToCertificate from the CommonName and SubjectAlternateName fields of each of the leaf certificates. 

Deprecated: NameToCertificate only allows associating a single certificate with a given name. Leave that field nil to let the library select the first compatible chain from Certificates. 

#### <a id="Config.writeKeyLog" href="#Config.writeKeyLog">func (c *Config) writeKeyLog(label string, clientRandom, secret []byte) error</a>

```
searchKey: tls.Config.writeKeyLog
```

```Go
func (c *Config) writeKeyLog(label string, clientRandom, secret []byte) error
```

### <a id="ticketKey" href="#ticketKey">type ticketKey struct</a>

```
searchKey: tls.ticketKey
```

```Go
type ticketKey struct {
	// keyName is an opaque byte string that serves to identify the session
	// ticket key. It's exposed as plaintext in every session ticket.
	keyName [ticketKeyNameLen]byte
	aesKey  [16]byte
	hmacKey [16]byte
	// created is the time at which this ticket key was created. See Config.ticketKeys.
	created time.Time
}
```

ticketKey is the internal representation of a session ticket key. 

### <a id="Certificate" href="#Certificate">type Certificate struct</a>

```
searchKey: tls.Certificate
tags: [exported]
```

```Go
type Certificate struct {
	Certificate [][]byte
	// PrivateKey contains the private key corresponding to the public key in
	// Leaf. This must implement crypto.Signer with an RSA, ECDSA or Ed25519 PublicKey.
	// For a server up to TLS 1.2, it can also implement crypto.Decrypter with
	// an RSA PublicKey.
	PrivateKey crypto.PrivateKey
	// SupportedSignatureAlgorithms is an optional list restricting what
	// signature algorithms the PrivateKey can be used for.
	SupportedSignatureAlgorithms []SignatureScheme
	// OCSPStaple contains an optional OCSP response which will be served
	// to clients that request it.
	OCSPStaple []byte
	// SignedCertificateTimestamps contains an optional list of Signed
	// Certificate Timestamps which will be served to clients that request it.
	SignedCertificateTimestamps [][]byte
	// Leaf is the parsed form of the leaf certificate, which may be initialized
	// using x509.ParseCertificate to reduce per-handshake processing. If nil,
	// the leaf certificate will be parsed as needed.
	Leaf *x509.Certificate
}
```

A Certificate is a chain of one or more certificates, leaf first. 

#### <a id="LoadX509KeyPair" href="#LoadX509KeyPair">func LoadX509KeyPair(certFile, keyFile string) (Certificate, error)</a>

```
searchKey: tls.LoadX509KeyPair
tags: [exported]
```

```Go
func LoadX509KeyPair(certFile, keyFile string) (Certificate, error)
```

LoadX509KeyPair reads and parses a public/private key pair from a pair of files. The files must contain PEM encoded data. The certificate file may contain intermediate certificates following the leaf certificate to form a certificate chain. On successful return, Certificate.Leaf will be nil because the parsed form of the certificate is not retained. 

#### <a id="X509KeyPair" href="#X509KeyPair">func X509KeyPair(certPEMBlock, keyPEMBlock []byte) (Certificate, error)</a>

```
searchKey: tls.X509KeyPair
tags: [exported]
```

```Go
func X509KeyPair(certPEMBlock, keyPEMBlock []byte) (Certificate, error)
```

X509KeyPair parses a public/private key pair from a pair of PEM encoded data. On successful return, Certificate.Leaf will be nil because the parsed form of the certificate is not retained. 

#### <a id="Certificate.leaf" href="#Certificate.leaf">func (c *Certificate) leaf() (*x509.Certificate, error)</a>

```
searchKey: tls.Certificate.leaf
```

```Go
func (c *Certificate) leaf() (*x509.Certificate, error)
```

leaf returns the parsed leaf certificate, either from c.Leaf or by parsing the corresponding c.Certificate[0]. 

### <a id="handshakeMessage" href="#handshakeMessage">type handshakeMessage interface</a>

```
searchKey: tls.handshakeMessage
```

```Go
type handshakeMessage interface {
	marshal() []byte
	unmarshal([]byte) bool
}
```

### <a id="lruSessionCache" href="#lruSessionCache">type lruSessionCache struct</a>

```
searchKey: tls.lruSessionCache
```

```Go
type lruSessionCache struct {
	sync.Mutex

	m        map[string]*list.Element
	q        *list.List
	capacity int
}
```

lruSessionCache is a ClientSessionCache implementation that uses an LRU caching strategy. 

#### <a id="lruSessionCache.Put" href="#lruSessionCache.Put">func (c *lruSessionCache) Put(sessionKey string, cs *ClientSessionState)</a>

```
searchKey: tls.lruSessionCache.Put
```

```Go
func (c *lruSessionCache) Put(sessionKey string, cs *ClientSessionState)
```

Put adds the provided (sessionKey, cs) pair to the cache. If cs is nil, the entry corresponding to sessionKey is removed from the cache instead. 

#### <a id="lruSessionCache.Get" href="#lruSessionCache.Get">func (c *lruSessionCache) Get(sessionKey string) (*ClientSessionState, bool)</a>

```
searchKey: tls.lruSessionCache.Get
```

```Go
func (c *lruSessionCache) Get(sessionKey string) (*ClientSessionState, bool)
```

Get returns the ClientSessionState value associated with a given key. It returns (nil, false) if no value is found. 

### <a id="lruSessionCacheEntry" href="#lruSessionCacheEntry">type lruSessionCacheEntry struct</a>

```
searchKey: tls.lruSessionCacheEntry
```

```Go
type lruSessionCacheEntry struct {
	sessionKey string
	state      *ClientSessionState
}
```

### <a id="Conn" href="#Conn">type Conn struct</a>

```
searchKey: tls.Conn
tags: [exported]
```

```Go
type Conn struct {
	// constant
	conn        net.Conn
	isClient    bool
	handshakeFn func(context.Context) error // (*Conn).clientHandshake or serverHandshake

	// handshakeStatus is 1 if the connection is currently transferring
	// application data (i.e. is not currently processing a handshake).
	// This field is only to be accessed with sync/atomic.
	handshakeStatus uint32
	// constant after handshake; protected by handshakeMutex
	handshakeMutex sync.Mutex
	handshakeErr   error   // error resulting from handshake
	vers           uint16  // TLS version
	haveVers       bool    // version has been negotiated
	config         *Config // configuration passed to constructor
	// handshakes counts the number of handshakes performed on the
	// connection so far. If renegotiation is disabled then this is either
	// zero or one.
	handshakes       int
	didResume        bool // whether this connection was a session resumption
	cipherSuite      uint16
	ocspResponse     []byte   // stapled OCSP response
	scts             [][]byte // signed certificate timestamps from server
	peerCertificates []*x509.Certificate
	// verifiedChains contains the certificate chains that we built, as
	// opposed to the ones presented by the server.
	verifiedChains [][]*x509.Certificate
	// serverName contains the server name indicated by the client, if any.
	serverName string
	// secureRenegotiation is true if the server echoed the secure
	// renegotiation extension. (This is meaningless as a server because
	// renegotiation is not supported in that case.)
	secureRenegotiation bool
	// ekm is a closure for exporting keying material.
	ekm func(label string, context []byte, length int) ([]byte, error)
	// resumptionSecret is the resumption_master_secret for handling
	// NewSessionTicket messages. nil if config.SessionTicketsDisabled.
	resumptionSecret []byte

	// ticketKeys is the set of active session ticket keys for this
	// connection. The first one is used to encrypt new tickets and
	// all are tried to decrypt tickets.
	ticketKeys []ticketKey

	// clientFinishedIsFirst is true if the client sent the first Finished
	// message during the most recent handshake. This is recorded because
	// the first transmitted Finished message is the tls-unique
	// channel-binding value.
	clientFinishedIsFirst bool

	// closeNotifyErr is any error from sending the alertCloseNotify record.
	closeNotifyErr error
	// closeNotifySent is true if the Conn attempted to send an
	// alertCloseNotify record.
	closeNotifySent bool

	// clientFinished and serverFinished contain the Finished message sent
	// by the client or server in the most recent handshake. This is
	// retained to support the renegotiation extension and tls-unique
	// channel-binding.
	clientFinished [12]byte
	serverFinished [12]byte

	// clientProtocol is the negotiated ALPN protocol.
	clientProtocol string

	// input/output
	in, out   halfConn
	rawInput  bytes.Buffer // raw input, starting with a record header
	input     bytes.Reader // application data waiting to be read, from rawInput.Next
	hand      bytes.Buffer // handshake data waiting to be read
	buffering bool         // whether records are buffered in sendBuf
	sendBuf   []byte       // a buffer of records waiting to be sent

	// bytesSent counts the bytes of application data sent.
	// packetsSent counts packets.
	bytesSent   int64
	packetsSent int64

	// retryCount counts the number of consecutive non-advancing records
	// received by Conn.readRecord. That is, records that neither advance the
	// handshake, nor deliver application data. Protected by in.Mutex.
	retryCount int

	// activeCall is an atomic int32; the low bit is whether Close has
	// been called. the rest of the bits are the number of goroutines
	// in Conn.Write.
	activeCall int32

	tmp [16]byte
}
```

A Conn represents a secured connection. It implements the net.Conn interface. 

#### <a id="Server" href="#Server">func Server(conn net.Conn, config *Config) *Conn</a>

```
searchKey: tls.Server
tags: [exported]
```

```Go
func Server(conn net.Conn, config *Config) *Conn
```

Server returns a new TLS server side connection using conn as the underlying transport. The configuration config must be non-nil and must include at least one certificate or else set GetCertificate. 

#### <a id="Client" href="#Client">func Client(conn net.Conn, config *Config) *Conn</a>

```
searchKey: tls.Client
tags: [exported]
```

```Go
func Client(conn net.Conn, config *Config) *Conn
```

Client returns a new TLS client side connection using conn as the underlying transport. The config cannot be nil: users must set either ServerName or InsecureSkipVerify in the config. 

#### <a id="DialWithDialer" href="#DialWithDialer">func DialWithDialer(dialer *net.Dialer, network, addr string, config *Config) (*Conn, error)</a>

```
searchKey: tls.DialWithDialer
tags: [exported]
```

```Go
func DialWithDialer(dialer *net.Dialer, network, addr string, config *Config) (*Conn, error)
```

DialWithDialer connects to the given network address using dialer.Dial and then initiates a TLS handshake, returning the resulting TLS connection. Any timeout or deadline given in the dialer apply to connection and TLS handshake as a whole. 

DialWithDialer interprets a nil configuration as equivalent to the zero configuration; see the documentation of Config for the defaults. 

DialWithDialer uses context.Background internally; to specify the context, use Dialer.DialContext with NetDialer set to the desired dialer. 

#### <a id="dial" href="#dial">func dial(ctx context.Context, netDialer *net.Dialer, network, addr string, config *Config) (*Conn, error)</a>

```
searchKey: tls.dial
```

```Go
func dial(ctx context.Context, netDialer *net.Dialer, network, addr string, config *Config) (*Conn, error)
```

#### <a id="Dial" href="#Dial">func Dial(network, addr string, config *Config) (*Conn, error)</a>

```
searchKey: tls.Dial
tags: [exported]
```

```Go
func Dial(network, addr string, config *Config) (*Conn, error)
```

Dial connects to the given network address using net.Dial and then initiates a TLS handshake, returning the resulting TLS connection. Dial interprets a nil configuration as equivalent to the zero configuration; see the documentation of Config for the defaults. 

#### <a id="Conn.LocalAddr" href="#Conn.LocalAddr">func (c *Conn) LocalAddr() net.Addr</a>

```
searchKey: tls.Conn.LocalAddr
tags: [exported]
```

```Go
func (c *Conn) LocalAddr() net.Addr
```

LocalAddr returns the local network address. 

#### <a id="Conn.RemoteAddr" href="#Conn.RemoteAddr">func (c *Conn) RemoteAddr() net.Addr</a>

```
searchKey: tls.Conn.RemoteAddr
tags: [exported]
```

```Go
func (c *Conn) RemoteAddr() net.Addr
```

RemoteAddr returns the remote network address. 

#### <a id="Conn.SetDeadline" href="#Conn.SetDeadline">func (c *Conn) SetDeadline(t time.Time) error</a>

```
searchKey: tls.Conn.SetDeadline
tags: [exported]
```

```Go
func (c *Conn) SetDeadline(t time.Time) error
```

SetDeadline sets the read and write deadlines associated with the connection. A zero value for t means Read and Write will not time out. After a Write has timed out, the TLS state is corrupt and all future writes will return the same error. 

#### <a id="Conn.SetReadDeadline" href="#Conn.SetReadDeadline">func (c *Conn) SetReadDeadline(t time.Time) error</a>

```
searchKey: tls.Conn.SetReadDeadline
tags: [exported]
```

```Go
func (c *Conn) SetReadDeadline(t time.Time) error
```

SetReadDeadline sets the read deadline on the underlying connection. A zero value for t means Read will not time out. 

#### <a id="Conn.SetWriteDeadline" href="#Conn.SetWriteDeadline">func (c *Conn) SetWriteDeadline(t time.Time) error</a>

```
searchKey: tls.Conn.SetWriteDeadline
tags: [exported]
```

```Go
func (c *Conn) SetWriteDeadline(t time.Time) error
```

SetWriteDeadline sets the write deadline on the underlying connection. A zero value for t means Write will not time out. After a Write has timed out, the TLS state is corrupt and all future writes will return the same error. 

#### <a id="Conn.newRecordHeaderError" href="#Conn.newRecordHeaderError">func (c *Conn) newRecordHeaderError(conn net.Conn, msg string) (err RecordHeaderError)</a>

```
searchKey: tls.Conn.newRecordHeaderError
```

```Go
func (c *Conn) newRecordHeaderError(conn net.Conn, msg string) (err RecordHeaderError)
```

#### <a id="Conn.readRecord" href="#Conn.readRecord">func (c *Conn) readRecord() error</a>

```
searchKey: tls.Conn.readRecord
```

```Go
func (c *Conn) readRecord() error
```

#### <a id="Conn.readChangeCipherSpec" href="#Conn.readChangeCipherSpec">func (c *Conn) readChangeCipherSpec() error</a>

```
searchKey: tls.Conn.readChangeCipherSpec
```

```Go
func (c *Conn) readChangeCipherSpec() error
```

#### <a id="Conn.readRecordOrCCS" href="#Conn.readRecordOrCCS">func (c *Conn) readRecordOrCCS(expectChangeCipherSpec bool) error</a>

```
searchKey: tls.Conn.readRecordOrCCS
```

```Go
func (c *Conn) readRecordOrCCS(expectChangeCipherSpec bool) error
```

readRecordOrCCS reads one or more TLS records from the connection and updates the record layer state. Some invariants: 

```
* c.in must be locked
* c.input must be empty

```
During the handshake one and only one of the following will happen: 

```
- c.hand grows
- c.in.changeCipherSpec is called
- an error is returned

```
After the handshake one and only one of the following will happen: 

```
- c.hand grows
- c.input is set
- an error is returned

```
#### <a id="Conn.retryReadRecord" href="#Conn.retryReadRecord">func (c *Conn) retryReadRecord(expectChangeCipherSpec bool) error</a>

```
searchKey: tls.Conn.retryReadRecord
```

```Go
func (c *Conn) retryReadRecord(expectChangeCipherSpec bool) error
```

retryReadRecord recurses into readRecordOrCCS to drop a non-advancing record, like a warning alert, empty application_data, or a change_cipher_spec in TLS 1.3. 

#### <a id="Conn.readFromUntil" href="#Conn.readFromUntil">func (c *Conn) readFromUntil(r io.Reader, n int) error</a>

```
searchKey: tls.Conn.readFromUntil
```

```Go
func (c *Conn) readFromUntil(r io.Reader, n int) error
```

readFromUntil reads from r into c.rawInput until c.rawInput contains at least n bytes or else returns an error. 

#### <a id="Conn.sendAlertLocked" href="#Conn.sendAlertLocked">func (c *Conn) sendAlertLocked(err alert) error</a>

```
searchKey: tls.Conn.sendAlertLocked
```

```Go
func (c *Conn) sendAlertLocked(err alert) error
```

sendAlert sends a TLS alert message. 

#### <a id="Conn.sendAlert" href="#Conn.sendAlert">func (c *Conn) sendAlert(err alert) error</a>

```
searchKey: tls.Conn.sendAlert
```

```Go
func (c *Conn) sendAlert(err alert) error
```

sendAlert sends a TLS alert message. 

#### <a id="Conn.maxPayloadSizeForWrite" href="#Conn.maxPayloadSizeForWrite">func (c *Conn) maxPayloadSizeForWrite(typ recordType) int</a>

```
searchKey: tls.Conn.maxPayloadSizeForWrite
```

```Go
func (c *Conn) maxPayloadSizeForWrite(typ recordType) int
```

maxPayloadSizeForWrite returns the maximum TLS payload size to use for the next application data record. There is the following trade-off: 

```
- For latency-sensitive applications, such as web browsing, each TLS
  record should fit in one TCP segment.
- For throughput-sensitive applications, such as large file transfers,
  larger TLS records better amortize framing and encryption overheads.

```
A simple heuristic that works well in practice is to use small records for the first 1MB of data, then use larger records for subsequent data, and reset back to smaller records after the connection becomes idle. See "High Performance Web Networking", Chapter 4, or: [https://www.igvita.com/2013/10/24/optimizing-tls-record-size-and-buffering-latency/](https://www.igvita.com/2013/10/24/optimizing-tls-record-size-and-buffering-latency/) 

In the interests of simplicity and determinism, this code does not attempt to reset the record size once the connection is idle, however. 

#### <a id="Conn.write" href="#Conn.write">func (c *Conn) write(data []byte) (int, error)</a>

```
searchKey: tls.Conn.write
```

```Go
func (c *Conn) write(data []byte) (int, error)
```

#### <a id="Conn.flush" href="#Conn.flush">func (c *Conn) flush() (int, error)</a>

```
searchKey: tls.Conn.flush
```

```Go
func (c *Conn) flush() (int, error)
```

#### <a id="Conn.writeRecordLocked" href="#Conn.writeRecordLocked">func (c *Conn) writeRecordLocked(typ recordType, data []byte) (int, error)</a>

```
searchKey: tls.Conn.writeRecordLocked
```

```Go
func (c *Conn) writeRecordLocked(typ recordType, data []byte) (int, error)
```

writeRecordLocked writes a TLS record with the given type and payload to the connection and updates the record layer state. 

#### <a id="Conn.writeRecord" href="#Conn.writeRecord">func (c *Conn) writeRecord(typ recordType, data []byte) (int, error)</a>

```
searchKey: tls.Conn.writeRecord
```

```Go
func (c *Conn) writeRecord(typ recordType, data []byte) (int, error)
```

writeRecord writes a TLS record with the given type and payload to the connection and updates the record layer state. 

#### <a id="Conn.readHandshake" href="#Conn.readHandshake">func (c *Conn) readHandshake() (interface{}, error)</a>

```
searchKey: tls.Conn.readHandshake
```

```Go
func (c *Conn) readHandshake() (interface{}, error)
```

readHandshake reads the next handshake message from the record layer. 

#### <a id="Conn.Write" href="#Conn.Write">func (c *Conn) Write(b []byte) (int, error)</a>

```
searchKey: tls.Conn.Write
tags: [exported]
```

```Go
func (c *Conn) Write(b []byte) (int, error)
```

Write writes data to the connection. 

As Write calls Handshake, in order to prevent indefinite blocking a deadline must be set for both Read and Write before Write is called when the handshake has not yet completed. See SetDeadline, SetReadDeadline, and SetWriteDeadline. 

#### <a id="Conn.handleRenegotiation" href="#Conn.handleRenegotiation">func (c *Conn) handleRenegotiation() error</a>

```
searchKey: tls.Conn.handleRenegotiation
```

```Go
func (c *Conn) handleRenegotiation() error
```

handleRenegotiation processes a HelloRequest handshake message. 

#### <a id="Conn.handlePostHandshakeMessage" href="#Conn.handlePostHandshakeMessage">func (c *Conn) handlePostHandshakeMessage() error</a>

```
searchKey: tls.Conn.handlePostHandshakeMessage
```

```Go
func (c *Conn) handlePostHandshakeMessage() error
```

handlePostHandshakeMessage processes a handshake message arrived after the handshake is complete. Up to TLS 1.2, it indicates the start of a renegotiation. 

#### <a id="Conn.handleKeyUpdate" href="#Conn.handleKeyUpdate">func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error</a>

```
searchKey: tls.Conn.handleKeyUpdate
```

```Go
func (c *Conn) handleKeyUpdate(keyUpdate *keyUpdateMsg) error
```

#### <a id="Conn.Read" href="#Conn.Read">func (c *Conn) Read(b []byte) (int, error)</a>

```
searchKey: tls.Conn.Read
tags: [exported]
```

```Go
func (c *Conn) Read(b []byte) (int, error)
```

Read reads data from the connection. 

As Read calls Handshake, in order to prevent indefinite blocking a deadline must be set for both Read and Write before Read is called when the handshake has not yet completed. See SetDeadline, SetReadDeadline, and SetWriteDeadline. 

#### <a id="Conn.Close" href="#Conn.Close">func (c *Conn) Close() error</a>

```
searchKey: tls.Conn.Close
tags: [exported]
```

```Go
func (c *Conn) Close() error
```

Close closes the connection. 

#### <a id="Conn.CloseWrite" href="#Conn.CloseWrite">func (c *Conn) CloseWrite() error</a>

```
searchKey: tls.Conn.CloseWrite
tags: [exported]
```

```Go
func (c *Conn) CloseWrite() error
```

CloseWrite shuts down the writing side of the connection. It should only be called once the handshake has completed and does not call CloseWrite on the underlying connection. Most callers should just use Close. 

#### <a id="Conn.closeNotify" href="#Conn.closeNotify">func (c *Conn) closeNotify() error</a>

```
searchKey: tls.Conn.closeNotify
```

```Go
func (c *Conn) closeNotify() error
```

#### <a id="Conn.Handshake" href="#Conn.Handshake">func (c *Conn) Handshake() error</a>

```
searchKey: tls.Conn.Handshake
tags: [exported]
```

```Go
func (c *Conn) Handshake() error
```

Handshake runs the client or server handshake protocol if it has not yet been run. 

Most uses of this package need not call Handshake explicitly: the first Read or Write will call it automatically. 

For control over canceling or setting a timeout on a handshake, use HandshakeContext or the Dialer's DialContext method instead. 

#### <a id="Conn.HandshakeContext" href="#Conn.HandshakeContext">func (c *Conn) HandshakeContext(ctx context.Context) error</a>

```
searchKey: tls.Conn.HandshakeContext
tags: [exported]
```

```Go
func (c *Conn) HandshakeContext(ctx context.Context) error
```

HandshakeContext runs the client or server handshake protocol if it has not yet been run. 

The provided Context must be non-nil. If the context is canceled before the handshake is complete, the handshake is interrupted and an error is returned. Once the handshake has completed, cancellation of the context will not affect the connection. 

Most uses of this package need not call HandshakeContext explicitly: the first Read or Write will call it automatically. 

#### <a id="Conn.handshakeContext" href="#Conn.handshakeContext">func (c *Conn) handshakeContext(ctx context.Context) (ret error)</a>

```
searchKey: tls.Conn.handshakeContext
```

```Go
func (c *Conn) handshakeContext(ctx context.Context) (ret error)
```

#### <a id="Conn.ConnectionState" href="#Conn.ConnectionState">func (c *Conn) ConnectionState() ConnectionState</a>

```
searchKey: tls.Conn.ConnectionState
tags: [exported]
```

```Go
func (c *Conn) ConnectionState() ConnectionState
```

ConnectionState returns basic TLS details about the connection. 

#### <a id="Conn.connectionStateLocked" href="#Conn.connectionStateLocked">func (c *Conn) connectionStateLocked() ConnectionState</a>

```
searchKey: tls.Conn.connectionStateLocked
```

```Go
func (c *Conn) connectionStateLocked() ConnectionState
```

#### <a id="Conn.OCSPResponse" href="#Conn.OCSPResponse">func (c *Conn) OCSPResponse() []byte</a>

```
searchKey: tls.Conn.OCSPResponse
tags: [exported]
```

```Go
func (c *Conn) OCSPResponse() []byte
```

OCSPResponse returns the stapled OCSP response from the TLS server, if any. (Only valid for client connections.) 

#### <a id="Conn.VerifyHostname" href="#Conn.VerifyHostname">func (c *Conn) VerifyHostname(host string) error</a>

```
searchKey: tls.Conn.VerifyHostname
tags: [exported]
```

```Go
func (c *Conn) VerifyHostname(host string) error
```

VerifyHostname checks that the peer certificate chain is valid for connecting to host. If so, it returns nil; if not, it returns an error describing the problem. 

#### <a id="Conn.handshakeComplete" href="#Conn.handshakeComplete">func (c *Conn) handshakeComplete() bool</a>

```
searchKey: tls.Conn.handshakeComplete
```

```Go
func (c *Conn) handshakeComplete() bool
```

#### <a id="Conn.makeClientHello" href="#Conn.makeClientHello">func (c *Conn) makeClientHello() (*clientHelloMsg, ecdheParameters, error)</a>

```
searchKey: tls.Conn.makeClientHello
```

```Go
func (c *Conn) makeClientHello() (*clientHelloMsg, ecdheParameters, error)
```

#### <a id="Conn.clientHandshake" href="#Conn.clientHandshake">func (c *Conn) clientHandshake(ctx context.Context) (err error)</a>

```
searchKey: tls.Conn.clientHandshake
```

```Go
func (c *Conn) clientHandshake(ctx context.Context) (err error)
```

#### <a id="Conn.loadSession" href="#Conn.loadSession">func (c *Conn) loadSession(hello *clientHelloMsg) (cacheKey string,...</a>

```
searchKey: tls.Conn.loadSession
```

```Go
func (c *Conn) loadSession(hello *clientHelloMsg) (cacheKey string,
	session *ClientSessionState, earlySecret, binderKey []byte)
```

#### <a id="Conn.pickTLSVersion" href="#Conn.pickTLSVersion">func (c *Conn) pickTLSVersion(serverHello *serverHelloMsg) error</a>

```
searchKey: tls.Conn.pickTLSVersion
```

```Go
func (c *Conn) pickTLSVersion(serverHello *serverHelloMsg) error
```

#### <a id="Conn.verifyServerCertificate" href="#Conn.verifyServerCertificate">func (c *Conn) verifyServerCertificate(certificates [][]byte) error</a>

```
searchKey: tls.Conn.verifyServerCertificate
```

```Go
func (c *Conn) verifyServerCertificate(certificates [][]byte) error
```

verifyServerCertificate parses and verifies the provided chain, setting c.verifiedChains and c.peerCertificates or sending the appropriate alert. 

#### <a id="Conn.getClientCertificate" href="#Conn.getClientCertificate">func (c *Conn) getClientCertificate(cri *CertificateRequestInfo) (*Certificate, error)</a>

```
searchKey: tls.Conn.getClientCertificate
```

```Go
func (c *Conn) getClientCertificate(cri *CertificateRequestInfo) (*Certificate, error)
```

#### <a id="Conn.handleNewSessionTicket" href="#Conn.handleNewSessionTicket">func (c *Conn) handleNewSessionTicket(msg *newSessionTicketMsgTLS13) error</a>

```
searchKey: tls.Conn.handleNewSessionTicket
```

```Go
func (c *Conn) handleNewSessionTicket(msg *newSessionTicketMsgTLS13) error
```

#### <a id="Conn.serverHandshake" href="#Conn.serverHandshake">func (c *Conn) serverHandshake(ctx context.Context) error</a>

```
searchKey: tls.Conn.serverHandshake
```

```Go
func (c *Conn) serverHandshake(ctx context.Context) error
```

serverHandshake performs a TLS handshake as a server. 

#### <a id="Conn.readClientHello" href="#Conn.readClientHello">func (c *Conn) readClientHello(ctx context.Context) (*clientHelloMsg, error)</a>

```
searchKey: tls.Conn.readClientHello
```

```Go
func (c *Conn) readClientHello(ctx context.Context) (*clientHelloMsg, error)
```

readClientHello reads a ClientHello message and selects the protocol version. 

#### <a id="Conn.processCertsFromClient" href="#Conn.processCertsFromClient">func (c *Conn) processCertsFromClient(certificate Certificate) error</a>

```
searchKey: tls.Conn.processCertsFromClient
```

```Go
func (c *Conn) processCertsFromClient(certificate Certificate) error
```

processCertsFromClient takes a chain of client certificates either from a Certificates message or from a sessionState and verifies them. It returns the public key of the leaf certificate. 

#### <a id="Conn.encryptTicket" href="#Conn.encryptTicket">func (c *Conn) encryptTicket(state []byte) ([]byte, error)</a>

```
searchKey: tls.Conn.encryptTicket
```

```Go
func (c *Conn) encryptTicket(state []byte) ([]byte, error)
```

#### <a id="Conn.decryptTicket" href="#Conn.decryptTicket">func (c *Conn) decryptTicket(encrypted []byte) (plaintext []byte, usedOldKey bool)</a>

```
searchKey: tls.Conn.decryptTicket
```

```Go
func (c *Conn) decryptTicket(encrypted []byte) (plaintext []byte, usedOldKey bool)
```

### <a id="halfConn" href="#halfConn">type halfConn struct</a>

```
searchKey: tls.halfConn
```

```Go
type halfConn struct {
	sync.Mutex

	err     error       // first permanent error
	version uint16      // protocol version
	cipher  interface{} // cipher algorithm
	mac     hash.Hash
	seq     [8]byte // 64-bit sequence number

	scratchBuf [13]byte // to avoid allocs; interface method args escape

	nextCipher interface{} // next encryption state
	nextMac    hash.Hash   // next MAC algorithm

	trafficSecret []byte // current TLS 1.3 traffic secret
}
```

A halfConn represents one direction of the record layer connection, either sending or receiving. 

#### <a id="halfConn.setErrorLocked" href="#halfConn.setErrorLocked">func (hc *halfConn) setErrorLocked(err error) error</a>

```
searchKey: tls.halfConn.setErrorLocked
```

```Go
func (hc *halfConn) setErrorLocked(err error) error
```

#### <a id="halfConn.prepareCipherSpec" href="#halfConn.prepareCipherSpec">func (hc *halfConn) prepareCipherSpec(version uint16, cipher interface{}, mac hash.Hash)</a>

```
searchKey: tls.halfConn.prepareCipherSpec
```

```Go
func (hc *halfConn) prepareCipherSpec(version uint16, cipher interface{}, mac hash.Hash)
```

prepareCipherSpec sets the encryption and MAC states that a subsequent changeCipherSpec will use. 

#### <a id="halfConn.changeCipherSpec" href="#halfConn.changeCipherSpec">func (hc *halfConn) changeCipherSpec() error</a>

```
searchKey: tls.halfConn.changeCipherSpec
```

```Go
func (hc *halfConn) changeCipherSpec() error
```

changeCipherSpec changes the encryption and MAC states to the ones previously passed to prepareCipherSpec. 

#### <a id="halfConn.setTrafficSecret" href="#halfConn.setTrafficSecret">func (hc *halfConn) setTrafficSecret(suite *cipherSuiteTLS13, secret []byte)</a>

```
searchKey: tls.halfConn.setTrafficSecret
```

```Go
func (hc *halfConn) setTrafficSecret(suite *cipherSuiteTLS13, secret []byte)
```

#### <a id="halfConn.incSeq" href="#halfConn.incSeq">func (hc *halfConn) incSeq()</a>

```
searchKey: tls.halfConn.incSeq
```

```Go
func (hc *halfConn) incSeq()
```

incSeq increments the sequence number. 

#### <a id="halfConn.explicitNonceLen" href="#halfConn.explicitNonceLen">func (hc *halfConn) explicitNonceLen() int</a>

```
searchKey: tls.halfConn.explicitNonceLen
```

```Go
func (hc *halfConn) explicitNonceLen() int
```

explicitNonceLen returns the number of bytes of explicit nonce or IV included in each record. Explicit nonces are present only in CBC modes after TLS 1.0 and in certain AEAD modes in TLS 1.2. 

#### <a id="halfConn.decrypt" href="#halfConn.decrypt">func (hc *halfConn) decrypt(record []byte) ([]byte, recordType, error)</a>

```
searchKey: tls.halfConn.decrypt
```

```Go
func (hc *halfConn) decrypt(record []byte) ([]byte, recordType, error)
```

decrypt authenticates and decrypts the record if protection is active at this stage. The returned plaintext might overlap with the input. 

#### <a id="halfConn.encrypt" href="#halfConn.encrypt">func (hc *halfConn) encrypt(record, payload []byte, rand io.Reader) ([]byte, error)</a>

```
searchKey: tls.halfConn.encrypt
```

```Go
func (hc *halfConn) encrypt(record, payload []byte, rand io.Reader) ([]byte, error)
```

encrypt encrypts payload, adding the appropriate nonce and/or MAC, and appends it to record, which must already contain the record header. 

### <a id="permanentError" href="#permanentError">type permanentError struct</a>

```
searchKey: tls.permanentError
```

```Go
type permanentError struct {
	err net.Error
}
```

#### <a id="permanentError.Error" href="#permanentError.Error">func (e *permanentError) Error() string</a>

```
searchKey: tls.permanentError.Error
```

```Go
func (e *permanentError) Error() string
```

#### <a id="permanentError.Unwrap" href="#permanentError.Unwrap">func (e *permanentError) Unwrap() error</a>

```
searchKey: tls.permanentError.Unwrap
```

```Go
func (e *permanentError) Unwrap() error
```

#### <a id="permanentError.Timeout" href="#permanentError.Timeout">func (e *permanentError) Timeout() bool</a>

```
searchKey: tls.permanentError.Timeout
```

```Go
func (e *permanentError) Timeout() bool
```

#### <a id="permanentError.Temporary" href="#permanentError.Temporary">func (e *permanentError) Temporary() bool</a>

```
searchKey: tls.permanentError.Temporary
```

```Go
func (e *permanentError) Temporary() bool
```

### <a id="cbcMode" href="#cbcMode">type cbcMode interface</a>

```
searchKey: tls.cbcMode
```

```Go
type cbcMode interface {
	cipher.BlockMode
	SetIV([]byte)
}
```

cbcMode is an interface for block ciphers using cipher block chaining. 

### <a id="RecordHeaderError" href="#RecordHeaderError">type RecordHeaderError struct</a>

```
searchKey: tls.RecordHeaderError
tags: [exported]
```

```Go
type RecordHeaderError struct {
	// Msg contains a human readable string that describes the error.
	Msg string
	// RecordHeader contains the five bytes of TLS record header that
	// triggered the error.
	RecordHeader [5]byte
	// Conn provides the underlying net.Conn in the case that a client
	// sent an initial handshake that didn't look like TLS.
	// It is nil if there's already been a handshake or a TLS alert has
	// been written to the connection.
	Conn net.Conn
}
```

RecordHeaderError is returned when a TLS record header is invalid. 

#### <a id="RecordHeaderError.Error" href="#RecordHeaderError.Error">func (e RecordHeaderError) Error() string</a>

```
searchKey: tls.RecordHeaderError.Error
tags: [exported]
```

```Go
func (e RecordHeaderError) Error() string
```

### <a id="atLeastReader" href="#atLeastReader">type atLeastReader struct</a>

```
searchKey: tls.atLeastReader
```

```Go
type atLeastReader struct {
	R io.Reader
	N int64
}
```

atLeastReader reads from R, stopping with EOF once at least N bytes have been read. It is different from an io.LimitedReader in that it doesn't cut short the last Read call, and in that it considers an early EOF an error. 

#### <a id="atLeastReader.Read" href="#atLeastReader.Read">func (r *atLeastReader) Read(p []byte) (int, error)</a>

```
searchKey: tls.atLeastReader.Read
```

```Go
func (r *atLeastReader) Read(p []byte) (int, error)
```

### <a id="clientHandshakeState" href="#clientHandshakeState">type clientHandshakeState struct</a>

```
searchKey: tls.clientHandshakeState
```

```Go
type clientHandshakeState struct {
	c            *Conn
	ctx          context.Context
	serverHello  *serverHelloMsg
	hello        *clientHelloMsg
	suite        *cipherSuite
	finishedHash finishedHash
	masterSecret []byte
	session      *ClientSessionState
}
```

#### <a id="clientHandshakeState.handshake" href="#clientHandshakeState.handshake">func (hs *clientHandshakeState) handshake() error</a>

```
searchKey: tls.clientHandshakeState.handshake
```

```Go
func (hs *clientHandshakeState) handshake() error
```

Does the handshake, either a full one or resumes old session. Requires hs.c, hs.hello, hs.serverHello, and, optionally, hs.session to be set. 

#### <a id="clientHandshakeState.pickCipherSuite" href="#clientHandshakeState.pickCipherSuite">func (hs *clientHandshakeState) pickCipherSuite() error</a>

```
searchKey: tls.clientHandshakeState.pickCipherSuite
```

```Go
func (hs *clientHandshakeState) pickCipherSuite() error
```

#### <a id="clientHandshakeState.doFullHandshake" href="#clientHandshakeState.doFullHandshake">func (hs *clientHandshakeState) doFullHandshake() error</a>

```
searchKey: tls.clientHandshakeState.doFullHandshake
```

```Go
func (hs *clientHandshakeState) doFullHandshake() error
```

#### <a id="clientHandshakeState.establishKeys" href="#clientHandshakeState.establishKeys">func (hs *clientHandshakeState) establishKeys() error</a>

```
searchKey: tls.clientHandshakeState.establishKeys
```

```Go
func (hs *clientHandshakeState) establishKeys() error
```

#### <a id="clientHandshakeState.serverResumedSession" href="#clientHandshakeState.serverResumedSession">func (hs *clientHandshakeState) serverResumedSession() bool</a>

```
searchKey: tls.clientHandshakeState.serverResumedSession
```

```Go
func (hs *clientHandshakeState) serverResumedSession() bool
```

#### <a id="clientHandshakeState.processServerHello" href="#clientHandshakeState.processServerHello">func (hs *clientHandshakeState) processServerHello() (bool, error)</a>

```
searchKey: tls.clientHandshakeState.processServerHello
```

```Go
func (hs *clientHandshakeState) processServerHello() (bool, error)
```

#### <a id="clientHandshakeState.readFinished" href="#clientHandshakeState.readFinished">func (hs *clientHandshakeState) readFinished(out []byte) error</a>

```
searchKey: tls.clientHandshakeState.readFinished
```

```Go
func (hs *clientHandshakeState) readFinished(out []byte) error
```

#### <a id="clientHandshakeState.readSessionTicket" href="#clientHandshakeState.readSessionTicket">func (hs *clientHandshakeState) readSessionTicket() error</a>

```
searchKey: tls.clientHandshakeState.readSessionTicket
```

```Go
func (hs *clientHandshakeState) readSessionTicket() error
```

#### <a id="clientHandshakeState.sendFinished" href="#clientHandshakeState.sendFinished">func (hs *clientHandshakeState) sendFinished(out []byte) error</a>

```
searchKey: tls.clientHandshakeState.sendFinished
```

```Go
func (hs *clientHandshakeState) sendFinished(out []byte) error
```

### <a id="clientHandshakeStateTLS13" href="#clientHandshakeStateTLS13">type clientHandshakeStateTLS13 struct</a>

```
searchKey: tls.clientHandshakeStateTLS13
```

```Go
type clientHandshakeStateTLS13 struct {
	c           *Conn
	ctx         context.Context
	serverHello *serverHelloMsg
	hello       *clientHelloMsg
	ecdheParams ecdheParameters

	session     *ClientSessionState
	earlySecret []byte
	binderKey   []byte

	certReq       *certificateRequestMsgTLS13
	usingPSK      bool
	sentDummyCCS  bool
	suite         *cipherSuiteTLS13
	transcript    hash.Hash
	masterSecret  []byte
	trafficSecret []byte // client_application_traffic_secret_0
}
```

#### <a id="clientHandshakeStateTLS13.handshake" href="#clientHandshakeStateTLS13.handshake">func (hs *clientHandshakeStateTLS13) handshake() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.handshake
```

```Go
func (hs *clientHandshakeStateTLS13) handshake() error
```

handshake requires hs.c, hs.hello, hs.serverHello, hs.ecdheParams, and, optionally, hs.session, hs.earlySecret and hs.binderKey to be set. 

#### <a id="clientHandshakeStateTLS13.checkServerHelloOrHRR" href="#clientHandshakeStateTLS13.checkServerHelloOrHRR">func (hs *clientHandshakeStateTLS13) checkServerHelloOrHRR() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.checkServerHelloOrHRR
```

```Go
func (hs *clientHandshakeStateTLS13) checkServerHelloOrHRR() error
```

checkServerHelloOrHRR does validity checks that apply to both ServerHello and HelloRetryRequest messages. It sets hs.suite. 

#### <a id="clientHandshakeStateTLS13.sendDummyChangeCipherSpec" href="#clientHandshakeStateTLS13.sendDummyChangeCipherSpec">func (hs *clientHandshakeStateTLS13) sendDummyChangeCipherSpec() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.sendDummyChangeCipherSpec
```

```Go
func (hs *clientHandshakeStateTLS13) sendDummyChangeCipherSpec() error
```

sendDummyChangeCipherSpec sends a ChangeCipherSpec record for compatibility with middleboxes that didn't implement TLS correctly. See RFC 8446, Appendix D.4. 

#### <a id="clientHandshakeStateTLS13.processHelloRetryRequest" href="#clientHandshakeStateTLS13.processHelloRetryRequest">func (hs *clientHandshakeStateTLS13) processHelloRetryRequest() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.processHelloRetryRequest
```

```Go
func (hs *clientHandshakeStateTLS13) processHelloRetryRequest() error
```

processHelloRetryRequest handles the HRR in hs.serverHello, modifies and resends hs.hello, and reads the new ServerHello into hs.serverHello. 

#### <a id="clientHandshakeStateTLS13.processServerHello" href="#clientHandshakeStateTLS13.processServerHello">func (hs *clientHandshakeStateTLS13) processServerHello() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.processServerHello
```

```Go
func (hs *clientHandshakeStateTLS13) processServerHello() error
```

#### <a id="clientHandshakeStateTLS13.establishHandshakeKeys" href="#clientHandshakeStateTLS13.establishHandshakeKeys">func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.establishHandshakeKeys
```

```Go
func (hs *clientHandshakeStateTLS13) establishHandshakeKeys() error
```

#### <a id="clientHandshakeStateTLS13.readServerParameters" href="#clientHandshakeStateTLS13.readServerParameters">func (hs *clientHandshakeStateTLS13) readServerParameters() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.readServerParameters
```

```Go
func (hs *clientHandshakeStateTLS13) readServerParameters() error
```

#### <a id="clientHandshakeStateTLS13.readServerCertificate" href="#clientHandshakeStateTLS13.readServerCertificate">func (hs *clientHandshakeStateTLS13) readServerCertificate() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.readServerCertificate
```

```Go
func (hs *clientHandshakeStateTLS13) readServerCertificate() error
```

#### <a id="clientHandshakeStateTLS13.readServerFinished" href="#clientHandshakeStateTLS13.readServerFinished">func (hs *clientHandshakeStateTLS13) readServerFinished() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.readServerFinished
```

```Go
func (hs *clientHandshakeStateTLS13) readServerFinished() error
```

#### <a id="clientHandshakeStateTLS13.sendClientCertificate" href="#clientHandshakeStateTLS13.sendClientCertificate">func (hs *clientHandshakeStateTLS13) sendClientCertificate() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.sendClientCertificate
```

```Go
func (hs *clientHandshakeStateTLS13) sendClientCertificate() error
```

#### <a id="clientHandshakeStateTLS13.sendClientFinished" href="#clientHandshakeStateTLS13.sendClientFinished">func (hs *clientHandshakeStateTLS13) sendClientFinished() error</a>

```
searchKey: tls.clientHandshakeStateTLS13.sendClientFinished
```

```Go
func (hs *clientHandshakeStateTLS13) sendClientFinished() error
```

### <a id="marshalingFunction" href="#marshalingFunction">type marshalingFunction func(b *golang.org/x/crypto/cryptobyte.Builder) error</a>

```
searchKey: tls.marshalingFunction
```

```Go
type marshalingFunction func(b *cryptobyte.Builder) error
```

The marshalingFunction type is an adapter to allow the use of ordinary functions as cryptobyte.MarshalingValue. 

#### <a id="marshalingFunction.Marshal" href="#marshalingFunction.Marshal">func (f marshalingFunction) Marshal(b *cryptobyte.Builder) error</a>

```
searchKey: tls.marshalingFunction.Marshal
```

```Go
func (f marshalingFunction) Marshal(b *cryptobyte.Builder) error
```

### <a id="clientHelloMsg" href="#clientHelloMsg">type clientHelloMsg struct</a>

```
searchKey: tls.clientHelloMsg
```

```Go
type clientHelloMsg struct {
	raw                              []byte
	vers                             uint16
	random                           []byte
	sessionId                        []byte
	cipherSuites                     []uint16
	compressionMethods               []uint8
	serverName                       string
	ocspStapling                     bool
	supportedCurves                  []CurveID
	supportedPoints                  []uint8
	ticketSupported                  bool
	sessionTicket                    []uint8
	supportedSignatureAlgorithms     []SignatureScheme
	supportedSignatureAlgorithmsCert []SignatureScheme
	secureRenegotiationSupported     bool
	secureRenegotiation              []byte
	alpnProtocols                    []string
	scts                             bool
	supportedVersions                []uint16
	cookie                           []byte
	keyShares                        []keyShare
	earlyData                        bool
	pskModes                         []uint8
	pskIdentities                    []pskIdentity
	pskBinders                       [][]byte
}
```

#### <a id="clientHelloMsg.marshal" href="#clientHelloMsg.marshal">func (m *clientHelloMsg) marshal() []byte</a>

```
searchKey: tls.clientHelloMsg.marshal
```

```Go
func (m *clientHelloMsg) marshal() []byte
```

#### <a id="clientHelloMsg.marshalWithoutBinders" href="#clientHelloMsg.marshalWithoutBinders">func (m *clientHelloMsg) marshalWithoutBinders() []byte</a>

```
searchKey: tls.clientHelloMsg.marshalWithoutBinders
```

```Go
func (m *clientHelloMsg) marshalWithoutBinders() []byte
```

marshalWithoutBinders returns the ClientHello through the PreSharedKeyExtension.identities field, according to RFC 8446, Section 4.2.11.2. Note that m.pskBinders must be set to slices of the correct length. 

#### <a id="clientHelloMsg.updateBinders" href="#clientHelloMsg.updateBinders">func (m *clientHelloMsg) updateBinders(pskBinders [][]byte)</a>

```
searchKey: tls.clientHelloMsg.updateBinders
```

```Go
func (m *clientHelloMsg) updateBinders(pskBinders [][]byte)
```

updateBinders updates the m.pskBinders field, if necessary updating the cached marshaled representation. The supplied binders must have the same length as the current m.pskBinders. 

#### <a id="clientHelloMsg.unmarshal" href="#clientHelloMsg.unmarshal">func (m *clientHelloMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.clientHelloMsg.unmarshal
```

```Go
func (m *clientHelloMsg) unmarshal(data []byte) bool
```

#### <a id="clientHelloMsg.Generate" href="#clientHelloMsg.Generate">func (*clientHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.clientHelloMsg.Generate
```

```Go
func (*clientHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="serverHelloMsg" href="#serverHelloMsg">type serverHelloMsg struct</a>

```
searchKey: tls.serverHelloMsg
```

```Go
type serverHelloMsg struct {
	raw                          []byte
	vers                         uint16
	random                       []byte
	sessionId                    []byte
	cipherSuite                  uint16
	compressionMethod            uint8
	ocspStapling                 bool
	ticketSupported              bool
	secureRenegotiationSupported bool
	secureRenegotiation          []byte
	alpnProtocol                 string
	scts                         [][]byte
	supportedVersion             uint16
	serverShare                  keyShare
	selectedIdentityPresent      bool
	selectedIdentity             uint16
	supportedPoints              []uint8

	// HelloRetryRequest extensions
	cookie        []byte
	selectedGroup CurveID
}
```

#### <a id="serverHelloMsg.marshal" href="#serverHelloMsg.marshal">func (m *serverHelloMsg) marshal() []byte</a>

```
searchKey: tls.serverHelloMsg.marshal
```

```Go
func (m *serverHelloMsg) marshal() []byte
```

#### <a id="serverHelloMsg.unmarshal" href="#serverHelloMsg.unmarshal">func (m *serverHelloMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.serverHelloMsg.unmarshal
```

```Go
func (m *serverHelloMsg) unmarshal(data []byte) bool
```

#### <a id="serverHelloMsg.Generate" href="#serverHelloMsg.Generate">func (*serverHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.serverHelloMsg.Generate
```

```Go
func (*serverHelloMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="encryptedExtensionsMsg" href="#encryptedExtensionsMsg">type encryptedExtensionsMsg struct</a>

```
searchKey: tls.encryptedExtensionsMsg
```

```Go
type encryptedExtensionsMsg struct {
	raw          []byte
	alpnProtocol string
}
```

#### <a id="encryptedExtensionsMsg.marshal" href="#encryptedExtensionsMsg.marshal">func (m *encryptedExtensionsMsg) marshal() []byte</a>

```
searchKey: tls.encryptedExtensionsMsg.marshal
```

```Go
func (m *encryptedExtensionsMsg) marshal() []byte
```

#### <a id="encryptedExtensionsMsg.unmarshal" href="#encryptedExtensionsMsg.unmarshal">func (m *encryptedExtensionsMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.encryptedExtensionsMsg.unmarshal
```

```Go
func (m *encryptedExtensionsMsg) unmarshal(data []byte) bool
```

#### <a id="encryptedExtensionsMsg.Generate" href="#encryptedExtensionsMsg.Generate">func (*encryptedExtensionsMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.encryptedExtensionsMsg.Generate
```

```Go
func (*encryptedExtensionsMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="endOfEarlyDataMsg" href="#endOfEarlyDataMsg">type endOfEarlyDataMsg struct{}</a>

```
searchKey: tls.endOfEarlyDataMsg
```

```Go
type endOfEarlyDataMsg struct{}
```

#### <a id="endOfEarlyDataMsg.marshal" href="#endOfEarlyDataMsg.marshal">func (m *endOfEarlyDataMsg) marshal() []byte</a>

```
searchKey: tls.endOfEarlyDataMsg.marshal
```

```Go
func (m *endOfEarlyDataMsg) marshal() []byte
```

#### <a id="endOfEarlyDataMsg.unmarshal" href="#endOfEarlyDataMsg.unmarshal">func (m *endOfEarlyDataMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.endOfEarlyDataMsg.unmarshal
```

```Go
func (m *endOfEarlyDataMsg) unmarshal(data []byte) bool
```

#### <a id="endOfEarlyDataMsg.Generate" href="#endOfEarlyDataMsg.Generate">func (*endOfEarlyDataMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.endOfEarlyDataMsg.Generate
```

```Go
func (*endOfEarlyDataMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="keyUpdateMsg" href="#keyUpdateMsg">type keyUpdateMsg struct</a>

```
searchKey: tls.keyUpdateMsg
```

```Go
type keyUpdateMsg struct {
	raw             []byte
	updateRequested bool
}
```

#### <a id="keyUpdateMsg.marshal" href="#keyUpdateMsg.marshal">func (m *keyUpdateMsg) marshal() []byte</a>

```
searchKey: tls.keyUpdateMsg.marshal
```

```Go
func (m *keyUpdateMsg) marshal() []byte
```

#### <a id="keyUpdateMsg.unmarshal" href="#keyUpdateMsg.unmarshal">func (m *keyUpdateMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.keyUpdateMsg.unmarshal
```

```Go
func (m *keyUpdateMsg) unmarshal(data []byte) bool
```

#### <a id="keyUpdateMsg.Generate" href="#keyUpdateMsg.Generate">func (*keyUpdateMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.keyUpdateMsg.Generate
```

```Go
func (*keyUpdateMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="newSessionTicketMsgTLS13" href="#newSessionTicketMsgTLS13">type newSessionTicketMsgTLS13 struct</a>

```
searchKey: tls.newSessionTicketMsgTLS13
```

```Go
type newSessionTicketMsgTLS13 struct {
	raw          []byte
	lifetime     uint32
	ageAdd       uint32
	nonce        []byte
	label        []byte
	maxEarlyData uint32
}
```

#### <a id="newSessionTicketMsgTLS13.marshal" href="#newSessionTicketMsgTLS13.marshal">func (m *newSessionTicketMsgTLS13) marshal() []byte</a>

```
searchKey: tls.newSessionTicketMsgTLS13.marshal
```

```Go
func (m *newSessionTicketMsgTLS13) marshal() []byte
```

#### <a id="newSessionTicketMsgTLS13.unmarshal" href="#newSessionTicketMsgTLS13.unmarshal">func (m *newSessionTicketMsgTLS13) unmarshal(data []byte) bool</a>

```
searchKey: tls.newSessionTicketMsgTLS13.unmarshal
```

```Go
func (m *newSessionTicketMsgTLS13) unmarshal(data []byte) bool
```

#### <a id="newSessionTicketMsgTLS13.Generate" href="#newSessionTicketMsgTLS13.Generate">func (*newSessionTicketMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.newSessionTicketMsgTLS13.Generate
```

```Go
func (*newSessionTicketMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="certificateRequestMsgTLS13" href="#certificateRequestMsgTLS13">type certificateRequestMsgTLS13 struct</a>

```
searchKey: tls.certificateRequestMsgTLS13
```

```Go
type certificateRequestMsgTLS13 struct {
	raw                              []byte
	ocspStapling                     bool
	scts                             bool
	supportedSignatureAlgorithms     []SignatureScheme
	supportedSignatureAlgorithmsCert []SignatureScheme
	certificateAuthorities           [][]byte
}
```

#### <a id="certificateRequestMsgTLS13.marshal" href="#certificateRequestMsgTLS13.marshal">func (m *certificateRequestMsgTLS13) marshal() []byte</a>

```
searchKey: tls.certificateRequestMsgTLS13.marshal
```

```Go
func (m *certificateRequestMsgTLS13) marshal() []byte
```

#### <a id="certificateRequestMsgTLS13.unmarshal" href="#certificateRequestMsgTLS13.unmarshal">func (m *certificateRequestMsgTLS13) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateRequestMsgTLS13.unmarshal
```

```Go
func (m *certificateRequestMsgTLS13) unmarshal(data []byte) bool
```

#### <a id="certificateRequestMsgTLS13.Generate" href="#certificateRequestMsgTLS13.Generate">func (*certificateRequestMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateRequestMsgTLS13.Generate
```

```Go
func (*certificateRequestMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="certificateMsg" href="#certificateMsg">type certificateMsg struct</a>

```
searchKey: tls.certificateMsg
```

```Go
type certificateMsg struct {
	raw          []byte
	certificates [][]byte
}
```

#### <a id="certificateMsg.marshal" href="#certificateMsg.marshal">func (m *certificateMsg) marshal() (x []byte)</a>

```
searchKey: tls.certificateMsg.marshal
```

```Go
func (m *certificateMsg) marshal() (x []byte)
```

#### <a id="certificateMsg.unmarshal" href="#certificateMsg.unmarshal">func (m *certificateMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateMsg.unmarshal
```

```Go
func (m *certificateMsg) unmarshal(data []byte) bool
```

#### <a id="certificateMsg.Generate" href="#certificateMsg.Generate">func (*certificateMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateMsg.Generate
```

```Go
func (*certificateMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="certificateMsgTLS13" href="#certificateMsgTLS13">type certificateMsgTLS13 struct</a>

```
searchKey: tls.certificateMsgTLS13
```

```Go
type certificateMsgTLS13 struct {
	raw          []byte
	certificate  Certificate
	ocspStapling bool
	scts         bool
}
```

#### <a id="certificateMsgTLS13.marshal" href="#certificateMsgTLS13.marshal">func (m *certificateMsgTLS13) marshal() []byte</a>

```
searchKey: tls.certificateMsgTLS13.marshal
```

```Go
func (m *certificateMsgTLS13) marshal() []byte
```

#### <a id="certificateMsgTLS13.unmarshal" href="#certificateMsgTLS13.unmarshal">func (m *certificateMsgTLS13) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateMsgTLS13.unmarshal
```

```Go
func (m *certificateMsgTLS13) unmarshal(data []byte) bool
```

#### <a id="certificateMsgTLS13.Generate" href="#certificateMsgTLS13.Generate">func (*certificateMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateMsgTLS13.Generate
```

```Go
func (*certificateMsgTLS13) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="serverKeyExchangeMsg" href="#serverKeyExchangeMsg">type serverKeyExchangeMsg struct</a>

```
searchKey: tls.serverKeyExchangeMsg
```

```Go
type serverKeyExchangeMsg struct {
	raw []byte
	key []byte
}
```

#### <a id="serverKeyExchangeMsg.marshal" href="#serverKeyExchangeMsg.marshal">func (m *serverKeyExchangeMsg) marshal() []byte</a>

```
searchKey: tls.serverKeyExchangeMsg.marshal
```

```Go
func (m *serverKeyExchangeMsg) marshal() []byte
```

#### <a id="serverKeyExchangeMsg.unmarshal" href="#serverKeyExchangeMsg.unmarshal">func (m *serverKeyExchangeMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.serverKeyExchangeMsg.unmarshal
```

```Go
func (m *serverKeyExchangeMsg) unmarshal(data []byte) bool
```

### <a id="certificateStatusMsg" href="#certificateStatusMsg">type certificateStatusMsg struct</a>

```
searchKey: tls.certificateStatusMsg
```

```Go
type certificateStatusMsg struct {
	raw      []byte
	response []byte
}
```

#### <a id="certificateStatusMsg.marshal" href="#certificateStatusMsg.marshal">func (m *certificateStatusMsg) marshal() []byte</a>

```
searchKey: tls.certificateStatusMsg.marshal
```

```Go
func (m *certificateStatusMsg) marshal() []byte
```

#### <a id="certificateStatusMsg.unmarshal" href="#certificateStatusMsg.unmarshal">func (m *certificateStatusMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateStatusMsg.unmarshal
```

```Go
func (m *certificateStatusMsg) unmarshal(data []byte) bool
```

#### <a id="certificateStatusMsg.Generate" href="#certificateStatusMsg.Generate">func (*certificateStatusMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateStatusMsg.Generate
```

```Go
func (*certificateStatusMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="serverHelloDoneMsg" href="#serverHelloDoneMsg">type serverHelloDoneMsg struct{}</a>

```
searchKey: tls.serverHelloDoneMsg
```

```Go
type serverHelloDoneMsg struct{}
```

#### <a id="serverHelloDoneMsg.marshal" href="#serverHelloDoneMsg.marshal">func (m *serverHelloDoneMsg) marshal() []byte</a>

```
searchKey: tls.serverHelloDoneMsg.marshal
```

```Go
func (m *serverHelloDoneMsg) marshal() []byte
```

#### <a id="serverHelloDoneMsg.unmarshal" href="#serverHelloDoneMsg.unmarshal">func (m *serverHelloDoneMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.serverHelloDoneMsg.unmarshal
```

```Go
func (m *serverHelloDoneMsg) unmarshal(data []byte) bool
```

### <a id="clientKeyExchangeMsg" href="#clientKeyExchangeMsg">type clientKeyExchangeMsg struct</a>

```
searchKey: tls.clientKeyExchangeMsg
```

```Go
type clientKeyExchangeMsg struct {
	raw        []byte
	ciphertext []byte
}
```

#### <a id="clientKeyExchangeMsg.marshal" href="#clientKeyExchangeMsg.marshal">func (m *clientKeyExchangeMsg) marshal() []byte</a>

```
searchKey: tls.clientKeyExchangeMsg.marshal
```

```Go
func (m *clientKeyExchangeMsg) marshal() []byte
```

#### <a id="clientKeyExchangeMsg.unmarshal" href="#clientKeyExchangeMsg.unmarshal">func (m *clientKeyExchangeMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.clientKeyExchangeMsg.unmarshal
```

```Go
func (m *clientKeyExchangeMsg) unmarshal(data []byte) bool
```

#### <a id="clientKeyExchangeMsg.Generate" href="#clientKeyExchangeMsg.Generate">func (*clientKeyExchangeMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.clientKeyExchangeMsg.Generate
```

```Go
func (*clientKeyExchangeMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="finishedMsg" href="#finishedMsg">type finishedMsg struct</a>

```
searchKey: tls.finishedMsg
```

```Go
type finishedMsg struct {
	raw        []byte
	verifyData []byte
}
```

#### <a id="finishedMsg.marshal" href="#finishedMsg.marshal">func (m *finishedMsg) marshal() []byte</a>

```
searchKey: tls.finishedMsg.marshal
```

```Go
func (m *finishedMsg) marshal() []byte
```

#### <a id="finishedMsg.unmarshal" href="#finishedMsg.unmarshal">func (m *finishedMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.finishedMsg.unmarshal
```

```Go
func (m *finishedMsg) unmarshal(data []byte) bool
```

#### <a id="finishedMsg.Generate" href="#finishedMsg.Generate">func (*finishedMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.finishedMsg.Generate
```

```Go
func (*finishedMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="certificateRequestMsg" href="#certificateRequestMsg">type certificateRequestMsg struct</a>

```
searchKey: tls.certificateRequestMsg
```

```Go
type certificateRequestMsg struct {
	raw []byte
	// hasSignatureAlgorithm indicates whether this message includes a list of
	// supported signature algorithms. This change was introduced with TLS 1.2.
	hasSignatureAlgorithm bool

	certificateTypes             []byte
	supportedSignatureAlgorithms []SignatureScheme
	certificateAuthorities       [][]byte
}
```

#### <a id="certificateRequestMsg.marshal" href="#certificateRequestMsg.marshal">func (m *certificateRequestMsg) marshal() (x []byte)</a>

```
searchKey: tls.certificateRequestMsg.marshal
```

```Go
func (m *certificateRequestMsg) marshal() (x []byte)
```

#### <a id="certificateRequestMsg.unmarshal" href="#certificateRequestMsg.unmarshal">func (m *certificateRequestMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateRequestMsg.unmarshal
```

```Go
func (m *certificateRequestMsg) unmarshal(data []byte) bool
```

#### <a id="certificateRequestMsg.Generate" href="#certificateRequestMsg.Generate">func (*certificateRequestMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateRequestMsg.Generate
```

```Go
func (*certificateRequestMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="certificateVerifyMsg" href="#certificateVerifyMsg">type certificateVerifyMsg struct</a>

```
searchKey: tls.certificateVerifyMsg
```

```Go
type certificateVerifyMsg struct {
	raw                   []byte
	hasSignatureAlgorithm bool // format change introduced in TLS 1.2
	signatureAlgorithm    SignatureScheme
	signature             []byte
}
```

#### <a id="certificateVerifyMsg.marshal" href="#certificateVerifyMsg.marshal">func (m *certificateVerifyMsg) marshal() (x []byte)</a>

```
searchKey: tls.certificateVerifyMsg.marshal
```

```Go
func (m *certificateVerifyMsg) marshal() (x []byte)
```

#### <a id="certificateVerifyMsg.unmarshal" href="#certificateVerifyMsg.unmarshal">func (m *certificateVerifyMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.certificateVerifyMsg.unmarshal
```

```Go
func (m *certificateVerifyMsg) unmarshal(data []byte) bool
```

#### <a id="certificateVerifyMsg.Generate" href="#certificateVerifyMsg.Generate">func (*certificateVerifyMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.certificateVerifyMsg.Generate
```

```Go
func (*certificateVerifyMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="newSessionTicketMsg" href="#newSessionTicketMsg">type newSessionTicketMsg struct</a>

```
searchKey: tls.newSessionTicketMsg
```

```Go
type newSessionTicketMsg struct {
	raw    []byte
	ticket []byte
}
```

#### <a id="newSessionTicketMsg.marshal" href="#newSessionTicketMsg.marshal">func (m *newSessionTicketMsg) marshal() (x []byte)</a>

```
searchKey: tls.newSessionTicketMsg.marshal
```

```Go
func (m *newSessionTicketMsg) marshal() (x []byte)
```

#### <a id="newSessionTicketMsg.unmarshal" href="#newSessionTicketMsg.unmarshal">func (m *newSessionTicketMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.newSessionTicketMsg.unmarshal
```

```Go
func (m *newSessionTicketMsg) unmarshal(data []byte) bool
```

#### <a id="newSessionTicketMsg.Generate" href="#newSessionTicketMsg.Generate">func (*newSessionTicketMsg) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.newSessionTicketMsg.Generate
```

```Go
func (*newSessionTicketMsg) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="helloRequestMsg" href="#helloRequestMsg">type helloRequestMsg struct{}</a>

```
searchKey: tls.helloRequestMsg
```

```Go
type helloRequestMsg struct {
}
```

#### <a id="helloRequestMsg.marshal" href="#helloRequestMsg.marshal">func (*helloRequestMsg) marshal() []byte</a>

```
searchKey: tls.helloRequestMsg.marshal
```

```Go
func (*helloRequestMsg) marshal() []byte
```

#### <a id="helloRequestMsg.unmarshal" href="#helloRequestMsg.unmarshal">func (*helloRequestMsg) unmarshal(data []byte) bool</a>

```
searchKey: tls.helloRequestMsg.unmarshal
```

```Go
func (*helloRequestMsg) unmarshal(data []byte) bool
```

### <a id="serverHandshakeState" href="#serverHandshakeState">type serverHandshakeState struct</a>

```
searchKey: tls.serverHandshakeState
```

```Go
type serverHandshakeState struct {
	c            *Conn
	ctx          context.Context
	clientHello  *clientHelloMsg
	hello        *serverHelloMsg
	suite        *cipherSuite
	ecdheOk      bool
	ecSignOk     bool
	rsaDecryptOk bool
	rsaSignOk    bool
	sessionState *sessionState
	finishedHash finishedHash
	masterSecret []byte
	cert         *Certificate
}
```

serverHandshakeState contains details of a server handshake in progress. It's discarded once the handshake has completed. 

#### <a id="serverHandshakeState.handshake" href="#serverHandshakeState.handshake">func (hs *serverHandshakeState) handshake() error</a>

```
searchKey: tls.serverHandshakeState.handshake
```

```Go
func (hs *serverHandshakeState) handshake() error
```

#### <a id="serverHandshakeState.processClientHello" href="#serverHandshakeState.processClientHello">func (hs *serverHandshakeState) processClientHello() error</a>

```
searchKey: tls.serverHandshakeState.processClientHello
```

```Go
func (hs *serverHandshakeState) processClientHello() error
```

#### <a id="serverHandshakeState.pickCipherSuite" href="#serverHandshakeState.pickCipherSuite">func (hs *serverHandshakeState) pickCipherSuite() error</a>

```
searchKey: tls.serverHandshakeState.pickCipherSuite
```

```Go
func (hs *serverHandshakeState) pickCipherSuite() error
```

#### <a id="serverHandshakeState.cipherSuiteOk" href="#serverHandshakeState.cipherSuiteOk">func (hs *serverHandshakeState) cipherSuiteOk(c *cipherSuite) bool</a>

```
searchKey: tls.serverHandshakeState.cipherSuiteOk
```

```Go
func (hs *serverHandshakeState) cipherSuiteOk(c *cipherSuite) bool
```

#### <a id="serverHandshakeState.checkForResumption" href="#serverHandshakeState.checkForResumption">func (hs *serverHandshakeState) checkForResumption() bool</a>

```
searchKey: tls.serverHandshakeState.checkForResumption
```

```Go
func (hs *serverHandshakeState) checkForResumption() bool
```

checkForResumption reports whether we should perform resumption on this connection. 

#### <a id="serverHandshakeState.doResumeHandshake" href="#serverHandshakeState.doResumeHandshake">func (hs *serverHandshakeState) doResumeHandshake() error</a>

```
searchKey: tls.serverHandshakeState.doResumeHandshake
```

```Go
func (hs *serverHandshakeState) doResumeHandshake() error
```

#### <a id="serverHandshakeState.doFullHandshake" href="#serverHandshakeState.doFullHandshake">func (hs *serverHandshakeState) doFullHandshake() error</a>

```
searchKey: tls.serverHandshakeState.doFullHandshake
```

```Go
func (hs *serverHandshakeState) doFullHandshake() error
```

#### <a id="serverHandshakeState.establishKeys" href="#serverHandshakeState.establishKeys">func (hs *serverHandshakeState) establishKeys() error</a>

```
searchKey: tls.serverHandshakeState.establishKeys
```

```Go
func (hs *serverHandshakeState) establishKeys() error
```

#### <a id="serverHandshakeState.readFinished" href="#serverHandshakeState.readFinished">func (hs *serverHandshakeState) readFinished(out []byte) error</a>

```
searchKey: tls.serverHandshakeState.readFinished
```

```Go
func (hs *serverHandshakeState) readFinished(out []byte) error
```

#### <a id="serverHandshakeState.sendSessionTicket" href="#serverHandshakeState.sendSessionTicket">func (hs *serverHandshakeState) sendSessionTicket() error</a>

```
searchKey: tls.serverHandshakeState.sendSessionTicket
```

```Go
func (hs *serverHandshakeState) sendSessionTicket() error
```

#### <a id="serverHandshakeState.sendFinished" href="#serverHandshakeState.sendFinished">func (hs *serverHandshakeState) sendFinished(out []byte) error</a>

```
searchKey: tls.serverHandshakeState.sendFinished
```

```Go
func (hs *serverHandshakeState) sendFinished(out []byte) error
```

### <a id="serverHandshakeStateTLS13" href="#serverHandshakeStateTLS13">type serverHandshakeStateTLS13 struct</a>

```
searchKey: tls.serverHandshakeStateTLS13
```

```Go
type serverHandshakeStateTLS13 struct {
	c               *Conn
	ctx             context.Context
	clientHello     *clientHelloMsg
	hello           *serverHelloMsg
	sentDummyCCS    bool
	usingPSK        bool
	suite           *cipherSuiteTLS13
	cert            *Certificate
	sigAlg          SignatureScheme
	earlySecret     []byte
	sharedKey       []byte
	handshakeSecret []byte
	masterSecret    []byte
	trafficSecret   []byte // client_application_traffic_secret_0
	transcript      hash.Hash
	clientFinished  []byte
}
```

#### <a id="serverHandshakeStateTLS13.handshake" href="#serverHandshakeStateTLS13.handshake">func (hs *serverHandshakeStateTLS13) handshake() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.handshake
```

```Go
func (hs *serverHandshakeStateTLS13) handshake() error
```

#### <a id="serverHandshakeStateTLS13.processClientHello" href="#serverHandshakeStateTLS13.processClientHello">func (hs *serverHandshakeStateTLS13) processClientHello() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.processClientHello
```

```Go
func (hs *serverHandshakeStateTLS13) processClientHello() error
```

#### <a id="serverHandshakeStateTLS13.checkForResumption" href="#serverHandshakeStateTLS13.checkForResumption">func (hs *serverHandshakeStateTLS13) checkForResumption() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.checkForResumption
```

```Go
func (hs *serverHandshakeStateTLS13) checkForResumption() error
```

#### <a id="serverHandshakeStateTLS13.pickCertificate" href="#serverHandshakeStateTLS13.pickCertificate">func (hs *serverHandshakeStateTLS13) pickCertificate() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.pickCertificate
```

```Go
func (hs *serverHandshakeStateTLS13) pickCertificate() error
```

#### <a id="serverHandshakeStateTLS13.sendDummyChangeCipherSpec" href="#serverHandshakeStateTLS13.sendDummyChangeCipherSpec">func (hs *serverHandshakeStateTLS13) sendDummyChangeCipherSpec() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.sendDummyChangeCipherSpec
```

```Go
func (hs *serverHandshakeStateTLS13) sendDummyChangeCipherSpec() error
```

sendDummyChangeCipherSpec sends a ChangeCipherSpec record for compatibility with middleboxes that didn't implement TLS correctly. See RFC 8446, Appendix D.4. 

#### <a id="serverHandshakeStateTLS13.doHelloRetryRequest" href="#serverHandshakeStateTLS13.doHelloRetryRequest">func (hs *serverHandshakeStateTLS13) doHelloRetryRequest(selectedGroup CurveID) error</a>

```
searchKey: tls.serverHandshakeStateTLS13.doHelloRetryRequest
```

```Go
func (hs *serverHandshakeStateTLS13) doHelloRetryRequest(selectedGroup CurveID) error
```

#### <a id="serverHandshakeStateTLS13.sendServerParameters" href="#serverHandshakeStateTLS13.sendServerParameters">func (hs *serverHandshakeStateTLS13) sendServerParameters() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.sendServerParameters
```

```Go
func (hs *serverHandshakeStateTLS13) sendServerParameters() error
```

#### <a id="serverHandshakeStateTLS13.requestClientCert" href="#serverHandshakeStateTLS13.requestClientCert">func (hs *serverHandshakeStateTLS13) requestClientCert() bool</a>

```
searchKey: tls.serverHandshakeStateTLS13.requestClientCert
```

```Go
func (hs *serverHandshakeStateTLS13) requestClientCert() bool
```

#### <a id="serverHandshakeStateTLS13.sendServerCertificate" href="#serverHandshakeStateTLS13.sendServerCertificate">func (hs *serverHandshakeStateTLS13) sendServerCertificate() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.sendServerCertificate
```

```Go
func (hs *serverHandshakeStateTLS13) sendServerCertificate() error
```

#### <a id="serverHandshakeStateTLS13.sendServerFinished" href="#serverHandshakeStateTLS13.sendServerFinished">func (hs *serverHandshakeStateTLS13) sendServerFinished() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.sendServerFinished
```

```Go
func (hs *serverHandshakeStateTLS13) sendServerFinished() error
```

#### <a id="serverHandshakeStateTLS13.shouldSendSessionTickets" href="#serverHandshakeStateTLS13.shouldSendSessionTickets">func (hs *serverHandshakeStateTLS13) shouldSendSessionTickets() bool</a>

```
searchKey: tls.serverHandshakeStateTLS13.shouldSendSessionTickets
```

```Go
func (hs *serverHandshakeStateTLS13) shouldSendSessionTickets() bool
```

#### <a id="serverHandshakeStateTLS13.sendSessionTickets" href="#serverHandshakeStateTLS13.sendSessionTickets">func (hs *serverHandshakeStateTLS13) sendSessionTickets() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.sendSessionTickets
```

```Go
func (hs *serverHandshakeStateTLS13) sendSessionTickets() error
```

#### <a id="serverHandshakeStateTLS13.readClientCertificate" href="#serverHandshakeStateTLS13.readClientCertificate">func (hs *serverHandshakeStateTLS13) readClientCertificate() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.readClientCertificate
```

```Go
func (hs *serverHandshakeStateTLS13) readClientCertificate() error
```

#### <a id="serverHandshakeStateTLS13.readClientFinished" href="#serverHandshakeStateTLS13.readClientFinished">func (hs *serverHandshakeStateTLS13) readClientFinished() error</a>

```
searchKey: tls.serverHandshakeStateTLS13.readClientFinished
```

```Go
func (hs *serverHandshakeStateTLS13) readClientFinished() error
```

### <a id="keyAgreement" href="#keyAgreement">type keyAgreement interface</a>

```
searchKey: tls.keyAgreement
```

```Go
type keyAgreement interface {

	// In the case that the key agreement protocol doesn't use a
	// ServerKeyExchange message, generateServerKeyExchange can return nil,
	// nil.
	generateServerKeyExchange(*Config, *Certificate, *clientHelloMsg, *serverHelloMsg) (*serverKeyExchangeMsg, error)
	processClientKeyExchange(*Config, *Certificate, *clientKeyExchangeMsg, uint16) ([]byte, error)

	// This method may not be called if the server doesn't send a
	// ServerKeyExchange message.
	processServerKeyExchange(*Config, *clientHelloMsg, *serverHelloMsg, *x509.Certificate, *serverKeyExchangeMsg) error
	generateClientKeyExchange(*Config, *clientHelloMsg, *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)
}
```

a keyAgreement implements the client and server side of a TLS key agreement protocol by generating and processing key exchange messages. 

#### <a id="rsaKA" href="#rsaKA">func rsaKA(version uint16) keyAgreement</a>

```
searchKey: tls.rsaKA
```

```Go
func rsaKA(version uint16) keyAgreement
```

#### <a id="ecdheECDSAKA" href="#ecdheECDSAKA">func ecdheECDSAKA(version uint16) keyAgreement</a>

```
searchKey: tls.ecdheECDSAKA
```

```Go
func ecdheECDSAKA(version uint16) keyAgreement
```

#### <a id="ecdheRSAKA" href="#ecdheRSAKA">func ecdheRSAKA(version uint16) keyAgreement</a>

```
searchKey: tls.ecdheRSAKA
```

```Go
func ecdheRSAKA(version uint16) keyAgreement
```

### <a id="rsaKeyAgreement" href="#rsaKeyAgreement">type rsaKeyAgreement struct{}</a>

```
searchKey: tls.rsaKeyAgreement
```

```Go
type rsaKeyAgreement struct{}
```

rsaKeyAgreement implements the standard TLS key agreement where the client encrypts the pre-master secret to the server's public key. 

#### <a id="rsaKeyAgreement.generateServerKeyExchange" href="#rsaKeyAgreement.generateServerKeyExchange">func (ka rsaKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)</a>

```
searchKey: tls.rsaKeyAgreement.generateServerKeyExchange
```

```Go
func (ka rsaKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)
```

#### <a id="rsaKeyAgreement.processClientKeyExchange" href="#rsaKeyAgreement.processClientKeyExchange">func (ka rsaKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)</a>

```
searchKey: tls.rsaKeyAgreement.processClientKeyExchange
```

```Go
func (ka rsaKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)
```

#### <a id="rsaKeyAgreement.processServerKeyExchange" href="#rsaKeyAgreement.processServerKeyExchange">func (ka rsaKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error</a>

```
searchKey: tls.rsaKeyAgreement.processServerKeyExchange
```

```Go
func (ka rsaKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error
```

#### <a id="rsaKeyAgreement.generateClientKeyExchange" href="#rsaKeyAgreement.generateClientKeyExchange">func (ka rsaKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)</a>

```
searchKey: tls.rsaKeyAgreement.generateClientKeyExchange
```

```Go
func (ka rsaKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)
```

### <a id="ecdheKeyAgreement" href="#ecdheKeyAgreement">type ecdheKeyAgreement struct</a>

```
searchKey: tls.ecdheKeyAgreement
```

```Go
type ecdheKeyAgreement struct {
	version uint16
	isRSA   bool
	params  ecdheParameters

	// ckx and preMasterSecret are generated in processServerKeyExchange
	// and returned in generateClientKeyExchange.
	ckx             *clientKeyExchangeMsg
	preMasterSecret []byte
}
```

ecdheKeyAgreement implements a TLS key agreement where the server generates an ephemeral EC public/private key pair and signs it. The pre-master secret is then calculated using ECDH. The signature may be ECDSA, Ed25519 or RSA. 

#### <a id="ecdheKeyAgreement.generateServerKeyExchange" href="#ecdheKeyAgreement.generateServerKeyExchange">func (ka *ecdheKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)</a>

```
searchKey: tls.ecdheKeyAgreement.generateServerKeyExchange
```

```Go
func (ka *ecdheKeyAgreement) generateServerKeyExchange(config *Config, cert *Certificate, clientHello *clientHelloMsg, hello *serverHelloMsg) (*serverKeyExchangeMsg, error)
```

#### <a id="ecdheKeyAgreement.processClientKeyExchange" href="#ecdheKeyAgreement.processClientKeyExchange">func (ka *ecdheKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)</a>

```
searchKey: tls.ecdheKeyAgreement.processClientKeyExchange
```

```Go
func (ka *ecdheKeyAgreement) processClientKeyExchange(config *Config, cert *Certificate, ckx *clientKeyExchangeMsg, version uint16) ([]byte, error)
```

#### <a id="ecdheKeyAgreement.processServerKeyExchange" href="#ecdheKeyAgreement.processServerKeyExchange">func (ka *ecdheKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error</a>

```
searchKey: tls.ecdheKeyAgreement.processServerKeyExchange
```

```Go
func (ka *ecdheKeyAgreement) processServerKeyExchange(config *Config, clientHello *clientHelloMsg, serverHello *serverHelloMsg, cert *x509.Certificate, skx *serverKeyExchangeMsg) error
```

#### <a id="ecdheKeyAgreement.generateClientKeyExchange" href="#ecdheKeyAgreement.generateClientKeyExchange">func (ka *ecdheKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)</a>

```
searchKey: tls.ecdheKeyAgreement.generateClientKeyExchange
```

```Go
func (ka *ecdheKeyAgreement) generateClientKeyExchange(config *Config, clientHello *clientHelloMsg, cert *x509.Certificate) ([]byte, *clientKeyExchangeMsg, error)
```

### <a id="ecdheParameters" href="#ecdheParameters">type ecdheParameters interface</a>

```
searchKey: tls.ecdheParameters
```

```Go
type ecdheParameters interface {
	CurveID() CurveID
	PublicKey() []byte
	SharedKey(peerPublicKey []byte) []byte
}
```

ecdheParameters implements Diffie-Hellman with either NIST curves or X25519, according to RFC 8446, Section 4.2.8.2. 

#### <a id="generateECDHEParameters" href="#generateECDHEParameters">func generateECDHEParameters(rand io.Reader, curveID CurveID) (ecdheParameters, error)</a>

```
searchKey: tls.generateECDHEParameters
```

```Go
func generateECDHEParameters(rand io.Reader, curveID CurveID) (ecdheParameters, error)
```

### <a id="nistParameters" href="#nistParameters">type nistParameters struct</a>

```
searchKey: tls.nistParameters
```

```Go
type nistParameters struct {
	privateKey []byte
	x, y       *big.Int // public key
	curveID    CurveID
}
```

#### <a id="nistParameters.CurveID" href="#nistParameters.CurveID">func (p *nistParameters) CurveID() CurveID</a>

```
searchKey: tls.nistParameters.CurveID
```

```Go
func (p *nistParameters) CurveID() CurveID
```

#### <a id="nistParameters.PublicKey" href="#nistParameters.PublicKey">func (p *nistParameters) PublicKey() []byte</a>

```
searchKey: tls.nistParameters.PublicKey
```

```Go
func (p *nistParameters) PublicKey() []byte
```

#### <a id="nistParameters.SharedKey" href="#nistParameters.SharedKey">func (p *nistParameters) SharedKey(peerPublicKey []byte) []byte</a>

```
searchKey: tls.nistParameters.SharedKey
```

```Go
func (p *nistParameters) SharedKey(peerPublicKey []byte) []byte
```

### <a id="x25519Parameters" href="#x25519Parameters">type x25519Parameters struct</a>

```
searchKey: tls.x25519Parameters
```

```Go
type x25519Parameters struct {
	privateKey []byte
	publicKey  []byte
}
```

#### <a id="x25519Parameters.CurveID" href="#x25519Parameters.CurveID">func (p *x25519Parameters) CurveID() CurveID</a>

```
searchKey: tls.x25519Parameters.CurveID
```

```Go
func (p *x25519Parameters) CurveID() CurveID
```

#### <a id="x25519Parameters.PublicKey" href="#x25519Parameters.PublicKey">func (p *x25519Parameters) PublicKey() []byte</a>

```
searchKey: tls.x25519Parameters.PublicKey
```

```Go
func (p *x25519Parameters) PublicKey() []byte
```

#### <a id="x25519Parameters.SharedKey" href="#x25519Parameters.SharedKey">func (p *x25519Parameters) SharedKey(peerPublicKey []byte) []byte</a>

```
searchKey: tls.x25519Parameters.SharedKey
```

```Go
func (p *x25519Parameters) SharedKey(peerPublicKey []byte) []byte
```

### <a id="finishedHash" href="#finishedHash">type finishedHash struct</a>

```
searchKey: tls.finishedHash
```

```Go
type finishedHash struct {
	client hash.Hash
	server hash.Hash

	// Prior to TLS 1.2, an additional MD5 hash is required.
	clientMD5 hash.Hash
	serverMD5 hash.Hash

	// In TLS 1.2, a full buffer is sadly required.
	buffer []byte

	version uint16
	prf     func(result, secret, label, seed []byte)
}
```

A finishedHash calculates the hash of a set of handshake messages suitable for including in a Finished message. 

#### <a id="newFinishedHash" href="#newFinishedHash">func newFinishedHash(version uint16, cipherSuite *cipherSuite) finishedHash</a>

```
searchKey: tls.newFinishedHash
```

```Go
func newFinishedHash(version uint16, cipherSuite *cipherSuite) finishedHash
```

#### <a id="finishedHash.Write" href="#finishedHash.Write">func (h *finishedHash) Write(msg []byte) (n int, err error)</a>

```
searchKey: tls.finishedHash.Write
```

```Go
func (h *finishedHash) Write(msg []byte) (n int, err error)
```

#### <a id="finishedHash.Sum" href="#finishedHash.Sum">func (h finishedHash) Sum() []byte</a>

```
searchKey: tls.finishedHash.Sum
```

```Go
func (h finishedHash) Sum() []byte
```

#### <a id="finishedHash.clientSum" href="#finishedHash.clientSum">func (h finishedHash) clientSum(masterSecret []byte) []byte</a>

```
searchKey: tls.finishedHash.clientSum
```

```Go
func (h finishedHash) clientSum(masterSecret []byte) []byte
```

clientSum returns the contents of the verify_data member of a client's Finished message. 

#### <a id="finishedHash.serverSum" href="#finishedHash.serverSum">func (h finishedHash) serverSum(masterSecret []byte) []byte</a>

```
searchKey: tls.finishedHash.serverSum
```

```Go
func (h finishedHash) serverSum(masterSecret []byte) []byte
```

serverSum returns the contents of the verify_data member of a server's Finished message. 

#### <a id="finishedHash.hashForClientCertificate" href="#finishedHash.hashForClientCertificate">func (h finishedHash) hashForClientCertificate(sigType uint8, hashAlg crypto.Hash, masterSecret []byte) []byte</a>

```
searchKey: tls.finishedHash.hashForClientCertificate
```

```Go
func (h finishedHash) hashForClientCertificate(sigType uint8, hashAlg crypto.Hash, masterSecret []byte) []byte
```

hashForClientCertificate returns the handshake messages so far, pre-hashed if necessary, suitable for signing by a TLS client certificate. 

#### <a id="finishedHash.discardHandshakeBuffer" href="#finishedHash.discardHandshakeBuffer">func (h *finishedHash) discardHandshakeBuffer()</a>

```
searchKey: tls.finishedHash.discardHandshakeBuffer
```

```Go
func (h *finishedHash) discardHandshakeBuffer()
```

discardHandshakeBuffer is called when there is no more need to buffer the entirety of the handshake messages. 

### <a id="sessionState" href="#sessionState">type sessionState struct</a>

```
searchKey: tls.sessionState
```

```Go
type sessionState struct {
	vers         uint16
	cipherSuite  uint16
	createdAt    uint64
	masterSecret []byte // opaque master_secret<1..2^16-1>;
	// struct { opaque certificate<1..2^24-1> } Certificate;
	certificates [][]byte // Certificate certificate_list<0..2^24-1>;

	// usedOldKey is true if the ticket from which this session came from
	// was encrypted with an older key and thus should be refreshed.
	usedOldKey bool
}
```

sessionState contains the information that is serialized into a session ticket in order to later resume a connection. 

#### <a id="sessionState.marshal" href="#sessionState.marshal">func (m *sessionState) marshal() []byte</a>

```
searchKey: tls.sessionState.marshal
```

```Go
func (m *sessionState) marshal() []byte
```

#### <a id="sessionState.unmarshal" href="#sessionState.unmarshal">func (m *sessionState) unmarshal(data []byte) bool</a>

```
searchKey: tls.sessionState.unmarshal
```

```Go
func (m *sessionState) unmarshal(data []byte) bool
```

#### <a id="sessionState.Generate" href="#sessionState.Generate">func (*sessionState) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.sessionState.Generate
```

```Go
func (*sessionState) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="sessionStateTLS13" href="#sessionStateTLS13">type sessionStateTLS13 struct</a>

```
searchKey: tls.sessionStateTLS13
```

```Go
type sessionStateTLS13 struct {
	// uint8 version  = 0x0304;
	// uint8 revision = 0;
	cipherSuite      uint16
	createdAt        uint64
	resumptionSecret []byte      // opaque resumption_master_secret<1..2^8-1>;
	certificate      Certificate // CertificateEntry certificate_list<0..2^24-1>;
}
```

sessionStateTLS13 is the content of a TLS 1.3 session ticket. Its first version (revision = 0) doesn't carry any of the information needed for 0-RTT validation and the nonce is always empty. 

#### <a id="sessionStateTLS13.marshal" href="#sessionStateTLS13.marshal">func (m *sessionStateTLS13) marshal() []byte</a>

```
searchKey: tls.sessionStateTLS13.marshal
```

```Go
func (m *sessionStateTLS13) marshal() []byte
```

#### <a id="sessionStateTLS13.unmarshal" href="#sessionStateTLS13.unmarshal">func (m *sessionStateTLS13) unmarshal(data []byte) bool</a>

```
searchKey: tls.sessionStateTLS13.unmarshal
```

```Go
func (m *sessionStateTLS13) unmarshal(data []byte) bool
```

#### <a id="sessionStateTLS13.Generate" href="#sessionStateTLS13.Generate">func (*sessionStateTLS13) Generate(rand *rand.Rand, size int) reflect.Value</a>

```
searchKey: tls.sessionStateTLS13.Generate
```

```Go
func (*sessionStateTLS13) Generate(rand *rand.Rand, size int) reflect.Value
```

### <a id="listener" href="#listener">type listener struct</a>

```
searchKey: tls.listener
```

```Go
type listener struct {
	net.Listener
	config *Config
}
```

A listener implements a network listener (net.Listener) for TLS connections. 

#### <a id="listener.Accept" href="#listener.Accept">func (l *listener) Accept() (net.Conn, error)</a>

```
searchKey: tls.listener.Accept
```

```Go
func (l *listener) Accept() (net.Conn, error)
```

Accept waits for and returns the next incoming TLS connection. The returned connection is of type *Conn. 

### <a id="timeoutError" href="#timeoutError">type timeoutError struct{}</a>

```
searchKey: tls.timeoutError
```

```Go
type timeoutError struct{}
```

#### <a id="timeoutError.Error" href="#timeoutError.Error">func (timeoutError) Error() string</a>

```
searchKey: tls.timeoutError.Error
```

```Go
func (timeoutError) Error() string
```

#### <a id="timeoutError.Timeout" href="#timeoutError.Timeout">func (timeoutError) Timeout() bool</a>

```
searchKey: tls.timeoutError.Timeout
```

```Go
func (timeoutError) Timeout() bool
```

#### <a id="timeoutError.Temporary" href="#timeoutError.Temporary">func (timeoutError) Temporary() bool</a>

```
searchKey: tls.timeoutError.Temporary
```

```Go
func (timeoutError) Temporary() bool
```

### <a id="Dialer" href="#Dialer">type Dialer struct</a>

```
searchKey: tls.Dialer
tags: [exported]
```

```Go
type Dialer struct {
	// NetDialer is the optional dialer to use for the TLS connections'
	// underlying TCP connections.
	// A nil NetDialer is equivalent to the net.Dialer zero value.
	NetDialer *net.Dialer

	// Config is the TLS configuration to use for new connections.
	// A nil configuration is equivalent to the zero
	// configuration; see the documentation of Config for the
	// defaults.
	Config *Config
}
```

Dialer dials TLS connections given a configuration and a Dialer for the underlying connection. 

#### <a id="Dialer.Dial" href="#Dialer.Dial">func (d *Dialer) Dial(network, addr string) (net.Conn, error)</a>

```
searchKey: tls.Dialer.Dial
tags: [exported]
```

```Go
func (d *Dialer) Dial(network, addr string) (net.Conn, error)
```

Dial connects to the given network address and initiates a TLS handshake, returning the resulting TLS connection. 

The returned Conn, if any, will always be of type *Conn. 

Dial uses context.Background internally; to specify the context, use DialContext. 

#### <a id="Dialer.netDialer" href="#Dialer.netDialer">func (d *Dialer) netDialer() *net.Dialer</a>

```
searchKey: tls.Dialer.netDialer
```

```Go
func (d *Dialer) netDialer() *net.Dialer
```

#### <a id="Dialer.DialContext" href="#Dialer.DialContext">func (d *Dialer) DialContext(ctx context.Context, network, addr string) (net.Conn, error)</a>

```
searchKey: tls.Dialer.DialContext
tags: [exported]
```

```Go
func (d *Dialer) DialContext(ctx context.Context, network, addr string) (net.Conn, error)
```

DialContext connects to the given network address and initiates a TLS handshake, returning the resulting TLS connection. 

The provided Context must be non-nil. If the context expires before the connection is complete, an error is returned. Once successfully connected, any expiration of the context will not affect the connection. 

The returned Conn, if any, will always be of type *Conn. 

### <a id="hairpinConn" href="#hairpinConn">type hairpinConn struct</a>

```
searchKey: tls.hairpinConn
```

```Go
type hairpinConn struct {
	net.Conn
	tlsConn *Conn
}
```

hairpinConn is a net.Conn that makes a “hairpin” call when closed, back into the tls.Conn which is calling it. 

#### <a id="hairpinConn.Close" href="#hairpinConn.Close">func (conn *hairpinConn) Close() error</a>

```
searchKey: tls.hairpinConn.Close
```

```Go
func (conn *hairpinConn) Close() error
```

### <a id="opensslInputEvent" href="#opensslInputEvent">type opensslInputEvent int</a>

```
searchKey: tls.opensslInputEvent
```

```Go
type opensslInputEvent int
```

opensslInputEvent enumerates possible inputs that can be sent to an `openssl s_client` process. 

### <a id="opensslInput" href="#opensslInput">type opensslInput chan tls.opensslInputEvent</a>

```
searchKey: tls.opensslInput
```

```Go
type opensslInput chan opensslInputEvent
```

#### <a id="opensslInput.Read" href="#opensslInput.Read">func (i opensslInput) Read(buf []byte) (n int, err error)</a>

```
searchKey: tls.opensslInput.Read
```

```Go
func (i opensslInput) Read(buf []byte) (n int, err error)
```

### <a id="opensslOutputSink" href="#opensslOutputSink">type opensslOutputSink struct</a>

```
searchKey: tls.opensslOutputSink
```

```Go
type opensslOutputSink struct {
	handshakeComplete chan struct{}
	readKeyUpdate     chan struct{}
	all               []byte
	line              []byte
}
```

opensslOutputSink is an io.Writer that receives the stdout and stderr from an `openssl` process and sends a value to handshakeComplete or readKeyUpdate when certain messages are seen. 

#### <a id="newOpensslOutputSink" href="#newOpensslOutputSink">func newOpensslOutputSink() *opensslOutputSink</a>

```
searchKey: tls.newOpensslOutputSink
```

```Go
func newOpensslOutputSink() *opensslOutputSink
```

#### <a id="opensslOutputSink.Write" href="#opensslOutputSink.Write">func (o *opensslOutputSink) Write(data []byte) (n int, err error)</a>

```
searchKey: tls.opensslOutputSink.Write
```

```Go
func (o *opensslOutputSink) Write(data []byte) (n int, err error)
```

#### <a id="opensslOutputSink.String" href="#opensslOutputSink.String">func (o *opensslOutputSink) String() string</a>

```
searchKey: tls.opensslOutputSink.String
```

```Go
func (o *opensslOutputSink) String() string
```

### <a id="clientTest" href="#clientTest">type clientTest struct</a>

```
searchKey: tls.clientTest
```

```Go
type clientTest struct {
	// name is a freeform string identifying the test and the file in which
	// the expected results will be stored.
	name string
	// args, if not empty, contains a series of arguments for the
	// command to run for the reference server.
	args []string
	// config, if not nil, contains a custom Config to use for this test.
	config *Config
	// cert, if not empty, contains a DER-encoded certificate for the
	// reference server.
	cert []byte
	// key, if not nil, contains either a *rsa.PrivateKey, ed25519.PrivateKey or
	// *ecdsa.PrivateKey which is the private key for the reference server.
	key interface{}
	// extensions, if not nil, contains a list of extension data to be returned
	// from the ServerHello. The data should be in standard TLS format with
	// a 2-byte uint16 type, 2-byte data length, followed by the extension data.
	extensions [][]byte
	// validate, if not nil, is a function that will be called with the
	// ConnectionState of the resulting connection. It returns a non-nil
	// error if the ConnectionState is unacceptable.
	validate func(ConnectionState) error
	// numRenegotiations is the number of times that the connection will be
	// renegotiated.
	numRenegotiations int
	// renegotiationExpectedToFail, if not zero, is the number of the
	// renegotiation attempt that is expected to fail.
	renegotiationExpectedToFail int
	// checkRenegotiationError, if not nil, is called with any error
	// arising from renegotiation. It can map expected errors to nil to
	// ignore them.
	checkRenegotiationError func(renegotiationNum int, err error) error
	// sendKeyUpdate will cause the server to send a KeyUpdate message.
	sendKeyUpdate bool
}
```

clientTest represents a test of the TLS client handshake against a reference implementation. 

#### <a id="clientTest.connFromCommand" href="#clientTest.connFromCommand">func (test *clientTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, stdin opensslInput, stdout *opensslOutputSink, err error)</a>

```
searchKey: tls.clientTest.connFromCommand
```

```Go
func (test *clientTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, stdin opensslInput, stdout *opensslOutputSink, err error)
```

connFromCommand starts the reference server process, connects to it and returns a recordingConn for the connection. The stdin return value is an opensslInput for the stdin of the child process. It must be closed before Waiting for child. 

#### <a id="clientTest.dataPath" href="#clientTest.dataPath">func (test *clientTest) dataPath() string</a>

```
searchKey: tls.clientTest.dataPath
```

```Go
func (test *clientTest) dataPath() string
```

#### <a id="clientTest.loadData" href="#clientTest.loadData">func (test *clientTest) loadData() (flows [][]byte, err error)</a>

```
searchKey: tls.clientTest.loadData
```

```Go
func (test *clientTest) loadData() (flows [][]byte, err error)
```

#### <a id="clientTest.run" href="#clientTest.run">func (test *clientTest) run(t *testing.T, write bool)</a>

```
searchKey: tls.clientTest.run
```

```Go
func (test *clientTest) run(t *testing.T, write bool)
```

### <a id="brokenConn" href="#brokenConn">type brokenConn struct</a>

```
searchKey: tls.brokenConn
```

```Go
type brokenConn struct {
	net.Conn

	// breakAfter is the number of successful writes that will be allowed
	// before all subsequent writes fail.
	breakAfter int

	// numWrites is the number of writes that have been done.
	numWrites int
}
```

brokenConn wraps a net.Conn and causes all Writes after a certain number to fail with brokenConnErr. 

#### <a id="brokenConn.Write" href="#brokenConn.Write">func (b *brokenConn) Write(data []byte) (int, error)</a>

```
searchKey: tls.brokenConn.Write
```

```Go
func (b *brokenConn) Write(data []byte) (int, error)
```

### <a id="writeCountingConn" href="#writeCountingConn">type writeCountingConn struct</a>

```
searchKey: tls.writeCountingConn
```

```Go
type writeCountingConn struct {
	net.Conn

	// numWrites is the number of writes that have been done.
	numWrites int
}
```

writeCountingConn wraps a net.Conn and counts the number of Write calls. 

#### <a id="writeCountingConn.Write" href="#writeCountingConn.Write">func (wcc *writeCountingConn) Write(data []byte) (int, error)</a>

```
searchKey: tls.writeCountingConn.Write
```

```Go
func (wcc *writeCountingConn) Write(data []byte) (int, error)
```

### <a id="serverTest" href="#serverTest">type serverTest struct</a>

```
searchKey: tls.serverTest
```

```Go
type serverTest struct {
	// name is a freeform string identifying the test and the file in which
	// the expected results will be stored.
	name string
	// command, if not empty, contains a series of arguments for the
	// command to run for the reference server.
	command []string
	// expectedPeerCerts contains a list of PEM blocks of expected
	// certificates from the client.
	expectedPeerCerts []string
	// config, if not nil, contains a custom Config to use for this test.
	config *Config
	// expectHandshakeErrorIncluding, when not empty, contains a string
	// that must be a substring of the error resulting from the handshake.
	expectHandshakeErrorIncluding string
	// validate, if not nil, is a function that will be called with the
	// ConnectionState of the resulting connection. It returns false if the
	// ConnectionState is unacceptable.
	validate func(ConnectionState) error
	// wait, if true, prevents this subtest from calling t.Parallel.
	// If false, runServerTest* returns immediately.
	wait bool
}
```

serverTest represents a test of the TLS server handshake against a reference implementation. 

#### <a id="serverTest.connFromCommand" href="#serverTest.connFromCommand">func (test *serverTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, err error)</a>

```
searchKey: tls.serverTest.connFromCommand
```

```Go
func (test *serverTest) connFromCommand() (conn *recordingConn, child *exec.Cmd, err error)
```

connFromCommand starts opens a listening socket and starts the reference client to connect to it. It returns a recordingConn that wraps the resulting connection. 

#### <a id="serverTest.dataPath" href="#serverTest.dataPath">func (test *serverTest) dataPath() string</a>

```
searchKey: tls.serverTest.dataPath
```

```Go
func (test *serverTest) dataPath() string
```

#### <a id="serverTest.loadData" href="#serverTest.loadData">func (test *serverTest) loadData() (flows [][]byte, err error)</a>

```
searchKey: tls.serverTest.loadData
```

```Go
func (test *serverTest) loadData() (flows [][]byte, err error)
```

#### <a id="serverTest.run" href="#serverTest.run">func (test *serverTest) run(t *testing.T, write bool)</a>

```
searchKey: tls.serverTest.run
```

```Go
func (test *serverTest) run(t *testing.T, write bool)
```

### <a id="recordingConn" href="#recordingConn">type recordingConn struct</a>

```
searchKey: tls.recordingConn
```

```Go
type recordingConn struct {
	net.Conn
	sync.Mutex
	flows   [][]byte
	reading bool
}
```

recordingConn is a net.Conn that records the traffic that passes through it. WriteTo can be used to produce output that can be later be loaded with ParseTestData. 

#### <a id="recordingConn.Read" href="#recordingConn.Read">func (r *recordingConn) Read(b []byte) (n int, err error)</a>

```
searchKey: tls.recordingConn.Read
```

```Go
func (r *recordingConn) Read(b []byte) (n int, err error)
```

#### <a id="recordingConn.Write" href="#recordingConn.Write">func (r *recordingConn) Write(b []byte) (n int, err error)</a>

```
searchKey: tls.recordingConn.Write
```

```Go
func (r *recordingConn) Write(b []byte) (n int, err error)
```

#### <a id="recordingConn.WriteTo" href="#recordingConn.WriteTo">func (r *recordingConn) WriteTo(w io.Writer) (int64, error)</a>

```
searchKey: tls.recordingConn.WriteTo
```

```Go
func (r *recordingConn) WriteTo(w io.Writer) (int64, error)
```

WriteTo writes Go source code to w that contains the recorded traffic. 

### <a id="zeroSource" href="#zeroSource">type zeroSource struct{}</a>

```
searchKey: tls.zeroSource
```

```Go
type zeroSource struct{}
```

zeroSource is an io.Reader that returns an unlimited number of zero bytes. 

#### <a id="zeroSource.Read" href="#zeroSource.Read">func (zeroSource) Read(b []byte) (n int, err error)</a>

```
searchKey: tls.zeroSource.Read
```

```Go
func (zeroSource) Read(b []byte) (n int, err error)
```

### <a id="testSplitPreMasterSecretTest" href="#testSplitPreMasterSecretTest">type testSplitPreMasterSecretTest struct</a>

```
searchKey: tls.testSplitPreMasterSecretTest
```

```Go
type testSplitPreMasterSecretTest struct {
	in, out1, out2 string
}
```

### <a id="testKeysFromTest" href="#testKeysFromTest">type testKeysFromTest struct</a>

```
searchKey: tls.testKeysFromTest
```

```Go
type testKeysFromTest struct {
	version                                        uint16
	suite                                          *cipherSuite
	preMasterSecret                                string
	clientRandom, serverRandom                     string
	masterSecret                                   string
	clientMAC, serverMAC                           string
	clientKey, serverKey                           string
	macLen, keyLen                                 int
	contextKeyingMaterial, noContextKeyingMaterial string
}
```

### <a id="readerFunc" href="#readerFunc">type readerFunc func([]byte) (int, error)</a>

```
searchKey: tls.readerFunc
```

```Go
type readerFunc func([]byte) (int, error)
```

#### <a id="readerFunc.Read" href="#readerFunc.Read">func (f readerFunc) Read(b []byte) (int, error)</a>

```
searchKey: tls.readerFunc.Read
```

```Go
func (f readerFunc) Read(b []byte) (int, error)
```

### <a id="changeImplConn" href="#changeImplConn">type changeImplConn struct</a>

```
searchKey: tls.changeImplConn
```

```Go
type changeImplConn struct {
	net.Conn
	writeFunc func([]byte) (int, error)
	closeFunc func() error
}
```

changeImplConn is a net.Conn which can change its Write and Close methods. 

#### <a id="changeImplConn.Write" href="#changeImplConn.Write">func (w *changeImplConn) Write(p []byte) (n int, err error)</a>

```
searchKey: tls.changeImplConn.Write
```

```Go
func (w *changeImplConn) Write(p []byte) (n int, err error)
```

#### <a id="changeImplConn.Close" href="#changeImplConn.Close">func (w *changeImplConn) Close() error</a>

```
searchKey: tls.changeImplConn.Close
```

```Go
func (w *changeImplConn) Close() error
```

### <a id="slowConn" href="#slowConn">type slowConn struct</a>

```
searchKey: tls.slowConn
```

```Go
type slowConn struct {
	net.Conn
	bps int
}
```

#### <a id="slowConn.Write" href="#slowConn.Write">func (c *slowConn) Write(p []byte) (int, error)</a>

```
searchKey: tls.slowConn.Write
```

```Go
func (c *slowConn) Write(p []byte) (int, error)
```

### <a id="brokenSigner" href="#brokenSigner">type brokenSigner struct</a>

```
searchKey: tls.brokenSigner
```

```Go
type brokenSigner struct{ crypto.Signer }
```

#### <a id="brokenSigner.Sign" href="#brokenSigner.Sign">func (s brokenSigner) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) (signature []byte, err error)</a>

```
searchKey: tls.brokenSigner.Sign
```

```Go
func (s brokenSigner) Sign(rand io.Reader, digest []byte, opts crypto.SignerOpts) (signature []byte, err error)
```

## <a id="func" href="#func">Functions</a>

```
tags: [exported]
```

### <a id="verifyHandshakeSignature" href="#verifyHandshakeSignature">func verifyHandshakeSignature(sigType uint8, pubkey crypto.PublicKey, hashFunc crypto.Hash, signed, sig []byte) error</a>

```
searchKey: tls.verifyHandshakeSignature
```

```Go
func verifyHandshakeSignature(sigType uint8, pubkey crypto.PublicKey, hashFunc crypto.Hash, signed, sig []byte) error
```

verifyHandshakeSignature verifies a signature against pre-hashed (if required) handshake contents. 

### <a id="signedMessage" href="#signedMessage">func signedMessage(sigHash crypto.Hash, context string, transcript hash.Hash) []byte</a>

```
searchKey: tls.signedMessage
```

```Go
func signedMessage(sigHash crypto.Hash, context string, transcript hash.Hash) []byte
```

signedMessage returns the pre-hashed (if necessary) message to be signed by certificate keys in TLS 1.3. See RFC 8446, Section 4.4.3. 

### <a id="typeAndHashFromSignatureScheme" href="#typeAndHashFromSignatureScheme">func typeAndHashFromSignatureScheme(signatureAlgorithm SignatureScheme) (sigType uint8, hash crypto.Hash, err error)</a>

```
searchKey: tls.typeAndHashFromSignatureScheme
```

```Go
func typeAndHashFromSignatureScheme(signatureAlgorithm SignatureScheme) (sigType uint8, hash crypto.Hash, err error)
```

typeAndHashFromSignatureScheme returns the corresponding signature type and crypto.Hash for a given TLS SignatureScheme. 

### <a id="legacyTypeAndHashFromPublicKey" href="#legacyTypeAndHashFromPublicKey">func legacyTypeAndHashFromPublicKey(pub crypto.PublicKey) (sigType uint8, hash crypto.Hash, err error)</a>

```
searchKey: tls.legacyTypeAndHashFromPublicKey
```

```Go
func legacyTypeAndHashFromPublicKey(pub crypto.PublicKey) (sigType uint8, hash crypto.Hash, err error)
```

legacyTypeAndHashFromPublicKey returns the fixed signature type and crypto.Hash for a given public key used with TLS 1.0 and 1.1, before the introduction of signature algorithm negotiation. 

### <a id="signatureSchemesForCertificate" href="#signatureSchemesForCertificate">func signatureSchemesForCertificate(version uint16, cert *Certificate) []SignatureScheme</a>

```
searchKey: tls.signatureSchemesForCertificate
```

```Go
func signatureSchemesForCertificate(version uint16, cert *Certificate) []SignatureScheme
```

signatureSchemesForCertificate returns the list of supported SignatureSchemes for a given certificate, based on the public key and the protocol version, and optionally filtered by its explicit SupportedSignatureAlgorithms. 

This function must be kept in sync with supportedSignatureAlgorithms. 

### <a id="unsupportedCertificateError" href="#unsupportedCertificateError">func unsupportedCertificateError(cert *Certificate) error</a>

```
searchKey: tls.unsupportedCertificateError
```

```Go
func unsupportedCertificateError(cert *Certificate) error
```

unsupportedCertificateError returns a helpful error for certificates with an unsupported private key. 

### <a id="CipherSuites" href="#CipherSuites">func CipherSuites() []*CipherSuite</a>

```
searchKey: tls.CipherSuites
tags: [exported]
```

```Go
func CipherSuites() []*CipherSuite
```

CipherSuites returns a list of cipher suites currently implemented by this package, excluding those with security issues, which are returned by InsecureCipherSuites. 

The list is sorted by ID. Note that the default cipher suites selected by this package might depend on logic that can't be captured by a static list, and might not match those returned by this function. 

### <a id="InsecureCipherSuites" href="#InsecureCipherSuites">func InsecureCipherSuites() []*CipherSuite</a>

```
searchKey: tls.InsecureCipherSuites
tags: [exported]
```

```Go
func InsecureCipherSuites() []*CipherSuite
```

InsecureCipherSuites returns a list of cipher suites currently implemented by this package and which have security issues. 

Most applications should not use the cipher suites in this list, and should only use those returned by CipherSuites. 

### <a id="CipherSuiteName" href="#CipherSuiteName">func CipherSuiteName(id uint16) string</a>

```
searchKey: tls.CipherSuiteName
tags: [exported]
```

```Go
func CipherSuiteName(id uint16) string
```

CipherSuiteName returns the standard name for the passed cipher suite ID (e.g. "TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"), or a fallback representation of the ID value if the cipher suite is not implemented by this package. 

### <a id="aesgcmPreferred" href="#aesgcmPreferred">func aesgcmPreferred(ciphers []uint16) bool</a>

```
searchKey: tls.aesgcmPreferred
```

```Go
func aesgcmPreferred(ciphers []uint16) bool
```

aesgcmPreferred returns whether the first known cipher in the preference list is an AES-GCM cipher, implying the peer has hardware support for it. 

### <a id="cipherRC4" href="#cipherRC4">func cipherRC4(key, iv []byte, isRead bool) interface{}</a>

```
searchKey: tls.cipherRC4
```

```Go
func cipherRC4(key, iv []byte, isRead bool) interface{}
```

### <a id="cipher3DES" href="#cipher3DES">func cipher3DES(key, iv []byte, isRead bool) interface{}</a>

```
searchKey: tls.cipher3DES
```

```Go
func cipher3DES(key, iv []byte, isRead bool) interface{}
```

### <a id="cipherAES" href="#cipherAES">func cipherAES(key, iv []byte, isRead bool) interface{}</a>

```
searchKey: tls.cipherAES
```

```Go
func cipherAES(key, iv []byte, isRead bool) interface{}
```

### <a id="macSHA1" href="#macSHA1">func macSHA1(key []byte) hash.Hash</a>

```
searchKey: tls.macSHA1
```

```Go
func macSHA1(key []byte) hash.Hash
```

macSHA1 returns a SHA-1 based constant time MAC. 

### <a id="macSHA256" href="#macSHA256">func macSHA256(key []byte) hash.Hash</a>

```
searchKey: tls.macSHA256
```

```Go
func macSHA256(key []byte) hash.Hash
```

macSHA256 returns a SHA-256 based MAC. This is only supported in TLS 1.2 and is currently only used in disabled-by-default cipher suites. 

### <a id="newConstantTimeHash" href="#newConstantTimeHash">func newConstantTimeHash(h func() hash.Hash) func() hash.Hash</a>

```
searchKey: tls.newConstantTimeHash
```

```Go
func newConstantTimeHash(h func() hash.Hash) func() hash.Hash
```

### <a id="tls10MAC" href="#tls10MAC">func tls10MAC(h hash.Hash, out, seq, header, data, extra []byte) []byte</a>

```
searchKey: tls.tls10MAC
```

```Go
func tls10MAC(h hash.Hash, out, seq, header, data, extra []byte) []byte
```

tls10MAC implements the TLS 1.0 MAC function. RFC 2246, Section 6.2.3. 

### <a id="requiresClientCert" href="#requiresClientCert">func requiresClientCert(c ClientAuthType) bool</a>

```
searchKey: tls.requiresClientCert
```

```Go
func requiresClientCert(c ClientAuthType) bool
```

requiresClientCert reports whether the ClientAuthType requires a client certificate to be provided. 

### <a id="supportedVersionsFromMax" href="#supportedVersionsFromMax">func supportedVersionsFromMax(maxVersion uint16) []uint16</a>

```
searchKey: tls.supportedVersionsFromMax
```

```Go
func supportedVersionsFromMax(maxVersion uint16) []uint16
```

supportedVersionsFromMax returns a list of supported versions derived from a legacy maximum version value. Note that only versions supported by this library are returned. Any newer peer will use supportedVersions anyway. 

### <a id="unexpectedMessageError" href="#unexpectedMessageError">func unexpectedMessageError(wanted, got interface{}) error</a>

```
searchKey: tls.unexpectedMessageError
```

```Go
func unexpectedMessageError(wanted, got interface{}) error
```

### <a id="isSupportedSignatureAlgorithm" href="#isSupportedSignatureAlgorithm">func isSupportedSignatureAlgorithm(sigAlg SignatureScheme, supportedSignatureAlgorithms []SignatureScheme) bool</a>

```
searchKey: tls.isSupportedSignatureAlgorithm
```

```Go
func isSupportedSignatureAlgorithm(sigAlg SignatureScheme, supportedSignatureAlgorithms []SignatureScheme) bool
```

### <a id="_" href="#_">func _()</a>

```
searchKey: tls._
```

```Go
func _()
```

### <a id="_" href="#_">func _()</a>

```
searchKey: tls._
```

```Go
func _()
```

### <a id="_" href="#_">func _()</a>

```
searchKey: tls._
```

```Go
func _()
```

### <a id="extractPadding" href="#extractPadding">func extractPadding(payload []byte) (toRemove int, good byte)</a>

```
searchKey: tls.extractPadding
```

```Go
func extractPadding(payload []byte) (toRemove int, good byte)
```

extractPadding returns, in constant time, the length of the padding to remove from the end of payload. It also returns a byte which is equal to 255 if the padding was valid and 0 otherwise. See RFC 2246, Section 6.2.3.2. 

### <a id="roundUp" href="#roundUp">func roundUp(a, b int) int</a>

```
searchKey: tls.roundUp
```

```Go
func roundUp(a, b int) int
```

### <a id="sliceForAppend" href="#sliceForAppend">func sliceForAppend(in []byte, n int) (head, tail []byte)</a>

```
searchKey: tls.sliceForAppend
```

```Go
func sliceForAppend(in []byte, n int) (head, tail []byte)
```

sliceForAppend extends the input slice by n bytes. head is the full extended slice, while tail is the appended part. If the original slice has sufficient capacity no allocation is performed. 

### <a id="checkALPN" href="#checkALPN">func checkALPN(clientProtos []string, serverProto string) error</a>

```
searchKey: tls.checkALPN
```

```Go
func checkALPN(clientProtos []string, serverProto string) error
```

checkALPN ensure that the server's choice of ALPN protocol is compatible with the protocols that we advertised in the Client Hello. 

### <a id="clientSessionCacheKey" href="#clientSessionCacheKey">func clientSessionCacheKey(serverAddr net.Addr, config *Config) string</a>

```
searchKey: tls.clientSessionCacheKey
```

```Go
func clientSessionCacheKey(serverAddr net.Addr, config *Config) string
```

clientSessionCacheKey returns a key used to cache sessionTickets that could be used to resume previously negotiated TLS sessions with a server. 

### <a id="hostnameInSNI" href="#hostnameInSNI">func hostnameInSNI(name string) string</a>

```
searchKey: tls.hostnameInSNI
```

```Go
func hostnameInSNI(name string) string
```

hostnameInSNI converts name into an appropriate hostname for SNI. Literal IP addresses and absolute FQDNs are not permitted as SNI values. See RFC 6066, Section 3. 

### <a id="addBytesWithLength" href="#addBytesWithLength">func addBytesWithLength(b *cryptobyte.Builder, v []byte, n int)</a>

```
searchKey: tls.addBytesWithLength
```

```Go
func addBytesWithLength(b *cryptobyte.Builder, v []byte, n int)
```

addBytesWithLength appends a sequence of bytes to the cryptobyte.Builder. If the length of the sequence is not the value specified, it produces an error. 

### <a id="addUint64" href="#addUint64">func addUint64(b *cryptobyte.Builder, v uint64)</a>

```
searchKey: tls.addUint64
```

```Go
func addUint64(b *cryptobyte.Builder, v uint64)
```

addUint64 appends a big-endian, 64-bit value to the cryptobyte.Builder. 

### <a id="readUint64" href="#readUint64">func readUint64(s *cryptobyte.String, out *uint64) bool</a>

```
searchKey: tls.readUint64
```

```Go
func readUint64(s *cryptobyte.String, out *uint64) bool
```

readUint64 decodes a big-endian, 64-bit value into out and advances over it. It reports whether the read was successful. 

### <a id="readUint8LengthPrefixed" href="#readUint8LengthPrefixed">func readUint8LengthPrefixed(s *cryptobyte.String, out *[]byte) bool</a>

```
searchKey: tls.readUint8LengthPrefixed
```

```Go
func readUint8LengthPrefixed(s *cryptobyte.String, out *[]byte) bool
```

readUint8LengthPrefixed acts like s.ReadUint8LengthPrefixed, but targets a []byte instead of a cryptobyte.String. 

### <a id="readUint16LengthPrefixed" href="#readUint16LengthPrefixed">func readUint16LengthPrefixed(s *cryptobyte.String, out *[]byte) bool</a>

```
searchKey: tls.readUint16LengthPrefixed
```

```Go
func readUint16LengthPrefixed(s *cryptobyte.String, out *[]byte) bool
```

readUint16LengthPrefixed acts like s.ReadUint16LengthPrefixed, but targets a []byte instead of a cryptobyte.String. 

### <a id="readUint24LengthPrefixed" href="#readUint24LengthPrefixed">func readUint24LengthPrefixed(s *cryptobyte.String, out *[]byte) bool</a>

```
searchKey: tls.readUint24LengthPrefixed
```

```Go
func readUint24LengthPrefixed(s *cryptobyte.String, out *[]byte) bool
```

readUint24LengthPrefixed acts like s.ReadUint24LengthPrefixed, but targets a []byte instead of a cryptobyte.String. 

### <a id="marshalCertificate" href="#marshalCertificate">func marshalCertificate(b *cryptobyte.Builder, certificate Certificate)</a>

```
searchKey: tls.marshalCertificate
```

```Go
func marshalCertificate(b *cryptobyte.Builder, certificate Certificate)
```

### <a id="unmarshalCertificate" href="#unmarshalCertificate">func unmarshalCertificate(s *cryptobyte.String, certificate *Certificate) bool</a>

```
searchKey: tls.unmarshalCertificate
```

```Go
func unmarshalCertificate(s *cryptobyte.String, certificate *Certificate) bool
```

### <a id="negotiateALPN" href="#negotiateALPN">func negotiateALPN(serverProtos, clientProtos []string) (string, error)</a>

```
searchKey: tls.negotiateALPN
```

```Go
func negotiateALPN(serverProtos, clientProtos []string) (string, error)
```

negotiateALPN picks a shared ALPN protocol that both sides support in server preference order. If ALPN is not configured or the peer doesn't support it, it returns "" and no error. 

### <a id="supportsECDHE" href="#supportsECDHE">func supportsECDHE(c *Config, supportedCurves []CurveID, supportedPoints []uint8) bool</a>

```
searchKey: tls.supportsECDHE
```

```Go
func supportsECDHE(c *Config, supportedCurves []CurveID, supportedPoints []uint8) bool
```

supportsECDHE returns whether ECDHE key exchanges can be used with this pre-TLS 1.3 client. 

### <a id="cloneHash" href="#cloneHash">func cloneHash(in hash.Hash, h crypto.Hash) hash.Hash</a>

```
searchKey: tls.cloneHash
```

```Go
func cloneHash(in hash.Hash, h crypto.Hash) hash.Hash
```

cloneHash uses the encoding.BinaryMarshaler and encoding.BinaryUnmarshaler interfaces implemented by standard library hashes to clone the state of in to a new instance of h. It returns nil if the operation fails. 

### <a id="illegalClientHelloChange" href="#illegalClientHelloChange">func illegalClientHelloChange(ch, ch1 *clientHelloMsg) bool</a>

```
searchKey: tls.illegalClientHelloChange
```

```Go
func illegalClientHelloChange(ch, ch1 *clientHelloMsg) bool
```

illegalClientHelloChange reports whether the two ClientHello messages are different, with the exception of the changes allowed before and after a HelloRetryRequest. See RFC 8446, Section 4.1.2. 

### <a id="sha1Hash" href="#sha1Hash">func sha1Hash(slices [][]byte) []byte</a>

```
searchKey: tls.sha1Hash
```

```Go
func sha1Hash(slices [][]byte) []byte
```

sha1Hash calculates a SHA1 hash over the given byte slices. 

### <a id="md5SHA1Hash" href="#md5SHA1Hash">func md5SHA1Hash(slices [][]byte) []byte</a>

```
searchKey: tls.md5SHA1Hash
```

```Go
func md5SHA1Hash(slices [][]byte) []byte
```

md5SHA1Hash implements TLS 1.0's hybrid hash function which consists of the concatenation of an MD5 and SHA1 hash. 

### <a id="hashForServerKeyExchange" href="#hashForServerKeyExchange">func hashForServerKeyExchange(sigType uint8, hashFunc crypto.Hash, version uint16, slices ...[]byte) []byte</a>

```
searchKey: tls.hashForServerKeyExchange
```

```Go
func hashForServerKeyExchange(sigType uint8, hashFunc crypto.Hash, version uint16, slices ...[]byte) []byte
```

hashForServerKeyExchange hashes the given slices and returns their digest using the given hash function (for >= TLS 1.2) or using a default based on the sigType (for earlier TLS versions). For Ed25519 signatures, which don't do pre-hashing, it returns the concatenation of the slices. 

### <a id="curveForCurveID" href="#curveForCurveID">func curveForCurveID(id CurveID) (elliptic.Curve, bool)</a>

```
searchKey: tls.curveForCurveID
```

```Go
func curveForCurveID(id CurveID) (elliptic.Curve, bool)
```

### <a id="splitPreMasterSecret" href="#splitPreMasterSecret">func splitPreMasterSecret(secret []byte) (s1, s2 []byte)</a>

```
searchKey: tls.splitPreMasterSecret
```

```Go
func splitPreMasterSecret(secret []byte) (s1, s2 []byte)
```

Split a premaster secret in two as specified in RFC 4346, Section 5. 

### <a id="pHash" href="#pHash">func pHash(result, secret, seed []byte, hash func() hash.Hash)</a>

```
searchKey: tls.pHash
```

```Go
func pHash(result, secret, seed []byte, hash func() hash.Hash)
```

pHash implements the P_hash function, as defined in RFC 4346, Section 5. 

### <a id="prf10" href="#prf10">func prf10(result, secret, label, seed []byte)</a>

```
searchKey: tls.prf10
```

```Go
func prf10(result, secret, label, seed []byte)
```

prf10 implements the TLS 1.0 pseudo-random function, as defined in RFC 2246, Section 5. 

### <a id="prf12" href="#prf12">func prf12(hashFunc func() hash.Hash) func(result, secret, label, seed []byte)</a>

```
searchKey: tls.prf12
```

```Go
func prf12(hashFunc func() hash.Hash) func(result, secret, label, seed []byte)
```

prf12 implements the TLS 1.2 pseudo-random function, as defined in RFC 5246, Section 5. 

### <a id="prfAndHashForVersion" href="#prfAndHashForVersion">func prfAndHashForVersion(version uint16, suite *cipherSuite) (func(result, secret, label, seed []byte), crypto.Hash)</a>

```
searchKey: tls.prfAndHashForVersion
```

```Go
func prfAndHashForVersion(version uint16, suite *cipherSuite) (func(result, secret, label, seed []byte), crypto.Hash)
```

### <a id="prfForVersion" href="#prfForVersion">func prfForVersion(version uint16, suite *cipherSuite) func(result, secret, label, seed []byte)</a>

```
searchKey: tls.prfForVersion
```

```Go
func prfForVersion(version uint16, suite *cipherSuite) func(result, secret, label, seed []byte)
```

### <a id="masterFromPreMasterSecret" href="#masterFromPreMasterSecret">func masterFromPreMasterSecret(version uint16, suite *cipherSuite, preMasterSecret, clientRandom, serverRandom []byte) []byte</a>

```
searchKey: tls.masterFromPreMasterSecret
```

```Go
func masterFromPreMasterSecret(version uint16, suite *cipherSuite, preMasterSecret, clientRandom, serverRandom []byte) []byte
```

masterFromPreMasterSecret generates the master secret from the pre-master secret. See RFC 5246, Section 8.1. 

### <a id="keysFromMasterSecret" href="#keysFromMasterSecret">func keysFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte, macLen, keyLen, ivLen int) (clientMAC, serverMAC, clientKey, serverKey, clientIV, serverIV []byte)</a>

```
searchKey: tls.keysFromMasterSecret
```

```Go
func keysFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte, macLen, keyLen, ivLen int) (clientMAC, serverMAC, clientKey, serverKey, clientIV, serverIV []byte)
```

keysFromMasterSecret generates the connection keys from the master secret, given the lengths of the MAC key, cipher key and IV, as defined in RFC 2246, Section 6.3. 

### <a id="noExportedKeyingMaterial" href="#noExportedKeyingMaterial">func noExportedKeyingMaterial(label string, context []byte, length int) ([]byte, error)</a>

```
searchKey: tls.noExportedKeyingMaterial
```

```Go
func noExportedKeyingMaterial(label string, context []byte, length int) ([]byte, error)
```

noExportedKeyingMaterial is used as a value of ConnectionState.ekm when renegotiation is enabled and thus we wish to fail all key-material export requests. 

### <a id="ekmFromMasterSecret" href="#ekmFromMasterSecret">func ekmFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte) func(string, []byte, int) ([]byte, error)</a>

```
searchKey: tls.ekmFromMasterSecret
```

```Go
func ekmFromMasterSecret(version uint16, suite *cipherSuite, masterSecret, clientRandom, serverRandom []byte) func(string, []byte, int) ([]byte, error)
```

ekmFromMasterSecret generates exported keying material as defined in RFC 5705. 

### <a id="NewListener" href="#NewListener">func NewListener(inner net.Listener, config *Config) net.Listener</a>

```
searchKey: tls.NewListener
tags: [exported]
```

```Go
func NewListener(inner net.Listener, config *Config) net.Listener
```

NewListener creates a Listener which accepts connections from an inner Listener and wraps each connection with Server. The configuration config must be non-nil and must include at least one certificate or else set GetCertificate. 

### <a id="Listen" href="#Listen">func Listen(network, laddr string, config *Config) (net.Listener, error)</a>

```
searchKey: tls.Listen
tags: [exported]
```

```Go
func Listen(network, laddr string, config *Config) (net.Listener, error)
```

Listen creates a TLS listener accepting connections on the given network address using net.Listen. The configuration config must be non-nil and must include at least one certificate or else set GetCertificate. 

### <a id="parsePrivateKey" href="#parsePrivateKey">func parsePrivateKey(der []byte) (crypto.PrivateKey, error)</a>

```
searchKey: tls.parsePrivateKey
```

```Go
func parsePrivateKey(der []byte) (crypto.PrivateKey, error)
```

Attempt to parse the given private key DER block. OpenSSL 0.9.8 generates PKCS #1 private keys by default, while OpenSSL 1.0.0 generates PKCS #8 keys. OpenSSL ecparam generates SEC1 EC private keys for ECDSA. We try all three. 

### <a id="TestSignatureSelection" href="#TestSignatureSelection">func TestSignatureSelection(t *testing.T)</a>

```
searchKey: tls.TestSignatureSelection
```

```Go
func TestSignatureSelection(t *testing.T)
```

### <a id="TestLegacyTypeAndHash" href="#TestLegacyTypeAndHash">func TestLegacyTypeAndHash(t *testing.T)</a>

```
searchKey: tls.TestLegacyTypeAndHash
```

```Go
func TestLegacyTypeAndHash(t *testing.T)
```

### <a id="TestSupportedSignatureAlgorithms" href="#TestSupportedSignatureAlgorithms">func TestSupportedSignatureAlgorithms(t *testing.T)</a>

```
searchKey: tls.TestSupportedSignatureAlgorithms
```

```Go
func TestSupportedSignatureAlgorithms(t *testing.T)
```

TestSupportedSignatureAlgorithms checks that all supportedSignatureAlgorithms have valid type and hash information. 

### <a id="TestRoundUp" href="#TestRoundUp">func TestRoundUp(t *testing.T)</a>

```
searchKey: tls.TestRoundUp
```

```Go
func TestRoundUp(t *testing.T)
```

### <a id="TestRemovePadding" href="#TestRemovePadding">func TestRemovePadding(t *testing.T)</a>

```
searchKey: tls.TestRemovePadding
```

```Go
func TestRemovePadding(t *testing.T)
```

### <a id="TestCertificateSelection" href="#TestCertificateSelection">func TestCertificateSelection(t *testing.T)</a>

```
searchKey: tls.TestCertificateSelection
```

```Go
func TestCertificateSelection(t *testing.T)
```

### <a id="runDynamicRecordSizingTest" href="#runDynamicRecordSizingTest">func runDynamicRecordSizingTest(t *testing.T, config *Config)</a>

```
searchKey: tls.runDynamicRecordSizingTest
```

```Go
func runDynamicRecordSizingTest(t *testing.T, config *Config)
```

Run with multiple crypto configs to test the logic for computing TLS record overheads. 

### <a id="TestDynamicRecordSizingWithStreamCipher" href="#TestDynamicRecordSizingWithStreamCipher">func TestDynamicRecordSizingWithStreamCipher(t *testing.T)</a>

```
searchKey: tls.TestDynamicRecordSizingWithStreamCipher
```

```Go
func TestDynamicRecordSizingWithStreamCipher(t *testing.T)
```

### <a id="TestDynamicRecordSizingWithCBC" href="#TestDynamicRecordSizingWithCBC">func TestDynamicRecordSizingWithCBC(t *testing.T)</a>

```
searchKey: tls.TestDynamicRecordSizingWithCBC
```

```Go
func TestDynamicRecordSizingWithCBC(t *testing.T)
```

### <a id="TestDynamicRecordSizingWithAEAD" href="#TestDynamicRecordSizingWithAEAD">func TestDynamicRecordSizingWithAEAD(t *testing.T)</a>

```
searchKey: tls.TestDynamicRecordSizingWithAEAD
```

```Go
func TestDynamicRecordSizingWithAEAD(t *testing.T)
```

### <a id="TestDynamicRecordSizingWithTLSv13" href="#TestDynamicRecordSizingWithTLSv13">func TestDynamicRecordSizingWithTLSv13(t *testing.T)</a>

```
searchKey: tls.TestDynamicRecordSizingWithTLSv13
```

```Go
func TestDynamicRecordSizingWithTLSv13(t *testing.T)
```

### <a id="TestHairpinInClose" href="#TestHairpinInClose">func TestHairpinInClose(t *testing.T)</a>

```
searchKey: tls.TestHairpinInClose
```

```Go
func TestHairpinInClose(t *testing.T)
```

### <a id="peekError" href="#peekError">func peekError(conn net.Conn) error</a>

```
searchKey: tls.peekError
```

```Go
func peekError(conn net.Conn) error
```

peekError does a read with a short timeout to check if the next read would cause an error, for example if there is an alert waiting on the wire. 

### <a id="runClientTestForVersion" href="#runClientTestForVersion">func runClientTestForVersion(t *testing.T, template *clientTest, version, option string)</a>

```
searchKey: tls.runClientTestForVersion
```

```Go
func runClientTestForVersion(t *testing.T, template *clientTest, version, option string)
```

### <a id="runClientTestTLS10" href="#runClientTestTLS10">func runClientTestTLS10(t *testing.T, template *clientTest)</a>

```
searchKey: tls.runClientTestTLS10
```

```Go
func runClientTestTLS10(t *testing.T, template *clientTest)
```

### <a id="runClientTestTLS11" href="#runClientTestTLS11">func runClientTestTLS11(t *testing.T, template *clientTest)</a>

```
searchKey: tls.runClientTestTLS11
```

```Go
func runClientTestTLS11(t *testing.T, template *clientTest)
```

### <a id="runClientTestTLS12" href="#runClientTestTLS12">func runClientTestTLS12(t *testing.T, template *clientTest)</a>

```
searchKey: tls.runClientTestTLS12
```

```Go
func runClientTestTLS12(t *testing.T, template *clientTest)
```

### <a id="runClientTestTLS13" href="#runClientTestTLS13">func runClientTestTLS13(t *testing.T, template *clientTest)</a>

```
searchKey: tls.runClientTestTLS13
```

```Go
func runClientTestTLS13(t *testing.T, template *clientTest)
```

### <a id="TestHandshakeClientRSARC4" href="#TestHandshakeClientRSARC4">func TestHandshakeClientRSARC4(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientRSARC4
```

```Go
func TestHandshakeClientRSARC4(t *testing.T)
```

### <a id="TestHandshakeClientRSAAES128GCM" href="#TestHandshakeClientRSAAES128GCM">func TestHandshakeClientRSAAES128GCM(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientRSAAES128GCM
```

```Go
func TestHandshakeClientRSAAES128GCM(t *testing.T)
```

### <a id="TestHandshakeClientRSAAES256GCM" href="#TestHandshakeClientRSAAES256GCM">func TestHandshakeClientRSAAES256GCM(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientRSAAES256GCM
```

```Go
func TestHandshakeClientRSAAES256GCM(t *testing.T)
```

### <a id="TestHandshakeClientECDHERSAAES" href="#TestHandshakeClientECDHERSAAES">func TestHandshakeClientECDHERSAAES(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHERSAAES
```

```Go
func TestHandshakeClientECDHERSAAES(t *testing.T)
```

### <a id="TestHandshakeClientECDHEECDSAAES" href="#TestHandshakeClientECDHEECDSAAES">func TestHandshakeClientECDHEECDSAAES(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHEECDSAAES
```

```Go
func TestHandshakeClientECDHEECDSAAES(t *testing.T)
```

### <a id="TestHandshakeClientECDHEECDSAAESGCM" href="#TestHandshakeClientECDHEECDSAAESGCM">func TestHandshakeClientECDHEECDSAAESGCM(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHEECDSAAESGCM
```

```Go
func TestHandshakeClientECDHEECDSAAESGCM(t *testing.T)
```

### <a id="TestHandshakeClientAES256GCMSHA384" href="#TestHandshakeClientAES256GCMSHA384">func TestHandshakeClientAES256GCMSHA384(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientAES256GCMSHA384
```

```Go
func TestHandshakeClientAES256GCMSHA384(t *testing.T)
```

### <a id="TestHandshakeClientAES128CBCSHA256" href="#TestHandshakeClientAES128CBCSHA256">func TestHandshakeClientAES128CBCSHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientAES128CBCSHA256
```

```Go
func TestHandshakeClientAES128CBCSHA256(t *testing.T)
```

### <a id="TestHandshakeClientECDHERSAAES128CBCSHA256" href="#TestHandshakeClientECDHERSAAES128CBCSHA256">func TestHandshakeClientECDHERSAAES128CBCSHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHERSAAES128CBCSHA256
```

```Go
func TestHandshakeClientECDHERSAAES128CBCSHA256(t *testing.T)
```

### <a id="TestHandshakeClientECDHEECDSAAES128CBCSHA256" href="#TestHandshakeClientECDHEECDSAAES128CBCSHA256">func TestHandshakeClientECDHEECDSAAES128CBCSHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHEECDSAAES128CBCSHA256
```

```Go
func TestHandshakeClientECDHEECDSAAES128CBCSHA256(t *testing.T)
```

### <a id="TestHandshakeClientX25519" href="#TestHandshakeClientX25519">func TestHandshakeClientX25519(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientX25519
```

```Go
func TestHandshakeClientX25519(t *testing.T)
```

### <a id="TestHandshakeClientP256" href="#TestHandshakeClientP256">func TestHandshakeClientP256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientP256
```

```Go
func TestHandshakeClientP256(t *testing.T)
```

### <a id="TestHandshakeClientHelloRetryRequest" href="#TestHandshakeClientHelloRetryRequest">func TestHandshakeClientHelloRetryRequest(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientHelloRetryRequest
```

```Go
func TestHandshakeClientHelloRetryRequest(t *testing.T)
```

### <a id="TestHandshakeClientECDHERSAChaCha20" href="#TestHandshakeClientECDHERSAChaCha20">func TestHandshakeClientECDHERSAChaCha20(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHERSAChaCha20
```

```Go
func TestHandshakeClientECDHERSAChaCha20(t *testing.T)
```

### <a id="TestHandshakeClientECDHEECDSAChaCha20" href="#TestHandshakeClientECDHEECDSAChaCha20">func TestHandshakeClientECDHEECDSAChaCha20(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDHEECDSAChaCha20
```

```Go
func TestHandshakeClientECDHEECDSAChaCha20(t *testing.T)
```

### <a id="TestHandshakeClientAES128SHA256" href="#TestHandshakeClientAES128SHA256">func TestHandshakeClientAES128SHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientAES128SHA256
```

```Go
func TestHandshakeClientAES128SHA256(t *testing.T)
```

### <a id="TestHandshakeClientAES256SHA384" href="#TestHandshakeClientAES256SHA384">func TestHandshakeClientAES256SHA384(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientAES256SHA384
```

```Go
func TestHandshakeClientAES256SHA384(t *testing.T)
```

### <a id="TestHandshakeClientCHACHA20SHA256" href="#TestHandshakeClientCHACHA20SHA256">func TestHandshakeClientCHACHA20SHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientCHACHA20SHA256
```

```Go
func TestHandshakeClientCHACHA20SHA256(t *testing.T)
```

### <a id="TestHandshakeClientECDSATLS13" href="#TestHandshakeClientECDSATLS13">func TestHandshakeClientECDSATLS13(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientECDSATLS13
```

```Go
func TestHandshakeClientECDSATLS13(t *testing.T)
```

### <a id="TestHandshakeClientEd25519" href="#TestHandshakeClientEd25519">func TestHandshakeClientEd25519(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientEd25519
```

```Go
func TestHandshakeClientEd25519(t *testing.T)
```

### <a id="TestHandshakeClientCertRSA" href="#TestHandshakeClientCertRSA">func TestHandshakeClientCertRSA(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientCertRSA
```

```Go
func TestHandshakeClientCertRSA(t *testing.T)
```

### <a id="TestHandshakeClientCertECDSA" href="#TestHandshakeClientCertECDSA">func TestHandshakeClientCertECDSA(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientCertECDSA
```

```Go
func TestHandshakeClientCertECDSA(t *testing.T)
```

### <a id="TestHandshakeClientCertRSAPSS" href="#TestHandshakeClientCertRSAPSS">func TestHandshakeClientCertRSAPSS(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientCertRSAPSS
```

```Go
func TestHandshakeClientCertRSAPSS(t *testing.T)
```

TestHandshakeClientCertRSAPSS tests rsa_pss_rsae_sha256 signatures from both client and server certificates. It also serves from both sides a certificate signed itself with RSA-PSS, mostly to check that crypto/x509 chain validation works. 

### <a id="TestHandshakeClientCertRSAPKCS1v15" href="#TestHandshakeClientCertRSAPKCS1v15">func TestHandshakeClientCertRSAPKCS1v15(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientCertRSAPKCS1v15
```

```Go
func TestHandshakeClientCertRSAPKCS1v15(t *testing.T)
```

### <a id="TestClientKeyUpdate" href="#TestClientKeyUpdate">func TestClientKeyUpdate(t *testing.T)</a>

```
searchKey: tls.TestClientKeyUpdate
```

```Go
func TestClientKeyUpdate(t *testing.T)
```

### <a id="TestResumption" href="#TestResumption">func TestResumption(t *testing.T)</a>

```
searchKey: tls.TestResumption
```

```Go
func TestResumption(t *testing.T)
```

### <a id="testResumption" href="#testResumption">func testResumption(t *testing.T, version uint16)</a>

```
searchKey: tls.testResumption
```

```Go
func testResumption(t *testing.T, version uint16)
```

### <a id="TestLRUClientSessionCache" href="#TestLRUClientSessionCache">func TestLRUClientSessionCache(t *testing.T)</a>

```
searchKey: tls.TestLRUClientSessionCache
```

```Go
func TestLRUClientSessionCache(t *testing.T)
```

### <a id="TestKeyLogTLS12" href="#TestKeyLogTLS12">func TestKeyLogTLS12(t *testing.T)</a>

```
searchKey: tls.TestKeyLogTLS12
```

```Go
func TestKeyLogTLS12(t *testing.T)
```

### <a id="TestKeyLogTLS13" href="#TestKeyLogTLS13">func TestKeyLogTLS13(t *testing.T)</a>

```
searchKey: tls.TestKeyLogTLS13
```

```Go
func TestKeyLogTLS13(t *testing.T)
```

### <a id="TestHandshakeClientALPNMatch" href="#TestHandshakeClientALPNMatch">func TestHandshakeClientALPNMatch(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientALPNMatch
```

```Go
func TestHandshakeClientALPNMatch(t *testing.T)
```

### <a id="TestServerSelectingUnconfiguredApplicationProtocol" href="#TestServerSelectingUnconfiguredApplicationProtocol">func TestServerSelectingUnconfiguredApplicationProtocol(t *testing.T)</a>

```
searchKey: tls.TestServerSelectingUnconfiguredApplicationProtocol
```

```Go
func TestServerSelectingUnconfiguredApplicationProtocol(t *testing.T)
```

### <a id="TestHandshakClientSCTs" href="#TestHandshakClientSCTs">func TestHandshakClientSCTs(t *testing.T)</a>

```
searchKey: tls.TestHandshakClientSCTs
```

```Go
func TestHandshakClientSCTs(t *testing.T)
```

### <a id="TestRenegotiationRejected" href="#TestRenegotiationRejected">func TestRenegotiationRejected(t *testing.T)</a>

```
searchKey: tls.TestRenegotiationRejected
```

```Go
func TestRenegotiationRejected(t *testing.T)
```

### <a id="TestRenegotiateOnce" href="#TestRenegotiateOnce">func TestRenegotiateOnce(t *testing.T)</a>

```
searchKey: tls.TestRenegotiateOnce
```

```Go
func TestRenegotiateOnce(t *testing.T)
```

### <a id="TestRenegotiateTwice" href="#TestRenegotiateTwice">func TestRenegotiateTwice(t *testing.T)</a>

```
searchKey: tls.TestRenegotiateTwice
```

```Go
func TestRenegotiateTwice(t *testing.T)
```

### <a id="TestRenegotiateTwiceRejected" href="#TestRenegotiateTwiceRejected">func TestRenegotiateTwiceRejected(t *testing.T)</a>

```
searchKey: tls.TestRenegotiateTwiceRejected
```

```Go
func TestRenegotiateTwiceRejected(t *testing.T)
```

### <a id="TestHandshakeClientExportKeyingMaterial" href="#TestHandshakeClientExportKeyingMaterial">func TestHandshakeClientExportKeyingMaterial(t *testing.T)</a>

```
searchKey: tls.TestHandshakeClientExportKeyingMaterial
```

```Go
func TestHandshakeClientExportKeyingMaterial(t *testing.T)
```

### <a id="TestHostnameInSNI" href="#TestHostnameInSNI">func TestHostnameInSNI(t *testing.T)</a>

```
searchKey: tls.TestHostnameInSNI
```

```Go
func TestHostnameInSNI(t *testing.T)
```

### <a id="TestServerSelectingUnconfiguredCipherSuite" href="#TestServerSelectingUnconfiguredCipherSuite">func TestServerSelectingUnconfiguredCipherSuite(t *testing.T)</a>

```
searchKey: tls.TestServerSelectingUnconfiguredCipherSuite
```

```Go
func TestServerSelectingUnconfiguredCipherSuite(t *testing.T)
```

### <a id="TestVerifyConnection" href="#TestVerifyConnection">func TestVerifyConnection(t *testing.T)</a>

```
searchKey: tls.TestVerifyConnection
```

```Go
func TestVerifyConnection(t *testing.T)
```

### <a id="testVerifyConnection" href="#testVerifyConnection">func testVerifyConnection(t *testing.T, version uint16)</a>

```
searchKey: tls.testVerifyConnection
```

```Go
func testVerifyConnection(t *testing.T, version uint16)
```

### <a id="TestVerifyPeerCertificate" href="#TestVerifyPeerCertificate">func TestVerifyPeerCertificate(t *testing.T)</a>

```
searchKey: tls.TestVerifyPeerCertificate
```

```Go
func TestVerifyPeerCertificate(t *testing.T)
```

### <a id="testVerifyPeerCertificate" href="#testVerifyPeerCertificate">func testVerifyPeerCertificate(t *testing.T, version uint16)</a>

```
searchKey: tls.testVerifyPeerCertificate
```

```Go
func testVerifyPeerCertificate(t *testing.T, version uint16)
```

### <a id="TestFailedWrite" href="#TestFailedWrite">func TestFailedWrite(t *testing.T)</a>

```
searchKey: tls.TestFailedWrite
```

```Go
func TestFailedWrite(t *testing.T)
```

### <a id="TestBuffering" href="#TestBuffering">func TestBuffering(t *testing.T)</a>

```
searchKey: tls.TestBuffering
```

```Go
func TestBuffering(t *testing.T)
```

### <a id="testBuffering" href="#testBuffering">func testBuffering(t *testing.T, version uint16)</a>

```
searchKey: tls.testBuffering
```

```Go
func testBuffering(t *testing.T, version uint16)
```

### <a id="TestAlertFlushing" href="#TestAlertFlushing">func TestAlertFlushing(t *testing.T)</a>

```
searchKey: tls.TestAlertFlushing
```

```Go
func TestAlertFlushing(t *testing.T)
```

### <a id="TestHandshakeRace" href="#TestHandshakeRace">func TestHandshakeRace(t *testing.T)</a>

```
searchKey: tls.TestHandshakeRace
```

```Go
func TestHandshakeRace(t *testing.T)
```

### <a id="TestGetClientCertificate" href="#TestGetClientCertificate">func TestGetClientCertificate(t *testing.T)</a>

```
searchKey: tls.TestGetClientCertificate
```

```Go
func TestGetClientCertificate(t *testing.T)
```

### <a id="testGetClientCertificate" href="#testGetClientCertificate">func testGetClientCertificate(t *testing.T, version uint16)</a>

```
searchKey: tls.testGetClientCertificate
```

```Go
func testGetClientCertificate(t *testing.T, version uint16)
```

### <a id="TestRSAPSSKeyError" href="#TestRSAPSSKeyError">func TestRSAPSSKeyError(t *testing.T)</a>

```
searchKey: tls.TestRSAPSSKeyError
```

```Go
func TestRSAPSSKeyError(t *testing.T)
```

### <a id="TestCloseClientConnectionOnIdleServer" href="#TestCloseClientConnectionOnIdleServer">func TestCloseClientConnectionOnIdleServer(t *testing.T)</a>

```
searchKey: tls.TestCloseClientConnectionOnIdleServer
```

```Go
func TestCloseClientConnectionOnIdleServer(t *testing.T)
```

### <a id="testDowngradeCanary" href="#testDowngradeCanary">func testDowngradeCanary(t *testing.T, clientVersion, serverVersion uint16) error</a>

```
searchKey: tls.testDowngradeCanary
```

```Go
func testDowngradeCanary(t *testing.T, clientVersion, serverVersion uint16) error
```

### <a id="TestDowngradeCanary" href="#TestDowngradeCanary">func TestDowngradeCanary(t *testing.T)</a>

```
searchKey: tls.TestDowngradeCanary
```

```Go
func TestDowngradeCanary(t *testing.T)
```

### <a id="TestResumptionKeepsOCSPAndSCT" href="#TestResumptionKeepsOCSPAndSCT">func TestResumptionKeepsOCSPAndSCT(t *testing.T)</a>

```
searchKey: tls.TestResumptionKeepsOCSPAndSCT
```

```Go
func TestResumptionKeepsOCSPAndSCT(t *testing.T)
```

### <a id="testResumptionKeepsOCSPAndSCT" href="#testResumptionKeepsOCSPAndSCT">func testResumptionKeepsOCSPAndSCT(t *testing.T, ver uint16)</a>

```
searchKey: tls.testResumptionKeepsOCSPAndSCT
```

```Go
func testResumptionKeepsOCSPAndSCT(t *testing.T, ver uint16)
```

### <a id="TestClientHandshakeContextCancellation" href="#TestClientHandshakeContextCancellation">func TestClientHandshakeContextCancellation(t *testing.T)</a>

```
searchKey: tls.TestClientHandshakeContextCancellation
```

```Go
func TestClientHandshakeContextCancellation(t *testing.T)
```

TestClientHandshakeContextCancellation tests that cancelling the context given to the client side conn.HandshakeContext interrupts the in-progress handshake. 

### <a id="TestMarshalUnmarshal" href="#TestMarshalUnmarshal">func TestMarshalUnmarshal(t *testing.T)</a>

```
searchKey: tls.TestMarshalUnmarshal
```

```Go
func TestMarshalUnmarshal(t *testing.T)
```

### <a id="TestFuzz" href="#TestFuzz">func TestFuzz(t *testing.T)</a>

```
searchKey: tls.TestFuzz
```

```Go
func TestFuzz(t *testing.T)
```

### <a id="randomBytes" href="#randomBytes">func randomBytes(n int, rand *rand.Rand) []byte</a>

```
searchKey: tls.randomBytes
```

```Go
func randomBytes(n int, rand *rand.Rand) []byte
```

### <a id="randomString" href="#randomString">func randomString(n int, rand *rand.Rand) string</a>

```
searchKey: tls.randomString
```

```Go
func randomString(n int, rand *rand.Rand) string
```

### <a id="TestRejectEmptySCTList" href="#TestRejectEmptySCTList">func TestRejectEmptySCTList(t *testing.T)</a>

```
searchKey: tls.TestRejectEmptySCTList
```

```Go
func TestRejectEmptySCTList(t *testing.T)
```

### <a id="TestRejectEmptySCT" href="#TestRejectEmptySCT">func TestRejectEmptySCT(t *testing.T)</a>

```
searchKey: tls.TestRejectEmptySCT
```

```Go
func TestRejectEmptySCT(t *testing.T)
```

### <a id="testClientHello" href="#testClientHello">func testClientHello(t *testing.T, serverConfig *Config, m handshakeMessage)</a>

```
searchKey: tls.testClientHello
```

```Go
func testClientHello(t *testing.T, serverConfig *Config, m handshakeMessage)
```

### <a id="testClientHelloFailure" href="#testClientHelloFailure">func testClientHelloFailure(t *testing.T, serverConfig *Config, m handshakeMessage, expectedSubStr string)</a>

```
searchKey: tls.testClientHelloFailure
```

```Go
func testClientHelloFailure(t *testing.T, serverConfig *Config, m handshakeMessage, expectedSubStr string)
```

### <a id="TestSimpleError" href="#TestSimpleError">func TestSimpleError(t *testing.T)</a>

```
searchKey: tls.TestSimpleError
```

```Go
func TestSimpleError(t *testing.T)
```

### <a id="TestRejectBadProtocolVersion" href="#TestRejectBadProtocolVersion">func TestRejectBadProtocolVersion(t *testing.T)</a>

```
searchKey: tls.TestRejectBadProtocolVersion
```

```Go
func TestRejectBadProtocolVersion(t *testing.T)
```

### <a id="TestNoSuiteOverlap" href="#TestNoSuiteOverlap">func TestNoSuiteOverlap(t *testing.T)</a>

```
searchKey: tls.TestNoSuiteOverlap
```

```Go
func TestNoSuiteOverlap(t *testing.T)
```

### <a id="TestNoCompressionOverlap" href="#TestNoCompressionOverlap">func TestNoCompressionOverlap(t *testing.T)</a>

```
searchKey: tls.TestNoCompressionOverlap
```

```Go
func TestNoCompressionOverlap(t *testing.T)
```

### <a id="TestNoRC4ByDefault" href="#TestNoRC4ByDefault">func TestNoRC4ByDefault(t *testing.T)</a>

```
searchKey: tls.TestNoRC4ByDefault
```

```Go
func TestNoRC4ByDefault(t *testing.T)
```

### <a id="TestRejectSNIWithTrailingDot" href="#TestRejectSNIWithTrailingDot">func TestRejectSNIWithTrailingDot(t *testing.T)</a>

```
searchKey: tls.TestRejectSNIWithTrailingDot
```

```Go
func TestRejectSNIWithTrailingDot(t *testing.T)
```

### <a id="TestDontSelectECDSAWithRSAKey" href="#TestDontSelectECDSAWithRSAKey">func TestDontSelectECDSAWithRSAKey(t *testing.T)</a>

```
searchKey: tls.TestDontSelectECDSAWithRSAKey
```

```Go
func TestDontSelectECDSAWithRSAKey(t *testing.T)
```

### <a id="TestDontSelectRSAWithECDSAKey" href="#TestDontSelectRSAWithECDSAKey">func TestDontSelectRSAWithECDSAKey(t *testing.T)</a>

```
searchKey: tls.TestDontSelectRSAWithECDSAKey
```

```Go
func TestDontSelectRSAWithECDSAKey(t *testing.T)
```

### <a id="TestRenegotiationExtension" href="#TestRenegotiationExtension">func TestRenegotiationExtension(t *testing.T)</a>

```
searchKey: tls.TestRenegotiationExtension
```

```Go
func TestRenegotiationExtension(t *testing.T)
```

### <a id="TestTLS12OnlyCipherSuites" href="#TestTLS12OnlyCipherSuites">func TestTLS12OnlyCipherSuites(t *testing.T)</a>

```
searchKey: tls.TestTLS12OnlyCipherSuites
```

```Go
func TestTLS12OnlyCipherSuites(t *testing.T)
```

### <a id="TestTLSPointFormats" href="#TestTLSPointFormats">func TestTLSPointFormats(t *testing.T)</a>

```
searchKey: tls.TestTLSPointFormats
```

```Go
func TestTLSPointFormats(t *testing.T)
```

### <a id="TestAlertForwarding" href="#TestAlertForwarding">func TestAlertForwarding(t *testing.T)</a>

```
searchKey: tls.TestAlertForwarding
```

```Go
func TestAlertForwarding(t *testing.T)
```

### <a id="TestClose" href="#TestClose">func TestClose(t *testing.T)</a>

```
searchKey: tls.TestClose
```

```Go
func TestClose(t *testing.T)
```

### <a id="TestVersion" href="#TestVersion">func TestVersion(t *testing.T)</a>

```
searchKey: tls.TestVersion
```

```Go
func TestVersion(t *testing.T)
```

### <a id="TestCipherSuitePreference" href="#TestCipherSuitePreference">func TestCipherSuitePreference(t *testing.T)</a>

```
searchKey: tls.TestCipherSuitePreference
```

```Go
func TestCipherSuitePreference(t *testing.T)
```

### <a id="TestSCTHandshake" href="#TestSCTHandshake">func TestSCTHandshake(t *testing.T)</a>

```
searchKey: tls.TestSCTHandshake
```

```Go
func TestSCTHandshake(t *testing.T)
```

### <a id="testSCTHandshake" href="#testSCTHandshake">func testSCTHandshake(t *testing.T, version uint16)</a>

```
searchKey: tls.testSCTHandshake
```

```Go
func testSCTHandshake(t *testing.T, version uint16)
```

### <a id="TestCrossVersionResume" href="#TestCrossVersionResume">func TestCrossVersionResume(t *testing.T)</a>

```
searchKey: tls.TestCrossVersionResume
```

```Go
func TestCrossVersionResume(t *testing.T)
```

### <a id="testCrossVersionResume" href="#testCrossVersionResume">func testCrossVersionResume(t *testing.T, version uint16)</a>

```
searchKey: tls.testCrossVersionResume
```

```Go
func testCrossVersionResume(t *testing.T, version uint16)
```

### <a id="runServerTestForVersion" href="#runServerTestForVersion">func runServerTestForVersion(t *testing.T, template *serverTest, version, option string)</a>

```
searchKey: tls.runServerTestForVersion
```

```Go
func runServerTestForVersion(t *testing.T, template *serverTest, version, option string)
```

### <a id="runServerTestTLS10" href="#runServerTestTLS10">func runServerTestTLS10(t *testing.T, template *serverTest)</a>

```
searchKey: tls.runServerTestTLS10
```

```Go
func runServerTestTLS10(t *testing.T, template *serverTest)
```

### <a id="runServerTestTLS11" href="#runServerTestTLS11">func runServerTestTLS11(t *testing.T, template *serverTest)</a>

```
searchKey: tls.runServerTestTLS11
```

```Go
func runServerTestTLS11(t *testing.T, template *serverTest)
```

### <a id="runServerTestTLS12" href="#runServerTestTLS12">func runServerTestTLS12(t *testing.T, template *serverTest)</a>

```
searchKey: tls.runServerTestTLS12
```

```Go
func runServerTestTLS12(t *testing.T, template *serverTest)
```

### <a id="runServerTestTLS13" href="#runServerTestTLS13">func runServerTestTLS13(t *testing.T, template *serverTest)</a>

```
searchKey: tls.runServerTestTLS13
```

```Go
func runServerTestTLS13(t *testing.T, template *serverTest)
```

### <a id="TestHandshakeServerRSARC4" href="#TestHandshakeServerRSARC4">func TestHandshakeServerRSARC4(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerRSARC4
```

```Go
func TestHandshakeServerRSARC4(t *testing.T)
```

### <a id="TestHandshakeServerRSA3DES" href="#TestHandshakeServerRSA3DES">func TestHandshakeServerRSA3DES(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerRSA3DES
```

```Go
func TestHandshakeServerRSA3DES(t *testing.T)
```

### <a id="TestHandshakeServerRSAAES" href="#TestHandshakeServerRSAAES">func TestHandshakeServerRSAAES(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerRSAAES
```

```Go
func TestHandshakeServerRSAAES(t *testing.T)
```

### <a id="TestHandshakeServerAESGCM" href="#TestHandshakeServerAESGCM">func TestHandshakeServerAESGCM(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerAESGCM
```

```Go
func TestHandshakeServerAESGCM(t *testing.T)
```

### <a id="TestHandshakeServerAES256GCMSHA384" href="#TestHandshakeServerAES256GCMSHA384">func TestHandshakeServerAES256GCMSHA384(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerAES256GCMSHA384
```

```Go
func TestHandshakeServerAES256GCMSHA384(t *testing.T)
```

### <a id="TestHandshakeServerAES128SHA256" href="#TestHandshakeServerAES128SHA256">func TestHandshakeServerAES128SHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerAES128SHA256
```

```Go
func TestHandshakeServerAES128SHA256(t *testing.T)
```

### <a id="TestHandshakeServerAES256SHA384" href="#TestHandshakeServerAES256SHA384">func TestHandshakeServerAES256SHA384(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerAES256SHA384
```

```Go
func TestHandshakeServerAES256SHA384(t *testing.T)
```

### <a id="TestHandshakeServerCHACHA20SHA256" href="#TestHandshakeServerCHACHA20SHA256">func TestHandshakeServerCHACHA20SHA256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerCHACHA20SHA256
```

```Go
func TestHandshakeServerCHACHA20SHA256(t *testing.T)
```

### <a id="TestHandshakeServerECDHEECDSAAES" href="#TestHandshakeServerECDHEECDSAAES">func TestHandshakeServerECDHEECDSAAES(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerECDHEECDSAAES
```

```Go
func TestHandshakeServerECDHEECDSAAES(t *testing.T)
```

### <a id="TestHandshakeServerX25519" href="#TestHandshakeServerX25519">func TestHandshakeServerX25519(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerX25519
```

```Go
func TestHandshakeServerX25519(t *testing.T)
```

### <a id="TestHandshakeServerP256" href="#TestHandshakeServerP256">func TestHandshakeServerP256(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerP256
```

```Go
func TestHandshakeServerP256(t *testing.T)
```

### <a id="TestHandshakeServerHelloRetryRequest" href="#TestHandshakeServerHelloRetryRequest">func TestHandshakeServerHelloRetryRequest(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerHelloRetryRequest
```

```Go
func TestHandshakeServerHelloRetryRequest(t *testing.T)
```

### <a id="TestHandshakeServerALPN" href="#TestHandshakeServerALPN">func TestHandshakeServerALPN(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerALPN
```

```Go
func TestHandshakeServerALPN(t *testing.T)
```

### <a id="TestHandshakeServerALPNNoMatch" href="#TestHandshakeServerALPNNoMatch">func TestHandshakeServerALPNNoMatch(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerALPNNoMatch
```

```Go
func TestHandshakeServerALPNNoMatch(t *testing.T)
```

### <a id="TestHandshakeServerALPNNotConfigured" href="#TestHandshakeServerALPNNotConfigured">func TestHandshakeServerALPNNotConfigured(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerALPNNotConfigured
```

```Go
func TestHandshakeServerALPNNotConfigured(t *testing.T)
```

### <a id="TestHandshakeServerALPNFallback" href="#TestHandshakeServerALPNFallback">func TestHandshakeServerALPNFallback(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerALPNFallback
```

```Go
func TestHandshakeServerALPNFallback(t *testing.T)
```

### <a id="TestHandshakeServerSNI" href="#TestHandshakeServerSNI">func TestHandshakeServerSNI(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerSNI
```

```Go
func TestHandshakeServerSNI(t *testing.T)
```

TestHandshakeServerSNI involves a client sending an SNI extension of "snitest.com", which happens to match the CN of testSNICertificate. The test verifies that the server correctly selects that certificate. 

### <a id="TestHandshakeServerSNIGetCertificate" href="#TestHandshakeServerSNIGetCertificate">func TestHandshakeServerSNIGetCertificate(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerSNIGetCertificate
```

```Go
func TestHandshakeServerSNIGetCertificate(t *testing.T)
```

TestHandshakeServerSNICertForName is similar to TestHandshakeServerSNI, but tests the dynamic GetCertificate method 

### <a id="TestHandshakeServerSNIGetCertificateNotFound" href="#TestHandshakeServerSNIGetCertificateNotFound">func TestHandshakeServerSNIGetCertificateNotFound(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerSNIGetCertificateNotFound
```

```Go
func TestHandshakeServerSNIGetCertificateNotFound(t *testing.T)
```

TestHandshakeServerSNICertForNameNotFound is similar to TestHandshakeServerSNICertForName, but tests to make sure that when the GetCertificate method doesn't return a cert, we fall back to what's in the NameToCertificate map. 

### <a id="TestHandshakeServerSNIGetCertificateError" href="#TestHandshakeServerSNIGetCertificateError">func TestHandshakeServerSNIGetCertificateError(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerSNIGetCertificateError
```

```Go
func TestHandshakeServerSNIGetCertificateError(t *testing.T)
```

TestHandshakeServerSNICertForNameError tests to make sure that errors in GetCertificate result in a tls alert. 

### <a id="TestHandshakeServerEmptyCertificates" href="#TestHandshakeServerEmptyCertificates">func TestHandshakeServerEmptyCertificates(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerEmptyCertificates
```

```Go
func TestHandshakeServerEmptyCertificates(t *testing.T)
```

TestHandshakeServerEmptyCertificates tests that GetCertificates is called in the case that Certificates is empty, even without SNI. 

### <a id="TestServerResumption" href="#TestServerResumption">func TestServerResumption(t *testing.T)</a>

```
searchKey: tls.TestServerResumption
```

```Go
func TestServerResumption(t *testing.T)
```

### <a id="TestServerResumptionDisabled" href="#TestServerResumptionDisabled">func TestServerResumptionDisabled(t *testing.T)</a>

```
searchKey: tls.TestServerResumptionDisabled
```

```Go
func TestServerResumptionDisabled(t *testing.T)
```

### <a id="TestFallbackSCSV" href="#TestFallbackSCSV">func TestFallbackSCSV(t *testing.T)</a>

```
searchKey: tls.TestFallbackSCSV
```

```Go
func TestFallbackSCSV(t *testing.T)
```

### <a id="TestHandshakeServerExportKeyingMaterial" href="#TestHandshakeServerExportKeyingMaterial">func TestHandshakeServerExportKeyingMaterial(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerExportKeyingMaterial
```

```Go
func TestHandshakeServerExportKeyingMaterial(t *testing.T)
```

### <a id="TestHandshakeServerRSAPKCS1v15" href="#TestHandshakeServerRSAPKCS1v15">func TestHandshakeServerRSAPKCS1v15(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerRSAPKCS1v15
```

```Go
func TestHandshakeServerRSAPKCS1v15(t *testing.T)
```

### <a id="TestHandshakeServerRSAPSS" href="#TestHandshakeServerRSAPSS">func TestHandshakeServerRSAPSS(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerRSAPSS
```

```Go
func TestHandshakeServerRSAPSS(t *testing.T)
```

### <a id="TestHandshakeServerEd25519" href="#TestHandshakeServerEd25519">func TestHandshakeServerEd25519(t *testing.T)</a>

```
searchKey: tls.TestHandshakeServerEd25519
```

```Go
func TestHandshakeServerEd25519(t *testing.T)
```

### <a id="benchmarkHandshakeServer" href="#benchmarkHandshakeServer">func benchmarkHandshakeServer(b *testing.B, version uint16, cipherSuite uint16, curve CurveID, cert []byte, key crypto.PrivateKey)</a>

```
searchKey: tls.benchmarkHandshakeServer
```

```Go
func benchmarkHandshakeServer(b *testing.B, version uint16, cipherSuite uint16, curve CurveID, cert []byte, key crypto.PrivateKey)
```

### <a id="BenchmarkHandshakeServer" href="#BenchmarkHandshakeServer">func BenchmarkHandshakeServer(b *testing.B)</a>

```
searchKey: tls.BenchmarkHandshakeServer
```

```Go
func BenchmarkHandshakeServer(b *testing.B)
```

### <a id="TestClientAuth" href="#TestClientAuth">func TestClientAuth(t *testing.T)</a>

```
searchKey: tls.TestClientAuth
```

```Go
func TestClientAuth(t *testing.T)
```

### <a id="TestSNIGivenOnFailure" href="#TestSNIGivenOnFailure">func TestSNIGivenOnFailure(t *testing.T)</a>

```
searchKey: tls.TestSNIGivenOnFailure
```

```Go
func TestSNIGivenOnFailure(t *testing.T)
```

### <a id="TestGetConfigForClient" href="#TestGetConfigForClient">func TestGetConfigForClient(t *testing.T)</a>

```
searchKey: tls.TestGetConfigForClient
```

```Go
func TestGetConfigForClient(t *testing.T)
```

### <a id="TestCloseServerConnectionOnIdleClient" href="#TestCloseServerConnectionOnIdleClient">func TestCloseServerConnectionOnIdleClient(t *testing.T)</a>

```
searchKey: tls.TestCloseServerConnectionOnIdleClient
```

```Go
func TestCloseServerConnectionOnIdleClient(t *testing.T)
```

### <a id="TestCloneHash" href="#TestCloneHash">func TestCloneHash(t *testing.T)</a>

```
searchKey: tls.TestCloneHash
```

```Go
func TestCloneHash(t *testing.T)
```

### <a id="expectError" href="#expectError">func expectError(t *testing.T, err error, sub string)</a>

```
searchKey: tls.expectError
```

```Go
func expectError(t *testing.T, err error, sub string)
```

### <a id="TestKeyTooSmallForRSAPSS" href="#TestKeyTooSmallForRSAPSS">func TestKeyTooSmallForRSAPSS(t *testing.T)</a>

```
searchKey: tls.TestKeyTooSmallForRSAPSS
```

```Go
func TestKeyTooSmallForRSAPSS(t *testing.T)
```

### <a id="TestMultipleCertificates" href="#TestMultipleCertificates">func TestMultipleCertificates(t *testing.T)</a>

```
searchKey: tls.TestMultipleCertificates
```

```Go
func TestMultipleCertificates(t *testing.T)
```

### <a id="TestAESCipherReordering" href="#TestAESCipherReordering">func TestAESCipherReordering(t *testing.T)</a>

```
searchKey: tls.TestAESCipherReordering
```

```Go
func TestAESCipherReordering(t *testing.T)
```

### <a id="TestAESCipherReorderingTLS13" href="#TestAESCipherReorderingTLS13">func TestAESCipherReorderingTLS13(t *testing.T)</a>

```
searchKey: tls.TestAESCipherReorderingTLS13
```

```Go
func TestAESCipherReorderingTLS13(t *testing.T)
```

### <a id="TestServerHandshakeContextCancellation" href="#TestServerHandshakeContextCancellation">func TestServerHandshakeContextCancellation(t *testing.T)</a>

```
searchKey: tls.TestServerHandshakeContextCancellation
```

```Go
func TestServerHandshakeContextCancellation(t *testing.T)
```

TestServerHandshakeContextCancellation tests that cancelling the context given to the server side conn.HandshakeContext interrupts the in-progress handshake. 

### <a id="TestHandshakeContextHierarchy" href="#TestHandshakeContextHierarchy">func TestHandshakeContextHierarchy(t *testing.T)</a>

```
searchKey: tls.TestHandshakeContextHierarchy
```

```Go
func TestHandshakeContextHierarchy(t *testing.T)
```

TestHandshakeContextHierarchy tests whether the contexts available to GetClientCertificate and GetCertificate are derived from the context provided to HandshakeContext, and that those contexts are canceled after HandshakeContext has returned. 

### <a id="runTestAndUpdateIfNeeded" href="#runTestAndUpdateIfNeeded">func runTestAndUpdateIfNeeded(t *testing.T, name string, run func(t *testing.T, update bool), wait bool)</a>

```
searchKey: tls.runTestAndUpdateIfNeeded
```

```Go
func runTestAndUpdateIfNeeded(t *testing.T, name string, run func(t *testing.T, update bool), wait bool)
```

### <a id="checkOpenSSLVersion" href="#checkOpenSSLVersion">func checkOpenSSLVersion() error</a>

```
searchKey: tls.checkOpenSSLVersion
```

```Go
func checkOpenSSLVersion() error
```

checkOpenSSLVersion ensures that the version of OpenSSL looks reasonable before updating the test data. 

### <a id="parseTestData" href="#parseTestData">func parseTestData(r io.Reader) (flows [][]byte, err error)</a>

```
searchKey: tls.parseTestData
```

```Go
func parseTestData(r io.Reader) (flows [][]byte, err error)
```

### <a id="tempFile" href="#tempFile">func tempFile(contents string) string</a>

```
searchKey: tls.tempFile
```

```Go
func tempFile(contents string) string
```

tempFile creates a temp file containing contents and returns its path. 

### <a id="localServer" href="#localServer">func localServer(l net.Listener)</a>

```
searchKey: tls.localServer
```

```Go
func localServer(l net.Listener)
```

### <a id="localPipe" href="#localPipe">func localPipe(t testing.TB) (net.Conn, net.Conn)</a>

```
searchKey: tls.localPipe
```

```Go
func localPipe(t testing.TB) (net.Conn, net.Conn)
```

### <a id="allCipherSuites" href="#allCipherSuites">func allCipherSuites() []uint16</a>

```
searchKey: tls.allCipherSuites
```

```Go
func allCipherSuites() []uint16
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: tls.TestMain
```

```Go
func TestMain(m *testing.M)
```

### <a id="runMain" href="#runMain">func runMain(m *testing.M) int</a>

```
searchKey: tls.runMain
```

```Go
func runMain(m *testing.M) int
```

### <a id="fromHex" href="#fromHex">func fromHex(s string) []byte</a>

```
searchKey: tls.fromHex
```

```Go
func fromHex(s string) []byte
```

### <a id="init" href="#init">func init()</a>

```
searchKey: tls.init
```

```Go
func init()
```

### <a id="parseVector" href="#parseVector">func parseVector(v string) []byte</a>

```
searchKey: tls.parseVector
```

```Go
func parseVector(v string) []byte
```

### <a id="TestDeriveSecret" href="#TestDeriveSecret">func TestDeriveSecret(t *testing.T)</a>

```
searchKey: tls.TestDeriveSecret
```

```Go
func TestDeriveSecret(t *testing.T)
```

### <a id="TestTrafficKey" href="#TestTrafficKey">func TestTrafficKey(t *testing.T)</a>

```
searchKey: tls.TestTrafficKey
```

```Go
func TestTrafficKey(t *testing.T)
```

### <a id="TestExtract" href="#TestExtract">func TestExtract(t *testing.T)</a>

```
searchKey: tls.TestExtract
```

```Go
func TestExtract(t *testing.T)
```

### <a id="TestLinkerGC" href="#TestLinkerGC">func TestLinkerGC(t *testing.T)</a>

```
searchKey: tls.TestLinkerGC
```

```Go
func TestLinkerGC(t *testing.T)
```

Tests that the linker is able to remove references to the Client or Server if unused. 

### <a id="TestSplitPreMasterSecret" href="#TestSplitPreMasterSecret">func TestSplitPreMasterSecret(t *testing.T)</a>

```
searchKey: tls.TestSplitPreMasterSecret
```

```Go
func TestSplitPreMasterSecret(t *testing.T)
```

### <a id="TestKeysFromPreMasterSecret" href="#TestKeysFromPreMasterSecret">func TestKeysFromPreMasterSecret(t *testing.T)</a>

```
searchKey: tls.TestKeysFromPreMasterSecret
```

```Go
func TestKeysFromPreMasterSecret(t *testing.T)
```

### <a id="TestX509KeyPair" href="#TestX509KeyPair">func TestX509KeyPair(t *testing.T)</a>

```
searchKey: tls.TestX509KeyPair
```

```Go
func TestX509KeyPair(t *testing.T)
```

### <a id="TestX509KeyPairErrors" href="#TestX509KeyPairErrors">func TestX509KeyPairErrors(t *testing.T)</a>

```
searchKey: tls.TestX509KeyPairErrors
```

```Go
func TestX509KeyPairErrors(t *testing.T)
```

### <a id="TestX509MixedKeyPair" href="#TestX509MixedKeyPair">func TestX509MixedKeyPair(t *testing.T)</a>

```
searchKey: tls.TestX509MixedKeyPair
```

```Go
func TestX509MixedKeyPair(t *testing.T)
```

### <a id="newLocalListener" href="#newLocalListener">func newLocalListener(t testing.TB) net.Listener</a>

```
searchKey: tls.newLocalListener
```

```Go
func newLocalListener(t testing.TB) net.Listener
```

### <a id="TestDialTimeout" href="#TestDialTimeout">func TestDialTimeout(t *testing.T)</a>

```
searchKey: tls.TestDialTimeout
```

```Go
func TestDialTimeout(t *testing.T)
```

### <a id="TestDeadlineOnWrite" href="#TestDeadlineOnWrite">func TestDeadlineOnWrite(t *testing.T)</a>

```
searchKey: tls.TestDeadlineOnWrite
```

```Go
func TestDeadlineOnWrite(t *testing.T)
```

### <a id="TestDialer" href="#TestDialer">func TestDialer(t *testing.T)</a>

```
searchKey: tls.TestDialer
```

```Go
func TestDialer(t *testing.T)
```

TestDialer tests that tls.Dialer.DialContext can abort in the middle of a handshake. (The other cases are all handled by the existing dial tests in this package, which all also flow through the same code shared code paths) 

### <a id="isTimeoutError" href="#isTimeoutError">func isTimeoutError(err error) bool</a>

```
searchKey: tls.isTimeoutError
```

```Go
func isTimeoutError(err error) bool
```

### <a id="TestConnReadNonzeroAndEOF" href="#TestConnReadNonzeroAndEOF">func TestConnReadNonzeroAndEOF(t *testing.T)</a>

```
searchKey: tls.TestConnReadNonzeroAndEOF
```

```Go
func TestConnReadNonzeroAndEOF(t *testing.T)
```

tests that Conn.Read returns (non-zero, io.EOF) instead of (non-zero, nil) when a Close (alertCloseNotify) is sitting right behind the application data in the buffer. 

### <a id="testConnReadNonzeroAndEOF" href="#testConnReadNonzeroAndEOF">func testConnReadNonzeroAndEOF(t *testing.T, delay time.Duration) error</a>

```
searchKey: tls.testConnReadNonzeroAndEOF
```

```Go
func testConnReadNonzeroAndEOF(t *testing.T, delay time.Duration) error
```

### <a id="TestTLSUniqueMatches" href="#TestTLSUniqueMatches">func TestTLSUniqueMatches(t *testing.T)</a>

```
searchKey: tls.TestTLSUniqueMatches
```

```Go
func TestTLSUniqueMatches(t *testing.T)
```

### <a id="TestVerifyHostname" href="#TestVerifyHostname">func TestVerifyHostname(t *testing.T)</a>

```
searchKey: tls.TestVerifyHostname
```

```Go
func TestVerifyHostname(t *testing.T)
```

### <a id="TestConnCloseBreakingWrite" href="#TestConnCloseBreakingWrite">func TestConnCloseBreakingWrite(t *testing.T)</a>

```
searchKey: tls.TestConnCloseBreakingWrite
```

```Go
func TestConnCloseBreakingWrite(t *testing.T)
```

### <a id="TestConnCloseWrite" href="#TestConnCloseWrite">func TestConnCloseWrite(t *testing.T)</a>

```
searchKey: tls.TestConnCloseWrite
```

```Go
func TestConnCloseWrite(t *testing.T)
```

### <a id="TestWarningAlertFlood" href="#TestWarningAlertFlood">func TestWarningAlertFlood(t *testing.T)</a>

```
searchKey: tls.TestWarningAlertFlood
```

```Go
func TestWarningAlertFlood(t *testing.T)
```

### <a id="TestCloneFuncFields" href="#TestCloneFuncFields">func TestCloneFuncFields(t *testing.T)</a>

```
searchKey: tls.TestCloneFuncFields
```

```Go
func TestCloneFuncFields(t *testing.T)
```

### <a id="TestCloneNonFuncFields" href="#TestCloneNonFuncFields">func TestCloneNonFuncFields(t *testing.T)</a>

```
searchKey: tls.TestCloneNonFuncFields
```

```Go
func TestCloneNonFuncFields(t *testing.T)
```

### <a id="TestCloneNilConfig" href="#TestCloneNilConfig">func TestCloneNilConfig(t *testing.T)</a>

```
searchKey: tls.TestCloneNilConfig
```

```Go
func TestCloneNilConfig(t *testing.T)
```

### <a id="throughput" href="#throughput">func throughput(b *testing.B, version uint16, totalBytes int64, dynamicRecordSizingDisabled bool)</a>

```
searchKey: tls.throughput
```

```Go
func throughput(b *testing.B, version uint16, totalBytes int64, dynamicRecordSizingDisabled bool)
```

### <a id="BenchmarkThroughput" href="#BenchmarkThroughput">func BenchmarkThroughput(b *testing.B)</a>

```
searchKey: tls.BenchmarkThroughput
```

```Go
func BenchmarkThroughput(b *testing.B)
```

### <a id="latency" href="#latency">func latency(b *testing.B, version uint16, bps int, dynamicRecordSizingDisabled bool)</a>

```
searchKey: tls.latency
```

```Go
func latency(b *testing.B, version uint16, bps int, dynamicRecordSizingDisabled bool)
```

### <a id="BenchmarkLatency" href="#BenchmarkLatency">func BenchmarkLatency(b *testing.B)</a>

```
searchKey: tls.BenchmarkLatency
```

```Go
func BenchmarkLatency(b *testing.B)
```

### <a id="TestConnectionStateMarshal" href="#TestConnectionStateMarshal">func TestConnectionStateMarshal(t *testing.T)</a>

```
searchKey: tls.TestConnectionStateMarshal
```

```Go
func TestConnectionStateMarshal(t *testing.T)
```

### <a id="TestConnectionState" href="#TestConnectionState">func TestConnectionState(t *testing.T)</a>

```
searchKey: tls.TestConnectionState
```

```Go
func TestConnectionState(t *testing.T)
```

### <a id="TestBuildNameToCertificate_doesntModifyCertificates" href="#TestBuildNameToCertificate_doesntModifyCertificates">func TestBuildNameToCertificate_doesntModifyCertificates(t *testing.T)</a>

```
searchKey: tls.TestBuildNameToCertificate_doesntModifyCertificates
```

```Go
func TestBuildNameToCertificate_doesntModifyCertificates(t *testing.T)
```

Issue 28744: Ensure that we don't modify memory that Config doesn't own such as Certificates. 

### <a id="testingKey" href="#testingKey">func testingKey(s string) string</a>

```
searchKey: tls.testingKey
```

```Go
func testingKey(s string) string
```

### <a id="TestClientHelloInfo_SupportsCertificate" href="#TestClientHelloInfo_SupportsCertificate">func TestClientHelloInfo_SupportsCertificate(t *testing.T)</a>

```
searchKey: tls.TestClientHelloInfo_SupportsCertificate
```

```Go
func TestClientHelloInfo_SupportsCertificate(t *testing.T)
```

### <a id="TestCipherSuites" href="#TestCipherSuites">func TestCipherSuites(t *testing.T)</a>

```
searchKey: tls.TestCipherSuites
```

```Go
func TestCipherSuites(t *testing.T)
```

### <a id="http2isBadCipher" href="#http2isBadCipher">func http2isBadCipher(cipher uint16) bool</a>

```
searchKey: tls.http2isBadCipher
```

```Go
func http2isBadCipher(cipher uint16) bool
```

http2isBadCipher is copied from net/http. TODO: if it ends up exposed somewhere, use that instead. 

### <a id="TestPKCS1OnlyCert" href="#TestPKCS1OnlyCert">func TestPKCS1OnlyCert(t *testing.T)</a>

```
searchKey: tls.TestPKCS1OnlyCert
```

```Go
func TestPKCS1OnlyCert(t *testing.T)
```

TestPKCS1OnlyCert uses a client certificate with a broken crypto.Signer that always makes PKCS #1 v1.5 signatures, so can't be used with RSA-PSS. 

