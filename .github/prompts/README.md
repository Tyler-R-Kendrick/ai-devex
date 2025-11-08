# GitHub Copilot Prompt Files

This directory contains reusable prompt files for GitHub Copilot that provide task-specific guidance for common workflows.

## What are Prompt Files?

Prompt files are markdown-based instructions stored in `.github/prompts/` that guide GitHub Copilot in performing specific, repeatable tasks. They work in VS Code and JetBrains IDEs with GitHub Copilot installed.

## Available Prompts

### modernize

**File:** `modernize.prompt.md`

**Purpose:** Kickoff modernization planning for a codebase by analyzing legacy systems and creating comprehensive modernization strategies.

**Usage:**
```
/modernize
/modernize /path/to/legacy/codebase
/modernize https://github.com/org/legacy-repo.git
/modernize https://github.com/org/legacy-repo.git#v1.2.3
```

**Default Behavior:** If no argument is provided, analyzes the current workspace root.

**What it does:**
1. Validates and prepares the source location (defaults to current workspace if not specified)
2. Performs initial technology stack assessment
3. Coordinates with `@modernization-legacy-modeler` for detailed analysis
4. Coordinates with `@modernization-desired-state-modeler` for target design
5. Coordinates with `@modernization-planner` for comprehensive strategy
6. Presents a complete modernization plan

**Supported source formats:**
- No argument (default): Uses current workspace root
- Local file paths: `/path/to/codebase`, `./relative/path`, `C:\Windows\Path`
- Git HTTPS URLs: `https://github.com/user/repo.git`
- Git SSH URLs: `git@github.com:user/repo.git`
- With branch/tag: `https://github.com/user/repo.git#branch-name`
- With commit: `https://github.com/user/repo.git#abc123`

### optimize-prompt

**File:** `optimize-prompt.prompt.md`

**Purpose:** Optimize a prompt file by applying prompt engineering best practices including in-context learning, cognitive architectures, and ambiguity resolution.

**Usage:**
```
/optimize-prompt ./prompts/my-prompt.md
/optimize-prompt ${file}
/optimize-prompt
```

**Default Behavior:** If a prompt file is open in the editor, uses that file. Otherwise, prompts the user for a file path.

**What it does:**
1. Reads and analyzes the provided prompt file
2. Identifies issues, ambiguities, and improvement opportunities
3. Coordinates with `@prompt-engineer` to apply best practices
4. Applies in-context learning patterns (zero-shot, few-shot, multi-shot)
5. Implements cognitive architecture patterns (CoT, ToT, GoT, etc.)
6. Optimizes structural context and resolves ambiguities
7. Presents the optimized prompt with before/after comparison
8. Offers to save the optimized version

**Supported file formats:**
- Absolute paths: `/path/to/prompt.md`
- Relative paths: `./prompts/prompt.md`
- Workspace paths: `${workspaceFolder}/prompts/prompt.md`
- Current file: `${file}` (when file is open in editor)
- Any text file containing a prompt

## How to Use Prompt Files

### In VS Code

1. Open GitHub Copilot Chat (Ctrl+Alt+I or Cmd+Alt+I)
2. Type `/` to see available prompts
3. Select or type the prompt name (e.g., `/modernize`)
4. Optionally provide parameters (if none provided, uses current workspace)

### In JetBrains IDEs

1. Open GitHub Copilot Chat
2. Type `/` followed by the prompt name
3. Optionally provide parameters (if none provided, uses current workspace)

## Prompt File Format

Prompt files use this structure:

```markdown
---
mode: agent
description: Brief description of what this prompt does
tools: [list, of, allowed, tools]
---

# Prompt Title

Detailed instructions for Copilot...
```

### YAML Frontmatter

- `mode`: Typically "agent" for task-oriented prompts
- `description`: Short summary of the prompt's purpose
- `tools`: List of tools Copilot can use (e.g., bash, view, create, edit)

### Context Variables

You can use these variables in prompts:
- `${workspaceFolder}` - Current workspace directory
- `${file}` - Current file path
- `${selection}` - Currently selected text

## Creating New Prompts

To add a new prompt:

1. Create a new `.prompt.md` file in `.github/prompts/`
2. Add YAML frontmatter with mode, description, and tools
3. Write clear instructions for Copilot
4. Test the prompt in your IDE
5. Update this README with usage information

## Prompt Files vs Custom Agents

**Prompt Files** (in `.github/prompts/`):
- Task-specific, reusable instructions
- Best for repeatable workflows
- Available in VS Code and JetBrains IDEs
- Quick to invoke with `/` commands

**Custom Agents** (in `.github/agents/`):
- Define specialized AI personas and behaviors
- Can orchestrate multiple prompts
- Define tool access and capabilities
- Available across Copilot (CLI, web, IDEs)

Both can work together: agents can reference prompts, and prompts can invoke agents.

## Best Practices

1. **Be specific** - Clear, detailed instructions work best
2. **Include examples** - Show expected input/output
3. **Handle errors** - Provide guidance for common issues
4. **Document assumptions** - Make requirements explicit
5. **Test thoroughly** - Verify prompts work as expected

## Resources

- [GitHub Docs: Prompt Files](https://docs.github.com/en/copilot/tutorials/customization-library/prompt-files)
- [GitHub Docs: Custom Agents](https://docs.github.com/en/copilot/reference/custom-agents-configuration)
- [Customization Library](https://docs.github.com/en/copilot/tutorials/customization-library)

---

For more information on the custom agents that prompts can coordinate with, see [../.github/agents/README.md](../agents/README.md).
