# Package conftypes

## Index

* [Types](#type)
    * [type ServiceConnections struct](#ServiceConnections)
    * [type RawUnified struct](#RawUnified)
        * [func (r RawUnified) Equal(other RawUnified) bool](#RawUnified.Equal)


## <a id="type" href="#type">Types</a>

### <a id="ServiceConnections" href="#ServiceConnections">type ServiceConnections struct</a>

```
searchKey: conftypes.ServiceConnections
tags: [exported]
```

```Go
type ServiceConnections struct {
	// GitServers is the addresses of gitserver instances that should be
	// talked to.
	GitServers []string `json:"gitServers"`

	// PostgresDSN is the PostgreSQL DB data source name.
	// eg: "postgres://sg@pgsql/sourcegraph?sslmode=false"
	PostgresDSN string `json:"postgresDSN"`

	// CodeIntelPostgresDSN is the PostgreSQL DB data source name for the
	// code intel database.
	// eg: "postgres://sg@pgsql/sourcegraph_codeintel?sslmode=false"
	CodeIntelPostgresDSN string `json:"codeIntelPostgresDSN"`

	// CodeInsightsTimescaleDSN is the TimescaleDB data source name for the
	// code insights database.
	// eg: "postgres://sg@pgsql/sourcegraph_codeintel?sslmode=false"
	CodeInsightsTimescaleDSN string `json:"codeinsightsTimescaleDSN"`
}
```

ServiceConnections represents configuration about how the deployment internally connects to services. These are settings that need to be propagated from the frontend to other services, so that the frontend can be the source of truth for all configuration. 

### <a id="RawUnified" href="#RawUnified">type RawUnified struct</a>

```
searchKey: conftypes.RawUnified
tags: [exported]
```

```Go
type RawUnified struct {
	Site               string
	ServiceConnections ServiceConnections
}
```

RawUnified is the unparsed variant of conf.Unified. 

#### <a id="RawUnified.Equal" href="#RawUnified.Equal">func (r RawUnified) Equal(other RawUnified) bool</a>

```
searchKey: conftypes.RawUnified.Equal
tags: [exported]
```

```Go
func (r RawUnified) Equal(other RawUnified) bool
```

Equal tells if the two configurations are equal or not. 

