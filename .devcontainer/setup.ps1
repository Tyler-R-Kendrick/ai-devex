#!/usr/bin/env pwsh
# Dev Container Post-Create Setup Script

Write-Host "Starting post-create setup..." -ForegroundColor Green

# Install uv package manager
Write-Host "Installing uv package manager..." -ForegroundColor Cyan
try {
    # Install uv using the official installer
    Invoke-WebRequest -Uri "https://astral.sh/uv/install.sh" -OutFile "/tmp/install-uv.sh"
    chmod +x /tmp/install-uv.sh
    bash /tmp/install-uv.sh
    
    # Add uv to PATH for current session
    $env:PATH = "$env:HOME/.cargo/bin:$env:PATH"
    
    Write-Host "✓ uv package manager installed successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install uv package manager: $_" -ForegroundColor Red
}

# Install .NET Aspire workload
Write-Host "Installing .NET Aspire workload..." -ForegroundColor Cyan
try {
    dotnet workload update
    dotnet workload install aspire
    Write-Host "✓ .NET Aspire workload installed successfully" -ForegroundColor Green
} catch {
    Write-Host "✗ Failed to install .NET Aspire workload: $_" -ForegroundColor Red
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
    
    # List installed workloads
    Write-Host "`nInstalled .NET workloads:" -ForegroundColor Cyan
    dotnet workload list
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
