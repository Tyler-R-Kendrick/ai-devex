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

#### Python Single-File Configuration

Aspire also supports Python applications. Create a minimal configuration:

```python
# app.py
from aspire import DistributedApplication

app = DistributedApplication()

# Add your services
redis = app.add_redis("cache")
api = app.add_container("api", "myapp:latest")

# Connect services
api.with_reference(redis)

if __name__ == "__main__":
    app.run()
```

Run the Python Aspire application:

```powershell
# Install Python Aspire package
uv pip install aspire-hosting

# Run your application
python app.py
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

**Python Example:**
```python
# app.py
from aspire import DistributedApplication
app = DistributedApplication()
app.add_redis("cache")
app.run()
```

### 2. Run and Test

```powershell
# For .NET
aspire run app.cs

# For Python
python app.py
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

### Multi-Language Support

Aspire works seamlessly with both .NET and Python:

```powershell
# .NET service
aspire add service api --language csharp

# Python service
aspire add service worker --language python
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
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);
builder.AddRedis("cache").WithDataVolume();
builder.Build().Run();
```

```powershell
aspire run redis-example.cs
```

### Example 2: Multi-Service Application

```csharp
using Aspire.Hosting;

var builder = DistributedApplication.CreateBuilder(args);

var cache = builder.AddRedis("cache");
var postgres = builder.AddPostgres("db");
var api = builder.AddProject<Projects.Api>("api")
    .WithReference(cache)
    .WithReference(postgres);

builder.Build().Run();
```

### Example 3: Python with Redis

```python
from aspire import DistributedApplication

app = DistributedApplication()

# Add Redis
redis = app.add_redis("cache", port=6379)

# Add a Python service
worker = app.add_python_project("worker", path="./worker")
worker.with_reference(redis)

app.run()
```

```powershell
python aspire-app.py
```

## Contributing

When contributing Aspire configurations to this repository:

1. Prefer single-file configurations for simple use cases
2. Use PowerShell Core for all scripts and examples
3. Test with both .NET and Python when applicable
4. Document any external dependencies
5. Follow the existing code style and structure
