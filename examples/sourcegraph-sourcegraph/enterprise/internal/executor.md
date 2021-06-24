# Package executor

## Index

* [Types](#type)
    * [type AddExecutionLogEntryRequest struct](#AddExecutionLogEntryRequest)
    * [type CliStep struct](#CliStep)
    * [type DequeueRequest struct](#DequeueRequest)
    * [type DockerStep struct](#DockerStep)
    * [type HeartbeatRequest struct](#HeartbeatRequest)
    * [type Job struct](#Job)
        * [func (j Job) RecordID() int](#Job.RecordID)
    * [type MarkCompleteRequest struct](#MarkCompleteRequest)
    * [type MarkErroredRequest struct](#MarkErroredRequest)


## <a id="type" href="#type">Types</a>

```
tags: [package private]
```

### <a id="AddExecutionLogEntryRequest" href="#AddExecutionLogEntryRequest">type AddExecutionLogEntryRequest struct</a>

```
searchKey: executor.AddExecutionLogEntryRequest
tags: [struct]
```

```Go
type AddExecutionLogEntryRequest struct {
	ExecutorName string `json:"executorName"`
	JobID        int    `json:"jobId"`
	workerutil.ExecutionLogEntry
}
```

### <a id="CliStep" href="#CliStep">type CliStep struct</a>

```
searchKey: executor.CliStep
tags: [struct]
```

```Go
type CliStep struct {
	// Commands specifies the arguments supplied to the src command.
	Commands []string `json:"command"`

	// Dir specifies the target working directory.
	Dir string `json:"dir"`

	// Env specifies a set of NAME=value pairs to supply to the src command.
	Env []string `json:"env"`
}
```

### <a id="DequeueRequest" href="#DequeueRequest">type DequeueRequest struct</a>

```
searchKey: executor.DequeueRequest
tags: [struct]
```

```Go
type DequeueRequest struct {
	ExecutorName string `json:"executorName"`
}
```

### <a id="DockerStep" href="#DockerStep">type DockerStep struct</a>

```
searchKey: executor.DockerStep
tags: [struct]
```

```Go
type DockerStep struct {
	// Image specifies the docker image.
	Image string `json:"image"`

	// Commands specifies the arguments supplied to the end of a docker run command.
	Commands []string `json:"commands"`

	// Dir specifies the target working directory.
	Dir string `json:"dir"`

	// Env specifies a set of NAME=value pairs to supply to the docker command.
	Env []string `json:"env"`
}
```

### <a id="HeartbeatRequest" href="#HeartbeatRequest">type HeartbeatRequest struct</a>

```
searchKey: executor.HeartbeatRequest
tags: [struct]
```

```Go
type HeartbeatRequest struct {
	ExecutorName string `json:"executorName"`
	JobIDs       []int  `json:"jobIds"`
}
```

### <a id="Job" href="#Job">type Job struct</a>

```
searchKey: executor.Job
tags: [struct]
```

```Go
type Job struct {
	// ID is the unique identifier of a job within the source queue. Note
	// that different queues can share identifiers.
	ID int `json:"id"`

	// RepositoryName is the name of the repository to be cloned into the
	// workspace prior to job execution.
	RepositoryName string `json:"repositoryName"`

	// Commit is the revhash that should be checked out prior to job execution.
	Commit string `json:"commit"`

	// VirtualMachineFiles is a map from file names to content. Each entry in
	// this map will be written into the workspace prior to job execution.
	VirtualMachineFiles map[string]string `json:"files"`

	// DockerSteps describe a series of docker run commands to be invoked in the
	// workspace. This may be done inside or outside of a Firecracker virtual
	// machine.
	DockerSteps []DockerStep `json:"dockerSteps"`

	// CliSteps describe a series of src commands to be invoked in the workspace.
	// These run after all docker commands have been completed successfully. This
	// may be done inside or outside of a Firecracker virtual machine.
	CliSteps []CliStep `json:"cliSteps"`

	// RedactedValues is a map from strings to replace to their replacement in the command
	// output before sending it to the underlying job store. This should contain all worker
	// environment variables, as well as secret values passed along with the dequeued job
	// payload, which may be sensitive (e.g. shared API tokens, URLs with credentials).
	RedactedValues map[string]string `json:"redactedValues"`
}
```

Job describes a series of steps to perform within an executor. 

#### <a id="Job.RecordID" href="#Job.RecordID">func (j Job) RecordID() int</a>

```
searchKey: executor.Job.RecordID
tags: [function]
```

```Go
func (j Job) RecordID() int
```

### <a id="MarkCompleteRequest" href="#MarkCompleteRequest">type MarkCompleteRequest struct</a>

```
searchKey: executor.MarkCompleteRequest
tags: [struct]
```

```Go
type MarkCompleteRequest struct {
	ExecutorName string `json:"executorName"`
	JobID        int    `json:"jobId"`
}
```

### <a id="MarkErroredRequest" href="#MarkErroredRequest">type MarkErroredRequest struct</a>

```
searchKey: executor.MarkErroredRequest
tags: [struct]
```

```Go
type MarkErroredRequest struct {
	ExecutorName string `json:"executorName"`
	JobID        int    `json:"jobId"`
	ErrorMessage string `json:"errorMessage"`
}
```

