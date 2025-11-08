# Custom GitHub Copilot Agents for AI-Driven Code Modernization

This directory contains specialized custom GitHub Copilot agents designed to facilitate AI-driven code modernization projects. These agents work together as a coordinated team to analyze legacy systems, plan modernization strategies, and execute transformations.

## Overview

The agents in this collection follow a modular, collaborative approach where each agent has specific expertise and responsibilities. Together, they provide comprehensive support for code modernization initiatives.

## Available Agents

### 1. knowledge-modeler
**Purpose**: Models and organizes knowledge using hybrid storage approaches.

**Expertise**:
- Creating data models and knowledge structures
- Designing hybrid storage solutions (files, vector DBs, relational DBs, document DBs, temporal, spatial)
- Structuring knowledge hierarchies and taxonomies
- Implementing storage solutions and ingestion workflows

**Use when**: You need to organize and structure project knowledge, design data models, or choose appropriate storage strategies.

**Example invocation**:
```
@knowledge-modeler Design a knowledge structure for storing our legacy system documentation and code analysis results using both local markdown files and a vector database for semantic search.
```

---

### 2. knowledge-retriever
**Purpose**: Retrieves and surfaces relevant information based on context and task requirements.

**Expertise**:
- Context-aware information retrieval across multiple sources
- Semantic and syntactic code search
- Historical context analysis through commit history
- Knowledge gap identification
- Cross-referencing information from multiple sources

**Use when**: You need to find specific information, understand how something works, or discover patterns in the codebase.

**Example invocation**:
```
@knowledge-retriever Find all instances where we handle user authentication in the codebase, including related tests and documentation. Also search for any known security issues related to our auth implementation.
```

---

### 3. knowledge-generator
**Purpose**: Generates new knowledge through user collaboration to reduce ambiguity.

**Expertise**:
- Identifying knowledge gaps and ambiguities
- User elicitation through structured questioning
- Generating specifications, requirements, and documentation
- Iterative refinement based on user feedback
- Converting vague requirements into specific criteria

**Use when**: You need to create new documentation, clarify ambiguous requirements, or fill gaps in system understanding.

**Example invocation**:
```
@knowledge-generator Help me create comprehensive API documentation for our payment processing module. I'll answer your questions about how it works, and you generate the documentation.
```

---

### 4. spec-generator
**Purpose**: Generates formal specifications using industry standards.

**Expertise**:
- Creating PRDs (Product Requirements Documents)
- Creating BRDs (Business Requirements Documents)
- Creating TRDs (Technical Requirements Documents)
- Generating Design System Documentation
- Writing Gherkin feature files for BDD
- Creating API specifications (OpenAPI/Swagger)
- Producing Architecture Documentation

**Use when**: You need formal specification documents for planning, development, or communication purposes.

**Example invocation**:
```
@spec-generator Create a Technical Requirements Document (TRD) for migrating our monolithic API to a microservices architecture, including performance requirements, security considerations, and deployment specifications.
```

---

### 5. setup-planner
**Purpose**: Analyzes tools, recommends best-suited options, and plans installation/configuration.

**Expertise**:
- Environment and tool auditing
- Tool evaluation and recommendation
- Installation planning and guides
- Configuration management
- Integration setup
- Troubleshooting and verification

**Use when**: You need to set up development environments, choose tools, or ensure proper tool configuration.

**Example invocation**:
```
@setup-planner What tools do we need to modernize a legacy Java 8 application to Java 17 with Spring Boot 3? Include code analysis, refactoring, testing, and deployment tools with installation instructions.
```

---

### 6. modernization-planner
**Purpose**: Orchestrates the entire modernization process by coordinating other agents.

**Expertise**:
- Legacy system analysis and documentation
- Target state definition
- Modernization strategy selection (Strangler Fig, Big Bang, Branch by Abstraction, etc.)
- Phased roadmap creation
- Task allocation (human vs. AI)
- Risk management and mitigation
- Tool and process setup coordination
- Comprehensive plan documentation

**Use when**: You're starting a code modernization project and need a comprehensive plan, or when you need to coordinate multiple aspects of modernization.

**Example invocation**:
```
@modernization-planner We have a 10-year-old PHP 5.6 monolith that needs to be modernized to PHP 8.2+ with a better architecture. Help me create a complete modernization plan including assessment, strategy, phasing, and task breakdown.
```

## Agent Collaboration Patterns

These agents are designed to work together. The **modernization-planner** acts as an orchestrator that delegates to other agents:

```
modernization-planner
  ├── knowledge-retriever (gathers information about legacy system)
  ├── knowledge-modeler (structures the gathered information)
  ├── knowledge-generator (elicits requirements from users)
  ├── spec-generator (creates formal specifications)
  └── setup-planner (ensures tools are available)
```

## Typical Modernization Workflow

1. **Discovery Phase**
   - Use `@modernization-planner` to kick off the project
   - It will work with `@knowledge-retriever` to understand the current system
   - `@knowledge-modeler` structures the findings

2. **Requirements Phase**
   - `@knowledge-generator` works with you to capture requirements
   - `@spec-generator` creates formal specification documents

3. **Planning Phase**
   - `@modernization-planner` develops the strategy and roadmap
   - `@setup-planner` identifies required tools and creates setup guides

4. **Execution Phase**
   - Follow the plan created by `@modernization-planner`
   - Use individual agents as needed for specific tasks
   - Regular check-ins with `@modernization-planner` to track progress

## Best Practices

### When to Use Which Agent

- **Starting a modernization project**: Start with `@modernization-planner`
- **Need to understand existing code**: Use `@knowledge-retriever`
- **Organizing project knowledge**: Use `@knowledge-modeler`
- **Missing documentation**: Use `@knowledge-generator`
- **Need formal specs**: Use `@spec-generator`
- **Tool setup/selection**: Use `@setup-planner`

### Agent Invocation Tips

1. **Be specific**: Provide context and clear objectives
2. **Reference files**: Mention specific files, components, or areas of the codebase
3. **State constraints**: Mention budget, timeline, or technical constraints upfront
4. **Iterate**: Work with agents iteratively, refining based on their output
5. **Combine agents**: Don't hesitate to use multiple agents for complex tasks

### Example Multi-Agent Workflow

```
Step 1: Start with modernization-planner
@modernization-planner Analyze our legacy React 16 application and create a modernization plan to React 18 with TypeScript.

Step 2: Get tool recommendations
@setup-planner What tools should we use for the React 16 to 18 migration including code analysis, refactoring, and testing?

Step 3: Generate specifications
@spec-generator Create a TRD for the React 18 migration including TypeScript conversion requirements.

Step 4: Create knowledge structure
@knowledge-modeler Design a documentation structure for tracking our migration progress and decisions.

Step 5: Fill documentation gaps
@knowledge-generator Help me document the current component architecture and data flow patterns.
```

## Common Use Cases

### Legacy System Modernization
- **Scenario**: Modernizing a 10-year-old codebase
- **Start with**: `@modernization-planner`
- **Supporting agents**: All agents will be used throughout the process

### API Documentation
- **Scenario**: Creating comprehensive API documentation
- **Start with**: `@knowledge-generator` or `@spec-generator`
- **Supporting agents**: `@knowledge-retriever` to gather existing examples

### Architecture Migration
- **Scenario**: Moving from monolith to microservices
- **Start with**: `@modernization-planner`
- **Supporting agents**: `@spec-generator` for architecture docs, `@setup-planner` for infrastructure

### Dependency Updates
- **Scenario**: Upgrading framework versions and dependencies
- **Start with**: `@setup-planner` to audit and plan updates
- **Supporting agents**: `@modernization-planner` for phased approach

### Technical Debt Reduction
- **Scenario**: Systematically reducing technical debt
- **Start with**: `@knowledge-retriever` to identify debt
- **Supporting agents**: `@modernization-planner` to prioritize and plan

## Troubleshooting

### Agent Not Responding as Expected
- Provide more context and specific details
- Break down complex requests into smaller tasks
- Explicitly state what you want the agent to do

### Conflicting Recommendations
- Agents may offer different perspectives
- Use your judgment to decide the best approach
- Consult `@modernization-planner` for synthesis

### Need Human Decision
- Agents will clearly identify decisions that require human judgment
- Review recommendations, but make final calls yourself
- Agents work best as advisors, not decision-makers

## Integration with GitHub Copilot

These agents are available through:
- **GitHub CLI**: Use `gh copilot` commands with `@agent-name`
- **GitHub Web Interface**: In Copilot chat
- **VS Code** (when supported): Through Copilot chat panel

## Further Resources

- [GitHub Copilot Custom Agents Documentation](https://docs.github.com/en/copilot/how-tos/use-copilot-agents/coding-agent/create-custom-agents)
- [Your First Custom Agent Tutorial](https://docs.github.com/en/copilot/tutorials/customization-library/custom-agents/your-first-custom-agent)
- [Awesome GitHub Copilot Customizations](https://github.com/github/awesome-copilot)

## Contributing

To modify or extend these agents:
1. Edit the agent markdown file in `.github/agents/`
2. Update the YAML frontmatter (name, description, tools)
3. Modify the agent instructions and best practices
4. Commit changes - agents are updated automatically

## Version History

- **v1.0** (2025-11-08): Initial release with six modernization-focused agents

---

**Note**: These agents are designed to assist and advise. They work best when collaborating with experienced developers who can validate recommendations and make final decisions. Always review and test agent suggestions before implementing them in production systems.
