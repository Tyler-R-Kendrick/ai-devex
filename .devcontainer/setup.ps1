#!/usr/bin/env pwsh
# Dev Container Post-Create Setup Script

Write-Host "Starting post-create setup..." -ForegroundColor Green

# Install uv package manager
Write-Host "Installing uv package manager..." -ForegroundColor Cyan
try {
    # Install uv using the official PowerShell installer
    Invoke-RestMethod https://astral.sh/uv/install.ps1 | Invoke-Expression
    
    # Add uv to PATH for current session
    $env:PATH = "$env:HOME/.cargo/bin:$env:PATH"
    
    Write-Host "✓ uv package manager installed successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install uv package manager: $_" -ForegroundColor Red
}

# Install .NET Aspire CLI
Write-Host "Installing .NET Aspire CLI..." -ForegroundColor Cyan
try {
    # Install Aspire CLI as a global tool
    dotnet tool install -g Microsoft.Aspire.Cli
    
    # Add dotnet tools to PATH for current session
    $env:PATH = "$env:HOME/.dotnet/tools:$env:PATH"
    
    Write-Host "✓ .NET Aspire CLI installed successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install .NET Aspire CLI: $_" -ForegroundColor Red
}

# Verify installations
Write-Host "`nVerifying installations..." -ForegroundColor Cyan

# Check uv
if (Get-Command uv -ErrorAction SilentlyContinue) {
    $uvVersion = uv --version
    Write-Host "✓ uv: $uvVersion" -ForegroundColor Green
} else {
    Write-Host "✗ uv not found in PATH" -ForegroundColor Yellow
}

# Check dotnet
if (Get-Command dotnet -ErrorAction SilentlyContinue) {
    $dotnetVersion = dotnet --version
    Write-Host "✓ dotnet: $dotnetVersion" -ForegroundColor Green
    
    # Check Aspire CLI
    if (Get-Command aspire -ErrorAction SilentlyContinue) {
        $aspireVersion = aspire --version
        Write-Host "✓ Aspire CLI: $aspireVersion" -ForegroundColor Green
    } else {
        Write-Host "✗ Aspire CLI not found in PATH" -ForegroundColor Yellow
    }
} else {
    Write-Host "✗ dotnet not found" -ForegroundColor Red
}

# Check azd
if (Get-Command azd -ErrorAction SilentlyContinue) {
    $azdVersion = azd version
    Write-Host "✓ azd: $azdVersion" -ForegroundColor Green
} else {
    Write-Host "✗ azd not found" -ForegroundColor Yellow
}

# Check gh
if (Get-Command gh -ErrorAction SilentlyContinue) {
    $ghVersion = gh --version | Select-Object -First 1
    Write-Host "✓ GitHub CLI: $ghVersion" -ForegroundColor Green
} else {
    Write-Host "✗ gh not found" -ForegroundColor Yellow
}

# Check docker
if (Get-Command docker -ErrorAction SilentlyContinue) {
    $dockerVersion = docker --version
    Write-Host "✓ Docker: $dockerVersion" -ForegroundColor Green
} else {
    Write-Host "✗ docker not found" -ForegroundColor Yellow
}

Write-Host "`nPost-create setup completed!" -ForegroundColor Green
