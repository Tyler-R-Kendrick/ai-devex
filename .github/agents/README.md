# Custom GitHub Copilot Agents for AI-Driven Code Modernization

This directory contains 15 specialized custom GitHub Copilot agents designed to facilitate comprehensive AI-driven code modernization projects. These agents work together as a coordinated team to analyze legacy systems, plan modernization strategies, and execute transformations.

## Overview

The agents follow a modular, collaborative approach where each agent has specific expertise and responsibilities. Together, they provide end-to-end support for code modernization initiatives, from legacy analysis to target state definition, strategy planning, and execution.

All agents use the official GitHub Copilot handoff pattern with YAML frontmatter, enabling guided multi-agent workflows with explicit control points.

## Agent Categories

### Modernization Orchestration (3 agents)
Coordinate the overall modernization process from analysis to execution

### Knowledge Management (3 agents)
Handle information gathering, organization, and generation

### Specification & Documentation (6 agents)
Create formal specifications, maintain current documentation, and generate Copilot instructions

### Architecture & Technical Guidance (3 agents)
Provide expert guidance on architecture patterns, research, and prompting

## Available Agents

### Modernization Orchestration

#### 1. modernization-legacy-modeler
**Purpose**: Analyzes and models legacy systems to understand current state

**Expertise**:
- Legacy system discovery and architecture analysis
- Technical debt assessment and inventory
- System behavior documentation
- Dependency analysis
- Knowledge synthesis from code, docs, and history

**Use when**: Starting modernization - need to understand what exists today

**Example**:
```
@modernization-legacy-modeler Analyze our 10-year-old Java monolith application. Document current architecture, technical debt, and dependencies.
```

---

#### 2. modernization-desired-state-modeler
**Purpose**: Defines and models the target state of modernized systems

**Expertise**:
- Modernization goals elicitation
- Target architecture design
- Technology selection and stack recommendations
- Success metrics definition
- Gap analysis between current and target states

**Use when**: Defining what the modernized system should look like

**Example**:
```
@modernization-desired-state-modeler Design target architecture for migrating our monolith to microservices with cloud-native patterns.
```

---

#### 3. modernization-planner
**Purpose**: Develops strategies and roadmaps by coordinating legacy and desired state models

**Expertise**:
- Strategy orchestration and selection (Strangler Fig, Big Bang, etc.)
- Phased roadmap development
- Task allocation (AI vs human work)
- Risk management and mitigation
- Handoff to execution teams

**Use when**: Need comprehensive plan to transform from current to target state

**Example**:
```
@modernization-planner Create migration strategy and phased roadmap from legacy Java to modern microservices architecture.
```

---

### Knowledge Management

#### 4. knowledge-modeler
**Purpose**: Models and organizes knowledge using hybrid storage approaches

**Expertise**:
- Designing data models and knowledge structures
- Hybrid storage solutions (local files, vector DBs, relational, document, temporal, spatial)
- Knowledge hierarchies and taxonomies
- ETL/ELT pipeline design

**Use when**: Need to organize project knowledge or design storage strategies

**Example**:
```
@knowledge-modeler Design a knowledge structure for our modernization documentation using markdown files and vector search.
```

---

#### 5. knowledge-retriever
**Purpose**: Retrieves relevant information from multiple sources based on context

**Expertise**:
- Multi-source semantic and syntactic search
- Historical context from commits and issues
- Cross-referencing code, docs, and discussions
- Knowledge gap identification

**Use when**: Need to find specific information across the codebase and documentation

**Example**:
```
@knowledge-retriever Find all authentication implementations, related tests, and security discussions in our repository.
```

---

#### 6. knowledge-generator
**Purpose**: Generates new knowledge through user collaboration to reduce ambiguity

**Expertise**:
- User elicitation through structured questioning
- Documentation generation with iterative refinement
- Specification creation (user stories, scenarios, requirements)
- Ambiguity reduction and gap filling

**Use when**: Need to create documentation or clarify unclear requirements

**Example**:
```
@knowledge-generator Help me document our deployment process. I'll answer your questions about how it works.
```

---

### Specification & Documentation

#### 7. spec-generator
**Purpose**: Generates formal specifications using industry standards

**Expertise**:
- PRDs, BRDs, TRDs generation
- Design System Documentation
- Gherkin feature files for BDD
- OpenAPI/Swagger specifications
- Architecture Decision Records format

**Use when**: Need formal specification documents

**Example**:
```
@spec-generator Create a Technical Requirements Document for migrating from REST to GraphQL, including performance and security requirements.
```

---

#### 8. adr-generator
**Purpose**: Generates Architecture Decision Records for approved decisions

**Expertise**:
- ADR creation in standard format
- Documenting context, decision, and consequences
- Recording alternatives considered
- Maintaining decision history and relationships

**Use when**: Significant architectural or technical decision has been made

**Example**:
```
@adr-generator Document our decision to use PostgreSQL over MongoDB for our main datastore, including alternatives considered.
```

---

#### 9. tool-documentation
**Purpose**: Manages tool knowledge and generates Copilot instruction prompts

**Expertise**:
- Tool knowledge management with freshness tracking
- Coordinating with research for current information
- Generating Copilot instructions reflecting usage patterns
- Version-specific guidance and best practices

**Use when**: Referenced tool needs documentation or Copilot guidance

**Example**:
```
@tool-documentation Document Vite v5 build tool and generate Copilot instructions for our project's usage patterns.
```

---

#### 10. deps-documentation
**Purpose**: Manages dependency knowledge and generates Copilot instruction prompts

**Expertise**:
- Dependency health monitoring (versions, security, maintenance)
- Security vulnerability tracking
- Generating Copilot instructions with safety guidance
- Migration paths and compatibility information

**Use when**: Referenced dependency needs documentation or security check

**Example**:
```
@deps-documentation Check security status of React 16.14 and document upgrade path to React 18 with Copilot instructions.
```

---

#### 11. copilot-instructions
**Purpose**: Generates GitHub Copilot instruction prompts from documented knowledge

**Expertise**:
- Synthesizing knowledge into actionable Copilot instructions
- Structuring prompts for effective in-context learning
- Including version-specific guidance and examples
- Providing clear DO/DON'T patterns with rationale

**Use when**: Need to generate Copilot instruction prompts from tool/dependency documentation

**Example**:
```
@copilot-instructions Generate Copilot instruction prompts for Vite v5 based on the documented usage patterns and best practices.
```

---

#### 12. prompt-engineer
**Purpose**: Implements best practices for prompt engineering

**Expertise**:
- In-context learning (zero-shot, few-shot, multi-shot)
- Cognitive architectures (CoT, ToT, GoT, Reflexion, Self-RAG)
- Structural context optimization
- Ambiguity resolution (Chain-of-Uncertain-Thoughts)

**Use when**: Creating prompts for AI-assisted tasks

**Example**:
```
@prompt-engineer Create effective prompts for Copilot to refactor callback-based code to async/await with proper error handling.
```

---

### Architecture & Technical Guidance

#### 13. architect
**Purpose**: Expert architect providing pattern guidance and migration paths

**Expertise**:
- Architecture pattern identification
- Migration path analysis considering dependencies
- Dependency architecture evaluation
- Architecture validation and review

**Use when**: Need architectural expertise or pattern recommendations

**Example**:
```
@architect Review our proposed microservices architecture and recommend migration pattern from current monolith.
```

---

#### 14. research
**Purpose**: Conducts research using fallback sources with quality evaluation

**Expertise**:
- Research planning with prioritized fallback strategies
- Multi-source research (MCPs → official docs → web search → code)
- Domain-specific quality evaluation
- Research documentation with citations

**Use when**: Need authoritative information on technologies, patterns, or practices

**Example**:
```
@research Research best practices for event-driven microservices architecture, including case studies and migration patterns.
```

---

#### 15. setup-planner
**Purpose**: Analyzes tools and plans installation/configuration

**Expertise**:
- Tool evaluation and recommendation
- Installation planning (multi-platform)
- Configuration management
- Verification and troubleshooting

**Use when**: Need tool recommendations or setup guidance

**Example**:
```
@setup-planner What tools do we need for React 16→18 migration? Provide evaluation and installation guide.
```

---

## Agent Collaboration Patterns

### Hierarchical Orchestration
```
modernization-planner (orchestrator)
├── modernization-legacy-modeler (current state)
├── modernization-desired-state-modeler (target state)
├── architect (patterns and guidance)
├── setup-planner (tools)
└── adr-generator (document decisions)
```

### Knowledge Flow
```
research → tool-documentation/deps-documentation → Copilot Instructions
research → knowledge-generator → spec-generator → ADR
knowledge-retriever → knowledge-modeler → knowledge-generator
```

### Decision Documentation
```
Any agent decision → adr-generator → ADR → knowledge-modeler (storage)
```

## Typical Workflows

### Complete Modernization Project

```
1. @modernization-legacy-modeler Analyze our PHP 5.6 monolith
   ↓ (provides current state)
2. @modernization-desired-state-modeler Design target: PHP 8.2 + microservices
   ↓ (provides target state)
3. @modernization-planner Create migration strategy and phased roadmap
   ↓ (coordinates all aspects)
4. @architect Validate architecture approach
5. @setup-planner Recommend and plan tools
6. @adr-generator Document key decisions
7. Execute plan with development team
```

### Documentation Generation

```
1. @knowledge-retriever Find all API endpoints and usage
2. @knowledge-generator Elicit missing information from stakeholders
3. @spec-generator Create OpenAPI specification
4. @adr-generator Document API design decisions
```

### Dependency Management

```
1. @deps-documentation Check security status of current dependencies
2. @research Research upgrade paths and breaking changes
3. @deps-documentation Generate Copilot instructions for safe usage
4. @adr-generator Document upgrade decisions
```

## Best Practices

### Choosing the Right Agent

- **Start with modernization-planner** for full modernization projects
- **Use specialist agents** for focused tasks
- **Leverage research agent** when information is needed
- **Use architect** for complex architectural questions
- **Document decisions** with adr-generator
- **Generate instructions** with tool/deps documentation agents

### Agent Invocation Tips

1. **Be specific**: Mention exact technologies, versions, components
2. **Provide context**: Explain constraints (time, budget, team size)
3. **State goals**: What you want to achieve
4. **Reference files**: Point to specific code or documents
5. **Iterate**: Refine based on agent output

### Handoff Flow

Agents are designed to hand off to each other:
- Modernization agents coordinate with each other
- Research feeds into documentation agents
- Documentation agents create Copilot instructions
- All agents can trigger ADR generation
- Architecture agent provides guidance to planners

## Integration with GitHub Copilot

These agents are available through:
- **GitHub CLI**: Use `gh copilot` with `@agent-name`
- **GitHub Web Interface**: In Copilot chat
- **VS Code** (when supported): Through Copilot chat panel

## Agent Capabilities Summary

| Agent | Analysis | Design | Planning | Execution | Documentation |
|-------|----------|--------|----------|-----------|---------------|
| modernization-legacy-modeler | ✅ Primary | ❌ | ❌ | ❌ | ✅ |
| modernization-desired-state-modeler | ❌ | ✅ Primary | ❌ | ❌ | ✅ |
| modernization-planner | ✅ | ✅ | ✅ Primary | ❌ | ✅ |
| knowledge-modeler | ❌ | ✅ | ❌ | ❌ | ✅ Primary |
| knowledge-retriever | ✅ Primary | ❌ | ❌ | ❌ | ❌ |
| knowledge-generator | ❌ | ❌ | ❌ | ❌ | ✅ Primary |
| spec-generator | ❌ | ✅ | ❌ | ❌ | ✅ Primary |
| adr-generator | ❌ | ❌ | ❌ | ❌ | ✅ Primary |
| tool-documentation | ✅ | ❌ | ❌ | ❌ | ✅ Primary |
| deps-documentation | ✅ | ❌ | ❌ | ❌ | ✅ Primary |
| copilot-instructions | ❌ | ✅ Primary | ❌ | ❌ | ✅ Primary |
| prompt-engineer | ❌ | ✅ Primary | ❌ | ❌ | ✅ |
| architect | ✅ | ✅ Primary | ✅ | ❌ | ✅ |
| research | ✅ Primary | ❌ | ❌ | ❌ | ✅ |
| setup-planner | ✅ | ❌ | ✅ Primary | ❌ | ✅ |

## Version History

- **v2.1** (2025-11-08): Handoff refactoring
  - Added copilot-instructions agent (15 agents total)
  - Implemented official YAML handoff pattern in all agents
  - Separated Copilot instruction generation into dedicated agent
  - Added handoff buttons for guided multi-agent workflows
  
- **v2.0** (2025-11-08): Major refactoring based on feedback
  - Split modernization-planner into 3 focused agents
  - Added 6 new specialized agents
  - Implemented comprehensive handoff patterns
  - Added Copilot instruction generation
  - Removed automation scripts (agents now guide)
  
- **v1.0** (2025-11-08): Initial release with 6 modernization-focused agents

---

**Note**: These agents provide guidance and coordination. They work best when collaborating with experienced developers who validate recommendations and make final decisions. Always review and test agent suggestions before implementing in production systems.
