# Documentation Standards for n8n Community Nodes

## Overview

This document outlines standards and best practices for writing documentation for n8n community nodes. Following these guidelines ensures your documentation meets n8n's verification requirements and provides the best possible experience for users installing and using your nodes.

## Purpose

Documentation should help users:

- Quickly understand what the node does and its value
- Install and configure the node successfully
- Use the node effectively in their workflows
- Troubleshoot common issues

## Structure Requirements

### Required Sections

Every n8n community node README must include these sections in this order:

```markdown
# [Node Name]

Brief description of what the node does and its main value proposition.

## Features

Bullet points highlighting key capabilities.

[Installation](#installation)
[Credentials](#credentials)
[Operations](#operations)
[Compatibility](#compatibility)
[Usage](#usage)
[Resources](#resources)
[Version history](#version-history)
```

### Section Details

#### Installation Section

**Required subsections:**

- Community Nodes (Recommended) - For n8n v0.187+
- Docker Installation (Recommended for Production)
- Manual Installation

**Pattern:**

````markdown
## Installation

Follow the [installation guide](https://docs.n8n.io/integrations/community-nodes/installation/) in the official n8n documentation for community nodes.

### Community Nodes (Recommended)

For **n8n v0.187+**, install directly from the UI:

1. Go to Settings → Community Nodes
2. Click **Install**
3. Enter `n8n-nodes-ai-agent-langfuse` in "Enter npm package name"
4. Agree to the risks of using community nodes
5. Select Install

### Docker Installation (Recommended for Production)

A preconfigured Docker setup is available in `docker/` directory:

1. Clone the repository and navigate to `docker/` directory
   ```bash
   git clone https://github.com/example/repo.git
   cd n8n-nodes-example/docker
   ```
2. Build Docker image
   ```bash
   docker build -t n8n:nodes-example .
   ```
3. Run container
   ```bash
   docker run -it -p 5678:5678 n8n:nodes-example
   ```
4. Access n8n at http://localhost:5678

### Manual Installation

For a standard installation without Docker:

```bash
# Go to your n8n installation directory
cd ~/.n8n
# Install the node
npm install n8n-nodes-example
# Restart n8n to apply the node
n8n start
```
````

````

#### Credentials Section

**Required for authenticated nodes:**
- Clear explanation of credential purpose
- Field descriptions with examples
- Visual credential UI preview
- Setup instructions

**Pattern:**
```markdown
## Credentials

This credential is used to:
- [Purpose of authentication]

### [Service] Settings
| Field Name | Description | Example |
|-----------|-------------|---------|
| Field * | Description of field | `example-value` |
| Secret Key * | Description of secret field | `sk-xxx` |

> 🔑 How to find your keys:
> Log in to your service dashboard, then go to:
> Settings → API Keys → Generate New Key

### Credential UI Preview
Once filled out, your credential should look like this:

![credentials-example](assets/credentials-example.png)

✅ After saving the credential, you're ready to use the node.
````

#### Operations Section

**Required content:**

- Supported operations/fields table
- Visual examples of node configuration
- Input/output examples
- Use case demonstrations

**Pattern:**

````markdown
## Operations

[Brief description of what the node does]

---

### Supported Fields

| Field       | Type     | Description              |
| ----------- | -------- | ------------------------ |
| `fieldName` | `string` | Description of field     |
| `userId`    | `string` | ID representing the user |

---

### 🧪 Example Setup

| Input Field | Example Value         |
| ----------- | --------------------- |
| Session ID  | `{{$json.sessionId}}` |
| User ID     | `test-user`           |

---

### Visual Example

1. **Node Configuration UI**: [Description of setup]

![node-example](assets/node-example.png)

2. **Output/Result**: [Description of expected output]

The node returns structured output that includes:

- LLM reasoning steps
- Tool calls with arguments
- Final response

Example output:

```json
{
	"data": "response data",
	"traceId": "trace-123"
}
```
````

````

#### Compatibility Section

**Required information:**
- Minimum n8n version
- Compatible services/APIs
- Known limitations

**Pattern:**
```markdown
## Compatibility
- Requires n8n version 1.0.0 or later
- Compatible with:
  - OpenAI official API (https://api.openai.com)
  - OpenAI-compatible LLMs (e.g., via LiteLLM, LocalAI)
  - Langfuse Cloud and self-hosted instances
- Known limitations:
  - Rate limits apply for API calls
  - Requires API credentials
````

#### Resources Section

**Required links:**

- n8n Community Node Docs
- Service/API documentation
- Related repositories
- Community forums

**Pattern:**

```markdown
## Resources

- [n8n Community Node Docs](https://docs.n8n.io/integrations/community-nodes/)
- [Service Documentation](https://docs.service.com/)
- [n8n Community Forum](https://community.n8n.io/)
- [Related Repository](https://github.com/example/repo)
```

#### Version History Section

**Optional but recommended:**

- List major versions and changes
- Follow semantic versioning
- Highlight breaking changes

**Pattern:**

```markdown
## Version History

- **v0.2.0** – Added new feature X
- **v0.1.0** – Initial release
```

## Tone and Voice Guidelines

### Professional Yet Accessible

- Use clear, concise language
- Avoid technical jargon without explanation
- Write for both beginners and experienced users
- Focus on workflow benefits, not API complexity

### n8n-Specific Language

- Use "workflows" instead of "automations"
- Reference n8n UI elements by name (Settings → Community Nodes)
- Use n8n expression syntax (`{{$json.field}}`)
- Follow n8n's terminology (nodes, credentials, executions)

### Action-Oriented

- Start sections with verbs ("Install", "Configure", "Use")
- Provide step-by-step instructions
- Include success indicators (✅)
- Use emojis sparingly for visual cues (🔑, ✅, ⚠️)

## Visual Standards

### Required Images

- Node configuration UI screenshot
- Credential setup preview
- Output/result examples
- Workflow integration examples

### Image Naming Convention

```
assets/
├── node-example.png
├── credentials-example.png
├── output-example.png
└── workflow-example.png
```

### Image Guidelines

- Use PNG format for screenshots
- Include clear annotations
- Show real data (anonymized if needed)
- Capture n8n UI at readable resolution (minimum 1920x1080)
- Ensure high contrast and visibility

## n8n-Specific Documentation Patterns

### Workflow-First Approach

- Show how node fits into complete workflows
- Provide example JSON for workflow imports
- Demonstrate integration with other n8n nodes
- Focus on use cases, not isolated API calls

### Pagination Handling

- Offer "Return All" boolean option for paginated APIs
- Default to `false` for performance
- Document pagination behavior clearly
- Reference n8n's pagination patterns when applicable

### Error Handling

- Document common error scenarios
- Provide troubleshooting steps
- Reference n8n's error handling patterns
- Include credential error guidance

### Data Transformation

- Show how node transforms data between steps
- Use n8n's data structure examples
- Demonstrate data mapping techniques
- Include input/output schema when relevant

## Best Practices

### From Community Experience

1. **Simplify Complex APIs**: Abstract multiple API calls into single operations when possible
2. **Provide UI Options**: Don't force users to learn complex query languages - offer simplified alternatives with text inputs
3. **Visual Examples**: Screenshots and workflow examples are worth more than detailed API documentation
4. **Test Documentation**: Install your own node following your documentation to verify accuracy

### Verification Requirements

- Must include proper documentation for verification
- Use English only (interface and docs)
- Follow n8n's community node standards
- Include usage examples and authentication details
- License must be MIT

### Maintenance

- Keep documentation updated with node versions
- Test installation instructions regularly
- Update screenshots when UI changes
- Monitor community feedback on documentation clarity

## Template Checklist

Before submitting documentation, verify:

- [ ] README follows required section structure
- [ ] Installation includes all three methods
- [ ] Credentials documented with examples and screenshots
- [ ] Operations include field tables and visual examples
- [ ] Compatibility clearly stated
- [ ] Resources section complete
- [ ] All images present and properly named
- [ ] Links tested and working
- [ ] Documentation tested with fresh n8n installation
- [ ] English language used throughout
- [ ] MIT license mentioned if applicable

## Common Pitfalls to Avoid

1. **API-Centric Documentation**: Don't just document API endpoints - show workflow integration
2. **Missing Visuals**: Text-only documentation is hard to follow for complex nodes
3. **Incomplete Installation**: Always test all installation methods
4. **Jargon-Heavy**: Explain technical terms or avoid them when possible
5. **Outdated Screenshots**: Keep visuals current with n8n versions
6. **No Use Cases**: Documentation without examples leaves users guessing how to use the node
7. **Broken Links**: Always verify all external links work

## Verification Guidelines

Your documentation will be reviewed for verification. Ensure:

- **English Only**: All UI text, parameter names, and documentation must be in English
- **Clear README**: Package includes a README with installation and usage instructions
- **Usage Examples**: Demonstrated workflows showing the node in action
- **Credential Setup**: Clear authentication process with screenshots
- **No External Dependencies**: Node should not require runtime dependencies
- **Proper n8n Structure**: Nodes follow n8n's file structure guidelines

## Examples from Verified Nodes

Study these verified community nodes for documentation patterns:

1. **Langfuse AI Agent Node** - Good visual examples, clear credential setup
2. **n8n's Built-in Nodes** - Professional structure, comprehensive field documentation
3. **Community Forum Examples** - Real-world usage patterns, troubleshooting guides

Remember: Good documentation gets your node verified and helps users succeed with your integration.

## Additional Resources

- [n8n Community Node Documentation](https://docs.n8n.io/integrations/community-nodes/)
- [Building Community Nodes Guide](https://docs.n8n.io/integrations/creating-nodes/build/)
- [Node Verification Guidelines](https://docs.n8n.io/integrations/creating-nodes/build/reference/verification-guidelines/)
- [UX Guidelines](https://docs.n8n.io/integrations/creating-nodes/build/reference/ux-guidelines/)
