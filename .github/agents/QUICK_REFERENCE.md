# Quick Reference: 14 Custom Agents for Code Modernization

## Agent Quick Lookup

| Agent | Focus | When to Use |
|-------|-------|-------------|
| **modernization-legacy-modeler** | Current state analysis | Starting modernization - analyze what exists |
| **modernization-desired-state-modeler** | Target state design | Define where you want to be |
| **modernization-planner** | Strategy & roadmap | Create comprehensive migration plan |
| **knowledge-modeler** | Data structure design | Organize knowledge and design storage |
| **knowledge-retriever** | Information discovery | Find code, docs, historical context |
| **knowledge-generator** | Documentation creation | Fill documentation gaps, elicit requirements |
| **spec-generator** | Formal specifications | PRDs, BRDs, TRDs, Gherkin, API specs |
| **adr-generator** | Decision records | Document architectural decisions |
| **tool-documentation** | Tool knowledge | Document tools, generate Copilot instructions |
| **deps-documentation** | Dependency management | Track dependencies, security, Copilot instructions |
| **prompt-engineer** | Prompt optimization | Create effective prompts for AI tasks |
| **architect** | Architecture expertise | Pattern recommendations, migration guidance |
| **research** | Information gathering | Research with fallback sources, quality evaluation |
| **setup-planner** | Tool setup | Evaluate and plan tool installation |

## Common Commands

### Full Modernization
```
@modernization-legacy-modeler Analyze our [tech stack] [age]-year-old application
@modernization-desired-state-modeler Design target using [modern tech] with [patterns]
@modernization-planner Create migration strategy and roadmap
```

### Finding Information
```
@knowledge-retriever Find all [feature] implementations and related tests
@research Research best practices for [technology/pattern]
```

### Creating Documentation
```
@knowledge-generator Help me document [component/process]
@spec-generator Create [PRD/BRD/TRD] for [feature/migration]
@adr-generator Document decision to use [choice] over [alternatives]
```

### Architecture & Tools
```
@architect Review proposed [architecture pattern] and recommend migration
@setup-planner What tools for [task]? Provide recommendations and setup
```

### Dependency Management
```
@deps-documentation Check [package]@[version] for security and upgrade path
@tool-documentation Document [tool] v[version] with Copilot instructions
```

### Prompting
```
@prompt-engineer Create prompts for [specific AI task] using [CoT/few-shot/etc]
```

## Workflow Examples

### Complete Modernization Project

**Phase 1: Analysis**
```
@modernization-legacy-modeler Analyze our legacy Java 8 monolith application.
Document architecture, technical debt, and dependencies.
```

**Phase 2: Target Design**
```
@modernization-desired-state-modeler Design target: Java 17 microservices
with Spring Boot 3, cloud-native patterns, and event-driven architecture.
```

**Phase 3: Architecture Review**
```
@architect Review proposed microservices architecture. Recommend migration
pattern considering our monolithic database and shared dependencies.
```

**Phase 4: Planning**
```
@modernization-planner Create migration strategy using Strangler Fig pattern.
Generate phased roadmap with risk mitigation and task allocation.
```

**Phase 5: Tool Setup**
```
@setup-planner Recommend tools for Java 8→17 migration including code
analysis, refactoring, testing, and deployment. Provide setup guides.
```

**Phase 6: Document Decisions**
```
@adr-generator Document key decisions: microservices adoption, Strangler
Fig strategy, Spring Boot 3 choice, cloud deployment approach.
```

### API Documentation Project

**Step 1**
```
@knowledge-retriever Find all REST endpoints, implementations, and tests
```

**Step 2**
```
@knowledge-generator Elicit missing API documentation from team
```

**Step 3**
```
@spec-generator Create OpenAPI 3.0 specification from gathered information
```

**Step 4**
```
@adr-generator Document API design decisions and standards chosen
```

### Dependency Security Audit

**Step 1**
```
@deps-documentation Check all current dependencies for security
vulnerabilities and maintenance status
```

**Step 2**
```
@research Research secure alternatives for any abandoned or vulnerable
packages
```

**Step 3**
```
@deps-documentation Generate Copilot instructions for safe usage of
approved dependencies with version-specific guidance
```

**Step 4**
```
@adr-generator Document dependency choices and security standards
```

## Agent Capabilities Matrix

### Primary Capabilities

| Task | Primary Agent | Supporting Agents |
|------|---------------|-------------------|
| Analyze legacy system | modernization-legacy-modeler | knowledge-retriever, architect |
| Design target state | modernization-desired-state-modeler | architect, research |
| Create migration plan | modernization-planner | All modernization + architect |
| Find existing code | knowledge-retriever | - |
| Organize knowledge | knowledge-modeler | knowledge-retriever |
| Create documentation | knowledge-generator | knowledge-retriever |
| Generate formal specs | spec-generator | knowledge-generator |
| Document decisions | adr-generator | - |
| Manage tool docs | tool-documentation | research |
| Manage dependency docs | deps-documentation | research |
| Create prompts | prompt-engineer | - |
| Architecture guidance | architect | research |
| Research information | research | - |
| Plan tool setup | setup-planner | - |

## Agent Handoff Patterns

### Modernization Flow
```
modernization-legacy-modeler
   ↓ (current state)
modernization-desired-state-modeler
   ↓ (target state + gap analysis)
modernization-planner
   ↓ (strategy + roadmap)
adr-generator (document decisions)
```

### Knowledge Flow
```
research
   ↓ (findings)
tool-documentation OR deps-documentation
   ↓ (Copilot instructions)
prompt-engineer (optimize)
```

### Architecture Flow
```
modernization-legacy-modeler OR modernization-desired-state-modeler
   ↓ (architecture questions)
architect
   ↓ (recommendations)
adr-generator (document)
```

## Quick Decision Guide

**Need to understand what exists?**
→ @modernization-legacy-modeler or @knowledge-retriever

**Need to define target state?**
→ @modernization-desired-state-modeler

**Need overall plan?**
→ @modernization-planner

**Need to find something?**
→ @knowledge-retriever or @research

**Need documentation?**
→ @knowledge-generator or @spec-generator

**Made a decision?**
→ @adr-generator

**Need architecture help?**
→ @architect

**Working with tools/deps?**
→ @tool-documentation or @deps-documentation

**Creating AI prompts?**
→ @prompt-engineer

**Setting up environment?**
→ @setup-planner

## Common Patterns

### Pattern: Discovery → Design → Plan
```
1. @modernization-legacy-modeler [analyze current]
2. @modernization-desired-state-modeler [design target]
3. @modernization-planner [create roadmap]
```

### Pattern: Research → Document → Instruct
```
1. @research [investigate topic]
2. @tool-documentation OR @deps-documentation [document findings]
3. @prompt-engineer [optimize for Copilot]
```

### Pattern: Find → Generate → Formalize
```
1. @knowledge-retriever [find existing info]
2. @knowledge-generator [fill gaps]
3. @spec-generator [create formal spec]
```

### Pattern: Analyze → Recommend → Document
```
1. @architect [analyze architecture]
2. @architect [recommend approach]
3. @adr-generator [document decision]
```

## Tips for Effective Use

1. **Be Specific**
   - ❌ "Help with my app"
   - ✅ "Analyze our React 16.8 SPA for migration to React 18 with TypeScript"

2. **Provide Context**
   - Mention current versions
   - State constraints (time, budget, team size)
   - Identify critical requirements

3. **Use Right Agent**
   - Don't ask knowledge-retriever to create plans
   - Don't ask spec-generator to analyze code
   - Match task to agent expertise

4. **Iterate and Refine**
   - Start with one agent
   - Use output to inform next agent
   - Refine based on feedback

5. **Document Decisions**
   - Use adr-generator for significant choices
   - Capture rationale and alternatives
   - Build knowledge base over time

6. **Leverage Handoffs**
   - Agents are designed to work together
   - Reference previous agent outputs
   - Follow suggested workflow patterns

## Troubleshooting

**Agent not understanding request?**
- Add more specific details
- Break into smaller tasks
- Try different agent

**Need multiple perspectives?**
- Use architect for expert view
- Use research for external info
- Use knowledge-retriever for internal info

**Results too generic?**
- Provide concrete examples
- Specify versions and technologies
- Include project-specific context

**Need to combine outputs?**
- Use modernization-planner to synthesize
- Use knowledge-modeler to organize
- Use spec-generator to formalize

## Version Info

- **Version**: 2.0
- **Agents**: 14 total
- **Last Updated**: 2025-11-08
- **Structure**: 3 modernization orchestration, 3 knowledge management, 5 specification/documentation, 3 architecture/guidance

---

*For detailed documentation, see [README.md](README.md) in this directory.*
*For architecture patterns, see [ARCHITECTURE.md](ARCHITECTURE.md).*
