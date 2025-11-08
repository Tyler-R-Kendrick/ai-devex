# GitHub Copilot Instructions

This directory contains instruction prompts for GitHub Copilot to guide code generation and development practices.

## Purpose

These instruction files provide Copilot with:
- Best practices for specific tools and frameworks
- Security considerations and common pitfalls
- Recommended usage patterns with examples
- Version-specific guidance
- DO/DON'T patterns for effective code generation

## Available Instructions

### [GitHub Spec Kit (specify-cli)](./github-spec-kit.md)
Comprehensive guidance for Spec-Driven Development (SDD) using GitHub Spec Kit v0.0.79+.

**Key Topics:**
- Slash command workflow (`/speckit.constitution`, `/speckit.specify`, etc.)
- Technology-agnostic specification writing
- Integration with PRDs, TRDs, OpenAPI, and Gherkin specs
- Best practices for maintaining spec-code consistency
- Common pitfalls and troubleshooting

**When to Use:** When implementing Spec-Driven Development workflows, creating specifications, or using the specify-cli tool.

## How to Use These Instructions

### For Developers
1. Reference these instructions when working with the respective tools
2. Follow the recommended workflows and patterns
3. Use the quick reference cards for common tasks
4. Check for security best practices before implementation

### For GitHub Copilot
These instructions are structured to guide Copilot's code generation:
- In-context learning examples show correct patterns
- DO/DON'T patterns prevent common mistakes
- Version-specific guidance ensures current best practices
- Security considerations are highlighted

## Contributing

When adding new instruction files:
1. Follow the standard format (see existing files)
2. Include concrete examples with code snippets
3. Specify version information and last updated date
4. Add DO/DON'T patterns for common scenarios
5. Include security considerations
6. Add quick reference card for workflows
7. Update this README with the new instruction file

## Format Standards

Each instruction file should include:
- **Tool/Version Header:** Clear identification and versioning
- **Primary Use Cases:** When and why to use the tool
- **Installation/Setup:** How to get started
- **Recommended Patterns:** Best practice examples with code
- **Common Pitfalls:** What to avoid with explanations
- **Security Practices:** Security-specific guidance
- **Quick Reference:** Summary card for fast lookup
- **Resources:** Links to documentation
- **Last Updated:** Timestamp and version

## Maintenance

- Review instructions quarterly or when major versions release
- Update security status when vulnerabilities are discovered
- Add new patterns based on community feedback
- Keep examples current with latest tool versions

---

*Directory Created: 2025-11-08*
