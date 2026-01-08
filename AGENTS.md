# AGENTS.md - n8n-nodes-ai-agent-langfuse

**Build commands:**

- `npm run build` - Full build (rimraf dist, tsc, gulp build:icons)
- `npm run dev` - TypeScript watch mode
- `npm run lint` - Lint with ESLint (nodes, credentials, package.json)
- `npm run lintfix` - Auto-fix linting issues
- `npm run format` - Format with Prettier (nodes, credentials)

**Docker commands:**

- `docker build -t n8n:nodes-ai-agent-langfuse .` - Build Docker image
- `docker run -it -p 5678:5678 -e N8N_USER_MANAGEMENT_DISABLED=true n8n:nodes-ai-agent-langfuse` - Run container

**Code style:**

- TypeScript with strict mode enabled
- Single quotes, trailing commas, semicolons required
- 2-space indent with tabs enabled, arrowParens: always
- Path aliases: `utils/*` → `src/utils/*`, `types/*` → `src/types/*`
- Node files: `*.node.ts` in `nodes/<NodeName>/`, credentials: `*.credentials.ts` in `credentials/`
- Use n8n-workflow types (`IExecuteFunctions`, `INodeType`, etc.)
- n8n-specific ESLint rules enforce naming conventions and descriptions
