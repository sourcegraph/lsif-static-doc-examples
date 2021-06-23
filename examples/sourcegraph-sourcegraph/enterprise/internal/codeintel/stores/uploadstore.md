# Package uploadstore

## Index

* Subpages
  * [enterprise/internal/codeintel/stores/uploadstore/mocks](uploadstore/mocks.md)
* [Constants](#const)
    * [const maxZeroReads](#maxZeroReads)
* [Variables](#var)
    * [var errNoDownloadProgress](#errNoDownloadProgress)
    * [var ioCopyHook](#ioCopyHook)
    * [var storeConstructors](#storeConstructors)
    * [var bytesPattern](#bytesPattern)
    * [var fullContents](#fullContents)
* [Types](#type)
    * [type Config struct](#Config)
        * [func (c *Config) Load()](#Config.Load)
    * [type loader interface](#loader)
    * [type gcsAPI interface](#gcsAPI)
    * [type gcsBucketHandle interface](#gcsBucketHandle)
    * [type gcsObjectHandle interface](#gcsObjectHandle)
    * [type gcsComposer interface](#gcsComposer)
    * [type gcsAPIShim struct](#gcsAPIShim)
        * [func (s *gcsAPIShim) Bucket(name string) gcsBucketHandle](#gcsAPIShim.Bucket)
    * [type bucketHandleShim struct](#bucketHandleShim)
        * [func (s *bucketHandleShim) Attrs(ctx context.Context) (*storage.BucketAttrs, error)](#bucketHandleShim.Attrs)
        * [func (s *bucketHandleShim) Create(ctx context.Context, projectID string, attrs *storage.BucketAttrs) error](#bucketHandleShim.Create)
        * [func (s *bucketHandleShim) Update(ctx context.Context, attrs storage.BucketAttrsToUpdate) error](#bucketHandleShim.Update)
        * [func (s *bucketHandleShim) Object(name string) gcsObjectHandle](#bucketHandleShim.Object)
    * [type objectHandleShim struct](#objectHandleShim)
        * [func (s *objectHandleShim) Delete(ctx context.Context) error](#objectHandleShim.Delete)
        * [func (s *objectHandleShim) NewRangeReader(ctx context.Context, offset, length int64) (io.ReadCloser, error)](#objectHandleShim.NewRangeReader)
        * [func (s *objectHandleShim) NewWriter(ctx context.Context) io.WriteCloser](#objectHandleShim.NewWriter)
        * [func (s *objectHandleShim) ComposerFrom(sources ...gcsObjectHandle) gcsComposer](#objectHandleShim.ComposerFrom)
    * [type composerShim struct](#composerShim)
        * [func (s *composerShim) Run(ctx context.Context) (*storage.ObjectAttrs, error)](#composerShim.Run)
    * [type gcsStore struct](#gcsStore)
        * [func newGCSWithClient(client gcsAPI, bucket string, ttl time.Duration, manageBucket bool, config GCSConfig, operations *operations) *gcsStore](#newGCSWithClient)
        * [func rawGCSClient(client gcsAPI, manageBucket bool) *gcsStore](#rawGCSClient)
        * [func (s *gcsStore) Init(ctx context.Context) error](#gcsStore.Init)
        * [func (s *gcsStore) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)](#gcsStore.Get)
        * [func (s *gcsStore) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)](#gcsStore.Upload)
        * [func (s *gcsStore) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)](#gcsStore.Compose)
        * [func (s *gcsStore) Delete(ctx context.Context, key string) (err error)](#gcsStore.Delete)
        * [func (s *gcsStore) create(ctx context.Context, bucket gcsBucketHandle) error](#gcsStore.create)
        * [func (s *gcsStore) update(ctx context.Context, bucket gcsBucketHandle) error](#gcsStore.update)
        * [func (s *gcsStore) lifecycle() storage.Lifecycle](#gcsStore.lifecycle)
        * [func (s *gcsStore) deleteSources(ctx context.Context, bucket gcsBucketHandle, sources []string) error](#gcsStore.deleteSources)
    * [type GCSConfig struct](#GCSConfig)
        * [func (c *GCSConfig) load(parent *env.BaseConfig)](#GCSConfig.load)
    * [type lazyStore struct](#lazyStore)
        * [func (s *lazyStore) Init(ctx context.Context) error](#lazyStore.Init)
        * [func (s *lazyStore) Get(ctx context.Context, key string) (io.ReadCloser, error)](#lazyStore.Get)
        * [func (s *lazyStore) Upload(ctx context.Context, key string, r io.Reader) (int64, error)](#lazyStore.Upload)
        * [func (s *lazyStore) Compose(ctx context.Context, destination string, sources ...string) (int64, error)](#lazyStore.Compose)
        * [func (s *lazyStore) Delete(ctx context.Context, key string) error](#lazyStore.Delete)
        * [func (s *lazyStore) initOnce(ctx context.Context) error](#lazyStore.initOnce)
    * [type operations struct](#operations)
        * [func newOperations(observationContext *observation.Context) *operations](#newOperations)
    * [type s3API interface](#s3API)
    * [type s3Uploader interface](#s3Uploader)
    * [type s3APIShim struct](#s3APIShim)
        * [func (s *s3APIShim) CreateBucket(ctx context.Context, input *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)](#s3APIShim.CreateBucket)
        * [func (s *s3APIShim) PutBucketLifecycleConfiguration(ctx context.Context, input *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)](#s3APIShim.PutBucketLifecycleConfiguration)
        * [func (s *s3APIShim) HeadObject(ctx context.Context, input *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)](#s3APIShim.HeadObject)
        * [func (s *s3APIShim) GetObject(ctx context.Context, input *s3.GetObjectInput) (*s3.GetObjectOutput, error)](#s3APIShim.GetObject)
        * [func (s *s3APIShim) DeleteObject(ctx context.Context, input *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)](#s3APIShim.DeleteObject)
        * [func (s *s3APIShim) CreateMultipartUpload(ctx context.Context, input *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)](#s3APIShim.CreateMultipartUpload)
        * [func (s *s3APIShim) AbortMultipartUpload(ctx context.Context, input *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)](#s3APIShim.AbortMultipartUpload)
        * [func (s *s3APIShim) UploadPartCopy(ctx context.Context, input *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)](#s3APIShim.UploadPartCopy)
        * [func (s *s3APIShim) CompleteMultipartUpload(ctx context.Context, input *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)](#s3APIShim.CompleteMultipartUpload)
    * [type s3UploaderShim struct](#s3UploaderShim)
        * [func (s *s3UploaderShim) Upload(ctx context.Context, input *s3.PutObjectInput) error](#s3UploaderShim.Upload)
    * [type s3Store struct](#s3Store)
        * [func newS3WithClients(client s3API, uploader s3Uploader, bucket string, manageBucket bool, lifecycleConfiguration *s3types.BucketLifecycleConfiguration, operations *operations) *s3Store](#newS3WithClients)
        * [func rawS3Client(client s3API, uploader s3Uploader) *s3Store](#rawS3Client)
        * [func (s *s3Store) Init(ctx context.Context) error](#s3Store.Init)
        * [func (s *s3Store) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)](#s3Store.Get)
        * [func (s *s3Store) readObjectInto(ctx context.Context, w io.Writer, key string, byteOffset int64) (int64, error)](#s3Store.readObjectInto)
        * [func (s *s3Store) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)](#s3Store.Upload)
        * [func (s *s3Store) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)](#s3Store.Compose)
        * [func (s *s3Store) Delete(ctx context.Context, key string) (err error)](#s3Store.Delete)
        * [func (s *s3Store) create(ctx context.Context) error](#s3Store.create)
        * [func (s *s3Store) update(ctx context.Context) error](#s3Store.update)
        * [func (s *s3Store) deleteSources(ctx context.Context, bucket string, sources []string) error](#s3Store.deleteSources)
    * [type S3Config struct](#S3Config)
        * [func (c *S3Config) load(parent *env.BaseConfig)](#S3Config.load)
    * [type countingReader struct](#countingReader)
        * [func (r *countingReader) Read(p []byte) (n int, err error)](#countingReader.Read)
    * [type Store interface](#Store)
        * [func newGCSFromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)](#newGCSFromConfig)
        * [func newLazyStore(store Store) Store](#newLazyStore)
        * [func newS3FromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)](#newS3FromConfig)
        * [func CreateLazy(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)](#CreateLazy)
        * [func create(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)](#create)
        * [func testGCSClient(client gcsAPI, manageBucket bool) Store](#testGCSClient)
        * [func testS3Client(client s3API, uploader s3Uploader) Store](#testS3Client)
    * [type nopCloser struct](#nopCloser)
        * [func (nopCloser) Close() error](#nopCloser.Close)
    * [type MockGcsAPI struct](#MockGcsAPI)
        * [func NewMockGcsAPI() *MockGcsAPI](#NewMockGcsAPI)
        * [func NewMockGcsAPIFrom(i surrogateMockGcsAPI) *MockGcsAPI](#NewMockGcsAPIFrom)
        * [func (m *MockGcsAPI) Bucket(v0 string) gcsBucketHandle](#MockGcsAPI.Bucket)
    * [type surrogateMockGcsAPI interface](#surrogateMockGcsAPI)
    * [type GcsAPIBucketFunc struct](#GcsAPIBucketFunc)
        * [func (f *GcsAPIBucketFunc) SetDefaultHook(hook func(string) gcsBucketHandle)](#GcsAPIBucketFunc.SetDefaultHook)
        * [func (f *GcsAPIBucketFunc) PushHook(hook func(string) gcsBucketHandle)](#GcsAPIBucketFunc.PushHook)
        * [func (f *GcsAPIBucketFunc) SetDefaultReturn(r0 gcsBucketHandle)](#GcsAPIBucketFunc.SetDefaultReturn)
        * [func (f *GcsAPIBucketFunc) PushReturn(r0 gcsBucketHandle)](#GcsAPIBucketFunc.PushReturn)
        * [func (f *GcsAPIBucketFunc) nextHook() func(string) gcsBucketHandle](#GcsAPIBucketFunc.nextHook)
        * [func (f *GcsAPIBucketFunc) appendCall(r0 GcsAPIBucketFuncCall)](#GcsAPIBucketFunc.appendCall)
        * [func (f *GcsAPIBucketFunc) History() []GcsAPIBucketFuncCall](#GcsAPIBucketFunc.History)
    * [type GcsAPIBucketFuncCall struct](#GcsAPIBucketFuncCall)
        * [func (c GcsAPIBucketFuncCall) Args() []interface{}](#GcsAPIBucketFuncCall.Args)
        * [func (c GcsAPIBucketFuncCall) Results() []interface{}](#GcsAPIBucketFuncCall.Results)
    * [type MockGcsBucketHandle struct](#MockGcsBucketHandle)
        * [func NewMockGcsBucketHandle() *MockGcsBucketHandle](#NewMockGcsBucketHandle)
        * [func NewMockGcsBucketHandleFrom(i surrogateMockGcsBucketHandle) *MockGcsBucketHandle](#NewMockGcsBucketHandleFrom)
        * [func (m *MockGcsBucketHandle) Attrs(v0 context.Context) (*storage.BucketAttrs, error)](#MockGcsBucketHandle.Attrs)
        * [func (m *MockGcsBucketHandle) Create(v0 context.Context, v1 string, v2 *storage.BucketAttrs) error](#MockGcsBucketHandle.Create)
        * [func (m *MockGcsBucketHandle) Object(v0 string) gcsObjectHandle](#MockGcsBucketHandle.Object)
        * [func (m *MockGcsBucketHandle) Update(v0 context.Context, v1 storage.BucketAttrsToUpdate) error](#MockGcsBucketHandle.Update)
    * [type surrogateMockGcsBucketHandle interface](#surrogateMockGcsBucketHandle)
    * [type GcsBucketHandleAttrsFunc struct](#GcsBucketHandleAttrsFunc)
        * [func (f *GcsBucketHandleAttrsFunc) SetDefaultHook(hook func(context.Context) (*storage.BucketAttrs, error))](#GcsBucketHandleAttrsFunc.SetDefaultHook)
        * [func (f *GcsBucketHandleAttrsFunc) PushHook(hook func(context.Context) (*storage.BucketAttrs, error))](#GcsBucketHandleAttrsFunc.PushHook)
        * [func (f *GcsBucketHandleAttrsFunc) SetDefaultReturn(r0 *storage.BucketAttrs, r1 error)](#GcsBucketHandleAttrsFunc.SetDefaultReturn)
        * [func (f *GcsBucketHandleAttrsFunc) PushReturn(r0 *storage.BucketAttrs, r1 error)](#GcsBucketHandleAttrsFunc.PushReturn)
        * [func (f *GcsBucketHandleAttrsFunc) nextHook() func(context.Context) (*storage.BucketAttrs, error)](#GcsBucketHandleAttrsFunc.nextHook)
        * [func (f *GcsBucketHandleAttrsFunc) appendCall(r0 GcsBucketHandleAttrsFuncCall)](#GcsBucketHandleAttrsFunc.appendCall)
        * [func (f *GcsBucketHandleAttrsFunc) History() []GcsBucketHandleAttrsFuncCall](#GcsBucketHandleAttrsFunc.History)
    * [type GcsBucketHandleAttrsFuncCall struct](#GcsBucketHandleAttrsFuncCall)
        * [func (c GcsBucketHandleAttrsFuncCall) Args() []interface{}](#GcsBucketHandleAttrsFuncCall.Args)
        * [func (c GcsBucketHandleAttrsFuncCall) Results() []interface{}](#GcsBucketHandleAttrsFuncCall.Results)
    * [type GcsBucketHandleCreateFunc struct](#GcsBucketHandleCreateFunc)
        * [func (f *GcsBucketHandleCreateFunc) SetDefaultHook(hook func(context.Context, string, *storage.BucketAttrs) error)](#GcsBucketHandleCreateFunc.SetDefaultHook)
        * [func (f *GcsBucketHandleCreateFunc) PushHook(hook func(context.Context, string, *storage.BucketAttrs) error)](#GcsBucketHandleCreateFunc.PushHook)
        * [func (f *GcsBucketHandleCreateFunc) SetDefaultReturn(r0 error)](#GcsBucketHandleCreateFunc.SetDefaultReturn)
        * [func (f *GcsBucketHandleCreateFunc) PushReturn(r0 error)](#GcsBucketHandleCreateFunc.PushReturn)
        * [func (f *GcsBucketHandleCreateFunc) nextHook() func(context.Context, string, *storage.BucketAttrs) error](#GcsBucketHandleCreateFunc.nextHook)
        * [func (f *GcsBucketHandleCreateFunc) appendCall(r0 GcsBucketHandleCreateFuncCall)](#GcsBucketHandleCreateFunc.appendCall)
        * [func (f *GcsBucketHandleCreateFunc) History() []GcsBucketHandleCreateFuncCall](#GcsBucketHandleCreateFunc.History)
    * [type GcsBucketHandleCreateFuncCall struct](#GcsBucketHandleCreateFuncCall)
        * [func (c GcsBucketHandleCreateFuncCall) Args() []interface{}](#GcsBucketHandleCreateFuncCall.Args)
        * [func (c GcsBucketHandleCreateFuncCall) Results() []interface{}](#GcsBucketHandleCreateFuncCall.Results)
    * [type GcsBucketHandleObjectFunc struct](#GcsBucketHandleObjectFunc)
        * [func (f *GcsBucketHandleObjectFunc) SetDefaultHook(hook func(string) gcsObjectHandle)](#GcsBucketHandleObjectFunc.SetDefaultHook)
        * [func (f *GcsBucketHandleObjectFunc) PushHook(hook func(string) gcsObjectHandle)](#GcsBucketHandleObjectFunc.PushHook)
        * [func (f *GcsBucketHandleObjectFunc) SetDefaultReturn(r0 gcsObjectHandle)](#GcsBucketHandleObjectFunc.SetDefaultReturn)
        * [func (f *GcsBucketHandleObjectFunc) PushReturn(r0 gcsObjectHandle)](#GcsBucketHandleObjectFunc.PushReturn)
        * [func (f *GcsBucketHandleObjectFunc) nextHook() func(string) gcsObjectHandle](#GcsBucketHandleObjectFunc.nextHook)
        * [func (f *GcsBucketHandleObjectFunc) appendCall(r0 GcsBucketHandleObjectFuncCall)](#GcsBucketHandleObjectFunc.appendCall)
        * [func (f *GcsBucketHandleObjectFunc) History() []GcsBucketHandleObjectFuncCall](#GcsBucketHandleObjectFunc.History)
    * [type GcsBucketHandleObjectFuncCall struct](#GcsBucketHandleObjectFuncCall)
        * [func (c GcsBucketHandleObjectFuncCall) Args() []interface{}](#GcsBucketHandleObjectFuncCall.Args)
        * [func (c GcsBucketHandleObjectFuncCall) Results() []interface{}](#GcsBucketHandleObjectFuncCall.Results)
    * [type GcsBucketHandleUpdateFunc struct](#GcsBucketHandleUpdateFunc)
        * [func (f *GcsBucketHandleUpdateFunc) SetDefaultHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)](#GcsBucketHandleUpdateFunc.SetDefaultHook)
        * [func (f *GcsBucketHandleUpdateFunc) PushHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)](#GcsBucketHandleUpdateFunc.PushHook)
        * [func (f *GcsBucketHandleUpdateFunc) SetDefaultReturn(r0 error)](#GcsBucketHandleUpdateFunc.SetDefaultReturn)
        * [func (f *GcsBucketHandleUpdateFunc) PushReturn(r0 error)](#GcsBucketHandleUpdateFunc.PushReturn)
        * [func (f *GcsBucketHandleUpdateFunc) nextHook() func(context.Context, storage.BucketAttrsToUpdate) error](#GcsBucketHandleUpdateFunc.nextHook)
        * [func (f *GcsBucketHandleUpdateFunc) appendCall(r0 GcsBucketHandleUpdateFuncCall)](#GcsBucketHandleUpdateFunc.appendCall)
        * [func (f *GcsBucketHandleUpdateFunc) History() []GcsBucketHandleUpdateFuncCall](#GcsBucketHandleUpdateFunc.History)
    * [type GcsBucketHandleUpdateFuncCall struct](#GcsBucketHandleUpdateFuncCall)
        * [func (c GcsBucketHandleUpdateFuncCall) Args() []interface{}](#GcsBucketHandleUpdateFuncCall.Args)
        * [func (c GcsBucketHandleUpdateFuncCall) Results() []interface{}](#GcsBucketHandleUpdateFuncCall.Results)
    * [type MockGcsComposer struct](#MockGcsComposer)
        * [func NewMockGcsComposer() *MockGcsComposer](#NewMockGcsComposer)
        * [func NewMockGcsComposerFrom(i surrogateMockGcsComposer) *MockGcsComposer](#NewMockGcsComposerFrom)
        * [func (m *MockGcsComposer) Run(v0 context.Context) (*storage.ObjectAttrs, error)](#MockGcsComposer.Run)
    * [type surrogateMockGcsComposer interface](#surrogateMockGcsComposer)
    * [type GcsComposerRunFunc struct](#GcsComposerRunFunc)
        * [func (f *GcsComposerRunFunc) SetDefaultHook(hook func(context.Context) (*storage.ObjectAttrs, error))](#GcsComposerRunFunc.SetDefaultHook)
        * [func (f *GcsComposerRunFunc) PushHook(hook func(context.Context) (*storage.ObjectAttrs, error))](#GcsComposerRunFunc.PushHook)
        * [func (f *GcsComposerRunFunc) SetDefaultReturn(r0 *storage.ObjectAttrs, r1 error)](#GcsComposerRunFunc.SetDefaultReturn)
        * [func (f *GcsComposerRunFunc) PushReturn(r0 *storage.ObjectAttrs, r1 error)](#GcsComposerRunFunc.PushReturn)
        * [func (f *GcsComposerRunFunc) nextHook() func(context.Context) (*storage.ObjectAttrs, error)](#GcsComposerRunFunc.nextHook)
        * [func (f *GcsComposerRunFunc) appendCall(r0 GcsComposerRunFuncCall)](#GcsComposerRunFunc.appendCall)
        * [func (f *GcsComposerRunFunc) History() []GcsComposerRunFuncCall](#GcsComposerRunFunc.History)
    * [type GcsComposerRunFuncCall struct](#GcsComposerRunFuncCall)
        * [func (c GcsComposerRunFuncCall) Args() []interface{}](#GcsComposerRunFuncCall.Args)
        * [func (c GcsComposerRunFuncCall) Results() []interface{}](#GcsComposerRunFuncCall.Results)
    * [type MockGcsObjectHandle struct](#MockGcsObjectHandle)
        * [func NewMockGcsObjectHandle() *MockGcsObjectHandle](#NewMockGcsObjectHandle)
        * [func NewMockGcsObjectHandleFrom(i surrogateMockGcsObjectHandle) *MockGcsObjectHandle](#NewMockGcsObjectHandleFrom)
        * [func (m *MockGcsObjectHandle) ComposerFrom(v0 ...gcsObjectHandle) gcsComposer](#MockGcsObjectHandle.ComposerFrom)
        * [func (m *MockGcsObjectHandle) Delete(v0 context.Context) error](#MockGcsObjectHandle.Delete)
        * [func (m *MockGcsObjectHandle) NewRangeReader(v0 context.Context, v1 int64, v2 int64) (io.ReadCloser, error)](#MockGcsObjectHandle.NewRangeReader)
        * [func (m *MockGcsObjectHandle) NewWriter(v0 context.Context) io.WriteCloser](#MockGcsObjectHandle.NewWriter)
    * [type surrogateMockGcsObjectHandle interface](#surrogateMockGcsObjectHandle)
    * [type GcsObjectHandleComposerFromFunc struct](#GcsObjectHandleComposerFromFunc)
        * [func (f *GcsObjectHandleComposerFromFunc) SetDefaultHook(hook func(...gcsObjectHandle) gcsComposer)](#GcsObjectHandleComposerFromFunc.SetDefaultHook)
        * [func (f *GcsObjectHandleComposerFromFunc) PushHook(hook func(...gcsObjectHandle) gcsComposer)](#GcsObjectHandleComposerFromFunc.PushHook)
        * [func (f *GcsObjectHandleComposerFromFunc) SetDefaultReturn(r0 gcsComposer)](#GcsObjectHandleComposerFromFunc.SetDefaultReturn)
        * [func (f *GcsObjectHandleComposerFromFunc) PushReturn(r0 gcsComposer)](#GcsObjectHandleComposerFromFunc.PushReturn)
        * [func (f *GcsObjectHandleComposerFromFunc) nextHook() func(...gcsObjectHandle) gcsComposer](#GcsObjectHandleComposerFromFunc.nextHook)
        * [func (f *GcsObjectHandleComposerFromFunc) appendCall(r0 GcsObjectHandleComposerFromFuncCall)](#GcsObjectHandleComposerFromFunc.appendCall)
        * [func (f *GcsObjectHandleComposerFromFunc) History() []GcsObjectHandleComposerFromFuncCall](#GcsObjectHandleComposerFromFunc.History)
    * [type GcsObjectHandleComposerFromFuncCall struct](#GcsObjectHandleComposerFromFuncCall)
        * [func (c GcsObjectHandleComposerFromFuncCall) Args() []interface{}](#GcsObjectHandleComposerFromFuncCall.Args)
        * [func (c GcsObjectHandleComposerFromFuncCall) Results() []interface{}](#GcsObjectHandleComposerFromFuncCall.Results)
    * [type GcsObjectHandleDeleteFunc struct](#GcsObjectHandleDeleteFunc)
        * [func (f *GcsObjectHandleDeleteFunc) SetDefaultHook(hook func(context.Context) error)](#GcsObjectHandleDeleteFunc.SetDefaultHook)
        * [func (f *GcsObjectHandleDeleteFunc) PushHook(hook func(context.Context) error)](#GcsObjectHandleDeleteFunc.PushHook)
        * [func (f *GcsObjectHandleDeleteFunc) SetDefaultReturn(r0 error)](#GcsObjectHandleDeleteFunc.SetDefaultReturn)
        * [func (f *GcsObjectHandleDeleteFunc) PushReturn(r0 error)](#GcsObjectHandleDeleteFunc.PushReturn)
        * [func (f *GcsObjectHandleDeleteFunc) nextHook() func(context.Context) error](#GcsObjectHandleDeleteFunc.nextHook)
        * [func (f *GcsObjectHandleDeleteFunc) appendCall(r0 GcsObjectHandleDeleteFuncCall)](#GcsObjectHandleDeleteFunc.appendCall)
        * [func (f *GcsObjectHandleDeleteFunc) History() []GcsObjectHandleDeleteFuncCall](#GcsObjectHandleDeleteFunc.History)
    * [type GcsObjectHandleDeleteFuncCall struct](#GcsObjectHandleDeleteFuncCall)
        * [func (c GcsObjectHandleDeleteFuncCall) Args() []interface{}](#GcsObjectHandleDeleteFuncCall.Args)
        * [func (c GcsObjectHandleDeleteFuncCall) Results() []interface{}](#GcsObjectHandleDeleteFuncCall.Results)
    * [type GcsObjectHandleNewRangeReaderFunc struct](#GcsObjectHandleNewRangeReaderFunc)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))](#GcsObjectHandleNewRangeReaderFunc.SetDefaultHook)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) PushHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))](#GcsObjectHandleNewRangeReaderFunc.PushHook)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)](#GcsObjectHandleNewRangeReaderFunc.SetDefaultReturn)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) PushReturn(r0 io.ReadCloser, r1 error)](#GcsObjectHandleNewRangeReaderFunc.PushReturn)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) nextHook() func(context.Context, int64, int64) (io.ReadCloser, error)](#GcsObjectHandleNewRangeReaderFunc.nextHook)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) appendCall(r0 GcsObjectHandleNewRangeReaderFuncCall)](#GcsObjectHandleNewRangeReaderFunc.appendCall)
        * [func (f *GcsObjectHandleNewRangeReaderFunc) History() []GcsObjectHandleNewRangeReaderFuncCall](#GcsObjectHandleNewRangeReaderFunc.History)
    * [type GcsObjectHandleNewRangeReaderFuncCall struct](#GcsObjectHandleNewRangeReaderFuncCall)
        * [func (c GcsObjectHandleNewRangeReaderFuncCall) Args() []interface{}](#GcsObjectHandleNewRangeReaderFuncCall.Args)
        * [func (c GcsObjectHandleNewRangeReaderFuncCall) Results() []interface{}](#GcsObjectHandleNewRangeReaderFuncCall.Results)
    * [type GcsObjectHandleNewWriterFunc struct](#GcsObjectHandleNewWriterFunc)
        * [func (f *GcsObjectHandleNewWriterFunc) SetDefaultHook(hook func(context.Context) io.WriteCloser)](#GcsObjectHandleNewWriterFunc.SetDefaultHook)
        * [func (f *GcsObjectHandleNewWriterFunc) PushHook(hook func(context.Context) io.WriteCloser)](#GcsObjectHandleNewWriterFunc.PushHook)
        * [func (f *GcsObjectHandleNewWriterFunc) SetDefaultReturn(r0 io.WriteCloser)](#GcsObjectHandleNewWriterFunc.SetDefaultReturn)
        * [func (f *GcsObjectHandleNewWriterFunc) PushReturn(r0 io.WriteCloser)](#GcsObjectHandleNewWriterFunc.PushReturn)
        * [func (f *GcsObjectHandleNewWriterFunc) nextHook() func(context.Context) io.WriteCloser](#GcsObjectHandleNewWriterFunc.nextHook)
        * [func (f *GcsObjectHandleNewWriterFunc) appendCall(r0 GcsObjectHandleNewWriterFuncCall)](#GcsObjectHandleNewWriterFunc.appendCall)
        * [func (f *GcsObjectHandleNewWriterFunc) History() []GcsObjectHandleNewWriterFuncCall](#GcsObjectHandleNewWriterFunc.History)
    * [type GcsObjectHandleNewWriterFuncCall struct](#GcsObjectHandleNewWriterFuncCall)
        * [func (c GcsObjectHandleNewWriterFuncCall) Args() []interface{}](#GcsObjectHandleNewWriterFuncCall.Args)
        * [func (c GcsObjectHandleNewWriterFuncCall) Results() []interface{}](#GcsObjectHandleNewWriterFuncCall.Results)
    * [type MockS3API struct](#MockS3API)
        * [func NewMockS3API() *MockS3API](#NewMockS3API)
        * [func NewMockS3APIFrom(i surrogateMockS3API) *MockS3API](#NewMockS3APIFrom)
        * [func fullContentsS3API() *MockS3API](#fullContentsS3API)
        * [func (m *MockS3API) AbortMultipartUpload(v0 context.Context, v1 *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)](#MockS3API.AbortMultipartUpload)
        * [func (m *MockS3API) CompleteMultipartUpload(v0 context.Context, v1 *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)](#MockS3API.CompleteMultipartUpload)
        * [func (m *MockS3API) CreateBucket(v0 context.Context, v1 *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)](#MockS3API.CreateBucket)
        * [func (m *MockS3API) CreateMultipartUpload(v0 context.Context, v1 *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)](#MockS3API.CreateMultipartUpload)
        * [func (m *MockS3API) DeleteObject(v0 context.Context, v1 *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)](#MockS3API.DeleteObject)
        * [func (m *MockS3API) GetObject(v0 context.Context, v1 *s3.GetObjectInput) (*s3.GetObjectOutput, error)](#MockS3API.GetObject)
        * [func (m *MockS3API) HeadObject(v0 context.Context, v1 *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)](#MockS3API.HeadObject)
        * [func (m *MockS3API) PutBucketLifecycleConfiguration(v0 context.Context, v1 *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)](#MockS3API.PutBucketLifecycleConfiguration)
        * [func (m *MockS3API) UploadPartCopy(v0 context.Context, v1 *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)](#MockS3API.UploadPartCopy)
    * [type surrogateMockS3API interface](#surrogateMockS3API)
    * [type S3APIAbortMultipartUploadFunc struct](#S3APIAbortMultipartUploadFunc)
        * [func (f *S3APIAbortMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))](#S3APIAbortMultipartUploadFunc.SetDefaultHook)
        * [func (f *S3APIAbortMultipartUploadFunc) PushHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))](#S3APIAbortMultipartUploadFunc.PushHook)
        * [func (f *S3APIAbortMultipartUploadFunc) SetDefaultReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)](#S3APIAbortMultipartUploadFunc.SetDefaultReturn)
        * [func (f *S3APIAbortMultipartUploadFunc) PushReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)](#S3APIAbortMultipartUploadFunc.PushReturn)
        * [func (f *S3APIAbortMultipartUploadFunc) nextHook() func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)](#S3APIAbortMultipartUploadFunc.nextHook)
        * [func (f *S3APIAbortMultipartUploadFunc) appendCall(r0 S3APIAbortMultipartUploadFuncCall)](#S3APIAbortMultipartUploadFunc.appendCall)
        * [func (f *S3APIAbortMultipartUploadFunc) History() []S3APIAbortMultipartUploadFuncCall](#S3APIAbortMultipartUploadFunc.History)
    * [type S3APIAbortMultipartUploadFuncCall struct](#S3APIAbortMultipartUploadFuncCall)
        * [func (c S3APIAbortMultipartUploadFuncCall) Args() []interface{}](#S3APIAbortMultipartUploadFuncCall.Args)
        * [func (c S3APIAbortMultipartUploadFuncCall) Results() []interface{}](#S3APIAbortMultipartUploadFuncCall.Results)
    * [type S3APICompleteMultipartUploadFunc struct](#S3APICompleteMultipartUploadFunc)
        * [func (f *S3APICompleteMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))](#S3APICompleteMultipartUploadFunc.SetDefaultHook)
        * [func (f *S3APICompleteMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))](#S3APICompleteMultipartUploadFunc.PushHook)
        * [func (f *S3APICompleteMultipartUploadFunc) SetDefaultReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)](#S3APICompleteMultipartUploadFunc.SetDefaultReturn)
        * [func (f *S3APICompleteMultipartUploadFunc) PushReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)](#S3APICompleteMultipartUploadFunc.PushReturn)
        * [func (f *S3APICompleteMultipartUploadFunc) nextHook() func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)](#S3APICompleteMultipartUploadFunc.nextHook)
        * [func (f *S3APICompleteMultipartUploadFunc) appendCall(r0 S3APICompleteMultipartUploadFuncCall)](#S3APICompleteMultipartUploadFunc.appendCall)
        * [func (f *S3APICompleteMultipartUploadFunc) History() []S3APICompleteMultipartUploadFuncCall](#S3APICompleteMultipartUploadFunc.History)
    * [type S3APICompleteMultipartUploadFuncCall struct](#S3APICompleteMultipartUploadFuncCall)
        * [func (c S3APICompleteMultipartUploadFuncCall) Args() []interface{}](#S3APICompleteMultipartUploadFuncCall.Args)
        * [func (c S3APICompleteMultipartUploadFuncCall) Results() []interface{}](#S3APICompleteMultipartUploadFuncCall.Results)
    * [type S3APICreateBucketFunc struct](#S3APICreateBucketFunc)
        * [func (f *S3APICreateBucketFunc) SetDefaultHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))](#S3APICreateBucketFunc.SetDefaultHook)
        * [func (f *S3APICreateBucketFunc) PushHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))](#S3APICreateBucketFunc.PushHook)
        * [func (f *S3APICreateBucketFunc) SetDefaultReturn(r0 *s3.CreateBucketOutput, r1 error)](#S3APICreateBucketFunc.SetDefaultReturn)
        * [func (f *S3APICreateBucketFunc) PushReturn(r0 *s3.CreateBucketOutput, r1 error)](#S3APICreateBucketFunc.PushReturn)
        * [func (f *S3APICreateBucketFunc) nextHook() func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)](#S3APICreateBucketFunc.nextHook)
        * [func (f *S3APICreateBucketFunc) appendCall(r0 S3APICreateBucketFuncCall)](#S3APICreateBucketFunc.appendCall)
        * [func (f *S3APICreateBucketFunc) History() []S3APICreateBucketFuncCall](#S3APICreateBucketFunc.History)
    * [type S3APICreateBucketFuncCall struct](#S3APICreateBucketFuncCall)
        * [func (c S3APICreateBucketFuncCall) Args() []interface{}](#S3APICreateBucketFuncCall.Args)
        * [func (c S3APICreateBucketFuncCall) Results() []interface{}](#S3APICreateBucketFuncCall.Results)
    * [type S3APICreateMultipartUploadFunc struct](#S3APICreateMultipartUploadFunc)
        * [func (f *S3APICreateMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))](#S3APICreateMultipartUploadFunc.SetDefaultHook)
        * [func (f *S3APICreateMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))](#S3APICreateMultipartUploadFunc.PushHook)
        * [func (f *S3APICreateMultipartUploadFunc) SetDefaultReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)](#S3APICreateMultipartUploadFunc.SetDefaultReturn)
        * [func (f *S3APICreateMultipartUploadFunc) PushReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)](#S3APICreateMultipartUploadFunc.PushReturn)
        * [func (f *S3APICreateMultipartUploadFunc) nextHook() func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)](#S3APICreateMultipartUploadFunc.nextHook)
        * [func (f *S3APICreateMultipartUploadFunc) appendCall(r0 S3APICreateMultipartUploadFuncCall)](#S3APICreateMultipartUploadFunc.appendCall)
        * [func (f *S3APICreateMultipartUploadFunc) History() []S3APICreateMultipartUploadFuncCall](#S3APICreateMultipartUploadFunc.History)
    * [type S3APICreateMultipartUploadFuncCall struct](#S3APICreateMultipartUploadFuncCall)
        * [func (c S3APICreateMultipartUploadFuncCall) Args() []interface{}](#S3APICreateMultipartUploadFuncCall.Args)
        * [func (c S3APICreateMultipartUploadFuncCall) Results() []interface{}](#S3APICreateMultipartUploadFuncCall.Results)
    * [type S3APIDeleteObjectFunc struct](#S3APIDeleteObjectFunc)
        * [func (f *S3APIDeleteObjectFunc) SetDefaultHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))](#S3APIDeleteObjectFunc.SetDefaultHook)
        * [func (f *S3APIDeleteObjectFunc) PushHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))](#S3APIDeleteObjectFunc.PushHook)
        * [func (f *S3APIDeleteObjectFunc) SetDefaultReturn(r0 *s3.DeleteObjectOutput, r1 error)](#S3APIDeleteObjectFunc.SetDefaultReturn)
        * [func (f *S3APIDeleteObjectFunc) PushReturn(r0 *s3.DeleteObjectOutput, r1 error)](#S3APIDeleteObjectFunc.PushReturn)
        * [func (f *S3APIDeleteObjectFunc) nextHook() func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)](#S3APIDeleteObjectFunc.nextHook)
        * [func (f *S3APIDeleteObjectFunc) appendCall(r0 S3APIDeleteObjectFuncCall)](#S3APIDeleteObjectFunc.appendCall)
        * [func (f *S3APIDeleteObjectFunc) History() []S3APIDeleteObjectFuncCall](#S3APIDeleteObjectFunc.History)
    * [type S3APIDeleteObjectFuncCall struct](#S3APIDeleteObjectFuncCall)
        * [func (c S3APIDeleteObjectFuncCall) Args() []interface{}](#S3APIDeleteObjectFuncCall.Args)
        * [func (c S3APIDeleteObjectFuncCall) Results() []interface{}](#S3APIDeleteObjectFuncCall.Results)
    * [type S3APIGetObjectFunc struct](#S3APIGetObjectFunc)
        * [func (f *S3APIGetObjectFunc) SetDefaultHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))](#S3APIGetObjectFunc.SetDefaultHook)
        * [func (f *S3APIGetObjectFunc) PushHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))](#S3APIGetObjectFunc.PushHook)
        * [func (f *S3APIGetObjectFunc) SetDefaultReturn(r0 *s3.GetObjectOutput, r1 error)](#S3APIGetObjectFunc.SetDefaultReturn)
        * [func (f *S3APIGetObjectFunc) PushReturn(r0 *s3.GetObjectOutput, r1 error)](#S3APIGetObjectFunc.PushReturn)
        * [func (f *S3APIGetObjectFunc) nextHook() func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)](#S3APIGetObjectFunc.nextHook)
        * [func (f *S3APIGetObjectFunc) appendCall(r0 S3APIGetObjectFuncCall)](#S3APIGetObjectFunc.appendCall)
        * [func (f *S3APIGetObjectFunc) History() []S3APIGetObjectFuncCall](#S3APIGetObjectFunc.History)
    * [type S3APIGetObjectFuncCall struct](#S3APIGetObjectFuncCall)
        * [func (c S3APIGetObjectFuncCall) Args() []interface{}](#S3APIGetObjectFuncCall.Args)
        * [func (c S3APIGetObjectFuncCall) Results() []interface{}](#S3APIGetObjectFuncCall.Results)
    * [type S3APIHeadObjectFunc struct](#S3APIHeadObjectFunc)
        * [func (f *S3APIHeadObjectFunc) SetDefaultHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))](#S3APIHeadObjectFunc.SetDefaultHook)
        * [func (f *S3APIHeadObjectFunc) PushHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))](#S3APIHeadObjectFunc.PushHook)
        * [func (f *S3APIHeadObjectFunc) SetDefaultReturn(r0 *s3.HeadObjectOutput, r1 error)](#S3APIHeadObjectFunc.SetDefaultReturn)
        * [func (f *S3APIHeadObjectFunc) PushReturn(r0 *s3.HeadObjectOutput, r1 error)](#S3APIHeadObjectFunc.PushReturn)
        * [func (f *S3APIHeadObjectFunc) nextHook() func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)](#S3APIHeadObjectFunc.nextHook)
        * [func (f *S3APIHeadObjectFunc) appendCall(r0 S3APIHeadObjectFuncCall)](#S3APIHeadObjectFunc.appendCall)
        * [func (f *S3APIHeadObjectFunc) History() []S3APIHeadObjectFuncCall](#S3APIHeadObjectFunc.History)
    * [type S3APIHeadObjectFuncCall struct](#S3APIHeadObjectFuncCall)
        * [func (c S3APIHeadObjectFuncCall) Args() []interface{}](#S3APIHeadObjectFuncCall.Args)
        * [func (c S3APIHeadObjectFuncCall) Results() []interface{}](#S3APIHeadObjectFuncCall.Results)
    * [type S3APIPutBucketLifecycleConfigurationFunc struct](#S3APIPutBucketLifecycleConfigurationFunc)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))](#S3APIPutBucketLifecycleConfigurationFunc.SetDefaultHook)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) PushHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))](#S3APIPutBucketLifecycleConfigurationFunc.PushHook)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)](#S3APIPutBucketLifecycleConfigurationFunc.SetDefaultReturn)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) PushReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)](#S3APIPutBucketLifecycleConfigurationFunc.PushReturn)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) nextHook() func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)](#S3APIPutBucketLifecycleConfigurationFunc.nextHook)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) appendCall(r0 S3APIPutBucketLifecycleConfigurationFuncCall)](#S3APIPutBucketLifecycleConfigurationFunc.appendCall)
        * [func (f *S3APIPutBucketLifecycleConfigurationFunc) History() []S3APIPutBucketLifecycleConfigurationFuncCall](#S3APIPutBucketLifecycleConfigurationFunc.History)
    * [type S3APIPutBucketLifecycleConfigurationFuncCall struct](#S3APIPutBucketLifecycleConfigurationFuncCall)
        * [func (c S3APIPutBucketLifecycleConfigurationFuncCall) Args() []interface{}](#S3APIPutBucketLifecycleConfigurationFuncCall.Args)
        * [func (c S3APIPutBucketLifecycleConfigurationFuncCall) Results() []interface{}](#S3APIPutBucketLifecycleConfigurationFuncCall.Results)
    * [type S3APIUploadPartCopyFunc struct](#S3APIUploadPartCopyFunc)
        * [func (f *S3APIUploadPartCopyFunc) SetDefaultHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))](#S3APIUploadPartCopyFunc.SetDefaultHook)
        * [func (f *S3APIUploadPartCopyFunc) PushHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))](#S3APIUploadPartCopyFunc.PushHook)
        * [func (f *S3APIUploadPartCopyFunc) SetDefaultReturn(r0 *s3.UploadPartCopyOutput, r1 error)](#S3APIUploadPartCopyFunc.SetDefaultReturn)
        * [func (f *S3APIUploadPartCopyFunc) PushReturn(r0 *s3.UploadPartCopyOutput, r1 error)](#S3APIUploadPartCopyFunc.PushReturn)
        * [func (f *S3APIUploadPartCopyFunc) nextHook() func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)](#S3APIUploadPartCopyFunc.nextHook)
        * [func (f *S3APIUploadPartCopyFunc) appendCall(r0 S3APIUploadPartCopyFuncCall)](#S3APIUploadPartCopyFunc.appendCall)
        * [func (f *S3APIUploadPartCopyFunc) History() []S3APIUploadPartCopyFuncCall](#S3APIUploadPartCopyFunc.History)
    * [type S3APIUploadPartCopyFuncCall struct](#S3APIUploadPartCopyFuncCall)
        * [func (c S3APIUploadPartCopyFuncCall) Args() []interface{}](#S3APIUploadPartCopyFuncCall.Args)
        * [func (c S3APIUploadPartCopyFuncCall) Results() []interface{}](#S3APIUploadPartCopyFuncCall.Results)
    * [type MockS3Uploader struct](#MockS3Uploader)
        * [func NewMockS3Uploader() *MockS3Uploader](#NewMockS3Uploader)
        * [func NewMockS3UploaderFrom(i surrogateMockS3Uploader) *MockS3Uploader](#NewMockS3UploaderFrom)
        * [func (m *MockS3Uploader) Upload(v0 context.Context, v1 *s3.PutObjectInput) error](#MockS3Uploader.Upload)
    * [type surrogateMockS3Uploader interface](#surrogateMockS3Uploader)
    * [type S3UploaderUploadFunc struct](#S3UploaderUploadFunc)
        * [func (f *S3UploaderUploadFunc) SetDefaultHook(hook func(context.Context, *s3.PutObjectInput) error)](#S3UploaderUploadFunc.SetDefaultHook)
        * [func (f *S3UploaderUploadFunc) PushHook(hook func(context.Context, *s3.PutObjectInput) error)](#S3UploaderUploadFunc.PushHook)
        * [func (f *S3UploaderUploadFunc) SetDefaultReturn(r0 error)](#S3UploaderUploadFunc.SetDefaultReturn)
        * [func (f *S3UploaderUploadFunc) PushReturn(r0 error)](#S3UploaderUploadFunc.PushReturn)
        * [func (f *S3UploaderUploadFunc) nextHook() func(context.Context, *s3.PutObjectInput) error](#S3UploaderUploadFunc.nextHook)
        * [func (f *S3UploaderUploadFunc) appendCall(r0 S3UploaderUploadFuncCall)](#S3UploaderUploadFunc.appendCall)
        * [func (f *S3UploaderUploadFunc) History() []S3UploaderUploadFuncCall](#S3UploaderUploadFunc.History)
    * [type S3UploaderUploadFuncCall struct](#S3UploaderUploadFuncCall)
        * [func (c S3UploaderUploadFuncCall) Args() []interface{}](#S3UploaderUploadFuncCall.Args)
        * [func (c S3UploaderUploadFuncCall) Results() []interface{}](#S3UploaderUploadFuncCall.Results)
* [Functions](#func)
    * [func gcsClientOptions(config GCSConfig) []option.ClientOption](#gcsClientOptions)
    * [func s3ClientConfig(ctx context.Context, s3config S3Config) (aws.Config, error)](#s3ClientConfig)
    * [func s3ClientOptions(backend string, config S3Config) func(o *s3.Options)](#s3ClientOptions)
    * [func writeToPipe(fn func(w io.Writer) error) io.Reader](#writeToPipe)
    * [func isConnectionResetError(err error) bool](#isConnectionResetError)
    * [func s3BucketLifecycleConfiguration(backend string, ttl time.Duration) *s3types.BucketLifecycleConfiguration](#s3BucketLifecycleConfiguration)
    * [func TestConfigDefaults(t *testing.T)](#TestConfigDefaults)
    * [func TestConfigS3(t *testing.T)](#TestConfigS3)
    * [func TestS3ClientOptions(t *testing.T)](#TestS3ClientOptions)
    * [func TestS3ClientConfig(t *testing.T)](#TestS3ClientConfig)
    * [func TestConfigGCS(t *testing.T)](#TestConfigGCS)
    * [func mapGetter(env map[string]string) func(name, defaultValue, description string) string](#mapGetter)
    * [func TestGCSInit(t *testing.T)](#TestGCSInit)
    * [func TestGCSInitBucketExists(t *testing.T)](#TestGCSInitBucketExists)
    * [func TestGCSUnmanagedInit(t *testing.T)](#TestGCSUnmanagedInit)
    * [func TestGCSGet(t *testing.T)](#TestGCSGet)
    * [func TestGCSUpload(t *testing.T)](#TestGCSUpload)
    * [func TestGCSCombine(t *testing.T)](#TestGCSCombine)
    * [func TestGCSDelete(t *testing.T)](#TestGCSDelete)
    * [func TestGCSLifecycle(t *testing.T)](#TestGCSLifecycle)
    * [func TestS3Init(t *testing.T)](#TestS3Init)
    * [func TestS3InitBucketExists(t *testing.T)](#TestS3InitBucketExists)
    * [func TestS3UnmanagedInit(t *testing.T)](#TestS3UnmanagedInit)
    * [func TestS3Get(t *testing.T)](#TestS3Get)
    * [func TestS3GetTransientErrors(t *testing.T)](#TestS3GetTransientErrors)
    * [func TestS3GetReadNothingLoop(t *testing.T)](#TestS3GetReadNothingLoop)
    * [func TestS3Upload(t *testing.T)](#TestS3Upload)
    * [func TestS3Combine(t *testing.T)](#TestS3Combine)
    * [func TestS3Delete(t *testing.T)](#TestS3Delete)
    * [func TestS3BucketLifecycleConfiguration(t *testing.T)](#TestS3BucketLifecycleConfiguration)
    * [func TestMain(m *testing.M)](#TestMain)


## <a id="const" href="#const">Constants</a>

```
tags: [private]
```

### <a id="maxZeroReads" href="#maxZeroReads">const maxZeroReads</a>

```
searchKey: uploadstore.maxZeroReads
tags: [private]
```

```Go
const maxZeroReads = 3
```

maxZeroReads is the maximum number of no-progress iterations (due to connection reset errors) in Get that can occur in a row before returning an error. 

## <a id="var" href="#var">Variables</a>

```
tags: [private]
```

### <a id="errNoDownloadProgress" href="#errNoDownloadProgress">var errNoDownloadProgress</a>

```
searchKey: uploadstore.errNoDownloadProgress
tags: [private]
```

```Go
var errNoDownloadProgress = errors.New("no download progress")
```

errNoDownloadProgress is returned from Get after multiple connection reset errors occur in a row. 

### <a id="ioCopyHook" href="#ioCopyHook">var ioCopyHook</a>

```
searchKey: uploadstore.ioCopyHook
tags: [private]
```

```Go
var ioCopyHook = io.Copy
```

ioCopyHook is a pointer to io.Copy. This function is replaced in unit tests so that we can easily inject errors when reading from the backing S3 store. 

### <a id="storeConstructors" href="#storeConstructors">var storeConstructors</a>

```
searchKey: uploadstore.storeConstructors
tags: [private]
```

```Go
var storeConstructors = ...
```

### <a id="bytesPattern" href="#bytesPattern">var bytesPattern</a>

```
searchKey: uploadstore.bytesPattern
tags: [private]
```

```Go
var bytesPattern = regexp.MustCompile(`bytes=(\d+)-`)
```

### <a id="fullContents" href="#fullContents">var fullContents</a>

```
searchKey: uploadstore.fullContents
tags: [private]
```

```Go
var fullContents = ...
```

## <a id="type" href="#type">Types</a>

```
tags: [private]
```

### <a id="Config" href="#Config">type Config struct</a>

```
searchKey: uploadstore.Config
```

```Go
type Config struct {
	env.BaseConfig

	Backend      string
	ManageBucket bool
	Bucket       string
	TTL          time.Duration
	S3           S3Config
	GCS          GCSConfig
}
```

#### <a id="Config.Load" href="#Config.Load">func (c *Config) Load()</a>

```
searchKey: uploadstore.Config.Load
```

```Go
func (c *Config) Load()
```

### <a id="loader" href="#loader">type loader interface</a>

```
searchKey: uploadstore.loader
tags: [private]
```

```Go
type loader interface {
	load(parent *env.BaseConfig)
}
```

### <a id="gcsAPI" href="#gcsAPI">type gcsAPI interface</a>

```
searchKey: uploadstore.gcsAPI
tags: [private]
```

```Go
type gcsAPI interface {
	Bucket(name string) gcsBucketHandle
}
```

### <a id="gcsBucketHandle" href="#gcsBucketHandle">type gcsBucketHandle interface</a>

```
searchKey: uploadstore.gcsBucketHandle
tags: [private]
```

```Go
type gcsBucketHandle interface {
	Attrs(ctx context.Context) (*storage.BucketAttrs, error)
	Create(ctx context.Context, projectID string, attrs *storage.BucketAttrs) error
	Update(ctx context.Context, attrs storage.BucketAttrsToUpdate) error
	Object(name string) gcsObjectHandle
}
```

### <a id="gcsObjectHandle" href="#gcsObjectHandle">type gcsObjectHandle interface</a>

```
searchKey: uploadstore.gcsObjectHandle
tags: [private]
```

```Go
type gcsObjectHandle interface {
	Delete(ctx context.Context) error
	NewRangeReader(ctx context.Context, offset, length int64) (io.ReadCloser, error)
	NewWriter(ctx context.Context) io.WriteCloser
	ComposerFrom(sources ...gcsObjectHandle) gcsComposer
}
```

### <a id="gcsComposer" href="#gcsComposer">type gcsComposer interface</a>

```
searchKey: uploadstore.gcsComposer
tags: [private]
```

```Go
type gcsComposer interface {
	Run(ctx context.Context) (*storage.ObjectAttrs, error)
}
```

### <a id="gcsAPIShim" href="#gcsAPIShim">type gcsAPIShim struct</a>

```
searchKey: uploadstore.gcsAPIShim
tags: [private]
```

```Go
type gcsAPIShim struct{ client *storage.Client }
```

#### <a id="gcsAPIShim.Bucket" href="#gcsAPIShim.Bucket">func (s *gcsAPIShim) Bucket(name string) gcsBucketHandle</a>

```
searchKey: uploadstore.gcsAPIShim.Bucket
tags: [private]
```

```Go
func (s *gcsAPIShim) Bucket(name string) gcsBucketHandle
```

### <a id="bucketHandleShim" href="#bucketHandleShim">type bucketHandleShim struct</a>

```
searchKey: uploadstore.bucketHandleShim
tags: [private]
```

```Go
type bucketHandleShim struct{ handle *storage.BucketHandle }
```

#### <a id="bucketHandleShim.Attrs" href="#bucketHandleShim.Attrs">func (s *bucketHandleShim) Attrs(ctx context.Context) (*storage.BucketAttrs, error)</a>

```
searchKey: uploadstore.bucketHandleShim.Attrs
tags: [private]
```

```Go
func (s *bucketHandleShim) Attrs(ctx context.Context) (*storage.BucketAttrs, error)
```

#### <a id="bucketHandleShim.Create" href="#bucketHandleShim.Create">func (s *bucketHandleShim) Create(ctx context.Context, projectID string, attrs *storage.BucketAttrs) error</a>

```
searchKey: uploadstore.bucketHandleShim.Create
tags: [private]
```

```Go
func (s *bucketHandleShim) Create(ctx context.Context, projectID string, attrs *storage.BucketAttrs) error
```

#### <a id="bucketHandleShim.Update" href="#bucketHandleShim.Update">func (s *bucketHandleShim) Update(ctx context.Context, attrs storage.BucketAttrsToUpdate) error</a>

```
searchKey: uploadstore.bucketHandleShim.Update
tags: [private]
```

```Go
func (s *bucketHandleShim) Update(ctx context.Context, attrs storage.BucketAttrsToUpdate) error
```

#### <a id="bucketHandleShim.Object" href="#bucketHandleShim.Object">func (s *bucketHandleShim) Object(name string) gcsObjectHandle</a>

```
searchKey: uploadstore.bucketHandleShim.Object
tags: [private]
```

```Go
func (s *bucketHandleShim) Object(name string) gcsObjectHandle
```

### <a id="objectHandleShim" href="#objectHandleShim">type objectHandleShim struct</a>

```
searchKey: uploadstore.objectHandleShim
tags: [private]
```

```Go
type objectHandleShim struct{ handle *storage.ObjectHandle }
```

#### <a id="objectHandleShim.Delete" href="#objectHandleShim.Delete">func (s *objectHandleShim) Delete(ctx context.Context) error</a>

```
searchKey: uploadstore.objectHandleShim.Delete
tags: [private]
```

```Go
func (s *objectHandleShim) Delete(ctx context.Context) error
```

#### <a id="objectHandleShim.NewRangeReader" href="#objectHandleShim.NewRangeReader">func (s *objectHandleShim) NewRangeReader(ctx context.Context, offset, length int64) (io.ReadCloser, error)</a>

```
searchKey: uploadstore.objectHandleShim.NewRangeReader
tags: [private]
```

```Go
func (s *objectHandleShim) NewRangeReader(ctx context.Context, offset, length int64) (io.ReadCloser, error)
```

#### <a id="objectHandleShim.NewWriter" href="#objectHandleShim.NewWriter">func (s *objectHandleShim) NewWriter(ctx context.Context) io.WriteCloser</a>

```
searchKey: uploadstore.objectHandleShim.NewWriter
tags: [private]
```

```Go
func (s *objectHandleShim) NewWriter(ctx context.Context) io.WriteCloser
```

#### <a id="objectHandleShim.ComposerFrom" href="#objectHandleShim.ComposerFrom">func (s *objectHandleShim) ComposerFrom(sources ...gcsObjectHandle) gcsComposer</a>

```
searchKey: uploadstore.objectHandleShim.ComposerFrom
tags: [private]
```

```Go
func (s *objectHandleShim) ComposerFrom(sources ...gcsObjectHandle) gcsComposer
```

### <a id="composerShim" href="#composerShim">type composerShim struct</a>

```
searchKey: uploadstore.composerShim
tags: [private]
```

```Go
type composerShim struct {
	handle  *storage.ObjectHandle
	sources []*storage.ObjectHandle
}
```

#### <a id="composerShim.Run" href="#composerShim.Run">func (s *composerShim) Run(ctx context.Context) (*storage.ObjectAttrs, error)</a>

```
searchKey: uploadstore.composerShim.Run
tags: [private]
```

```Go
func (s *composerShim) Run(ctx context.Context) (*storage.ObjectAttrs, error)
```

### <a id="gcsStore" href="#gcsStore">type gcsStore struct</a>

```
searchKey: uploadstore.gcsStore
tags: [private]
```

```Go
type gcsStore struct {
	bucket       string
	ttl          time.Duration
	manageBucket bool
	config       GCSConfig
	client       gcsAPI
	operations   *operations
}
```

#### <a id="newGCSWithClient" href="#newGCSWithClient">func newGCSWithClient(client gcsAPI, bucket string, ttl time.Duration, manageBucket bool, config GCSConfig, operations *operations) *gcsStore</a>

```
searchKey: uploadstore.newGCSWithClient
tags: [private]
```

```Go
func newGCSWithClient(client gcsAPI, bucket string, ttl time.Duration, manageBucket bool, config GCSConfig, operations *operations) *gcsStore
```

#### <a id="rawGCSClient" href="#rawGCSClient">func rawGCSClient(client gcsAPI, manageBucket bool) *gcsStore</a>

```
searchKey: uploadstore.rawGCSClient
tags: [private]
```

```Go
func rawGCSClient(client gcsAPI, manageBucket bool) *gcsStore
```

#### <a id="gcsStore.Init" href="#gcsStore.Init">func (s *gcsStore) Init(ctx context.Context) error</a>

```
searchKey: uploadstore.gcsStore.Init
tags: [private]
```

```Go
func (s *gcsStore) Init(ctx context.Context) error
```

#### <a id="gcsStore.Get" href="#gcsStore.Get">func (s *gcsStore) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)</a>

```
searchKey: uploadstore.gcsStore.Get
tags: [private]
```

```Go
func (s *gcsStore) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)
```

#### <a id="gcsStore.Upload" href="#gcsStore.Upload">func (s *gcsStore) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)</a>

```
searchKey: uploadstore.gcsStore.Upload
tags: [private]
```

```Go
func (s *gcsStore) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)
```

#### <a id="gcsStore.Compose" href="#gcsStore.Compose">func (s *gcsStore) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)</a>

```
searchKey: uploadstore.gcsStore.Compose
tags: [private]
```

```Go
func (s *gcsStore) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)
```

#### <a id="gcsStore.Delete" href="#gcsStore.Delete">func (s *gcsStore) Delete(ctx context.Context, key string) (err error)</a>

```
searchKey: uploadstore.gcsStore.Delete
tags: [private]
```

```Go
func (s *gcsStore) Delete(ctx context.Context, key string) (err error)
```

#### <a id="gcsStore.create" href="#gcsStore.create">func (s *gcsStore) create(ctx context.Context, bucket gcsBucketHandle) error</a>

```
searchKey: uploadstore.gcsStore.create
tags: [private]
```

```Go
func (s *gcsStore) create(ctx context.Context, bucket gcsBucketHandle) error
```

#### <a id="gcsStore.update" href="#gcsStore.update">func (s *gcsStore) update(ctx context.Context, bucket gcsBucketHandle) error</a>

```
searchKey: uploadstore.gcsStore.update
tags: [private]
```

```Go
func (s *gcsStore) update(ctx context.Context, bucket gcsBucketHandle) error
```

#### <a id="gcsStore.lifecycle" href="#gcsStore.lifecycle">func (s *gcsStore) lifecycle() storage.Lifecycle</a>

```
searchKey: uploadstore.gcsStore.lifecycle
tags: [private]
```

```Go
func (s *gcsStore) lifecycle() storage.Lifecycle
```

#### <a id="gcsStore.deleteSources" href="#gcsStore.deleteSources">func (s *gcsStore) deleteSources(ctx context.Context, bucket gcsBucketHandle, sources []string) error</a>

```
searchKey: uploadstore.gcsStore.deleteSources
tags: [private]
```

```Go
func (s *gcsStore) deleteSources(ctx context.Context, bucket gcsBucketHandle, sources []string) error
```

### <a id="GCSConfig" href="#GCSConfig">type GCSConfig struct</a>

```
searchKey: uploadstore.GCSConfig
```

```Go
type GCSConfig struct {
	ProjectID               string
	CredentialsFile         string
	CredentialsFileContents string
}
```

#### <a id="GCSConfig.load" href="#GCSConfig.load">func (c *GCSConfig) load(parent *env.BaseConfig)</a>

```
searchKey: uploadstore.GCSConfig.load
tags: [private]
```

```Go
func (c *GCSConfig) load(parent *env.BaseConfig)
```

### <a id="lazyStore" href="#lazyStore">type lazyStore struct</a>

```
searchKey: uploadstore.lazyStore
tags: [private]
```

```Go
type lazyStore struct {
	store       Store
	m           sync.RWMutex
	initialized bool
}
```

#### <a id="lazyStore.Init" href="#lazyStore.Init">func (s *lazyStore) Init(ctx context.Context) error</a>

```
searchKey: uploadstore.lazyStore.Init
tags: [private]
```

```Go
func (s *lazyStore) Init(ctx context.Context) error
```

#### <a id="lazyStore.Get" href="#lazyStore.Get">func (s *lazyStore) Get(ctx context.Context, key string) (io.ReadCloser, error)</a>

```
searchKey: uploadstore.lazyStore.Get
tags: [private]
```

```Go
func (s *lazyStore) Get(ctx context.Context, key string) (io.ReadCloser, error)
```

#### <a id="lazyStore.Upload" href="#lazyStore.Upload">func (s *lazyStore) Upload(ctx context.Context, key string, r io.Reader) (int64, error)</a>

```
searchKey: uploadstore.lazyStore.Upload
tags: [private]
```

```Go
func (s *lazyStore) Upload(ctx context.Context, key string, r io.Reader) (int64, error)
```

#### <a id="lazyStore.Compose" href="#lazyStore.Compose">func (s *lazyStore) Compose(ctx context.Context, destination string, sources ...string) (int64, error)</a>

```
searchKey: uploadstore.lazyStore.Compose
tags: [private]
```

```Go
func (s *lazyStore) Compose(ctx context.Context, destination string, sources ...string) (int64, error)
```

#### <a id="lazyStore.Delete" href="#lazyStore.Delete">func (s *lazyStore) Delete(ctx context.Context, key string) error</a>

```
searchKey: uploadstore.lazyStore.Delete
tags: [private]
```

```Go
func (s *lazyStore) Delete(ctx context.Context, key string) error
```

#### <a id="lazyStore.initOnce" href="#lazyStore.initOnce">func (s *lazyStore) initOnce(ctx context.Context) error</a>

```
searchKey: uploadstore.lazyStore.initOnce
tags: [private]
```

```Go
func (s *lazyStore) initOnce(ctx context.Context) error
```

initOnce serializes access to the underlying store's Init method. If the Init method completes successfully, all future calls to this function will no-op. 

### <a id="operations" href="#operations">type operations struct</a>

```
searchKey: uploadstore.operations
tags: [private]
```

```Go
type operations struct {
	get     *observation.Operation
	upload  *observation.Operation
	compose *observation.Operation
	delete  *observation.Operation
}
```

#### <a id="newOperations" href="#newOperations">func newOperations(observationContext *observation.Context) *operations</a>

```
searchKey: uploadstore.newOperations
tags: [private]
```

```Go
func newOperations(observationContext *observation.Context) *operations
```

### <a id="s3API" href="#s3API">type s3API interface</a>

```
searchKey: uploadstore.s3API
tags: [private]
```

```Go
type s3API interface {
	HeadObject(ctx context.Context, input *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
	GetObject(ctx context.Context, input *s3.GetObjectInput) (*s3.GetObjectOutput, error)
	CreateMultipartUpload(ctx context.Context, input *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
	AbortMultipartUpload(ctx context.Context, input *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
	DeleteObject(ctx context.Context, input *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
	UploadPartCopy(ctx context.Context, input *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
	CompleteMultipartUpload(ctx context.Context, input *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
	CreateBucket(ctx context.Context, input *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
	PutBucketLifecycleConfiguration(ctx context.Context, input *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
}
```

### <a id="s3Uploader" href="#s3Uploader">type s3Uploader interface</a>

```
searchKey: uploadstore.s3Uploader
tags: [private]
```

```Go
type s3Uploader interface {
	Upload(ctx context.Context, input *s3.PutObjectInput) error
}
```

### <a id="s3APIShim" href="#s3APIShim">type s3APIShim struct</a>

```
searchKey: uploadstore.s3APIShim
tags: [private]
```

```Go
type s3APIShim struct{ *s3.Client }
```

#### <a id="s3APIShim.CreateBucket" href="#s3APIShim.CreateBucket">func (s *s3APIShim) CreateBucket(ctx context.Context, input *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.CreateBucket
tags: [private]
```

```Go
func (s *s3APIShim) CreateBucket(ctx context.Context, input *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
```

#### <a id="s3APIShim.PutBucketLifecycleConfiguration" href="#s3APIShim.PutBucketLifecycleConfiguration">func (s *s3APIShim) PutBucketLifecycleConfiguration(ctx context.Context, input *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.PutBucketLifecycleConfiguration
tags: [private]
```

```Go
func (s *s3APIShim) PutBucketLifecycleConfiguration(ctx context.Context, input *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
```

#### <a id="s3APIShim.HeadObject" href="#s3APIShim.HeadObject">func (s *s3APIShim) HeadObject(ctx context.Context, input *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.HeadObject
tags: [private]
```

```Go
func (s *s3APIShim) HeadObject(ctx context.Context, input *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
```

#### <a id="s3APIShim.GetObject" href="#s3APIShim.GetObject">func (s *s3APIShim) GetObject(ctx context.Context, input *s3.GetObjectInput) (*s3.GetObjectOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.GetObject
tags: [private]
```

```Go
func (s *s3APIShim) GetObject(ctx context.Context, input *s3.GetObjectInput) (*s3.GetObjectOutput, error)
```

#### <a id="s3APIShim.DeleteObject" href="#s3APIShim.DeleteObject">func (s *s3APIShim) DeleteObject(ctx context.Context, input *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.DeleteObject
tags: [private]
```

```Go
func (s *s3APIShim) DeleteObject(ctx context.Context, input *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
```

#### <a id="s3APIShim.CreateMultipartUpload" href="#s3APIShim.CreateMultipartUpload">func (s *s3APIShim) CreateMultipartUpload(ctx context.Context, input *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.CreateMultipartUpload
tags: [private]
```

```Go
func (s *s3APIShim) CreateMultipartUpload(ctx context.Context, input *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
```

#### <a id="s3APIShim.AbortMultipartUpload" href="#s3APIShim.AbortMultipartUpload">func (s *s3APIShim) AbortMultipartUpload(ctx context.Context, input *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.AbortMultipartUpload
tags: [private]
```

```Go
func (s *s3APIShim) AbortMultipartUpload(ctx context.Context, input *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
```

#### <a id="s3APIShim.UploadPartCopy" href="#s3APIShim.UploadPartCopy">func (s *s3APIShim) UploadPartCopy(ctx context.Context, input *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.UploadPartCopy
tags: [private]
```

```Go
func (s *s3APIShim) UploadPartCopy(ctx context.Context, input *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
```

#### <a id="s3APIShim.CompleteMultipartUpload" href="#s3APIShim.CompleteMultipartUpload">func (s *s3APIShim) CompleteMultipartUpload(ctx context.Context, input *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.s3APIShim.CompleteMultipartUpload
tags: [private]
```

```Go
func (s *s3APIShim) CompleteMultipartUpload(ctx context.Context, input *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
```

### <a id="s3UploaderShim" href="#s3UploaderShim">type s3UploaderShim struct</a>

```
searchKey: uploadstore.s3UploaderShim
tags: [private]
```

```Go
type s3UploaderShim struct{ *manager.Uploader }
```

#### <a id="s3UploaderShim.Upload" href="#s3UploaderShim.Upload">func (s *s3UploaderShim) Upload(ctx context.Context, input *s3.PutObjectInput) error</a>

```
searchKey: uploadstore.s3UploaderShim.Upload
tags: [private]
```

```Go
func (s *s3UploaderShim) Upload(ctx context.Context, input *s3.PutObjectInput) error
```

### <a id="s3Store" href="#s3Store">type s3Store struct</a>

```
searchKey: uploadstore.s3Store
tags: [private]
```

```Go
type s3Store struct {
	bucket                       string
	manageBucket                 bool
	client                       s3API
	uploader                     s3Uploader
	bucketLifecycleConfiguration *s3types.BucketLifecycleConfiguration
	operations                   *operations
}
```

#### <a id="newS3WithClients" href="#newS3WithClients">func newS3WithClients(client s3API, uploader s3Uploader, bucket string, manageBucket bool, lifecycleConfiguration *s3types.BucketLifecycleConfiguration, operations *operations) *s3Store</a>

```
searchKey: uploadstore.newS3WithClients
tags: [private]
```

```Go
func newS3WithClients(client s3API, uploader s3Uploader, bucket string, manageBucket bool, lifecycleConfiguration *s3types.BucketLifecycleConfiguration, operations *operations) *s3Store
```

#### <a id="rawS3Client" href="#rawS3Client">func rawS3Client(client s3API, uploader s3Uploader) *s3Store</a>

```
searchKey: uploadstore.rawS3Client
tags: [private]
```

```Go
func rawS3Client(client s3API, uploader s3Uploader) *s3Store
```

#### <a id="s3Store.Init" href="#s3Store.Init">func (s *s3Store) Init(ctx context.Context) error</a>

```
searchKey: uploadstore.s3Store.Init
tags: [private]
```

```Go
func (s *s3Store) Init(ctx context.Context) error
```

#### <a id="s3Store.Get" href="#s3Store.Get">func (s *s3Store) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)</a>

```
searchKey: uploadstore.s3Store.Get
tags: [private]
```

```Go
func (s *s3Store) Get(ctx context.Context, key string) (_ io.ReadCloser, err error)
```

#### <a id="s3Store.readObjectInto" href="#s3Store.readObjectInto">func (s *s3Store) readObjectInto(ctx context.Context, w io.Writer, key string, byteOffset int64) (int64, error)</a>

```
searchKey: uploadstore.s3Store.readObjectInto
tags: [private]
```

```Go
func (s *s3Store) readObjectInto(ctx context.Context, w io.Writer, key string, byteOffset int64) (int64, error)
```

readObjectInto reads the content of the given key starting at the given byte offset into the given writer. The number of bytes read is returned. On successful read, the error value is nil. 

#### <a id="s3Store.Upload" href="#s3Store.Upload">func (s *s3Store) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)</a>

```
searchKey: uploadstore.s3Store.Upload
tags: [private]
```

```Go
func (s *s3Store) Upload(ctx context.Context, key string, r io.Reader) (_ int64, err error)
```

#### <a id="s3Store.Compose" href="#s3Store.Compose">func (s *s3Store) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)</a>

```
searchKey: uploadstore.s3Store.Compose
tags: [private]
```

```Go
func (s *s3Store) Compose(ctx context.Context, destination string, sources ...string) (_ int64, err error)
```

#### <a id="s3Store.Delete" href="#s3Store.Delete">func (s *s3Store) Delete(ctx context.Context, key string) (err error)</a>

```
searchKey: uploadstore.s3Store.Delete
tags: [private]
```

```Go
func (s *s3Store) Delete(ctx context.Context, key string) (err error)
```

#### <a id="s3Store.create" href="#s3Store.create">func (s *s3Store) create(ctx context.Context) error</a>

```
searchKey: uploadstore.s3Store.create
tags: [private]
```

```Go
func (s *s3Store) create(ctx context.Context) error
```

#### <a id="s3Store.update" href="#s3Store.update">func (s *s3Store) update(ctx context.Context) error</a>

```
searchKey: uploadstore.s3Store.update
tags: [private]
```

```Go
func (s *s3Store) update(ctx context.Context) error
```

#### <a id="s3Store.deleteSources" href="#s3Store.deleteSources">func (s *s3Store) deleteSources(ctx context.Context, bucket string, sources []string) error</a>

```
searchKey: uploadstore.s3Store.deleteSources
tags: [private]
```

```Go
func (s *s3Store) deleteSources(ctx context.Context, bucket string, sources []string) error
```

### <a id="S3Config" href="#S3Config">type S3Config struct</a>

```
searchKey: uploadstore.S3Config
```

```Go
type S3Config struct {
	Region          string
	Endpoint        string
	AccessKeyID     string
	SecretAccessKey string
	SessionToken    string
}
```

#### <a id="S3Config.load" href="#S3Config.load">func (c *S3Config) load(parent *env.BaseConfig)</a>

```
searchKey: uploadstore.S3Config.load
tags: [private]
```

```Go
func (c *S3Config) load(parent *env.BaseConfig)
```

### <a id="countingReader" href="#countingReader">type countingReader struct</a>

```
searchKey: uploadstore.countingReader
tags: [private]
```

```Go
type countingReader struct {
	r io.Reader
	n int
}
```

countingReader is an io.Reader that counts the number of bytes sent back to the caller. 

#### <a id="countingReader.Read" href="#countingReader.Read">func (r *countingReader) Read(p []byte) (n int, err error)</a>

```
searchKey: uploadstore.countingReader.Read
tags: [private]
```

```Go
func (r *countingReader) Read(p []byte) (n int, err error)
```

### <a id="Store" href="#Store">type Store interface</a>

```
searchKey: uploadstore.Store
```

```Go
type Store interface {
	// Init ensures that the underlying target bucket exists and has the expected ACL
	// and lifecycle configuration.
	Init(ctx context.Context) error

	// Get returns a reader that streams the content of the object at the given key.
	Get(ctx context.Context, key string) (io.ReadCloser, error)

	// Upload writes the content in the given reader to the object at the given key.
	Upload(ctx context.Context, key string, r io.Reader) (int64, error)

	// Compose will concatenate the given source objects together and write to the given
	// destination object. The source objects will be removed if the composed write is
	// successful.
	Compose(ctx context.Context, destination string, sources ...string) (int64, error)

	// Delete removes the content at the given key.
	Delete(ctx context.Context, key string) error
}
```

Store is an expiring key/value store backed by a managed blob store. 

#### <a id="newGCSFromConfig" href="#newGCSFromConfig">func newGCSFromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)</a>

```
searchKey: uploadstore.newGCSFromConfig
tags: [private]
```

```Go
func newGCSFromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)
```

newGCSFromConfig creates a new store backed by GCP storage. 

#### <a id="newLazyStore" href="#newLazyStore">func newLazyStore(store Store) Store</a>

```
searchKey: uploadstore.newLazyStore
tags: [private]
```

```Go
func newLazyStore(store Store) Store
```

#### <a id="newS3FromConfig" href="#newS3FromConfig">func newS3FromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)</a>

```
searchKey: uploadstore.newS3FromConfig
tags: [private]
```

```Go
func newS3FromConfig(ctx context.Context, config *Config, operations *operations) (Store, error)
```

newS3FromConfig creates a new store backed by AWS Simple Storage Service. 

#### <a id="CreateLazy" href="#CreateLazy">func CreateLazy(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)</a>

```
searchKey: uploadstore.CreateLazy
```

```Go
func CreateLazy(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)
```

CreateLazy initialize a new store from the given configuration that is initialized on it first method call. If initialization fails, all methods calls will return a the initialization error. 

#### <a id="create" href="#create">func create(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)</a>

```
searchKey: uploadstore.create
tags: [private]
```

```Go
func create(ctx context.Context, config *Config, observationContext *observation.Context) (Store, error)
```

create creates but does not initialize a new store from the given configuration. 

#### <a id="testGCSClient" href="#testGCSClient">func testGCSClient(client gcsAPI, manageBucket bool) Store</a>

```
searchKey: uploadstore.testGCSClient
tags: [private]
```

```Go
func testGCSClient(client gcsAPI, manageBucket bool) Store
```

#### <a id="testS3Client" href="#testS3Client">func testS3Client(client s3API, uploader s3Uploader) Store</a>

```
searchKey: uploadstore.testS3Client
tags: [private]
```

```Go
func testS3Client(client s3API, uploader s3Uploader) Store
```

### <a id="nopCloser" href="#nopCloser">type nopCloser struct</a>

```
searchKey: uploadstore.nopCloser
tags: [private]
```

```Go
type nopCloser struct {
	io.Writer
}
```

#### <a id="nopCloser.Close" href="#nopCloser.Close">func (nopCloser) Close() error</a>

```
searchKey: uploadstore.nopCloser.Close
tags: [private]
```

```Go
func (nopCloser) Close() error
```

### <a id="MockGcsAPI" href="#MockGcsAPI">type MockGcsAPI struct</a>

```
searchKey: uploadstore.MockGcsAPI
tags: [private]
```

```Go
type MockGcsAPI struct {
	// BucketFunc is an instance of a mock function object controlling the
	// behavior of the method Bucket.
	BucketFunc *GcsAPIBucketFunc
}
```

MockGcsAPI is a mock implementation of the gcsAPI interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockGcsAPI" href="#NewMockGcsAPI">func NewMockGcsAPI() *MockGcsAPI</a>

```
searchKey: uploadstore.NewMockGcsAPI
tags: [private]
```

```Go
func NewMockGcsAPI() *MockGcsAPI
```

NewMockGcsAPI creates a new mock of the gcsAPI interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGcsAPIFrom" href="#NewMockGcsAPIFrom">func NewMockGcsAPIFrom(i surrogateMockGcsAPI) *MockGcsAPI</a>

```
searchKey: uploadstore.NewMockGcsAPIFrom
tags: [private]
```

```Go
func NewMockGcsAPIFrom(i surrogateMockGcsAPI) *MockGcsAPI
```

NewMockGcsAPIFrom creates a new mock of the MockGcsAPI interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGcsAPI.Bucket" href="#MockGcsAPI.Bucket">func (m *MockGcsAPI) Bucket(v0 string) gcsBucketHandle</a>

```
searchKey: uploadstore.MockGcsAPI.Bucket
tags: [private]
```

```Go
func (m *MockGcsAPI) Bucket(v0 string) gcsBucketHandle
```

Bucket delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockGcsAPI" href="#surrogateMockGcsAPI">type surrogateMockGcsAPI interface</a>

```
searchKey: uploadstore.surrogateMockGcsAPI
tags: [private]
```

```Go
type surrogateMockGcsAPI interface {
	Bucket(string) gcsBucketHandle
}
```

surrogateMockGcsAPI is a copy of the gcsAPI interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="GcsAPIBucketFunc" href="#GcsAPIBucketFunc">type GcsAPIBucketFunc struct</a>

```
searchKey: uploadstore.GcsAPIBucketFunc
tags: [private]
```

```Go
type GcsAPIBucketFunc struct {
	defaultHook func(string) gcsBucketHandle
	hooks       []func(string) gcsBucketHandle
	history     []GcsAPIBucketFuncCall
	mutex       sync.Mutex
}
```

GcsAPIBucketFunc describes the behavior when the Bucket method of the parent MockGcsAPI instance is invoked. 

#### <a id="GcsAPIBucketFunc.SetDefaultHook" href="#GcsAPIBucketFunc.SetDefaultHook">func (f *GcsAPIBucketFunc) SetDefaultHook(hook func(string) gcsBucketHandle)</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) SetDefaultHook(hook func(string) gcsBucketHandle)
```

SetDefaultHook sets function that is called when the Bucket method of the parent MockGcsAPI instance is invoked and the hook queue is empty. 

#### <a id="GcsAPIBucketFunc.PushHook" href="#GcsAPIBucketFunc.PushHook">func (f *GcsAPIBucketFunc) PushHook(hook func(string) gcsBucketHandle)</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.PushHook
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) PushHook(hook func(string) gcsBucketHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Bucket method of the parent MockGcsAPI instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsAPIBucketFunc.SetDefaultReturn" href="#GcsAPIBucketFunc.SetDefaultReturn">func (f *GcsAPIBucketFunc) SetDefaultReturn(r0 gcsBucketHandle)</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) SetDefaultReturn(r0 gcsBucketHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsAPIBucketFunc.PushReturn" href="#GcsAPIBucketFunc.PushReturn">func (f *GcsAPIBucketFunc) PushReturn(r0 gcsBucketHandle)</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) PushReturn(r0 gcsBucketHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsAPIBucketFunc.nextHook" href="#GcsAPIBucketFunc.nextHook">func (f *GcsAPIBucketFunc) nextHook() func(string) gcsBucketHandle</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.nextHook
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) nextHook() func(string) gcsBucketHandle
```

#### <a id="GcsAPIBucketFunc.appendCall" href="#GcsAPIBucketFunc.appendCall">func (f *GcsAPIBucketFunc) appendCall(r0 GcsAPIBucketFuncCall)</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.appendCall
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) appendCall(r0 GcsAPIBucketFuncCall)
```

#### <a id="GcsAPIBucketFunc.History" href="#GcsAPIBucketFunc.History">func (f *GcsAPIBucketFunc) History() []GcsAPIBucketFuncCall</a>

```
searchKey: uploadstore.GcsAPIBucketFunc.History
tags: [private]
```

```Go
func (f *GcsAPIBucketFunc) History() []GcsAPIBucketFuncCall
```

History returns a sequence of GcsAPIBucketFuncCall objects describing the invocations of this function. 

### <a id="GcsAPIBucketFuncCall" href="#GcsAPIBucketFuncCall">type GcsAPIBucketFuncCall struct</a>

```
searchKey: uploadstore.GcsAPIBucketFuncCall
tags: [private]
```

```Go
type GcsAPIBucketFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 gcsBucketHandle
}
```

GcsAPIBucketFuncCall is an object that describes an invocation of method Bucket on an instance of MockGcsAPI. 

#### <a id="GcsAPIBucketFuncCall.Args" href="#GcsAPIBucketFuncCall.Args">func (c GcsAPIBucketFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsAPIBucketFuncCall.Args
tags: [private]
```

```Go
func (c GcsAPIBucketFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsAPIBucketFuncCall.Results" href="#GcsAPIBucketFuncCall.Results">func (c GcsAPIBucketFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsAPIBucketFuncCall.Results
tags: [private]
```

```Go
func (c GcsAPIBucketFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockGcsBucketHandle" href="#MockGcsBucketHandle">type MockGcsBucketHandle struct</a>

```
searchKey: uploadstore.MockGcsBucketHandle
tags: [private]
```

```Go
type MockGcsBucketHandle struct {
	// AttrsFunc is an instance of a mock function object controlling the
	// behavior of the method Attrs.
	AttrsFunc *GcsBucketHandleAttrsFunc
	// CreateFunc is an instance of a mock function object controlling the
	// behavior of the method Create.
	CreateFunc *GcsBucketHandleCreateFunc
	// ObjectFunc is an instance of a mock function object controlling the
	// behavior of the method Object.
	ObjectFunc *GcsBucketHandleObjectFunc
	// UpdateFunc is an instance of a mock function object controlling the
	// behavior of the method Update.
	UpdateFunc *GcsBucketHandleUpdateFunc
}
```

MockGcsBucketHandle is a mock implementation of the gcsBucketHandle interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockGcsBucketHandle" href="#NewMockGcsBucketHandle">func NewMockGcsBucketHandle() *MockGcsBucketHandle</a>

```
searchKey: uploadstore.NewMockGcsBucketHandle
tags: [private]
```

```Go
func NewMockGcsBucketHandle() *MockGcsBucketHandle
```

NewMockGcsBucketHandle creates a new mock of the gcsBucketHandle interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGcsBucketHandleFrom" href="#NewMockGcsBucketHandleFrom">func NewMockGcsBucketHandleFrom(i surrogateMockGcsBucketHandle) *MockGcsBucketHandle</a>

```
searchKey: uploadstore.NewMockGcsBucketHandleFrom
tags: [private]
```

```Go
func NewMockGcsBucketHandleFrom(i surrogateMockGcsBucketHandle) *MockGcsBucketHandle
```

NewMockGcsBucketHandleFrom creates a new mock of the MockGcsBucketHandle interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGcsBucketHandle.Attrs" href="#MockGcsBucketHandle.Attrs">func (m *MockGcsBucketHandle) Attrs(v0 context.Context) (*storage.BucketAttrs, error)</a>

```
searchKey: uploadstore.MockGcsBucketHandle.Attrs
tags: [private]
```

```Go
func (m *MockGcsBucketHandle) Attrs(v0 context.Context) (*storage.BucketAttrs, error)
```

Attrs delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsBucketHandle.Create" href="#MockGcsBucketHandle.Create">func (m *MockGcsBucketHandle) Create(v0 context.Context, v1 string, v2 *storage.BucketAttrs) error</a>

```
searchKey: uploadstore.MockGcsBucketHandle.Create
tags: [private]
```

```Go
func (m *MockGcsBucketHandle) Create(v0 context.Context, v1 string, v2 *storage.BucketAttrs) error
```

Create delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsBucketHandle.Object" href="#MockGcsBucketHandle.Object">func (m *MockGcsBucketHandle) Object(v0 string) gcsObjectHandle</a>

```
searchKey: uploadstore.MockGcsBucketHandle.Object
tags: [private]
```

```Go
func (m *MockGcsBucketHandle) Object(v0 string) gcsObjectHandle
```

Object delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsBucketHandle.Update" href="#MockGcsBucketHandle.Update">func (m *MockGcsBucketHandle) Update(v0 context.Context, v1 storage.BucketAttrsToUpdate) error</a>

```
searchKey: uploadstore.MockGcsBucketHandle.Update
tags: [private]
```

```Go
func (m *MockGcsBucketHandle) Update(v0 context.Context, v1 storage.BucketAttrsToUpdate) error
```

Update delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockGcsBucketHandle" href="#surrogateMockGcsBucketHandle">type surrogateMockGcsBucketHandle interface</a>

```
searchKey: uploadstore.surrogateMockGcsBucketHandle
tags: [private]
```

```Go
type surrogateMockGcsBucketHandle interface {
	Attrs(context.Context) (*storage.BucketAttrs, error)
	Create(context.Context, string, *storage.BucketAttrs) error
	Object(string) gcsObjectHandle
	Update(context.Context, storage.BucketAttrsToUpdate) error
}
```

surrogateMockGcsBucketHandle is a copy of the gcsBucketHandle interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="GcsBucketHandleAttrsFunc" href="#GcsBucketHandleAttrsFunc">type GcsBucketHandleAttrsFunc struct</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc
tags: [private]
```

```Go
type GcsBucketHandleAttrsFunc struct {
	defaultHook func(context.Context) (*storage.BucketAttrs, error)
	hooks       []func(context.Context) (*storage.BucketAttrs, error)
	history     []GcsBucketHandleAttrsFuncCall
	mutex       sync.Mutex
}
```

GcsBucketHandleAttrsFunc describes the behavior when the Attrs method of the parent MockGcsBucketHandle instance is invoked. 

#### <a id="GcsBucketHandleAttrsFunc.SetDefaultHook" href="#GcsBucketHandleAttrsFunc.SetDefaultHook">func (f *GcsBucketHandleAttrsFunc) SetDefaultHook(hook func(context.Context) (*storage.BucketAttrs, error))</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) SetDefaultHook(hook func(context.Context) (*storage.BucketAttrs, error))
```

SetDefaultHook sets function that is called when the Attrs method of the parent MockGcsBucketHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsBucketHandleAttrsFunc.PushHook" href="#GcsBucketHandleAttrsFunc.PushHook">func (f *GcsBucketHandleAttrsFunc) PushHook(hook func(context.Context) (*storage.BucketAttrs, error))</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.PushHook
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) PushHook(hook func(context.Context) (*storage.BucketAttrs, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Attrs method of the parent MockGcsBucketHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsBucketHandleAttrsFunc.SetDefaultReturn" href="#GcsBucketHandleAttrsFunc.SetDefaultReturn">func (f *GcsBucketHandleAttrsFunc) SetDefaultReturn(r0 *storage.BucketAttrs, r1 error)</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) SetDefaultReturn(r0 *storage.BucketAttrs, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleAttrsFunc.PushReturn" href="#GcsBucketHandleAttrsFunc.PushReturn">func (f *GcsBucketHandleAttrsFunc) PushReturn(r0 *storage.BucketAttrs, r1 error)</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) PushReturn(r0 *storage.BucketAttrs, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleAttrsFunc.nextHook" href="#GcsBucketHandleAttrsFunc.nextHook">func (f *GcsBucketHandleAttrsFunc) nextHook() func(context.Context) (*storage.BucketAttrs, error)</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.nextHook
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) nextHook() func(context.Context) (*storage.BucketAttrs, error)
```

#### <a id="GcsBucketHandleAttrsFunc.appendCall" href="#GcsBucketHandleAttrsFunc.appendCall">func (f *GcsBucketHandleAttrsFunc) appendCall(r0 GcsBucketHandleAttrsFuncCall)</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.appendCall
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) appendCall(r0 GcsBucketHandleAttrsFuncCall)
```

#### <a id="GcsBucketHandleAttrsFunc.History" href="#GcsBucketHandleAttrsFunc.History">func (f *GcsBucketHandleAttrsFunc) History() []GcsBucketHandleAttrsFuncCall</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFunc.History
tags: [private]
```

```Go
func (f *GcsBucketHandleAttrsFunc) History() []GcsBucketHandleAttrsFuncCall
```

History returns a sequence of GcsBucketHandleAttrsFuncCall objects describing the invocations of this function. 

### <a id="GcsBucketHandleAttrsFuncCall" href="#GcsBucketHandleAttrsFuncCall">type GcsBucketHandleAttrsFuncCall struct</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFuncCall
tags: [private]
```

```Go
type GcsBucketHandleAttrsFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *storage.BucketAttrs
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GcsBucketHandleAttrsFuncCall is an object that describes an invocation of method Attrs on an instance of MockGcsBucketHandle. 

#### <a id="GcsBucketHandleAttrsFuncCall.Args" href="#GcsBucketHandleAttrsFuncCall.Args">func (c GcsBucketHandleAttrsFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFuncCall.Args
tags: [private]
```

```Go
func (c GcsBucketHandleAttrsFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsBucketHandleAttrsFuncCall.Results" href="#GcsBucketHandleAttrsFuncCall.Results">func (c GcsBucketHandleAttrsFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleAttrsFuncCall.Results
tags: [private]
```

```Go
func (c GcsBucketHandleAttrsFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsBucketHandleCreateFunc" href="#GcsBucketHandleCreateFunc">type GcsBucketHandleCreateFunc struct</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc
tags: [private]
```

```Go
type GcsBucketHandleCreateFunc struct {
	defaultHook func(context.Context, string, *storage.BucketAttrs) error
	hooks       []func(context.Context, string, *storage.BucketAttrs) error
	history     []GcsBucketHandleCreateFuncCall
	mutex       sync.Mutex
}
```

GcsBucketHandleCreateFunc describes the behavior when the Create method of the parent MockGcsBucketHandle instance is invoked. 

#### <a id="GcsBucketHandleCreateFunc.SetDefaultHook" href="#GcsBucketHandleCreateFunc.SetDefaultHook">func (f *GcsBucketHandleCreateFunc) SetDefaultHook(hook func(context.Context, string, *storage.BucketAttrs) error)</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) SetDefaultHook(hook func(context.Context, string, *storage.BucketAttrs) error)
```

SetDefaultHook sets function that is called when the Create method of the parent MockGcsBucketHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsBucketHandleCreateFunc.PushHook" href="#GcsBucketHandleCreateFunc.PushHook">func (f *GcsBucketHandleCreateFunc) PushHook(hook func(context.Context, string, *storage.BucketAttrs) error)</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.PushHook
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) PushHook(hook func(context.Context, string, *storage.BucketAttrs) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Create method of the parent MockGcsBucketHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsBucketHandleCreateFunc.SetDefaultReturn" href="#GcsBucketHandleCreateFunc.SetDefaultReturn">func (f *GcsBucketHandleCreateFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleCreateFunc.PushReturn" href="#GcsBucketHandleCreateFunc.PushReturn">func (f *GcsBucketHandleCreateFunc) PushReturn(r0 error)</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleCreateFunc.nextHook" href="#GcsBucketHandleCreateFunc.nextHook">func (f *GcsBucketHandleCreateFunc) nextHook() func(context.Context, string, *storage.BucketAttrs) error</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.nextHook
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) nextHook() func(context.Context, string, *storage.BucketAttrs) error
```

#### <a id="GcsBucketHandleCreateFunc.appendCall" href="#GcsBucketHandleCreateFunc.appendCall">func (f *GcsBucketHandleCreateFunc) appendCall(r0 GcsBucketHandleCreateFuncCall)</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.appendCall
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) appendCall(r0 GcsBucketHandleCreateFuncCall)
```

#### <a id="GcsBucketHandleCreateFunc.History" href="#GcsBucketHandleCreateFunc.History">func (f *GcsBucketHandleCreateFunc) History() []GcsBucketHandleCreateFuncCall</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFunc.History
tags: [private]
```

```Go
func (f *GcsBucketHandleCreateFunc) History() []GcsBucketHandleCreateFuncCall
```

History returns a sequence of GcsBucketHandleCreateFuncCall objects describing the invocations of this function. 

### <a id="GcsBucketHandleCreateFuncCall" href="#GcsBucketHandleCreateFuncCall">type GcsBucketHandleCreateFuncCall struct</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFuncCall
tags: [private]
```

```Go
type GcsBucketHandleCreateFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 string
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 *storage.BucketAttrs
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

GcsBucketHandleCreateFuncCall is an object that describes an invocation of method Create on an instance of MockGcsBucketHandle. 

#### <a id="GcsBucketHandleCreateFuncCall.Args" href="#GcsBucketHandleCreateFuncCall.Args">func (c GcsBucketHandleCreateFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFuncCall.Args
tags: [private]
```

```Go
func (c GcsBucketHandleCreateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsBucketHandleCreateFuncCall.Results" href="#GcsBucketHandleCreateFuncCall.Results">func (c GcsBucketHandleCreateFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleCreateFuncCall.Results
tags: [private]
```

```Go
func (c GcsBucketHandleCreateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsBucketHandleObjectFunc" href="#GcsBucketHandleObjectFunc">type GcsBucketHandleObjectFunc struct</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc
tags: [private]
```

```Go
type GcsBucketHandleObjectFunc struct {
	defaultHook func(string) gcsObjectHandle
	hooks       []func(string) gcsObjectHandle
	history     []GcsBucketHandleObjectFuncCall
	mutex       sync.Mutex
}
```

GcsBucketHandleObjectFunc describes the behavior when the Object method of the parent MockGcsBucketHandle instance is invoked. 

#### <a id="GcsBucketHandleObjectFunc.SetDefaultHook" href="#GcsBucketHandleObjectFunc.SetDefaultHook">func (f *GcsBucketHandleObjectFunc) SetDefaultHook(hook func(string) gcsObjectHandle)</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) SetDefaultHook(hook func(string) gcsObjectHandle)
```

SetDefaultHook sets function that is called when the Object method of the parent MockGcsBucketHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsBucketHandleObjectFunc.PushHook" href="#GcsBucketHandleObjectFunc.PushHook">func (f *GcsBucketHandleObjectFunc) PushHook(hook func(string) gcsObjectHandle)</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.PushHook
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) PushHook(hook func(string) gcsObjectHandle)
```

PushHook adds a function to the end of hook queue. Each invocation of the Object method of the parent MockGcsBucketHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsBucketHandleObjectFunc.SetDefaultReturn" href="#GcsBucketHandleObjectFunc.SetDefaultReturn">func (f *GcsBucketHandleObjectFunc) SetDefaultReturn(r0 gcsObjectHandle)</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) SetDefaultReturn(r0 gcsObjectHandle)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleObjectFunc.PushReturn" href="#GcsBucketHandleObjectFunc.PushReturn">func (f *GcsBucketHandleObjectFunc) PushReturn(r0 gcsObjectHandle)</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) PushReturn(r0 gcsObjectHandle)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleObjectFunc.nextHook" href="#GcsBucketHandleObjectFunc.nextHook">func (f *GcsBucketHandleObjectFunc) nextHook() func(string) gcsObjectHandle</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.nextHook
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) nextHook() func(string) gcsObjectHandle
```

#### <a id="GcsBucketHandleObjectFunc.appendCall" href="#GcsBucketHandleObjectFunc.appendCall">func (f *GcsBucketHandleObjectFunc) appendCall(r0 GcsBucketHandleObjectFuncCall)</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.appendCall
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) appendCall(r0 GcsBucketHandleObjectFuncCall)
```

#### <a id="GcsBucketHandleObjectFunc.History" href="#GcsBucketHandleObjectFunc.History">func (f *GcsBucketHandleObjectFunc) History() []GcsBucketHandleObjectFuncCall</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFunc.History
tags: [private]
```

```Go
func (f *GcsBucketHandleObjectFunc) History() []GcsBucketHandleObjectFuncCall
```

History returns a sequence of GcsBucketHandleObjectFuncCall objects describing the invocations of this function. 

### <a id="GcsBucketHandleObjectFuncCall" href="#GcsBucketHandleObjectFuncCall">type GcsBucketHandleObjectFuncCall struct</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFuncCall
tags: [private]
```

```Go
type GcsBucketHandleObjectFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 string
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 gcsObjectHandle
}
```

GcsBucketHandleObjectFuncCall is an object that describes an invocation of method Object on an instance of MockGcsBucketHandle. 

#### <a id="GcsBucketHandleObjectFuncCall.Args" href="#GcsBucketHandleObjectFuncCall.Args">func (c GcsBucketHandleObjectFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFuncCall.Args
tags: [private]
```

```Go
func (c GcsBucketHandleObjectFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsBucketHandleObjectFuncCall.Results" href="#GcsBucketHandleObjectFuncCall.Results">func (c GcsBucketHandleObjectFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleObjectFuncCall.Results
tags: [private]
```

```Go
func (c GcsBucketHandleObjectFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsBucketHandleUpdateFunc" href="#GcsBucketHandleUpdateFunc">type GcsBucketHandleUpdateFunc struct</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc
tags: [private]
```

```Go
type GcsBucketHandleUpdateFunc struct {
	defaultHook func(context.Context, storage.BucketAttrsToUpdate) error
	hooks       []func(context.Context, storage.BucketAttrsToUpdate) error
	history     []GcsBucketHandleUpdateFuncCall
	mutex       sync.Mutex
}
```

GcsBucketHandleUpdateFunc describes the behavior when the Update method of the parent MockGcsBucketHandle instance is invoked. 

#### <a id="GcsBucketHandleUpdateFunc.SetDefaultHook" href="#GcsBucketHandleUpdateFunc.SetDefaultHook">func (f *GcsBucketHandleUpdateFunc) SetDefaultHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) SetDefaultHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)
```

SetDefaultHook sets function that is called when the Update method of the parent MockGcsBucketHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsBucketHandleUpdateFunc.PushHook" href="#GcsBucketHandleUpdateFunc.PushHook">func (f *GcsBucketHandleUpdateFunc) PushHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.PushHook
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) PushHook(hook func(context.Context, storage.BucketAttrsToUpdate) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Update method of the parent MockGcsBucketHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsBucketHandleUpdateFunc.SetDefaultReturn" href="#GcsBucketHandleUpdateFunc.SetDefaultReturn">func (f *GcsBucketHandleUpdateFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleUpdateFunc.PushReturn" href="#GcsBucketHandleUpdateFunc.PushReturn">func (f *GcsBucketHandleUpdateFunc) PushReturn(r0 error)</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsBucketHandleUpdateFunc.nextHook" href="#GcsBucketHandleUpdateFunc.nextHook">func (f *GcsBucketHandleUpdateFunc) nextHook() func(context.Context, storage.BucketAttrsToUpdate) error</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.nextHook
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) nextHook() func(context.Context, storage.BucketAttrsToUpdate) error
```

#### <a id="GcsBucketHandleUpdateFunc.appendCall" href="#GcsBucketHandleUpdateFunc.appendCall">func (f *GcsBucketHandleUpdateFunc) appendCall(r0 GcsBucketHandleUpdateFuncCall)</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.appendCall
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) appendCall(r0 GcsBucketHandleUpdateFuncCall)
```

#### <a id="GcsBucketHandleUpdateFunc.History" href="#GcsBucketHandleUpdateFunc.History">func (f *GcsBucketHandleUpdateFunc) History() []GcsBucketHandleUpdateFuncCall</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFunc.History
tags: [private]
```

```Go
func (f *GcsBucketHandleUpdateFunc) History() []GcsBucketHandleUpdateFuncCall
```

History returns a sequence of GcsBucketHandleUpdateFuncCall objects describing the invocations of this function. 

### <a id="GcsBucketHandleUpdateFuncCall" href="#GcsBucketHandleUpdateFuncCall">type GcsBucketHandleUpdateFuncCall struct</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFuncCall
tags: [private]
```

```Go
type GcsBucketHandleUpdateFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 storage.BucketAttrsToUpdate
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

GcsBucketHandleUpdateFuncCall is an object that describes an invocation of method Update on an instance of MockGcsBucketHandle. 

#### <a id="GcsBucketHandleUpdateFuncCall.Args" href="#GcsBucketHandleUpdateFuncCall.Args">func (c GcsBucketHandleUpdateFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFuncCall.Args
tags: [private]
```

```Go
func (c GcsBucketHandleUpdateFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsBucketHandleUpdateFuncCall.Results" href="#GcsBucketHandleUpdateFuncCall.Results">func (c GcsBucketHandleUpdateFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsBucketHandleUpdateFuncCall.Results
tags: [private]
```

```Go
func (c GcsBucketHandleUpdateFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockGcsComposer" href="#MockGcsComposer">type MockGcsComposer struct</a>

```
searchKey: uploadstore.MockGcsComposer
tags: [private]
```

```Go
type MockGcsComposer struct {
	// RunFunc is an instance of a mock function object controlling the
	// behavior of the method Run.
	RunFunc *GcsComposerRunFunc
}
```

MockGcsComposer is a mock implementation of the gcsComposer interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockGcsComposer" href="#NewMockGcsComposer">func NewMockGcsComposer() *MockGcsComposer</a>

```
searchKey: uploadstore.NewMockGcsComposer
tags: [private]
```

```Go
func NewMockGcsComposer() *MockGcsComposer
```

NewMockGcsComposer creates a new mock of the gcsComposer interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGcsComposerFrom" href="#NewMockGcsComposerFrom">func NewMockGcsComposerFrom(i surrogateMockGcsComposer) *MockGcsComposer</a>

```
searchKey: uploadstore.NewMockGcsComposerFrom
tags: [private]
```

```Go
func NewMockGcsComposerFrom(i surrogateMockGcsComposer) *MockGcsComposer
```

NewMockGcsComposerFrom creates a new mock of the MockGcsComposer interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGcsComposer.Run" href="#MockGcsComposer.Run">func (m *MockGcsComposer) Run(v0 context.Context) (*storage.ObjectAttrs, error)</a>

```
searchKey: uploadstore.MockGcsComposer.Run
tags: [private]
```

```Go
func (m *MockGcsComposer) Run(v0 context.Context) (*storage.ObjectAttrs, error)
```

Run delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockGcsComposer" href="#surrogateMockGcsComposer">type surrogateMockGcsComposer interface</a>

```
searchKey: uploadstore.surrogateMockGcsComposer
tags: [private]
```

```Go
type surrogateMockGcsComposer interface {
	Run(context.Context) (*storage.ObjectAttrs, error)
}
```

surrogateMockGcsComposer is a copy of the gcsComposer interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="GcsComposerRunFunc" href="#GcsComposerRunFunc">type GcsComposerRunFunc struct</a>

```
searchKey: uploadstore.GcsComposerRunFunc
tags: [private]
```

```Go
type GcsComposerRunFunc struct {
	defaultHook func(context.Context) (*storage.ObjectAttrs, error)
	hooks       []func(context.Context) (*storage.ObjectAttrs, error)
	history     []GcsComposerRunFuncCall
	mutex       sync.Mutex
}
```

GcsComposerRunFunc describes the behavior when the Run method of the parent MockGcsComposer instance is invoked. 

#### <a id="GcsComposerRunFunc.SetDefaultHook" href="#GcsComposerRunFunc.SetDefaultHook">func (f *GcsComposerRunFunc) SetDefaultHook(hook func(context.Context) (*storage.ObjectAttrs, error))</a>

```
searchKey: uploadstore.GcsComposerRunFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) SetDefaultHook(hook func(context.Context) (*storage.ObjectAttrs, error))
```

SetDefaultHook sets function that is called when the Run method of the parent MockGcsComposer instance is invoked and the hook queue is empty. 

#### <a id="GcsComposerRunFunc.PushHook" href="#GcsComposerRunFunc.PushHook">func (f *GcsComposerRunFunc) PushHook(hook func(context.Context) (*storage.ObjectAttrs, error))</a>

```
searchKey: uploadstore.GcsComposerRunFunc.PushHook
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) PushHook(hook func(context.Context) (*storage.ObjectAttrs, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the Run method of the parent MockGcsComposer instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsComposerRunFunc.SetDefaultReturn" href="#GcsComposerRunFunc.SetDefaultReturn">func (f *GcsComposerRunFunc) SetDefaultReturn(r0 *storage.ObjectAttrs, r1 error)</a>

```
searchKey: uploadstore.GcsComposerRunFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) SetDefaultReturn(r0 *storage.ObjectAttrs, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsComposerRunFunc.PushReturn" href="#GcsComposerRunFunc.PushReturn">func (f *GcsComposerRunFunc) PushReturn(r0 *storage.ObjectAttrs, r1 error)</a>

```
searchKey: uploadstore.GcsComposerRunFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) PushReturn(r0 *storage.ObjectAttrs, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsComposerRunFunc.nextHook" href="#GcsComposerRunFunc.nextHook">func (f *GcsComposerRunFunc) nextHook() func(context.Context) (*storage.ObjectAttrs, error)</a>

```
searchKey: uploadstore.GcsComposerRunFunc.nextHook
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) nextHook() func(context.Context) (*storage.ObjectAttrs, error)
```

#### <a id="GcsComposerRunFunc.appendCall" href="#GcsComposerRunFunc.appendCall">func (f *GcsComposerRunFunc) appendCall(r0 GcsComposerRunFuncCall)</a>

```
searchKey: uploadstore.GcsComposerRunFunc.appendCall
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) appendCall(r0 GcsComposerRunFuncCall)
```

#### <a id="GcsComposerRunFunc.History" href="#GcsComposerRunFunc.History">func (f *GcsComposerRunFunc) History() []GcsComposerRunFuncCall</a>

```
searchKey: uploadstore.GcsComposerRunFunc.History
tags: [private]
```

```Go
func (f *GcsComposerRunFunc) History() []GcsComposerRunFuncCall
```

History returns a sequence of GcsComposerRunFuncCall objects describing the invocations of this function. 

### <a id="GcsComposerRunFuncCall" href="#GcsComposerRunFuncCall">type GcsComposerRunFuncCall struct</a>

```
searchKey: uploadstore.GcsComposerRunFuncCall
tags: [private]
```

```Go
type GcsComposerRunFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *storage.ObjectAttrs
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GcsComposerRunFuncCall is an object that describes an invocation of method Run on an instance of MockGcsComposer. 

#### <a id="GcsComposerRunFuncCall.Args" href="#GcsComposerRunFuncCall.Args">func (c GcsComposerRunFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsComposerRunFuncCall.Args
tags: [private]
```

```Go
func (c GcsComposerRunFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsComposerRunFuncCall.Results" href="#GcsComposerRunFuncCall.Results">func (c GcsComposerRunFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsComposerRunFuncCall.Results
tags: [private]
```

```Go
func (c GcsComposerRunFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockGcsObjectHandle" href="#MockGcsObjectHandle">type MockGcsObjectHandle struct</a>

```
searchKey: uploadstore.MockGcsObjectHandle
tags: [private]
```

```Go
type MockGcsObjectHandle struct {
	// ComposerFromFunc is an instance of a mock function object controlling
	// the behavior of the method ComposerFrom.
	ComposerFromFunc *GcsObjectHandleComposerFromFunc
	// DeleteFunc is an instance of a mock function object controlling the
	// behavior of the method Delete.
	DeleteFunc *GcsObjectHandleDeleteFunc
	// NewRangeReaderFunc is an instance of a mock function object
	// controlling the behavior of the method NewRangeReader.
	NewRangeReaderFunc *GcsObjectHandleNewRangeReaderFunc
	// NewWriterFunc is an instance of a mock function object controlling
	// the behavior of the method NewWriter.
	NewWriterFunc *GcsObjectHandleNewWriterFunc
}
```

MockGcsObjectHandle is a mock implementation of the gcsObjectHandle interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockGcsObjectHandle" href="#NewMockGcsObjectHandle">func NewMockGcsObjectHandle() *MockGcsObjectHandle</a>

```
searchKey: uploadstore.NewMockGcsObjectHandle
tags: [private]
```

```Go
func NewMockGcsObjectHandle() *MockGcsObjectHandle
```

NewMockGcsObjectHandle creates a new mock of the gcsObjectHandle interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockGcsObjectHandleFrom" href="#NewMockGcsObjectHandleFrom">func NewMockGcsObjectHandleFrom(i surrogateMockGcsObjectHandle) *MockGcsObjectHandle</a>

```
searchKey: uploadstore.NewMockGcsObjectHandleFrom
tags: [private]
```

```Go
func NewMockGcsObjectHandleFrom(i surrogateMockGcsObjectHandle) *MockGcsObjectHandle
```

NewMockGcsObjectHandleFrom creates a new mock of the MockGcsObjectHandle interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockGcsObjectHandle.ComposerFrom" href="#MockGcsObjectHandle.ComposerFrom">func (m *MockGcsObjectHandle) ComposerFrom(v0 ...gcsObjectHandle) gcsComposer</a>

```
searchKey: uploadstore.MockGcsObjectHandle.ComposerFrom
tags: [private]
```

```Go
func (m *MockGcsObjectHandle) ComposerFrom(v0 ...gcsObjectHandle) gcsComposer
```

ComposerFrom delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsObjectHandle.Delete" href="#MockGcsObjectHandle.Delete">func (m *MockGcsObjectHandle) Delete(v0 context.Context) error</a>

```
searchKey: uploadstore.MockGcsObjectHandle.Delete
tags: [private]
```

```Go
func (m *MockGcsObjectHandle) Delete(v0 context.Context) error
```

Delete delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsObjectHandle.NewRangeReader" href="#MockGcsObjectHandle.NewRangeReader">func (m *MockGcsObjectHandle) NewRangeReader(v0 context.Context, v1 int64, v2 int64) (io.ReadCloser, error)</a>

```
searchKey: uploadstore.MockGcsObjectHandle.NewRangeReader
tags: [private]
```

```Go
func (m *MockGcsObjectHandle) NewRangeReader(v0 context.Context, v1 int64, v2 int64) (io.ReadCloser, error)
```

NewRangeReader delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockGcsObjectHandle.NewWriter" href="#MockGcsObjectHandle.NewWriter">func (m *MockGcsObjectHandle) NewWriter(v0 context.Context) io.WriteCloser</a>

```
searchKey: uploadstore.MockGcsObjectHandle.NewWriter
tags: [private]
```

```Go
func (m *MockGcsObjectHandle) NewWriter(v0 context.Context) io.WriteCloser
```

NewWriter delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockGcsObjectHandle" href="#surrogateMockGcsObjectHandle">type surrogateMockGcsObjectHandle interface</a>

```
searchKey: uploadstore.surrogateMockGcsObjectHandle
tags: [private]
```

```Go
type surrogateMockGcsObjectHandle interface {
	ComposerFrom(...gcsObjectHandle) gcsComposer
	Delete(context.Context) error
	NewRangeReader(context.Context, int64, int64) (io.ReadCloser, error)
	NewWriter(context.Context) io.WriteCloser
}
```

surrogateMockGcsObjectHandle is a copy of the gcsObjectHandle interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="GcsObjectHandleComposerFromFunc" href="#GcsObjectHandleComposerFromFunc">type GcsObjectHandleComposerFromFunc struct</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc
tags: [private]
```

```Go
type GcsObjectHandleComposerFromFunc struct {
	defaultHook func(...gcsObjectHandle) gcsComposer
	hooks       []func(...gcsObjectHandle) gcsComposer
	history     []GcsObjectHandleComposerFromFuncCall
	mutex       sync.Mutex
}
```

GcsObjectHandleComposerFromFunc describes the behavior when the ComposerFrom method of the parent MockGcsObjectHandle instance is invoked. 

#### <a id="GcsObjectHandleComposerFromFunc.SetDefaultHook" href="#GcsObjectHandleComposerFromFunc.SetDefaultHook">func (f *GcsObjectHandleComposerFromFunc) SetDefaultHook(hook func(...gcsObjectHandle) gcsComposer)</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) SetDefaultHook(hook func(...gcsObjectHandle) gcsComposer)
```

SetDefaultHook sets function that is called when the ComposerFrom method of the parent MockGcsObjectHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsObjectHandleComposerFromFunc.PushHook" href="#GcsObjectHandleComposerFromFunc.PushHook">func (f *GcsObjectHandleComposerFromFunc) PushHook(hook func(...gcsObjectHandle) gcsComposer)</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.PushHook
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) PushHook(hook func(...gcsObjectHandle) gcsComposer)
```

PushHook adds a function to the end of hook queue. Each invocation of the ComposerFrom method of the parent MockGcsObjectHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsObjectHandleComposerFromFunc.SetDefaultReturn" href="#GcsObjectHandleComposerFromFunc.SetDefaultReturn">func (f *GcsObjectHandleComposerFromFunc) SetDefaultReturn(r0 gcsComposer)</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) SetDefaultReturn(r0 gcsComposer)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleComposerFromFunc.PushReturn" href="#GcsObjectHandleComposerFromFunc.PushReturn">func (f *GcsObjectHandleComposerFromFunc) PushReturn(r0 gcsComposer)</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) PushReturn(r0 gcsComposer)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleComposerFromFunc.nextHook" href="#GcsObjectHandleComposerFromFunc.nextHook">func (f *GcsObjectHandleComposerFromFunc) nextHook() func(...gcsObjectHandle) gcsComposer</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.nextHook
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) nextHook() func(...gcsObjectHandle) gcsComposer
```

#### <a id="GcsObjectHandleComposerFromFunc.appendCall" href="#GcsObjectHandleComposerFromFunc.appendCall">func (f *GcsObjectHandleComposerFromFunc) appendCall(r0 GcsObjectHandleComposerFromFuncCall)</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.appendCall
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) appendCall(r0 GcsObjectHandleComposerFromFuncCall)
```

#### <a id="GcsObjectHandleComposerFromFunc.History" href="#GcsObjectHandleComposerFromFunc.History">func (f *GcsObjectHandleComposerFromFunc) History() []GcsObjectHandleComposerFromFuncCall</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFunc.History
tags: [private]
```

```Go
func (f *GcsObjectHandleComposerFromFunc) History() []GcsObjectHandleComposerFromFuncCall
```

History returns a sequence of GcsObjectHandleComposerFromFuncCall objects describing the invocations of this function. 

### <a id="GcsObjectHandleComposerFromFuncCall" href="#GcsObjectHandleComposerFromFuncCall">type GcsObjectHandleComposerFromFuncCall struct</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFuncCall
tags: [private]
```

```Go
type GcsObjectHandleComposerFromFuncCall struct {
	// Arg0 is a slice containing the values of the variadic arguments
	// passed to this method invocation.
	Arg0 []gcsObjectHandle
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 gcsComposer
}
```

GcsObjectHandleComposerFromFuncCall is an object that describes an invocation of method ComposerFrom on an instance of MockGcsObjectHandle. 

#### <a id="GcsObjectHandleComposerFromFuncCall.Args" href="#GcsObjectHandleComposerFromFuncCall.Args">func (c GcsObjectHandleComposerFromFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFuncCall.Args
tags: [private]
```

```Go
func (c GcsObjectHandleComposerFromFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. The variadic slice argument is flattened in this array such that one positional argument and three variadic arguments would result in a slice of four, not two. 

#### <a id="GcsObjectHandleComposerFromFuncCall.Results" href="#GcsObjectHandleComposerFromFuncCall.Results">func (c GcsObjectHandleComposerFromFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleComposerFromFuncCall.Results
tags: [private]
```

```Go
func (c GcsObjectHandleComposerFromFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsObjectHandleDeleteFunc" href="#GcsObjectHandleDeleteFunc">type GcsObjectHandleDeleteFunc struct</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc
tags: [private]
```

```Go
type GcsObjectHandleDeleteFunc struct {
	defaultHook func(context.Context) error
	hooks       []func(context.Context) error
	history     []GcsObjectHandleDeleteFuncCall
	mutex       sync.Mutex
}
```

GcsObjectHandleDeleteFunc describes the behavior when the Delete method of the parent MockGcsObjectHandle instance is invoked. 

#### <a id="GcsObjectHandleDeleteFunc.SetDefaultHook" href="#GcsObjectHandleDeleteFunc.SetDefaultHook">func (f *GcsObjectHandleDeleteFunc) SetDefaultHook(hook func(context.Context) error)</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) SetDefaultHook(hook func(context.Context) error)
```

SetDefaultHook sets function that is called when the Delete method of the parent MockGcsObjectHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsObjectHandleDeleteFunc.PushHook" href="#GcsObjectHandleDeleteFunc.PushHook">func (f *GcsObjectHandleDeleteFunc) PushHook(hook func(context.Context) error)</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.PushHook
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) PushHook(hook func(context.Context) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Delete method of the parent MockGcsObjectHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsObjectHandleDeleteFunc.SetDefaultReturn" href="#GcsObjectHandleDeleteFunc.SetDefaultReturn">func (f *GcsObjectHandleDeleteFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleDeleteFunc.PushReturn" href="#GcsObjectHandleDeleteFunc.PushReturn">func (f *GcsObjectHandleDeleteFunc) PushReturn(r0 error)</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleDeleteFunc.nextHook" href="#GcsObjectHandleDeleteFunc.nextHook">func (f *GcsObjectHandleDeleteFunc) nextHook() func(context.Context) error</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.nextHook
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) nextHook() func(context.Context) error
```

#### <a id="GcsObjectHandleDeleteFunc.appendCall" href="#GcsObjectHandleDeleteFunc.appendCall">func (f *GcsObjectHandleDeleteFunc) appendCall(r0 GcsObjectHandleDeleteFuncCall)</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.appendCall
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) appendCall(r0 GcsObjectHandleDeleteFuncCall)
```

#### <a id="GcsObjectHandleDeleteFunc.History" href="#GcsObjectHandleDeleteFunc.History">func (f *GcsObjectHandleDeleteFunc) History() []GcsObjectHandleDeleteFuncCall</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFunc.History
tags: [private]
```

```Go
func (f *GcsObjectHandleDeleteFunc) History() []GcsObjectHandleDeleteFuncCall
```

History returns a sequence of GcsObjectHandleDeleteFuncCall objects describing the invocations of this function. 

### <a id="GcsObjectHandleDeleteFuncCall" href="#GcsObjectHandleDeleteFuncCall">type GcsObjectHandleDeleteFuncCall struct</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFuncCall
tags: [private]
```

```Go
type GcsObjectHandleDeleteFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

GcsObjectHandleDeleteFuncCall is an object that describes an invocation of method Delete on an instance of MockGcsObjectHandle. 

#### <a id="GcsObjectHandleDeleteFuncCall.Args" href="#GcsObjectHandleDeleteFuncCall.Args">func (c GcsObjectHandleDeleteFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFuncCall.Args
tags: [private]
```

```Go
func (c GcsObjectHandleDeleteFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsObjectHandleDeleteFuncCall.Results" href="#GcsObjectHandleDeleteFuncCall.Results">func (c GcsObjectHandleDeleteFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleDeleteFuncCall.Results
tags: [private]
```

```Go
func (c GcsObjectHandleDeleteFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsObjectHandleNewRangeReaderFunc" href="#GcsObjectHandleNewRangeReaderFunc">type GcsObjectHandleNewRangeReaderFunc struct</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc
tags: [private]
```

```Go
type GcsObjectHandleNewRangeReaderFunc struct {
	defaultHook func(context.Context, int64, int64) (io.ReadCloser, error)
	hooks       []func(context.Context, int64, int64) (io.ReadCloser, error)
	history     []GcsObjectHandleNewRangeReaderFuncCall
	mutex       sync.Mutex
}
```

GcsObjectHandleNewRangeReaderFunc describes the behavior when the NewRangeReader method of the parent MockGcsObjectHandle instance is invoked. 

#### <a id="GcsObjectHandleNewRangeReaderFunc.SetDefaultHook" href="#GcsObjectHandleNewRangeReaderFunc.SetDefaultHook">func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))
```

SetDefaultHook sets function that is called when the NewRangeReader method of the parent MockGcsObjectHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsObjectHandleNewRangeReaderFunc.PushHook" href="#GcsObjectHandleNewRangeReaderFunc.PushHook">func (f *GcsObjectHandleNewRangeReaderFunc) PushHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.PushHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) PushHook(hook func(context.Context, int64, int64) (io.ReadCloser, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the NewRangeReader method of the parent MockGcsObjectHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsObjectHandleNewRangeReaderFunc.SetDefaultReturn" href="#GcsObjectHandleNewRangeReaderFunc.SetDefaultReturn">func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) SetDefaultReturn(r0 io.ReadCloser, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleNewRangeReaderFunc.PushReturn" href="#GcsObjectHandleNewRangeReaderFunc.PushReturn">func (f *GcsObjectHandleNewRangeReaderFunc) PushReturn(r0 io.ReadCloser, r1 error)</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) PushReturn(r0 io.ReadCloser, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleNewRangeReaderFunc.nextHook" href="#GcsObjectHandleNewRangeReaderFunc.nextHook">func (f *GcsObjectHandleNewRangeReaderFunc) nextHook() func(context.Context, int64, int64) (io.ReadCloser, error)</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.nextHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) nextHook() func(context.Context, int64, int64) (io.ReadCloser, error)
```

#### <a id="GcsObjectHandleNewRangeReaderFunc.appendCall" href="#GcsObjectHandleNewRangeReaderFunc.appendCall">func (f *GcsObjectHandleNewRangeReaderFunc) appendCall(r0 GcsObjectHandleNewRangeReaderFuncCall)</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.appendCall
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) appendCall(r0 GcsObjectHandleNewRangeReaderFuncCall)
```

#### <a id="GcsObjectHandleNewRangeReaderFunc.History" href="#GcsObjectHandleNewRangeReaderFunc.History">func (f *GcsObjectHandleNewRangeReaderFunc) History() []GcsObjectHandleNewRangeReaderFuncCall</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFunc.History
tags: [private]
```

```Go
func (f *GcsObjectHandleNewRangeReaderFunc) History() []GcsObjectHandleNewRangeReaderFuncCall
```

History returns a sequence of GcsObjectHandleNewRangeReaderFuncCall objects describing the invocations of this function. 

### <a id="GcsObjectHandleNewRangeReaderFuncCall" href="#GcsObjectHandleNewRangeReaderFuncCall">type GcsObjectHandleNewRangeReaderFuncCall struct</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFuncCall
tags: [private]
```

```Go
type GcsObjectHandleNewRangeReaderFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 int64
	// Arg2 is the value of the 3rd argument passed to this method
	// invocation.
	Arg2 int64
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 io.ReadCloser
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

GcsObjectHandleNewRangeReaderFuncCall is an object that describes an invocation of method NewRangeReader on an instance of MockGcsObjectHandle. 

#### <a id="GcsObjectHandleNewRangeReaderFuncCall.Args" href="#GcsObjectHandleNewRangeReaderFuncCall.Args">func (c GcsObjectHandleNewRangeReaderFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFuncCall.Args
tags: [private]
```

```Go
func (c GcsObjectHandleNewRangeReaderFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsObjectHandleNewRangeReaderFuncCall.Results" href="#GcsObjectHandleNewRangeReaderFuncCall.Results">func (c GcsObjectHandleNewRangeReaderFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleNewRangeReaderFuncCall.Results
tags: [private]
```

```Go
func (c GcsObjectHandleNewRangeReaderFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="GcsObjectHandleNewWriterFunc" href="#GcsObjectHandleNewWriterFunc">type GcsObjectHandleNewWriterFunc struct</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc
tags: [private]
```

```Go
type GcsObjectHandleNewWriterFunc struct {
	defaultHook func(context.Context) io.WriteCloser
	hooks       []func(context.Context) io.WriteCloser
	history     []GcsObjectHandleNewWriterFuncCall
	mutex       sync.Mutex
}
```

GcsObjectHandleNewWriterFunc describes the behavior when the NewWriter method of the parent MockGcsObjectHandle instance is invoked. 

#### <a id="GcsObjectHandleNewWriterFunc.SetDefaultHook" href="#GcsObjectHandleNewWriterFunc.SetDefaultHook">func (f *GcsObjectHandleNewWriterFunc) SetDefaultHook(hook func(context.Context) io.WriteCloser)</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) SetDefaultHook(hook func(context.Context) io.WriteCloser)
```

SetDefaultHook sets function that is called when the NewWriter method of the parent MockGcsObjectHandle instance is invoked and the hook queue is empty. 

#### <a id="GcsObjectHandleNewWriterFunc.PushHook" href="#GcsObjectHandleNewWriterFunc.PushHook">func (f *GcsObjectHandleNewWriterFunc) PushHook(hook func(context.Context) io.WriteCloser)</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.PushHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) PushHook(hook func(context.Context) io.WriteCloser)
```

PushHook adds a function to the end of hook queue. Each invocation of the NewWriter method of the parent MockGcsObjectHandle instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="GcsObjectHandleNewWriterFunc.SetDefaultReturn" href="#GcsObjectHandleNewWriterFunc.SetDefaultReturn">func (f *GcsObjectHandleNewWriterFunc) SetDefaultReturn(r0 io.WriteCloser)</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) SetDefaultReturn(r0 io.WriteCloser)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleNewWriterFunc.PushReturn" href="#GcsObjectHandleNewWriterFunc.PushReturn">func (f *GcsObjectHandleNewWriterFunc) PushReturn(r0 io.WriteCloser)</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.PushReturn
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) PushReturn(r0 io.WriteCloser)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="GcsObjectHandleNewWriterFunc.nextHook" href="#GcsObjectHandleNewWriterFunc.nextHook">func (f *GcsObjectHandleNewWriterFunc) nextHook() func(context.Context) io.WriteCloser</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.nextHook
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) nextHook() func(context.Context) io.WriteCloser
```

#### <a id="GcsObjectHandleNewWriterFunc.appendCall" href="#GcsObjectHandleNewWriterFunc.appendCall">func (f *GcsObjectHandleNewWriterFunc) appendCall(r0 GcsObjectHandleNewWriterFuncCall)</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.appendCall
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) appendCall(r0 GcsObjectHandleNewWriterFuncCall)
```

#### <a id="GcsObjectHandleNewWriterFunc.History" href="#GcsObjectHandleNewWriterFunc.History">func (f *GcsObjectHandleNewWriterFunc) History() []GcsObjectHandleNewWriterFuncCall</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFunc.History
tags: [private]
```

```Go
func (f *GcsObjectHandleNewWriterFunc) History() []GcsObjectHandleNewWriterFuncCall
```

History returns a sequence of GcsObjectHandleNewWriterFuncCall objects describing the invocations of this function. 

### <a id="GcsObjectHandleNewWriterFuncCall" href="#GcsObjectHandleNewWriterFuncCall">type GcsObjectHandleNewWriterFuncCall struct</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFuncCall
tags: [private]
```

```Go
type GcsObjectHandleNewWriterFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 io.WriteCloser
}
```

GcsObjectHandleNewWriterFuncCall is an object that describes an invocation of method NewWriter on an instance of MockGcsObjectHandle. 

#### <a id="GcsObjectHandleNewWriterFuncCall.Args" href="#GcsObjectHandleNewWriterFuncCall.Args">func (c GcsObjectHandleNewWriterFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFuncCall.Args
tags: [private]
```

```Go
func (c GcsObjectHandleNewWriterFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="GcsObjectHandleNewWriterFuncCall.Results" href="#GcsObjectHandleNewWriterFuncCall.Results">func (c GcsObjectHandleNewWriterFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.GcsObjectHandleNewWriterFuncCall.Results
tags: [private]
```

```Go
func (c GcsObjectHandleNewWriterFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockS3API" href="#MockS3API">type MockS3API struct</a>

```
searchKey: uploadstore.MockS3API
tags: [private]
```

```Go
type MockS3API struct {
	// AbortMultipartUploadFunc is an instance of a mock function object
	// controlling the behavior of the method AbortMultipartUpload.
	AbortMultipartUploadFunc *S3APIAbortMultipartUploadFunc
	// CompleteMultipartUploadFunc is an instance of a mock function object
	// controlling the behavior of the method CompleteMultipartUpload.
	CompleteMultipartUploadFunc *S3APICompleteMultipartUploadFunc
	// CreateBucketFunc is an instance of a mock function object controlling
	// the behavior of the method CreateBucket.
	CreateBucketFunc *S3APICreateBucketFunc
	// CreateMultipartUploadFunc is an instance of a mock function object
	// controlling the behavior of the method CreateMultipartUpload.
	CreateMultipartUploadFunc *S3APICreateMultipartUploadFunc
	// DeleteObjectFunc is an instance of a mock function object controlling
	// the behavior of the method DeleteObject.
	DeleteObjectFunc *S3APIDeleteObjectFunc
	// GetObjectFunc is an instance of a mock function object controlling
	// the behavior of the method GetObject.
	GetObjectFunc *S3APIGetObjectFunc
	// HeadObjectFunc is an instance of a mock function object controlling
	// the behavior of the method HeadObject.
	HeadObjectFunc *S3APIHeadObjectFunc
	// PutBucketLifecycleConfigurationFunc is an instance of a mock function
	// object controlling the behavior of the method
	// PutBucketLifecycleConfiguration.
	PutBucketLifecycleConfigurationFunc *S3APIPutBucketLifecycleConfigurationFunc
	// UploadPartCopyFunc is an instance of a mock function object
	// controlling the behavior of the method UploadPartCopy.
	UploadPartCopyFunc *S3APIUploadPartCopyFunc
}
```

MockS3API is a mock implementation of the s3API interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockS3API" href="#NewMockS3API">func NewMockS3API() *MockS3API</a>

```
searchKey: uploadstore.NewMockS3API
tags: [private]
```

```Go
func NewMockS3API() *MockS3API
```

NewMockS3API creates a new mock of the s3API interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockS3APIFrom" href="#NewMockS3APIFrom">func NewMockS3APIFrom(i surrogateMockS3API) *MockS3API</a>

```
searchKey: uploadstore.NewMockS3APIFrom
tags: [private]
```

```Go
func NewMockS3APIFrom(i surrogateMockS3API) *MockS3API
```

NewMockS3APIFrom creates a new mock of the MockS3API interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="fullContentsS3API" href="#fullContentsS3API">func fullContentsS3API() *MockS3API</a>

```
searchKey: uploadstore.fullContentsS3API
tags: [private]
```

```Go
func fullContentsS3API() *MockS3API
```

#### <a id="MockS3API.AbortMultipartUpload" href="#MockS3API.AbortMultipartUpload">func (m *MockS3API) AbortMultipartUpload(v0 context.Context, v1 *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.MockS3API.AbortMultipartUpload
tags: [private]
```

```Go
func (m *MockS3API) AbortMultipartUpload(v0 context.Context, v1 *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
```

AbortMultipartUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.CompleteMultipartUpload" href="#MockS3API.CompleteMultipartUpload">func (m *MockS3API) CompleteMultipartUpload(v0 context.Context, v1 *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.MockS3API.CompleteMultipartUpload
tags: [private]
```

```Go
func (m *MockS3API) CompleteMultipartUpload(v0 context.Context, v1 *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
```

CompleteMultipartUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.CreateBucket" href="#MockS3API.CreateBucket">func (m *MockS3API) CreateBucket(v0 context.Context, v1 *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)</a>

```
searchKey: uploadstore.MockS3API.CreateBucket
tags: [private]
```

```Go
func (m *MockS3API) CreateBucket(v0 context.Context, v1 *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
```

CreateBucket delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.CreateMultipartUpload" href="#MockS3API.CreateMultipartUpload">func (m *MockS3API) CreateMultipartUpload(v0 context.Context, v1 *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.MockS3API.CreateMultipartUpload
tags: [private]
```

```Go
func (m *MockS3API) CreateMultipartUpload(v0 context.Context, v1 *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
```

CreateMultipartUpload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.DeleteObject" href="#MockS3API.DeleteObject">func (m *MockS3API) DeleteObject(v0 context.Context, v1 *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)</a>

```
searchKey: uploadstore.MockS3API.DeleteObject
tags: [private]
```

```Go
func (m *MockS3API) DeleteObject(v0 context.Context, v1 *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
```

DeleteObject delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.GetObject" href="#MockS3API.GetObject">func (m *MockS3API) GetObject(v0 context.Context, v1 *s3.GetObjectInput) (*s3.GetObjectOutput, error)</a>

```
searchKey: uploadstore.MockS3API.GetObject
tags: [private]
```

```Go
func (m *MockS3API) GetObject(v0 context.Context, v1 *s3.GetObjectInput) (*s3.GetObjectOutput, error)
```

GetObject delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.HeadObject" href="#MockS3API.HeadObject">func (m *MockS3API) HeadObject(v0 context.Context, v1 *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)</a>

```
searchKey: uploadstore.MockS3API.HeadObject
tags: [private]
```

```Go
func (m *MockS3API) HeadObject(v0 context.Context, v1 *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
```

HeadObject delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.PutBucketLifecycleConfiguration" href="#MockS3API.PutBucketLifecycleConfiguration">func (m *MockS3API) PutBucketLifecycleConfiguration(v0 context.Context, v1 *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)</a>

```
searchKey: uploadstore.MockS3API.PutBucketLifecycleConfiguration
tags: [private]
```

```Go
func (m *MockS3API) PutBucketLifecycleConfiguration(v0 context.Context, v1 *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
```

PutBucketLifecycleConfiguration delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

#### <a id="MockS3API.UploadPartCopy" href="#MockS3API.UploadPartCopy">func (m *MockS3API) UploadPartCopy(v0 context.Context, v1 *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)</a>

```
searchKey: uploadstore.MockS3API.UploadPartCopy
tags: [private]
```

```Go
func (m *MockS3API) UploadPartCopy(v0 context.Context, v1 *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
```

UploadPartCopy delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockS3API" href="#surrogateMockS3API">type surrogateMockS3API interface</a>

```
searchKey: uploadstore.surrogateMockS3API
tags: [private]
```

```Go
type surrogateMockS3API interface {
	AbortMultipartUpload(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
	CompleteMultipartUpload(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
	CreateBucket(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
	CreateMultipartUpload(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
	DeleteObject(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
	GetObject(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)
	HeadObject(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
	PutBucketLifecycleConfiguration(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
	UploadPartCopy(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
}
```

surrogateMockS3API is a copy of the s3API interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="S3APIAbortMultipartUploadFunc" href="#S3APIAbortMultipartUploadFunc">type S3APIAbortMultipartUploadFunc struct</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc
tags: [private]
```

```Go
type S3APIAbortMultipartUploadFunc struct {
	defaultHook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
	hooks       []func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
	history     []S3APIAbortMultipartUploadFuncCall
	mutex       sync.Mutex
}
```

S3APIAbortMultipartUploadFunc describes the behavior when the AbortMultipartUpload method of the parent MockS3API instance is invoked. 

#### <a id="S3APIAbortMultipartUploadFunc.SetDefaultHook" href="#S3APIAbortMultipartUploadFunc.SetDefaultHook">func (f *S3APIAbortMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))
```

SetDefaultHook sets function that is called when the AbortMultipartUpload method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIAbortMultipartUploadFunc.PushHook" href="#S3APIAbortMultipartUploadFunc.PushHook">func (f *S3APIAbortMultipartUploadFunc) PushHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) PushHook(hook func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the AbortMultipartUpload method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIAbortMultipartUploadFunc.SetDefaultReturn" href="#S3APIAbortMultipartUploadFunc.SetDefaultReturn">func (f *S3APIAbortMultipartUploadFunc) SetDefaultReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) SetDefaultReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIAbortMultipartUploadFunc.PushReturn" href="#S3APIAbortMultipartUploadFunc.PushReturn">func (f *S3APIAbortMultipartUploadFunc) PushReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) PushReturn(r0 *s3.AbortMultipartUploadOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIAbortMultipartUploadFunc.nextHook" href="#S3APIAbortMultipartUploadFunc.nextHook">func (f *S3APIAbortMultipartUploadFunc) nextHook() func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) nextHook() func(context.Context, *s3.AbortMultipartUploadInput) (*s3.AbortMultipartUploadOutput, error)
```

#### <a id="S3APIAbortMultipartUploadFunc.appendCall" href="#S3APIAbortMultipartUploadFunc.appendCall">func (f *S3APIAbortMultipartUploadFunc) appendCall(r0 S3APIAbortMultipartUploadFuncCall)</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) appendCall(r0 S3APIAbortMultipartUploadFuncCall)
```

#### <a id="S3APIAbortMultipartUploadFunc.History" href="#S3APIAbortMultipartUploadFunc.History">func (f *S3APIAbortMultipartUploadFunc) History() []S3APIAbortMultipartUploadFuncCall</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFunc.History
tags: [private]
```

```Go
func (f *S3APIAbortMultipartUploadFunc) History() []S3APIAbortMultipartUploadFuncCall
```

History returns a sequence of S3APIAbortMultipartUploadFuncCall objects describing the invocations of this function. 

### <a id="S3APIAbortMultipartUploadFuncCall" href="#S3APIAbortMultipartUploadFuncCall">type S3APIAbortMultipartUploadFuncCall struct</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFuncCall
tags: [private]
```

```Go
type S3APIAbortMultipartUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.AbortMultipartUploadInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.AbortMultipartUploadOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIAbortMultipartUploadFuncCall is an object that describes an invocation of method AbortMultipartUpload on an instance of MockS3API. 

#### <a id="S3APIAbortMultipartUploadFuncCall.Args" href="#S3APIAbortMultipartUploadFuncCall.Args">func (c S3APIAbortMultipartUploadFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFuncCall.Args
tags: [private]
```

```Go
func (c S3APIAbortMultipartUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIAbortMultipartUploadFuncCall.Results" href="#S3APIAbortMultipartUploadFuncCall.Results">func (c S3APIAbortMultipartUploadFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIAbortMultipartUploadFuncCall.Results
tags: [private]
```

```Go
func (c S3APIAbortMultipartUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APICompleteMultipartUploadFunc" href="#S3APICompleteMultipartUploadFunc">type S3APICompleteMultipartUploadFunc struct</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc
tags: [private]
```

```Go
type S3APICompleteMultipartUploadFunc struct {
	defaultHook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
	hooks       []func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
	history     []S3APICompleteMultipartUploadFuncCall
	mutex       sync.Mutex
}
```

S3APICompleteMultipartUploadFunc describes the behavior when the CompleteMultipartUpload method of the parent MockS3API instance is invoked. 

#### <a id="S3APICompleteMultipartUploadFunc.SetDefaultHook" href="#S3APICompleteMultipartUploadFunc.SetDefaultHook">func (f *S3APICompleteMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))
```

SetDefaultHook sets function that is called when the CompleteMultipartUpload method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APICompleteMultipartUploadFunc.PushHook" href="#S3APICompleteMultipartUploadFunc.PushHook">func (f *S3APICompleteMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.PushHook
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CompleteMultipartUpload method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APICompleteMultipartUploadFunc.SetDefaultReturn" href="#S3APICompleteMultipartUploadFunc.SetDefaultReturn">func (f *S3APICompleteMultipartUploadFunc) SetDefaultReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) SetDefaultReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APICompleteMultipartUploadFunc.PushReturn" href="#S3APICompleteMultipartUploadFunc.PushReturn">func (f *S3APICompleteMultipartUploadFunc) PushReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) PushReturn(r0 *s3.CompleteMultipartUploadOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APICompleteMultipartUploadFunc.nextHook" href="#S3APICompleteMultipartUploadFunc.nextHook">func (f *S3APICompleteMultipartUploadFunc) nextHook() func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.nextHook
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) nextHook() func(context.Context, *s3.CompleteMultipartUploadInput) (*s3.CompleteMultipartUploadOutput, error)
```

#### <a id="S3APICompleteMultipartUploadFunc.appendCall" href="#S3APICompleteMultipartUploadFunc.appendCall">func (f *S3APICompleteMultipartUploadFunc) appendCall(r0 S3APICompleteMultipartUploadFuncCall)</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.appendCall
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) appendCall(r0 S3APICompleteMultipartUploadFuncCall)
```

#### <a id="S3APICompleteMultipartUploadFunc.History" href="#S3APICompleteMultipartUploadFunc.History">func (f *S3APICompleteMultipartUploadFunc) History() []S3APICompleteMultipartUploadFuncCall</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFunc.History
tags: [private]
```

```Go
func (f *S3APICompleteMultipartUploadFunc) History() []S3APICompleteMultipartUploadFuncCall
```

History returns a sequence of S3APICompleteMultipartUploadFuncCall objects describing the invocations of this function. 

### <a id="S3APICompleteMultipartUploadFuncCall" href="#S3APICompleteMultipartUploadFuncCall">type S3APICompleteMultipartUploadFuncCall struct</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFuncCall
tags: [private]
```

```Go
type S3APICompleteMultipartUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.CompleteMultipartUploadInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.CompleteMultipartUploadOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APICompleteMultipartUploadFuncCall is an object that describes an invocation of method CompleteMultipartUpload on an instance of MockS3API. 

#### <a id="S3APICompleteMultipartUploadFuncCall.Args" href="#S3APICompleteMultipartUploadFuncCall.Args">func (c S3APICompleteMultipartUploadFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFuncCall.Args
tags: [private]
```

```Go
func (c S3APICompleteMultipartUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APICompleteMultipartUploadFuncCall.Results" href="#S3APICompleteMultipartUploadFuncCall.Results">func (c S3APICompleteMultipartUploadFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APICompleteMultipartUploadFuncCall.Results
tags: [private]
```

```Go
func (c S3APICompleteMultipartUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APICreateBucketFunc" href="#S3APICreateBucketFunc">type S3APICreateBucketFunc struct</a>

```
searchKey: uploadstore.S3APICreateBucketFunc
tags: [private]
```

```Go
type S3APICreateBucketFunc struct {
	defaultHook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
	hooks       []func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
	history     []S3APICreateBucketFuncCall
	mutex       sync.Mutex
}
```

S3APICreateBucketFunc describes the behavior when the CreateBucket method of the parent MockS3API instance is invoked. 

#### <a id="S3APICreateBucketFunc.SetDefaultHook" href="#S3APICreateBucketFunc.SetDefaultHook">func (f *S3APICreateBucketFunc) SetDefaultHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) SetDefaultHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))
```

SetDefaultHook sets function that is called when the CreateBucket method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APICreateBucketFunc.PushHook" href="#S3APICreateBucketFunc.PushHook">func (f *S3APICreateBucketFunc) PushHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.PushHook
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) PushHook(hook func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CreateBucket method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APICreateBucketFunc.SetDefaultReturn" href="#S3APICreateBucketFunc.SetDefaultReturn">func (f *S3APICreateBucketFunc) SetDefaultReturn(r0 *s3.CreateBucketOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) SetDefaultReturn(r0 *s3.CreateBucketOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APICreateBucketFunc.PushReturn" href="#S3APICreateBucketFunc.PushReturn">func (f *S3APICreateBucketFunc) PushReturn(r0 *s3.CreateBucketOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) PushReturn(r0 *s3.CreateBucketOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APICreateBucketFunc.nextHook" href="#S3APICreateBucketFunc.nextHook">func (f *S3APICreateBucketFunc) nextHook() func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.nextHook
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) nextHook() func(context.Context, *s3.CreateBucketInput) (*s3.CreateBucketOutput, error)
```

#### <a id="S3APICreateBucketFunc.appendCall" href="#S3APICreateBucketFunc.appendCall">func (f *S3APICreateBucketFunc) appendCall(r0 S3APICreateBucketFuncCall)</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.appendCall
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) appendCall(r0 S3APICreateBucketFuncCall)
```

#### <a id="S3APICreateBucketFunc.History" href="#S3APICreateBucketFunc.History">func (f *S3APICreateBucketFunc) History() []S3APICreateBucketFuncCall</a>

```
searchKey: uploadstore.S3APICreateBucketFunc.History
tags: [private]
```

```Go
func (f *S3APICreateBucketFunc) History() []S3APICreateBucketFuncCall
```

History returns a sequence of S3APICreateBucketFuncCall objects describing the invocations of this function. 

### <a id="S3APICreateBucketFuncCall" href="#S3APICreateBucketFuncCall">type S3APICreateBucketFuncCall struct</a>

```
searchKey: uploadstore.S3APICreateBucketFuncCall
tags: [private]
```

```Go
type S3APICreateBucketFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.CreateBucketInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.CreateBucketOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APICreateBucketFuncCall is an object that describes an invocation of method CreateBucket on an instance of MockS3API. 

#### <a id="S3APICreateBucketFuncCall.Args" href="#S3APICreateBucketFuncCall.Args">func (c S3APICreateBucketFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APICreateBucketFuncCall.Args
tags: [private]
```

```Go
func (c S3APICreateBucketFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APICreateBucketFuncCall.Results" href="#S3APICreateBucketFuncCall.Results">func (c S3APICreateBucketFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APICreateBucketFuncCall.Results
tags: [private]
```

```Go
func (c S3APICreateBucketFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APICreateMultipartUploadFunc" href="#S3APICreateMultipartUploadFunc">type S3APICreateMultipartUploadFunc struct</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc
tags: [private]
```

```Go
type S3APICreateMultipartUploadFunc struct {
	defaultHook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
	hooks       []func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
	history     []S3APICreateMultipartUploadFuncCall
	mutex       sync.Mutex
}
```

S3APICreateMultipartUploadFunc describes the behavior when the CreateMultipartUpload method of the parent MockS3API instance is invoked. 

#### <a id="S3APICreateMultipartUploadFunc.SetDefaultHook" href="#S3APICreateMultipartUploadFunc.SetDefaultHook">func (f *S3APICreateMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) SetDefaultHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))
```

SetDefaultHook sets function that is called when the CreateMultipartUpload method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APICreateMultipartUploadFunc.PushHook" href="#S3APICreateMultipartUploadFunc.PushHook">func (f *S3APICreateMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.PushHook
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) PushHook(hook func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the CreateMultipartUpload method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APICreateMultipartUploadFunc.SetDefaultReturn" href="#S3APICreateMultipartUploadFunc.SetDefaultReturn">func (f *S3APICreateMultipartUploadFunc) SetDefaultReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) SetDefaultReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APICreateMultipartUploadFunc.PushReturn" href="#S3APICreateMultipartUploadFunc.PushReturn">func (f *S3APICreateMultipartUploadFunc) PushReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) PushReturn(r0 *s3.CreateMultipartUploadOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APICreateMultipartUploadFunc.nextHook" href="#S3APICreateMultipartUploadFunc.nextHook">func (f *S3APICreateMultipartUploadFunc) nextHook() func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.nextHook
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) nextHook() func(context.Context, *s3.CreateMultipartUploadInput) (*s3.CreateMultipartUploadOutput, error)
```

#### <a id="S3APICreateMultipartUploadFunc.appendCall" href="#S3APICreateMultipartUploadFunc.appendCall">func (f *S3APICreateMultipartUploadFunc) appendCall(r0 S3APICreateMultipartUploadFuncCall)</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.appendCall
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) appendCall(r0 S3APICreateMultipartUploadFuncCall)
```

#### <a id="S3APICreateMultipartUploadFunc.History" href="#S3APICreateMultipartUploadFunc.History">func (f *S3APICreateMultipartUploadFunc) History() []S3APICreateMultipartUploadFuncCall</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFunc.History
tags: [private]
```

```Go
func (f *S3APICreateMultipartUploadFunc) History() []S3APICreateMultipartUploadFuncCall
```

History returns a sequence of S3APICreateMultipartUploadFuncCall objects describing the invocations of this function. 

### <a id="S3APICreateMultipartUploadFuncCall" href="#S3APICreateMultipartUploadFuncCall">type S3APICreateMultipartUploadFuncCall struct</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFuncCall
tags: [private]
```

```Go
type S3APICreateMultipartUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.CreateMultipartUploadInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.CreateMultipartUploadOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APICreateMultipartUploadFuncCall is an object that describes an invocation of method CreateMultipartUpload on an instance of MockS3API. 

#### <a id="S3APICreateMultipartUploadFuncCall.Args" href="#S3APICreateMultipartUploadFuncCall.Args">func (c S3APICreateMultipartUploadFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFuncCall.Args
tags: [private]
```

```Go
func (c S3APICreateMultipartUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APICreateMultipartUploadFuncCall.Results" href="#S3APICreateMultipartUploadFuncCall.Results">func (c S3APICreateMultipartUploadFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APICreateMultipartUploadFuncCall.Results
tags: [private]
```

```Go
func (c S3APICreateMultipartUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APIDeleteObjectFunc" href="#S3APIDeleteObjectFunc">type S3APIDeleteObjectFunc struct</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc
tags: [private]
```

```Go
type S3APIDeleteObjectFunc struct {
	defaultHook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
	hooks       []func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
	history     []S3APIDeleteObjectFuncCall
	mutex       sync.Mutex
}
```

S3APIDeleteObjectFunc describes the behavior when the DeleteObject method of the parent MockS3API instance is invoked. 

#### <a id="S3APIDeleteObjectFunc.SetDefaultHook" href="#S3APIDeleteObjectFunc.SetDefaultHook">func (f *S3APIDeleteObjectFunc) SetDefaultHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) SetDefaultHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))
```

SetDefaultHook sets function that is called when the DeleteObject method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIDeleteObjectFunc.PushHook" href="#S3APIDeleteObjectFunc.PushHook">func (f *S3APIDeleteObjectFunc) PushHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) PushHook(hook func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the DeleteObject method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIDeleteObjectFunc.SetDefaultReturn" href="#S3APIDeleteObjectFunc.SetDefaultReturn">func (f *S3APIDeleteObjectFunc) SetDefaultReturn(r0 *s3.DeleteObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) SetDefaultReturn(r0 *s3.DeleteObjectOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIDeleteObjectFunc.PushReturn" href="#S3APIDeleteObjectFunc.PushReturn">func (f *S3APIDeleteObjectFunc) PushReturn(r0 *s3.DeleteObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) PushReturn(r0 *s3.DeleteObjectOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIDeleteObjectFunc.nextHook" href="#S3APIDeleteObjectFunc.nextHook">func (f *S3APIDeleteObjectFunc) nextHook() func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) nextHook() func(context.Context, *s3.DeleteObjectInput) (*s3.DeleteObjectOutput, error)
```

#### <a id="S3APIDeleteObjectFunc.appendCall" href="#S3APIDeleteObjectFunc.appendCall">func (f *S3APIDeleteObjectFunc) appendCall(r0 S3APIDeleteObjectFuncCall)</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) appendCall(r0 S3APIDeleteObjectFuncCall)
```

#### <a id="S3APIDeleteObjectFunc.History" href="#S3APIDeleteObjectFunc.History">func (f *S3APIDeleteObjectFunc) History() []S3APIDeleteObjectFuncCall</a>

```
searchKey: uploadstore.S3APIDeleteObjectFunc.History
tags: [private]
```

```Go
func (f *S3APIDeleteObjectFunc) History() []S3APIDeleteObjectFuncCall
```

History returns a sequence of S3APIDeleteObjectFuncCall objects describing the invocations of this function. 

### <a id="S3APIDeleteObjectFuncCall" href="#S3APIDeleteObjectFuncCall">type S3APIDeleteObjectFuncCall struct</a>

```
searchKey: uploadstore.S3APIDeleteObjectFuncCall
tags: [private]
```

```Go
type S3APIDeleteObjectFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.DeleteObjectInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.DeleteObjectOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIDeleteObjectFuncCall is an object that describes an invocation of method DeleteObject on an instance of MockS3API. 

#### <a id="S3APIDeleteObjectFuncCall.Args" href="#S3APIDeleteObjectFuncCall.Args">func (c S3APIDeleteObjectFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIDeleteObjectFuncCall.Args
tags: [private]
```

```Go
func (c S3APIDeleteObjectFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIDeleteObjectFuncCall.Results" href="#S3APIDeleteObjectFuncCall.Results">func (c S3APIDeleteObjectFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIDeleteObjectFuncCall.Results
tags: [private]
```

```Go
func (c S3APIDeleteObjectFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APIGetObjectFunc" href="#S3APIGetObjectFunc">type S3APIGetObjectFunc struct</a>

```
searchKey: uploadstore.S3APIGetObjectFunc
tags: [private]
```

```Go
type S3APIGetObjectFunc struct {
	defaultHook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)
	hooks       []func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)
	history     []S3APIGetObjectFuncCall
	mutex       sync.Mutex
}
```

S3APIGetObjectFunc describes the behavior when the GetObject method of the parent MockS3API instance is invoked. 

#### <a id="S3APIGetObjectFunc.SetDefaultHook" href="#S3APIGetObjectFunc.SetDefaultHook">func (f *S3APIGetObjectFunc) SetDefaultHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) SetDefaultHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))
```

SetDefaultHook sets function that is called when the GetObject method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIGetObjectFunc.PushHook" href="#S3APIGetObjectFunc.PushHook">func (f *S3APIGetObjectFunc) PushHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) PushHook(hook func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the GetObject method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIGetObjectFunc.SetDefaultReturn" href="#S3APIGetObjectFunc.SetDefaultReturn">func (f *S3APIGetObjectFunc) SetDefaultReturn(r0 *s3.GetObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) SetDefaultReturn(r0 *s3.GetObjectOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIGetObjectFunc.PushReturn" href="#S3APIGetObjectFunc.PushReturn">func (f *S3APIGetObjectFunc) PushReturn(r0 *s3.GetObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) PushReturn(r0 *s3.GetObjectOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIGetObjectFunc.nextHook" href="#S3APIGetObjectFunc.nextHook">func (f *S3APIGetObjectFunc) nextHook() func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) nextHook() func(context.Context, *s3.GetObjectInput) (*s3.GetObjectOutput, error)
```

#### <a id="S3APIGetObjectFunc.appendCall" href="#S3APIGetObjectFunc.appendCall">func (f *S3APIGetObjectFunc) appendCall(r0 S3APIGetObjectFuncCall)</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) appendCall(r0 S3APIGetObjectFuncCall)
```

#### <a id="S3APIGetObjectFunc.History" href="#S3APIGetObjectFunc.History">func (f *S3APIGetObjectFunc) History() []S3APIGetObjectFuncCall</a>

```
searchKey: uploadstore.S3APIGetObjectFunc.History
tags: [private]
```

```Go
func (f *S3APIGetObjectFunc) History() []S3APIGetObjectFuncCall
```

History returns a sequence of S3APIGetObjectFuncCall objects describing the invocations of this function. 

### <a id="S3APIGetObjectFuncCall" href="#S3APIGetObjectFuncCall">type S3APIGetObjectFuncCall struct</a>

```
searchKey: uploadstore.S3APIGetObjectFuncCall
tags: [private]
```

```Go
type S3APIGetObjectFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.GetObjectInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.GetObjectOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIGetObjectFuncCall is an object that describes an invocation of method GetObject on an instance of MockS3API. 

#### <a id="S3APIGetObjectFuncCall.Args" href="#S3APIGetObjectFuncCall.Args">func (c S3APIGetObjectFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIGetObjectFuncCall.Args
tags: [private]
```

```Go
func (c S3APIGetObjectFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIGetObjectFuncCall.Results" href="#S3APIGetObjectFuncCall.Results">func (c S3APIGetObjectFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIGetObjectFuncCall.Results
tags: [private]
```

```Go
func (c S3APIGetObjectFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APIHeadObjectFunc" href="#S3APIHeadObjectFunc">type S3APIHeadObjectFunc struct</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc
tags: [private]
```

```Go
type S3APIHeadObjectFunc struct {
	defaultHook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
	hooks       []func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
	history     []S3APIHeadObjectFuncCall
	mutex       sync.Mutex
}
```

S3APIHeadObjectFunc describes the behavior when the HeadObject method of the parent MockS3API instance is invoked. 

#### <a id="S3APIHeadObjectFunc.SetDefaultHook" href="#S3APIHeadObjectFunc.SetDefaultHook">func (f *S3APIHeadObjectFunc) SetDefaultHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) SetDefaultHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))
```

SetDefaultHook sets function that is called when the HeadObject method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIHeadObjectFunc.PushHook" href="#S3APIHeadObjectFunc.PushHook">func (f *S3APIHeadObjectFunc) PushHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) PushHook(hook func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the HeadObject method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIHeadObjectFunc.SetDefaultReturn" href="#S3APIHeadObjectFunc.SetDefaultReturn">func (f *S3APIHeadObjectFunc) SetDefaultReturn(r0 *s3.HeadObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) SetDefaultReturn(r0 *s3.HeadObjectOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIHeadObjectFunc.PushReturn" href="#S3APIHeadObjectFunc.PushReturn">func (f *S3APIHeadObjectFunc) PushReturn(r0 *s3.HeadObjectOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) PushReturn(r0 *s3.HeadObjectOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIHeadObjectFunc.nextHook" href="#S3APIHeadObjectFunc.nextHook">func (f *S3APIHeadObjectFunc) nextHook() func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) nextHook() func(context.Context, *s3.HeadObjectInput) (*s3.HeadObjectOutput, error)
```

#### <a id="S3APIHeadObjectFunc.appendCall" href="#S3APIHeadObjectFunc.appendCall">func (f *S3APIHeadObjectFunc) appendCall(r0 S3APIHeadObjectFuncCall)</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) appendCall(r0 S3APIHeadObjectFuncCall)
```

#### <a id="S3APIHeadObjectFunc.History" href="#S3APIHeadObjectFunc.History">func (f *S3APIHeadObjectFunc) History() []S3APIHeadObjectFuncCall</a>

```
searchKey: uploadstore.S3APIHeadObjectFunc.History
tags: [private]
```

```Go
func (f *S3APIHeadObjectFunc) History() []S3APIHeadObjectFuncCall
```

History returns a sequence of S3APIHeadObjectFuncCall objects describing the invocations of this function. 

### <a id="S3APIHeadObjectFuncCall" href="#S3APIHeadObjectFuncCall">type S3APIHeadObjectFuncCall struct</a>

```
searchKey: uploadstore.S3APIHeadObjectFuncCall
tags: [private]
```

```Go
type S3APIHeadObjectFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.HeadObjectInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.HeadObjectOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIHeadObjectFuncCall is an object that describes an invocation of method HeadObject on an instance of MockS3API. 

#### <a id="S3APIHeadObjectFuncCall.Args" href="#S3APIHeadObjectFuncCall.Args">func (c S3APIHeadObjectFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIHeadObjectFuncCall.Args
tags: [private]
```

```Go
func (c S3APIHeadObjectFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIHeadObjectFuncCall.Results" href="#S3APIHeadObjectFuncCall.Results">func (c S3APIHeadObjectFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIHeadObjectFuncCall.Results
tags: [private]
```

```Go
func (c S3APIHeadObjectFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APIPutBucketLifecycleConfigurationFunc" href="#S3APIPutBucketLifecycleConfigurationFunc">type S3APIPutBucketLifecycleConfigurationFunc struct</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc
tags: [private]
```

```Go
type S3APIPutBucketLifecycleConfigurationFunc struct {
	defaultHook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
	hooks       []func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
	history     []S3APIPutBucketLifecycleConfigurationFuncCall
	mutex       sync.Mutex
}
```

S3APIPutBucketLifecycleConfigurationFunc describes the behavior when the PutBucketLifecycleConfiguration method of the parent MockS3API instance is invoked. 

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.SetDefaultHook" href="#S3APIPutBucketLifecycleConfigurationFunc.SetDefaultHook">func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))
```

SetDefaultHook sets function that is called when the PutBucketLifecycleConfiguration method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.PushHook" href="#S3APIPutBucketLifecycleConfigurationFunc.PushHook">func (f *S3APIPutBucketLifecycleConfigurationFunc) PushHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) PushHook(hook func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the PutBucketLifecycleConfiguration method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.SetDefaultReturn" href="#S3APIPutBucketLifecycleConfigurationFunc.SetDefaultReturn">func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) SetDefaultReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.PushReturn" href="#S3APIPutBucketLifecycleConfigurationFunc.PushReturn">func (f *S3APIPutBucketLifecycleConfigurationFunc) PushReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) PushReturn(r0 *s3.PutBucketLifecycleConfigurationOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.nextHook" href="#S3APIPutBucketLifecycleConfigurationFunc.nextHook">func (f *S3APIPutBucketLifecycleConfigurationFunc) nextHook() func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) nextHook() func(context.Context, *s3.PutBucketLifecycleConfigurationInput) (*s3.PutBucketLifecycleConfigurationOutput, error)
```

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.appendCall" href="#S3APIPutBucketLifecycleConfigurationFunc.appendCall">func (f *S3APIPutBucketLifecycleConfigurationFunc) appendCall(r0 S3APIPutBucketLifecycleConfigurationFuncCall)</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) appendCall(r0 S3APIPutBucketLifecycleConfigurationFuncCall)
```

#### <a id="S3APIPutBucketLifecycleConfigurationFunc.History" href="#S3APIPutBucketLifecycleConfigurationFunc.History">func (f *S3APIPutBucketLifecycleConfigurationFunc) History() []S3APIPutBucketLifecycleConfigurationFuncCall</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFunc.History
tags: [private]
```

```Go
func (f *S3APIPutBucketLifecycleConfigurationFunc) History() []S3APIPutBucketLifecycleConfigurationFuncCall
```

History returns a sequence of S3APIPutBucketLifecycleConfigurationFuncCall objects describing the invocations of this function. 

### <a id="S3APIPutBucketLifecycleConfigurationFuncCall" href="#S3APIPutBucketLifecycleConfigurationFuncCall">type S3APIPutBucketLifecycleConfigurationFuncCall struct</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFuncCall
tags: [private]
```

```Go
type S3APIPutBucketLifecycleConfigurationFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.PutBucketLifecycleConfigurationInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.PutBucketLifecycleConfigurationOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIPutBucketLifecycleConfigurationFuncCall is an object that describes an invocation of method PutBucketLifecycleConfiguration on an instance of MockS3API. 

#### <a id="S3APIPutBucketLifecycleConfigurationFuncCall.Args" href="#S3APIPutBucketLifecycleConfigurationFuncCall.Args">func (c S3APIPutBucketLifecycleConfigurationFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFuncCall.Args
tags: [private]
```

```Go
func (c S3APIPutBucketLifecycleConfigurationFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIPutBucketLifecycleConfigurationFuncCall.Results" href="#S3APIPutBucketLifecycleConfigurationFuncCall.Results">func (c S3APIPutBucketLifecycleConfigurationFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIPutBucketLifecycleConfigurationFuncCall.Results
tags: [private]
```

```Go
func (c S3APIPutBucketLifecycleConfigurationFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="S3APIUploadPartCopyFunc" href="#S3APIUploadPartCopyFunc">type S3APIUploadPartCopyFunc struct</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc
tags: [private]
```

```Go
type S3APIUploadPartCopyFunc struct {
	defaultHook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
	hooks       []func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
	history     []S3APIUploadPartCopyFuncCall
	mutex       sync.Mutex
}
```

S3APIUploadPartCopyFunc describes the behavior when the UploadPartCopy method of the parent MockS3API instance is invoked. 

#### <a id="S3APIUploadPartCopyFunc.SetDefaultHook" href="#S3APIUploadPartCopyFunc.SetDefaultHook">func (f *S3APIUploadPartCopyFunc) SetDefaultHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) SetDefaultHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))
```

SetDefaultHook sets function that is called when the UploadPartCopy method of the parent MockS3API instance is invoked and the hook queue is empty. 

#### <a id="S3APIUploadPartCopyFunc.PushHook" href="#S3APIUploadPartCopyFunc.PushHook">func (f *S3APIUploadPartCopyFunc) PushHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.PushHook
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) PushHook(hook func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error))
```

PushHook adds a function to the end of hook queue. Each invocation of the UploadPartCopy method of the parent MockS3API instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3APIUploadPartCopyFunc.SetDefaultReturn" href="#S3APIUploadPartCopyFunc.SetDefaultReturn">func (f *S3APIUploadPartCopyFunc) SetDefaultReturn(r0 *s3.UploadPartCopyOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) SetDefaultReturn(r0 *s3.UploadPartCopyOutput, r1 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3APIUploadPartCopyFunc.PushReturn" href="#S3APIUploadPartCopyFunc.PushReturn">func (f *S3APIUploadPartCopyFunc) PushReturn(r0 *s3.UploadPartCopyOutput, r1 error)</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.PushReturn
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) PushReturn(r0 *s3.UploadPartCopyOutput, r1 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3APIUploadPartCopyFunc.nextHook" href="#S3APIUploadPartCopyFunc.nextHook">func (f *S3APIUploadPartCopyFunc) nextHook() func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.nextHook
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) nextHook() func(context.Context, *s3.UploadPartCopyInput) (*s3.UploadPartCopyOutput, error)
```

#### <a id="S3APIUploadPartCopyFunc.appendCall" href="#S3APIUploadPartCopyFunc.appendCall">func (f *S3APIUploadPartCopyFunc) appendCall(r0 S3APIUploadPartCopyFuncCall)</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.appendCall
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) appendCall(r0 S3APIUploadPartCopyFuncCall)
```

#### <a id="S3APIUploadPartCopyFunc.History" href="#S3APIUploadPartCopyFunc.History">func (f *S3APIUploadPartCopyFunc) History() []S3APIUploadPartCopyFuncCall</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFunc.History
tags: [private]
```

```Go
func (f *S3APIUploadPartCopyFunc) History() []S3APIUploadPartCopyFuncCall
```

History returns a sequence of S3APIUploadPartCopyFuncCall objects describing the invocations of this function. 

### <a id="S3APIUploadPartCopyFuncCall" href="#S3APIUploadPartCopyFuncCall">type S3APIUploadPartCopyFuncCall struct</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFuncCall
tags: [private]
```

```Go
type S3APIUploadPartCopyFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.UploadPartCopyInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 *s3.UploadPartCopyOutput
	// Result1 is the value of the 2nd result returned from this method
	// invocation.
	Result1 error
}
```

S3APIUploadPartCopyFuncCall is an object that describes an invocation of method UploadPartCopy on an instance of MockS3API. 

#### <a id="S3APIUploadPartCopyFuncCall.Args" href="#S3APIUploadPartCopyFuncCall.Args">func (c S3APIUploadPartCopyFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFuncCall.Args
tags: [private]
```

```Go
func (c S3APIUploadPartCopyFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3APIUploadPartCopyFuncCall.Results" href="#S3APIUploadPartCopyFuncCall.Results">func (c S3APIUploadPartCopyFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3APIUploadPartCopyFuncCall.Results
tags: [private]
```

```Go
func (c S3APIUploadPartCopyFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

### <a id="MockS3Uploader" href="#MockS3Uploader">type MockS3Uploader struct</a>

```
searchKey: uploadstore.MockS3Uploader
tags: [private]
```

```Go
type MockS3Uploader struct {
	// UploadFunc is an instance of a mock function object controlling the
	// behavior of the method Upload.
	UploadFunc *S3UploaderUploadFunc
}
```

MockS3Uploader is a mock implementation of the s3Uploader interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore) used for unit testing. 

#### <a id="NewMockS3Uploader" href="#NewMockS3Uploader">func NewMockS3Uploader() *MockS3Uploader</a>

```
searchKey: uploadstore.NewMockS3Uploader
tags: [private]
```

```Go
func NewMockS3Uploader() *MockS3Uploader
```

NewMockS3Uploader creates a new mock of the s3Uploader interface. All methods return zero values for all results, unless overwritten. 

#### <a id="NewMockS3UploaderFrom" href="#NewMockS3UploaderFrom">func NewMockS3UploaderFrom(i surrogateMockS3Uploader) *MockS3Uploader</a>

```
searchKey: uploadstore.NewMockS3UploaderFrom
tags: [private]
```

```Go
func NewMockS3UploaderFrom(i surrogateMockS3Uploader) *MockS3Uploader
```

NewMockS3UploaderFrom creates a new mock of the MockS3Uploader interface. All methods delegate to the given implementation, unless overwritten. 

#### <a id="MockS3Uploader.Upload" href="#MockS3Uploader.Upload">func (m *MockS3Uploader) Upload(v0 context.Context, v1 *s3.PutObjectInput) error</a>

```
searchKey: uploadstore.MockS3Uploader.Upload
tags: [private]
```

```Go
func (m *MockS3Uploader) Upload(v0 context.Context, v1 *s3.PutObjectInput) error
```

Upload delegates to the next hook function in the queue and stores the parameter and result values of this invocation. 

### <a id="surrogateMockS3Uploader" href="#surrogateMockS3Uploader">type surrogateMockS3Uploader interface</a>

```
searchKey: uploadstore.surrogateMockS3Uploader
tags: [private]
```

```Go
type surrogateMockS3Uploader interface {
	Upload(context.Context, *s3.PutObjectInput) error
}
```

surrogateMockS3Uploader is a copy of the s3Uploader interface (from the package github.com/sourcegraph/sourcegraph/enterprise/internal/codeintel/stores/uploadstore). It is redefined here as it is unexported in the source package. 

### <a id="S3UploaderUploadFunc" href="#S3UploaderUploadFunc">type S3UploaderUploadFunc struct</a>

```
searchKey: uploadstore.S3UploaderUploadFunc
tags: [private]
```

```Go
type S3UploaderUploadFunc struct {
	defaultHook func(context.Context, *s3.PutObjectInput) error
	hooks       []func(context.Context, *s3.PutObjectInput) error
	history     []S3UploaderUploadFuncCall
	mutex       sync.Mutex
}
```

S3UploaderUploadFunc describes the behavior when the Upload method of the parent MockS3Uploader instance is invoked. 

#### <a id="S3UploaderUploadFunc.SetDefaultHook" href="#S3UploaderUploadFunc.SetDefaultHook">func (f *S3UploaderUploadFunc) SetDefaultHook(hook func(context.Context, *s3.PutObjectInput) error)</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.SetDefaultHook
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) SetDefaultHook(hook func(context.Context, *s3.PutObjectInput) error)
```

SetDefaultHook sets function that is called when the Upload method of the parent MockS3Uploader instance is invoked and the hook queue is empty. 

#### <a id="S3UploaderUploadFunc.PushHook" href="#S3UploaderUploadFunc.PushHook">func (f *S3UploaderUploadFunc) PushHook(hook func(context.Context, *s3.PutObjectInput) error)</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.PushHook
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) PushHook(hook func(context.Context, *s3.PutObjectInput) error)
```

PushHook adds a function to the end of hook queue. Each invocation of the Upload method of the parent MockS3Uploader instance invokes the hook at the front of the queue and discards it. After the queue is empty, the default hook function is invoked for any future action. 

#### <a id="S3UploaderUploadFunc.SetDefaultReturn" href="#S3UploaderUploadFunc.SetDefaultReturn">func (f *S3UploaderUploadFunc) SetDefaultReturn(r0 error)</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.SetDefaultReturn
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) SetDefaultReturn(r0 error)
```

SetDefaultReturn calls SetDefaultDefaultHook with a function that returns the given values. 

#### <a id="S3UploaderUploadFunc.PushReturn" href="#S3UploaderUploadFunc.PushReturn">func (f *S3UploaderUploadFunc) PushReturn(r0 error)</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.PushReturn
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) PushReturn(r0 error)
```

PushReturn calls PushDefaultHook with a function that returns the given values. 

#### <a id="S3UploaderUploadFunc.nextHook" href="#S3UploaderUploadFunc.nextHook">func (f *S3UploaderUploadFunc) nextHook() func(context.Context, *s3.PutObjectInput) error</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.nextHook
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) nextHook() func(context.Context, *s3.PutObjectInput) error
```

#### <a id="S3UploaderUploadFunc.appendCall" href="#S3UploaderUploadFunc.appendCall">func (f *S3UploaderUploadFunc) appendCall(r0 S3UploaderUploadFuncCall)</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.appendCall
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) appendCall(r0 S3UploaderUploadFuncCall)
```

#### <a id="S3UploaderUploadFunc.History" href="#S3UploaderUploadFunc.History">func (f *S3UploaderUploadFunc) History() []S3UploaderUploadFuncCall</a>

```
searchKey: uploadstore.S3UploaderUploadFunc.History
tags: [private]
```

```Go
func (f *S3UploaderUploadFunc) History() []S3UploaderUploadFuncCall
```

History returns a sequence of S3UploaderUploadFuncCall objects describing the invocations of this function. 

### <a id="S3UploaderUploadFuncCall" href="#S3UploaderUploadFuncCall">type S3UploaderUploadFuncCall struct</a>

```
searchKey: uploadstore.S3UploaderUploadFuncCall
tags: [private]
```

```Go
type S3UploaderUploadFuncCall struct {
	// Arg0 is the value of the 1st argument passed to this method
	// invocation.
	Arg0 context.Context
	// Arg1 is the value of the 2nd argument passed to this method
	// invocation.
	Arg1 *s3.PutObjectInput
	// Result0 is the value of the 1st result returned from this method
	// invocation.
	Result0 error
}
```

S3UploaderUploadFuncCall is an object that describes an invocation of method Upload on an instance of MockS3Uploader. 

#### <a id="S3UploaderUploadFuncCall.Args" href="#S3UploaderUploadFuncCall.Args">func (c S3UploaderUploadFuncCall) Args() []interface{}</a>

```
searchKey: uploadstore.S3UploaderUploadFuncCall.Args
tags: [private]
```

```Go
func (c S3UploaderUploadFuncCall) Args() []interface{}
```

Args returns an interface slice containing the arguments of this invocation. 

#### <a id="S3UploaderUploadFuncCall.Results" href="#S3UploaderUploadFuncCall.Results">func (c S3UploaderUploadFuncCall) Results() []interface{}</a>

```
searchKey: uploadstore.S3UploaderUploadFuncCall.Results
tags: [private]
```

```Go
func (c S3UploaderUploadFuncCall) Results() []interface{}
```

Results returns an interface slice containing the results of this invocation. 

## <a id="func" href="#func">Functions</a>

```
tags: [private]
```

### <a id="gcsClientOptions" href="#gcsClientOptions">func gcsClientOptions(config GCSConfig) []option.ClientOption</a>

```
searchKey: uploadstore.gcsClientOptions
tags: [private]
```

```Go
func gcsClientOptions(config GCSConfig) []option.ClientOption
```

### <a id="s3ClientConfig" href="#s3ClientConfig">func s3ClientConfig(ctx context.Context, s3config S3Config) (aws.Config, error)</a>

```
searchKey: uploadstore.s3ClientConfig
tags: [private]
```

```Go
func s3ClientConfig(ctx context.Context, s3config S3Config) (aws.Config, error)
```

### <a id="s3ClientOptions" href="#s3ClientOptions">func s3ClientOptions(backend string, config S3Config) func(o *s3.Options)</a>

```
searchKey: uploadstore.s3ClientOptions
tags: [private]
```

```Go
func s3ClientOptions(backend string, config S3Config) func(o *s3.Options)
```

### <a id="writeToPipe" href="#writeToPipe">func writeToPipe(fn func(w io.Writer) error) io.Reader</a>

```
searchKey: uploadstore.writeToPipe
tags: [private]
```

```Go
func writeToPipe(fn func(w io.Writer) error) io.Reader
```

writeToPipe invokes the given function with a pipe writer in a goroutine and returns the associated pipe reader. 

### <a id="isConnectionResetError" href="#isConnectionResetError">func isConnectionResetError(err error) bool</a>

```
searchKey: uploadstore.isConnectionResetError
tags: [private]
```

```Go
func isConnectionResetError(err error) bool
```

### <a id="s3BucketLifecycleConfiguration" href="#s3BucketLifecycleConfiguration">func s3BucketLifecycleConfiguration(backend string, ttl time.Duration) *s3types.BucketLifecycleConfiguration</a>

```
searchKey: uploadstore.s3BucketLifecycleConfiguration
tags: [private]
```

```Go
func s3BucketLifecycleConfiguration(backend string, ttl time.Duration) *s3types.BucketLifecycleConfiguration
```

### <a id="TestConfigDefaults" href="#TestConfigDefaults">func TestConfigDefaults(t *testing.T)</a>

```
searchKey: uploadstore.TestConfigDefaults
tags: [private]
```

```Go
func TestConfigDefaults(t *testing.T)
```

### <a id="TestConfigS3" href="#TestConfigS3">func TestConfigS3(t *testing.T)</a>

```
searchKey: uploadstore.TestConfigS3
tags: [private]
```

```Go
func TestConfigS3(t *testing.T)
```

### <a id="TestS3ClientOptions" href="#TestS3ClientOptions">func TestS3ClientOptions(t *testing.T)</a>

```
searchKey: uploadstore.TestS3ClientOptions
tags: [private]
```

```Go
func TestS3ClientOptions(t *testing.T)
```

### <a id="TestS3ClientConfig" href="#TestS3ClientConfig">func TestS3ClientConfig(t *testing.T)</a>

```
searchKey: uploadstore.TestS3ClientConfig
tags: [private]
```

```Go
func TestS3ClientConfig(t *testing.T)
```

### <a id="TestConfigGCS" href="#TestConfigGCS">func TestConfigGCS(t *testing.T)</a>

```
searchKey: uploadstore.TestConfigGCS
tags: [private]
```

```Go
func TestConfigGCS(t *testing.T)
```

### <a id="mapGetter" href="#mapGetter">func mapGetter(env map[string]string) func(name, defaultValue, description string) string</a>

```
searchKey: uploadstore.mapGetter
tags: [private]
```

```Go
func mapGetter(env map[string]string) func(name, defaultValue, description string) string
```

### <a id="TestGCSInit" href="#TestGCSInit">func TestGCSInit(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSInit
tags: [private]
```

```Go
func TestGCSInit(t *testing.T)
```

### <a id="TestGCSInitBucketExists" href="#TestGCSInitBucketExists">func TestGCSInitBucketExists(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSInitBucketExists
tags: [private]
```

```Go
func TestGCSInitBucketExists(t *testing.T)
```

### <a id="TestGCSUnmanagedInit" href="#TestGCSUnmanagedInit">func TestGCSUnmanagedInit(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSUnmanagedInit
tags: [private]
```

```Go
func TestGCSUnmanagedInit(t *testing.T)
```

### <a id="TestGCSGet" href="#TestGCSGet">func TestGCSGet(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSGet
tags: [private]
```

```Go
func TestGCSGet(t *testing.T)
```

### <a id="TestGCSUpload" href="#TestGCSUpload">func TestGCSUpload(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSUpload
tags: [private]
```

```Go
func TestGCSUpload(t *testing.T)
```

### <a id="TestGCSCombine" href="#TestGCSCombine">func TestGCSCombine(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSCombine
tags: [private]
```

```Go
func TestGCSCombine(t *testing.T)
```

### <a id="TestGCSDelete" href="#TestGCSDelete">func TestGCSDelete(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSDelete
tags: [private]
```

```Go
func TestGCSDelete(t *testing.T)
```

### <a id="TestGCSLifecycle" href="#TestGCSLifecycle">func TestGCSLifecycle(t *testing.T)</a>

```
searchKey: uploadstore.TestGCSLifecycle
tags: [private]
```

```Go
func TestGCSLifecycle(t *testing.T)
```

### <a id="TestS3Init" href="#TestS3Init">func TestS3Init(t *testing.T)</a>

```
searchKey: uploadstore.TestS3Init
tags: [private]
```

```Go
func TestS3Init(t *testing.T)
```

### <a id="TestS3InitBucketExists" href="#TestS3InitBucketExists">func TestS3InitBucketExists(t *testing.T)</a>

```
searchKey: uploadstore.TestS3InitBucketExists
tags: [private]
```

```Go
func TestS3InitBucketExists(t *testing.T)
```

### <a id="TestS3UnmanagedInit" href="#TestS3UnmanagedInit">func TestS3UnmanagedInit(t *testing.T)</a>

```
searchKey: uploadstore.TestS3UnmanagedInit
tags: [private]
```

```Go
func TestS3UnmanagedInit(t *testing.T)
```

### <a id="TestS3Get" href="#TestS3Get">func TestS3Get(t *testing.T)</a>

```
searchKey: uploadstore.TestS3Get
tags: [private]
```

```Go
func TestS3Get(t *testing.T)
```

### <a id="TestS3GetTransientErrors" href="#TestS3GetTransientErrors">func TestS3GetTransientErrors(t *testing.T)</a>

```
searchKey: uploadstore.TestS3GetTransientErrors
tags: [private]
```

```Go
func TestS3GetTransientErrors(t *testing.T)
```

### <a id="TestS3GetReadNothingLoop" href="#TestS3GetReadNothingLoop">func TestS3GetReadNothingLoop(t *testing.T)</a>

```
searchKey: uploadstore.TestS3GetReadNothingLoop
tags: [private]
```

```Go
func TestS3GetReadNothingLoop(t *testing.T)
```

### <a id="TestS3Upload" href="#TestS3Upload">func TestS3Upload(t *testing.T)</a>

```
searchKey: uploadstore.TestS3Upload
tags: [private]
```

```Go
func TestS3Upload(t *testing.T)
```

### <a id="TestS3Combine" href="#TestS3Combine">func TestS3Combine(t *testing.T)</a>

```
searchKey: uploadstore.TestS3Combine
tags: [private]
```

```Go
func TestS3Combine(t *testing.T)
```

### <a id="TestS3Delete" href="#TestS3Delete">func TestS3Delete(t *testing.T)</a>

```
searchKey: uploadstore.TestS3Delete
tags: [private]
```

```Go
func TestS3Delete(t *testing.T)
```

### <a id="TestS3BucketLifecycleConfiguration" href="#TestS3BucketLifecycleConfiguration">func TestS3BucketLifecycleConfiguration(t *testing.T)</a>

```
searchKey: uploadstore.TestS3BucketLifecycleConfiguration
tags: [private]
```

```Go
func TestS3BucketLifecycleConfiguration(t *testing.T)
```

### <a id="TestMain" href="#TestMain">func TestMain(m *testing.M)</a>

```
searchKey: uploadstore.TestMain
tags: [private]
```

```Go
func TestMain(m *testing.M)
```

