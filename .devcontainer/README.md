# Dev Container Configuration

This repository includes a dev container configuration that provides a fully-featured development environment with all necessary tools pre-installed.

## Features

### Base Image
- **Microsoft Universal Image** (`mcr.microsoft.com/devcontainers/universal:2`) - A comprehensive development container with multiple language runtimes and tools

### Installed Features
- **Docker-in-Docker** - Build and run Docker containers within the dev container
- **Azure Developer CLI (azd)** - Deploy and manage Azure resources
- **GitHub CLI (gh)** - Interact with GitHub from the command line
- **PowerShell Core** - Cross-platform PowerShell for scripting and automation

### VS Code Extensions
The following extensions are automatically installed:
- **GitHub Copilot** (`GitHub.copilot`) - AI-powered code completion
- **AI Toolkit** (`ms-windows-ai-studio.windows-ai-studio`) - AI development tools
- **Prompty** (`ms-toolsai.prompty`) - Prompt engineering and testing
- **Markdown Lint** (`DavidAnson.vscode-markdownlint`) - Markdown linting and style checking

### Additional Tools (Installed via Post-Create Script)
- **uv** - Fast Python package installer and resolver
- **.NET Aspire** - Cloud-native application development workload supporting both .NET and Python

## Usage

### Using with GitHub Codespaces
1. Navigate to the repository on GitHub
2. Click the "Code" button
3. Select "Create codespace on main" (or your branch)
4. Wait for the container to build and initialize

### Using with VS Code Dev Containers Extension
1. Install the [Dev Containers extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)
2. Open the repository in VS Code
3. Press `F1` and select "Dev Containers: Reopen in Container"
4. Wait for the container to build and initialize

## Post-Create Setup

The dev container runs a PowerShell script (`.devcontainer/setup.ps1`) after creation that:
1. Installs the uv package manager from astral.sh
2. Installs the .NET Aspire workload
3. Verifies all tools are correctly installed

You can monitor the setup progress in the terminal output.

## Verification

After the container is created, you can verify all tools are installed by running:

```bash
# Check uv
uv --version

# Check .NET and Aspire
dotnet --version
dotnet workload list

# Check Azure Developer CLI
azd version

# Check GitHub CLI
gh --version

# Check Docker
docker --version

# Check PowerShell
pwsh --version
```

## Customization

To customize the dev container:
- Edit `.devcontainer/devcontainer.json` to modify features or extensions
- Edit `.devcontainer/setup.ps1` to add additional setup steps
- All setup commands should use PowerShell Core syntax

## Troubleshooting

If the post-create script fails:
1. Open a new terminal in the dev container
2. Run manually: `pwsh .devcontainer/setup.ps1` (or `pwsh /workspaces/<repository-name>/.devcontainer/setup.ps1` if needed)
3. Check the output for specific error messages

For feature-specific issues, refer to:
- [Dev Containers documentation](https://containers.dev/)
- [Dev Container Features](https://containers.dev/features)
