FROM n8nio/n8n:latest

USER root

RUN mkdir -p /opt/n8n-custom-nodes && \
    chown -R node:node /opt/n8n-custom-nodes

# Copy local dist folder
COPY --chown=node:node dist /opt/n8n-custom-nodes

# Install dependencies from the local package
WORKDIR /opt/n8n-custom-nodes
RUN npm install --legacy-peer-deps

ENV N8N_CUSTOM_EXTENSIONS="/opt/n8n-custom-nodes"
ENV N8N_USER_MANAGEMENT_DISABLED=true
ENV N8N_MFA_ENABLED=false

USER node
ENTRYPOINT ["tini", "--", "/docker-entrypoint.sh"]
