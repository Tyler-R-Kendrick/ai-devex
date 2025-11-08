# Agent Architecture and Collaboration

## System Overview

The agent system consists of 15 specialized agents organized into 4 functional categories. Agents collaborate through explicit YAML handoff patterns to provide comprehensive support for code modernization.

All agents use the official GitHub Copilot handoff format with `handoffs` field in YAML frontmatter, enabling guided multi-agent workflows with control points.

```
┌─────────────────────────────────────────────────────────────┐
│              MODERNIZATION ORCHESTRATION (3)                 │
│  ┌──────────────────┐  ┌──────────────────┐  ┌───────────┐ │
│  │Legacy Modeler    │  │Desired State     │  │  Planner  │ │
│  │(Current State)   │→ │Modeler (Target)  │→ │(Strategy) │ │
│  └──────────────────┘  └──────────────────┘  └─────┬─────┘ │
└──────────────────────────────────────────────────────┼───────┘
                                                       │
                    ┌──────────────────────────────────┼──────────────┐
                    │                                  ↓              │
         ┌──────────┴───────────┐        ┌─────────────────────┐    │
         │                      │        │                     │    │
┌────────▼────────┐  ┌─────────▼──────┐ │  ┌──────────────┐  │    │
│  KNOWLEDGE      │  │ SPECIFICATION  │ │  │ ARCHITECTURE │  │    │
│ MANAGEMENT (3)  │  │    & DOCS (6)  │ │  │  & GUIDANCE  │  │    │
│                 │  │                │ │  │      (3)     │  │    │
│ • Modeler       │  │ • Spec Gen     │ │  │ • Architect  │  │    │
│ • Retriever     │  │ • ADR Gen      │ │  │ • Research   │  │    │
│ • Generator     │  │ • Tool Docs    │ │  │ • Prompt Eng │  │    │
│                 │  │ • Deps Docs    │ │  │              │  │    │
│                 │  │ • Copilot Inst │ │  │              │  │    │
│                 │  │ • Prompt Eng   │ │  │              │  │    │
└─────────────────┘  └────────────────┘ │  └──────────────┘  │    │
                                        │                     │    │
                                        └─────────────────────┘    │
                                                                    │
                                   ┌────────────────────────────────┘
                                   │
                                   ▼
                          ┌─────────────────┐
                          │  setup-planner  │
                          │  (Tool Setup)   │
                          └─────────────────┘
```

## Agent Categories

### 1. Modernization Orchestration (3 agents)

These agents coordinate the overall modernization process from analysis through execution.

**modernization-legacy-modeler**
- Input: Codebase, documentation, history
- Output: Current state model, technical debt inventory
- Handoff to: desired-state-modeler, architect, planner

**modernization-desired-state-modeler**
- Input: Legacy model, business goals, requirements
- Output: Target architecture, technology stack, gap analysis
- Handoff to: planner, architect, adr-generator

**modernization-planner**
- Input: Legacy model, desired state model
- Output: Strategy, roadmap, task breakdown, risk plan
- Handoff to: Development team, adr-generator

### 2. Knowledge Management (3 agents)

These agents handle information gathering, organization, and generation.

**knowledge-modeler**
- Input: Information to organize
- Output: Structured knowledge, storage design
- Used by: All agents for knowledge organization

**knowledge-retriever**
- Input: Search queries, context
- Output: Found information from multiple sources
- Used by: All agents needing information

**knowledge-generator**
- Input: Requirements, user input
- Output: New documentation, filled gaps
- Used by: Agents needing documentation creation

### 3. Specification & Documentation (6 agents)

These agents create formal specifications, maintain current documentation, and generate Copilot instructions.

**spec-generator**
- Input: Requirements, information
- Output: Formal specs (PRDs, BRDs, TRDs, Gherkin, OpenAPI)
- Used by: Modernization agents, architect

**adr-generator**
- Input: Decisions made
- Output: Architecture Decision Records
- Used by: All agents for decision documentation

**tool-documentation**
- Input: Tool name/version
- Output: Tool docs
- Handoffs to: copilot-instructions, research

**deps-documentation**
- Input: Dependency name/version
- Output: Dependency docs, security info
- Handoffs to: copilot-instructions, research

**copilot-instructions**
- Input: Documented knowledge (tools, dependencies, patterns)
- Output: Copilot instruction prompts
- Used by: tool-documentation, deps-documentation


**prompt-engineer**
- Input: Task requirements
- Output: Optimized prompts using CoT, few-shot, etc.
- Used by: Agents needing prompt optimization

### 4. Architecture & Technical Guidance (3 agents)

These agents provide expert guidance and research.

**architect**
- Input: Architecture questions, systems
- Output: Pattern recommendations, migration guidance
- Coordinates with: All modernization agents, research

**research**
- Input: Research questions
- Output: Research findings with citations, quality assessment
- Used by: All agents needing external information

**setup-planner**
- Input: Tool requirements
- Output: Tool recommendations, installation plans
- Used by: Modernization planner, desired-state-modeler

## Collaboration Patterns

### Pattern 1: Modernization Flow

```
User Request: "Modernize our legacy system"
    │
    ▼
modernization-legacy-modeler
- Analyzes current system
- Coordinates with knowledge-retriever
- Produces current state model
    │
    ▼
modernization-desired-state-modeler  
- Designs target state
- Coordinates with architect
- Coordinates with research
- Produces target state model + gap analysis
    │
    ▼
modernization-planner
- Selects strategy
- Creates roadmap
- Allocates tasks
- Produces comprehensive plan
    │
    ▼
adr-generator
- Documents key decisions
```

### Pattern 2: Documentation Generation

```
User Request: "Document our API"
    │
    ▼
knowledge-retriever
- Finds API endpoints, implementations
    │
    ▼
knowledge-generator
- Elicits missing information
    │
    ▼
spec-generator
- Creates OpenAPI specification
    │
    ▼
adr-generator
- Documents API design decisions
```

### Pattern 3: Dependency Management

```
User Request: "Check dependency security"
    │
    ▼
deps-documentation
- Checks current status
- Identifies issues
    │
    ▼
research
- Researches alternatives if needed
- Finds upgrade paths
    │
    ▼
deps-documentation
- Generates Copilot instructions
- Documents recommendations
    │
    ▼
adr-generator
- Documents dependency decisions
```

### Pattern 4: Tool Knowledge Management

```
Tool Referenced in Code
    │
    ▼
tool-documentation
- Checks if documentation exists
- Checks if current
    │
    ▼ (if needed)
research
- Researches latest version
- Finds best practices
    │
    ▼
tool-documentation
- Creates/updates documentation
- Generates Copilot instructions
    │
    ▼
prompt-engineer
- Optimizes instruction format
```

## Data Flow

### Information Flow
```
Source Code/Docs
    │
    ▼
knowledge-retriever → Extract information
    │
    ▼
knowledge-modeler → Organize information
    │
    ▼
knowledge-generator → Fill gaps
    │
    ▼
spec-generator → Formalize
    │
    ▼
Storage (via knowledge-modeler)
```

### Decision Flow
```
Analysis/Design by Any Agent
    │
    ▼
Decision Made
    │
    ▼
adr-generator → Create ADR
    │
    ▼
knowledge-modeler → Store ADR
```

### Instruction Flow
```
Tool/Dependency Referenced
    │
    ▼
tool-documentation OR deps-documentation
- Check freshness
    │
    ▼ (if update needed)
research → Get latest info
    │
    ▼
tool/deps-documentation → Generate Copilot instructions
    │
    ▼
prompt-engineer → Optimize prompt structure
    │
    ▼
Output: Copilot Instruction Prompt
```

## Handoff Protocols

### Explicit Handoffs

Agents use explicit handoff patterns described in their documentation:

**To modernization-planner:**
- From legacy-modeler: Current state analysis
- From desired-state-modeler: Target state design
- Expected: Comprehensive migration plan

**To architect:**
- From any agent: Architecture questions
- Expected: Pattern recommendations, validation

**To research:**
- From any agent: Research questions
- Expected: Research findings with citations

**To adr-generator:**
- From any agent: Decisions to document
- Expected: Formal ADR

**To tool/deps-documentation:**
- From any agent: Tool/dependency referenced
- Expected: Current documentation, Copilot instructions

**To prompt-engineer:**
- From any agent: Need optimized prompts
- Expected: Structured prompts using best practices

## Decision Tree

```
                        Start Task
                            │
            ┌───────────────┼───────────────┐
            │               │               │
         Need           Need             Need
       Analysis?      Documentation?   Decision?
            │               │               │
            ▼               ▼               ▼
    ┌──────────────┐  ┌─────────────┐  adr-generator
    │What kind?    │  │What kind?   │
    └──┬───────┬───┘  └──┬──────┬───┘
       │       │         │      │
    Legacy   Arch    New Doc  Formal
       │       │         │      Spec
       ▼       ▼         ▼      │
 legacy-  architect  knowledge- │
 modeler              generator  │
                                 ▼
                          spec-generator
```

## Communication Patterns

### Synchronous (Direct Handoff)
```
Agent A completes task
    ↓
Agent A indicates next step: "Hand off to Agent B"
    ↓
User invokes Agent B with context
    ↓
Agent B continues workflow
```

### Asynchronous (Independent Tasks)
```
Multiple agents work independently
    ↓
modernization-planner synthesizes results
    ↓
Creates unified plan
```

### Iterative (Refinement)
```
Agent produces output
    ↓
User reviews
    ↓
User requests refinement
    ↓
Same or different agent refines
    ↓
Repeat until satisfied
```

## Best Practices

### For Users

1. **Start with the right agent** for your task type
2. **Follow suggested handoffs** when agents recommend next steps
3. **Provide context** when switching agents
4. **Iterate** - refine outputs progressively
5. **Document decisions** using adr-generator

### For Integration

1. **Respect agent expertise** - use specialist agents for their domain
2. **Coordinate through handoffs** - don't skip recommended flows
3. **Synthesize results** - use orchestration agents to combine outputs
4. **Maintain context** - reference previous agent outputs
5. **Track decisions** - use adr-generator consistently

## Version History

- **v2.1** (2025-11-08): Handoff refactoring with 15 agents
  - Added copilot-instructions agent
  - Implemented official YAML handoff pattern in all agents
  - Enabled guided multi-agent workflows
- **v2.0** (2025-11-08): Refactored architecture with 14 agents
- **v1.0** (2025-11-08): Initial 6-agent architecture

---

*For agent details, see [README.md](README.md).*
*For quick commands, see [QUICK_REFERENCE.md](QUICK_REFERENCE.md).*
