# Quick Reference: Custom Agents for Code Modernization

## Agent Summary Table

| Agent | Primary Focus | Key Tools | When to Use |
|-------|--------------|-----------|-------------|
| **knowledge-modeler** | Data structure design | bash, create, edit, search | Organizing knowledge, designing storage |
| **knowledge-retriever** | Information discovery | search, view, web_search | Finding code, docs, historical context |
| **knowledge-generator** | Documentation creation | create, edit, web_search | Filling documentation gaps, eliciting requirements |
| **spec-generator** | Formal specifications | create, edit, view | PRDs, BRDs, TRDs, Gherkin, API specs |
| **setup-planner** | Tool management | bash, view, create, web_search | Tool selection, installation, configuration |
| **modernization-planner** | Orchestration | All agents | Overall modernization planning and coordination |

## Quick Start Commands

### Starting a Modernization Project
```bash
@modernization-planner Help me modernize our [technology] application. 
It's currently using [old versions] and we want to update to [new versions].
```

### Understanding Legacy Code
```bash
@knowledge-retriever Find all instances of [pattern/feature] in the codebase, 
including related tests, documentation, and historical context.
```

### Creating Documentation
```bash
@knowledge-generator Help me create documentation for [component/module]. 
I'll answer your questions about how it works.
```

### Generating Specifications
```bash
@spec-generator Create a [PRD/BRD/TRD] for [project/feature] including 
[specific sections you need].
```

### Setting Up Tools
```bash
@setup-planner What tools do we need for [task]? 
Include installation instructions for [platform].
```

### Organizing Knowledge
```bash
@knowledge-modeler Design a knowledge structure for [type of information] 
using [storage preferences].
```

## Agent Workflow Examples

### Complete Modernization Project

1. **Initial Assessment**
   ```
   @modernization-planner Assess our legacy PHP 5.6 application for 
   modernization to PHP 8.2. Analyze the codebase and create an initial plan.
   ```

2. **Tool Setup**
   ```
   @setup-planner Based on the modernization plan, what tools should we 
   install? Provide setup instructions for Mac and Linux.
   ```

3. **Document Current State**
   ```
   @spec-generator Create a TRD documenting the current architecture, 
   dependencies, and technical debt.
   ```

4. **Create Migration Specs**
   ```
   @spec-generator Generate Gherkin feature files for testing the migration 
   of our authentication module.
   ```

5. **Track Progress**
   ```
   @knowledge-modeler Design a structure for tracking migration progress, 
   decisions, and issues using markdown files and Git.
   ```

### API Documentation Project

1. **Gather Existing Information**
   ```
   @knowledge-retriever Find all API endpoints, their implementations, 
   tests, and any existing documentation.
   ```

2. **Create Comprehensive Docs**
   ```
   @spec-generator Create OpenAPI 3.0 specification for our REST API based 
   on the code analysis.
   ```

3. **Fill Gaps**
   ```
   @knowledge-generator Help me document edge cases and error handling for 
   our API endpoints.
   ```

### Dependency Update Project

1. **Audit Current Tools**
   ```
   @setup-planner Audit our current dependencies and recommend updates for 
   our Node.js project.
   ```

2. **Create Update Plan**
   ```
   @modernization-planner Create a phased plan for updating dependencies 
   with minimal risk.
   ```

3. **Document Changes**
   ```
   @spec-generator Document the breaking changes and migration steps for 
   each major dependency update.
   ```

## Agent Capabilities Matrix

### knowledge-modeler
✅ Design data schemas  
✅ Recommend storage solutions  
✅ Create taxonomies  
✅ Design ETL pipelines  
❌ Implement actual databases  
❌ Write application code  

### knowledge-retriever
✅ Search codebase  
✅ Find historical context  
✅ Cross-reference information  
✅ Identify patterns  
❌ Modify code  
❌ Make decisions  

### knowledge-generator
✅ Ask clarifying questions  
✅ Generate documentation  
✅ Create examples  
✅ Iterative refinement  
❌ Implement features  
❌ Final decision-making  

### spec-generator
✅ Generate formal specs  
✅ Create test scenarios  
✅ Design system docs  
✅ API specifications  
❌ Write implementation code  
❌ Execute tests  

### setup-planner
✅ Recommend tools  
✅ Create install guides  
✅ Generate configs  
✅ Troubleshooting steps  
❌ Install tools directly  
❌ Access your system  

### modernization-planner
✅ Create comprehensive plans  
✅ Coordinate agents  
✅ Risk assessment  
✅ Task breakdown  
❌ Execute modernization  
❌ Make business decisions  

## Common Pitfalls and Solutions

### Pitfall: Vague requests
❌ "Help me with my code"  
✅ "Analyze our authentication module for modernization from bcrypt to Argon2"

### Pitfall: Asking wrong agent
❌ Asking knowledge-retriever to write specs  
✅ Use knowledge-retriever to find info, then spec-generator to write specs

### Pitfall: Expecting implementation
❌ "Deploy this to production"  
✅ "Create a deployment plan with steps and verification"

### Pitfall: Not providing context
❌ "What tools should I use?"  
✅ "What tools should I use for migrating a React 16 app to React 18 with TypeScript?"

## Tips for Effective Use

1. **Be Specific**: Mention exact technologies, versions, and components
2. **Provide Context**: Explain constraints (time, budget, team size)
3. **Use the Right Agent**: Match task to agent expertise
4. **Iterate**: Start broad, then refine with follow-up questions
5. **Validate Output**: Review agent recommendations before implementing
6. **Combine Agents**: Use multiple agents for complex workflows
7. **Ask for Options**: Request alternatives when multiple approaches exist

## Agent Interaction Patterns

### Sequential Pattern (One after another)
```
knowledge-retriever → knowledge-modeler → spec-generator
(Find info) → (Organize it) → (Document it)
```

### Collaborative Pattern (Multiple agents on same task)
```
modernization-planner
  ├─ knowledge-retriever (get current state)
  ├─ knowledge-generator (elicit requirements)
  ├─ spec-generator (create specs)
  └─ setup-planner (plan tools)
```

### Iterative Pattern (Repeat with refinement)
```
1. knowledge-generator → Create draft
2. User feedback → Refine
3. knowledge-generator → Update draft
4. User approval → Finalize
```

## Response Format Examples

### Asking for Analysis
```
@modernization-planner What's the risk level of upgrading from Java 8 to 
Java 17 in our 500K LOC enterprise application?
```

Expected: Risk analysis, mitigation strategies, phased approach

### Asking for Options
```
@setup-planner Should we use Jest or Vitest for our new Vite project?
```

Expected: Comparison table, pros/cons, recommendation with rationale

### Asking for Documentation
```
@knowledge-generator Document our deployment process for new team members.
```

Expected: Questions about the process, then step-by-step documentation

### Asking for Specifications
```
@spec-generator Create a BRD for adding OAuth2 authentication.
```

Expected: Complete BRD following standard template

## Troubleshooting

### Agent doesn't understand request
- Provide more context and background
- Break complex requests into smaller parts
- Use examples to clarify what you want

### Agent provides generic advice
- Be more specific about your exact situation
- Mention specific technologies and versions
- Provide code samples or file references

### Need to override agent recommendation
- Agents are advisors, not decision-makers
- Feel free to choose different approaches
- Ask agent to adapt plan to your choice

### Want to see alternatives
- Explicitly ask for multiple options
- Request pros/cons comparison
- Ask for reasoning behind recommendations

## Best Practices Summary

✅ **DO**
- Provide clear context
- Ask specific questions
- Validate recommendations
- Iterate and refine
- Use appropriate agent for task
- Combine agents for complex workflows

❌ **DON'T**
- Expect agents to execute changes
- Rely solely on agent decisions
- Skip validation of outputs
- Use wrong agent for task
- Provide insufficient context
- Assume agents have full system access

## Getting Help

If agents aren't meeting your needs:

1. Review this quick reference
2. Check the main README.md in `.github/agents/`
3. Read individual agent documentation
4. Refine your prompts and try again
5. Consider if you're using the right agent
6. Break down complex tasks into smaller pieces

## Version Info

- **Version**: 1.0
- **Last Updated**: 2025-11-08
- **Agents Count**: 6
- **Total Lines**: ~2,300

---

*For complete documentation, see [README.md](README.md) in this directory.*
