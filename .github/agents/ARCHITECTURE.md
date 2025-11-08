# Agent Architecture and Workflows

## Agent Collaboration Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                   modernization-planner                         │
│                    (Orchestrator Agent)                          │
│                                                                   │
│  Coordinates all other agents to plan and execute                │
│  comprehensive code modernization projects                       │
└────────┬────────────┬───────────┬──────────┬────────────────────┘
         │            │           │          │
         ▼            ▼           ▼          ▼
    ┌────────┐  ┌─────────┐ ┌─────────┐ ┌────────────┐
    │ Know.  │  │ Know.   │ │ Know.   │ │   Setup    │
    │Retrie- │  │Modeler  │ │Genera-  │ │  Planner   │
    │  ver   │  │         │ │  tor    │ │            │
    └────────┘  └─────────┘ └─────────┘ └────────────┘
         │            │           │            │
         └────────────┴───────────┴────────────┘
                      │
                      ▼
              ┌──────────────┐
              │     Spec     │
              │  Generator   │
              └──────────────┘
```

## Typical Modernization Workflow

```
Phase 1: Discovery & Assessment
────────────────────────────────
User → modernization-planner: "Assess our legacy system"
       │
       ├─→ knowledge-retriever: Gather codebase information
       │   └─→ Returns: code structure, dependencies, patterns
       │
       ├─→ knowledge-modeler: Organize findings
       │   └─→ Returns: structured inventory
       │
       └─→ spec-generator: Document current state
           └─→ Returns: "As-Is" architecture docs

Phase 2: Requirements & Goals
──────────────────────────────
User ← modernization-planner: Asks clarifying questions
       │
       ├─→ knowledge-generator: Elicit detailed requirements
       │   └─→ Iterates with user to capture goals
       │
       └─→ spec-generator: Create target state specs
           └─→ Returns: PRDs, BRDs, TRDs

Phase 3: Tool Setup
────────────────────
       modernization-planner
       │
       └─→ setup-planner: Identify and plan tools
           └─→ Returns: Tool recommendations + install guides

Phase 4: Modernization Plan
────────────────────────────
       modernization-planner
       │
       └─→ Synthesizes all inputs
           └─→ Returns: Comprehensive modernization plan
               - Phased roadmap
               - Task breakdown (human vs AI)
               - Risk assessment
               - Success criteria

Phase 5: Execution
──────────────────
User → Follows plan with Copilot coding agent
       Iterates with agents as needed
```

## Agent Interaction Patterns

### Pattern 1: Sequential Chain
```
A → B → C → D → Result

Example:
knowledge-retriever → knowledge-modeler → spec-generator → Document
    (Find info)    →    (Structure it)  →  (Formalize it) → (Output)
```

### Pattern 2: Parallel Gathering
```
        ┌─→ Agent A ─┐
Start ──┼─→ Agent B ─┼─→ Synthesize → Result
        └─→ Agent C ─┘

Example:
              ┌─→ knowledge-retriever (code) ─┐
              │                                 │
Planner ─────┼─→ setup-planner (tools) ────────┼─→ Combined Plan
              │                                 │
              └─→ spec-generator (specs) ──────┘
```

### Pattern 3: Iterative Refinement
```
User Request → Agent → Draft
                ↑         │
                │         ▼
                └── Feedback ← User Review

Example:
User → knowledge-generator → Documentation Draft
         ↑                          │
         │                          ▼
         └──── Refinements ← User Reviews
```

### Pattern 4: Hierarchical Delegation
```
Orchestrator
    │
    ├─→ Specialist 1
    │   └─→ Sub-task A
    │
    ├─→ Specialist 2
    │   └─→ Sub-task B
    │
    └─→ Specialist 3
        └─→ Sub-task C

Example:
modernization-planner (decides what needs to be done)
    │
    ├─→ knowledge-retriever (find legacy patterns)
    │   └─→ Search for deprecated APIs
    │
    ├─→ spec-generator (document migration)
    │   └─→ Create Gherkin test scenarios
    │
    └─→ setup-planner (prepare tools)
        └─→ Install refactoring tools
```

## Data Flow Diagram

```
                    ┌─────────────────┐
                    │   User Input    │
                    │  (Requirements, │
                    │   Constraints)  │
                    └────────┬────────┘
                             │
                             ▼
┌────────────────────────────────────────────────────────────┐
│              modernization-planner                         │
│  • Understands requirements                                 │
│  • Plans approach                                           │
│  • Delegates to specialists                                 │
└─────┬──────────┬───────────┬────────────┬──────────────────┘
      │          │           │            │
      ▼          ▼           ▼            ▼
┌──────────┐ ┌──────┐  ┌──────────┐ ┌──────────┐
│ Legacy   │ │Tools │  │  Target  │ │Knowledge │
│ System   │ │ &    │  │  State   │ │Structure │
│ Analysis │ │Infra │  │  Specs   │ │          │
└────┬─────┘ └──┬───┘  └────┬─────┘ └────┬─────┘
     │          │           │            │
     │   ┌──────┴───────────┴────────┐   │
     │   │    spec-generator         │   │
     │   │  • Creates formal specs    │   │
     │   │  • PRDs, BRDs, TRDs        │   │
     │   │  • Gherkin scenarios       │   │
     │   └──────────┬─────────────────┘   │
     │              │                     │
     └──────────────┴─────────────────────┘
                    │
                    ▼
          ┌──────────────────┐
          │  Comprehensive   │
          │ Modernization    │
          │      Plan        │
          └────────┬─────────┘
                   │
                   ▼
          ┌──────────────────┐
          │   Execution by   │
          │ Development Team │
          │   + Copilot      │
          └──────────────────┘
```

## Agent Responsibility Matrix

| Task Type | Primary Agent | Supporting Agents | Output |
|-----------|---------------|-------------------|--------|
| **Find existing code** | knowledge-retriever | - | Code locations, patterns |
| **Organize knowledge** | knowledge-modeler | knowledge-retriever | Structured data models |
| **Create docs** | knowledge-generator | knowledge-retriever | Documentation |
| **Formal specs** | spec-generator | knowledge-generator | PRDs, BRDs, TRDs, Gherkin |
| **Tool selection** | setup-planner | - | Tool recommendations |
| **Install guides** | setup-planner | - | Installation instructions |
| **Overall planning** | modernization-planner | All agents | Comprehensive plan |
| **Risk assessment** | modernization-planner | All agents | Risk matrix |
| **Task allocation** | modernization-planner | - | Human vs AI breakdown |

## Communication Flow

```
User ←→ modernization-planner (Primary Interface)
             │
             ├─→ knowledge-retriever ─→ Returns data
             │   (No user interaction)
             │
             ├─→ knowledge-modeler ─→ Returns structure
             │   (No user interaction)
             │
             ├─→ knowledge-generator ←→ User
             │   (Interactive, asks questions)
             │
             ├─→ spec-generator ─→ Returns specs
             │   (Minimal user interaction)
             │
             └─→ setup-planner ─→ Returns tool plans
                 (No user interaction)

Legend:
─→  One-way communication
←→  Interactive/two-way communication
```

## Decision Tree: Which Agent to Use?

```
                    Start
                      │
        ┌─────────────┼─────────────┐
        ▼             ▼             ▼
    Need to      Need to       Need to
     find?       create?      setup?
        │             │             │
        ▼             ▼             ▼
  knowledge-    knowledge-     setup-
  retriever     generator     planner
                      │
            ┌─────────┼─────────┐
            ▼         ▼         ▼
        Formal?   Organize?  Modernize
                              entire
                              system?
            │         │         │
            ▼         ▼         ▼
        spec-    knowledge-  modernization-
        generator modeler    planner
```

## Usage Decision Guide

**Start with modernization-planner if:**
- Beginning a new modernization project
- Need comprehensive assessment and planning
- Coordinating multiple aspects of modernization
- Want end-to-end guidance

**Use individual agents if:**
- Have a specific, focused task
- Already have a plan, need execution help
- Working on isolated component
- Need specialized expertise for one area

**Combine agents when:**
- Task spans multiple domains
- Need different types of outputs
- Building comprehensive documentation
- Iterating on complex requirements

## Example Agent Invocation Sequences

### Example 1: Full Modernization Project
```
1. @modernization-planner "Analyze our PHP 5.6 monolith"
   → Internally uses retriever, modeler, spec-generator
2. @modernization-planner "Create migration plan to PHP 8.2"
   → Internally uses all agents
3. @setup-planner "Confirm tool selections and create setup guide"
4. Execute plan with development team
```

### Example 2: Documentation Project
```
1. @knowledge-retriever "Find all API endpoints"
2. @spec-generator "Create OpenAPI spec from findings"
3. @knowledge-generator "Help me document edge cases"
4. @knowledge-modeler "Organize into documentation site structure"
```

### Example 3: Architecture Migration
```
1. @modernization-planner "Plan monolith to microservices"
   → Coordinates all agents for comprehensive plan
2. Follow phased plan from modernization-planner
3. Use @spec-generator for service contracts as needed
4. Use @setup-planner for infrastructure tools as needed
```

## Agent State and Context

```
┌────────────────────────────────────────────┐
│         Each Agent Invocation              │
│         (Fresh Context Window)             │
├────────────────────────────────────────────┤
│                                            │
│  User must provide:                        │
│  • Task description                        │
│  • Relevant context                        │
│  • Constraints                             │
│  • Previous work if continuing             │
│                                            │
│  Agent maintains:                          │
│  • Core instructions (from .md file)       │
│  • Tool access                             │
│  • Best practices knowledge                │
│                                            │
│  Agent does NOT maintain:                  │
│  • Conversation history                    │
│  • Previous task context                   │
│  • User preferences (unless stated)        │
│                                            │
└────────────────────────────────────────────┘
```

## Best Practices for Agent Coordination

1. **Use modernization-planner as entry point** for complex projects
2. **Provide context** to each agent invocation
3. **Reference previous work** when continuing tasks
4. **Validate outputs** before proceeding to next agent
5. **Combine outputs** from multiple agents into cohesive plan
6. **Iterate** based on feedback and new information

---

For more details, see:
- [README.md](README.md) - Complete documentation
- [QUICK_REFERENCE.md](QUICK_REFERENCE.md) - Fast lookup guide
