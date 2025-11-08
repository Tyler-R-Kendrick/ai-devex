# .NET Aspire Development Guide

This guide covers installation, usage, and development with .NET Aspire in this repository, with a focus on single-file configurations in both .NET and Python.

## Installation

### Prerequisites
- .NET 10 SDK or later
- PowerShell Core

### Installing .NET Aspire CLI

The .NET Aspire CLI is installed automatically when you open this repository in the dev container. To install it manually:

```powershell
# Install Aspire CLI as a global tool
dotnet tool install -g Microsoft.Aspire.Cli

# Verify installation
aspire --version
```

For more details, see the [official installation guide](https://aspire.dev/get-started/install-cli/).

## Using .NET Aspire

### Single-File Aspire Configurations

Aspire supports single-file configurations that are ideal for quick prototyping and simple applications.

#### .NET Single-File Configuration

Create a minimal `Program.cs` file:

```csharp
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

// Add your services here
var api = builder.AddProject<Projects.ApiService>("api");
var cache = builder.AddRedis("cache");

// Connect services
api.WithReference(cache);

builder.Build().Run();
```

Run the application:

```powershell
# Create a new Aspire app
aspire init

# Run your Aspire application
aspire run
```

#### Python Service Orchestration

> **Note:** .NET Aspire is a .NET-specific technology and does not provide a native Python SDK or package. However, Aspire can orchestrate Python services by running them as containers.

To orchestrate a Python service with Aspire, create a Dockerfile for your Python application:

```dockerfile
# Dockerfile for Python service
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

Then add it to your Aspire configuration as a container:

```csharp
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

// Add Redis
var cache = builder.AddRedis("cache");

// Add Python service as a container
var pythonWorker = builder.AddContainer("python-worker", "your-python-image")
    .WithReference(cache);

builder.Build().Run();
```

### Creating a New Aspire Project

```powershell
# Create a new Aspire application
aspire init my-app

# Navigate to the project directory
cd my-app

# Run the application
aspire run
```

### Common Aspire Commands

```powershell
# Initialize a new Aspire application
aspire init [name]

# Run an Aspire application
aspire run

# Build an Aspire application
aspire build

# Get help
aspire --help

# Check version
aspire --version
```

## Development Workflow

### 1. Create a Single-File Application

For rapid development, start with a single file:

**C# Example:**
```csharp
// app.cs
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);
var cache = builder.AddRedis("cache");
builder.Build().Run();
```

**Python Service (as Container):**
```csharp
// AppHost/Program.cs - Orchestrating a Python service
var builder = DistributedApplication.CreateBuilder(args);
var cache = builder.AddRedis("cache");
var pythonApp = builder.AddContainer("python-app", "my-python-image")
    .WithReference(cache);
builder.Build().Run();
```

### 2. Run and Test

```powershell
# For .NET Aspire projects
dotnet run --project AppHost
```

### 3. Add Services

Aspire supports various service types:
- Redis cache
- PostgreSQL/SQL Server databases
- Container-based services
- HTTP services
- Message queues (RabbitMQ, Azure Service Bus)

### 4. Local Development

```powershell
# Watch mode for auto-reload during development
aspire run --watch

# Specify environment
aspire run --environment Development

# View logs
aspire logs
```

## Best Practices

### Single-File Configurations

1. **Keep it Simple**: Single-file configs are ideal for:
   - Prototypes
   - Learning
   - Small microservices
   - Simple orchestration

2. **Structure**: Even in a single file, organize your code:
   ```csharp
   // 1. Using statements
   // 2. Builder creation
   // 3. Service definitions
   // 4. Service connections
   // 5. Build and run
   ```

3. **Environment Variables**: Use configuration for flexibility:
   ```csharp
   var redisHost = builder.Configuration["Redis:Host"] ?? "localhost";
   ```

### Container Orchestration

Aspire can orchestrate services written in different languages by running them as containers. While Aspire itself is a .NET technology, it excels at managing multi-language distributed applications.

**Example: Orchestrating .NET and Python services:**

```csharp
// AppHost/Program.cs
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

// Add infrastructure
var cache = builder.AddRedis("cache");
var postgres = builder.AddPostgres("postgres");

// Add .NET service
var api = builder.AddProject<Projects.ApiService>("api")
    .WithReference(cache)
    .WithReference(postgres);

// Add Python service as container
var pythonWorker = builder.AddContainer("python-worker", "my-python-worker")
    .WithReference(cache)
    .WithReference(postgres);

builder.Build().Run();
```

## Troubleshooting

### Aspire CLI Not Found

```powershell
# Ensure dotnet tools are in PATH
$env:PATH = "$env:HOME/.dotnet/tools:$env:PATH"

# Reinstall if needed
dotnet tool uninstall -g Microsoft.Aspire.Cli
dotnet tool install -g Microsoft.Aspire.Cli
```

### Version Compatibility

Ensure you're using .NET 10 or later:

```powershell
dotnet --version
# Should output 10.0.x or higher
```

### Service Connection Issues

Check service health:

```powershell
# View all services
aspire status

# View service logs
aspire logs [service-name]
```

## Resources

- [Official Aspire Documentation](https://aspire.dev/)
- [Installation Guide](https://aspire.dev/get-started/install-cli/)
- [Aspire Samples](https://github.com/dotnet/aspire-samples)
- [Aspire GitHub Repository](https://github.com/dotnet/aspire)

## Examples

### Example 1: Simple Redis Cache Service

```csharp
// AppHost/Program.cs
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);
builder.AddRedis("cache").WithDataVolume();
builder.Build().Run();
```

Run the application:
```powershell
dotnet run --project AppHost
```

### Example 2: Multi-Service Application

```csharp
// AppHost/Program.cs
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

var cache = builder.AddRedis("cache");
var postgres = builder.AddPostgres("db");
var api = builder.AddProject<Projects.Api>("api")
    .WithReference(cache)
    .WithReference(postgres);

builder.Build().Run();
```

### Example 3: Orchestrating Python Service with Redis

```csharp
// AppHost/Program.cs
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

// Add Redis
var redis = builder.AddRedis("cache");

// Add Python worker as container
var pythonWorker = builder.AddContainer("python-worker", "python-worker:latest")
    .WithReference(redis)
    .WithEnvironment("REDIS_HOST", redis.Resource.Name);

builder.Build().Run();
```

Build and run:
```powershell
dotnet run --project AppHost
```

## Contributing

When contributing Aspire configurations to this repository:

1. Prefer single-file configurations for simple use cases
2. Use PowerShell Core for all scripts and examples
3. Test with both .NET and Python when applicable
4. Document any external dependencies
5. Follow the existing code style and structure
