FROM n8nio/n8n:latest

# Set environment variables for n8n configuration
ENV N8N_PORT=3000 \
    N8N_PROTOCOL=https \
    NODE_ENV=production \
    N8N_DIAGNOSTICS_ENABLED=false \
    WEBHOOK_URL=https://render-a37d.onrender.com/ \
    GENERIC_TIMEZONE=UTC \
    DB_TYPE=sqlite

# For security (change these in Render's environment variables)
ENV N8N_ENCRYPTION_KEY=change-me-please \
    N8N_JWT_SECRET=change-me-please

# Using SQLite as the default database
# The database file will be stored in /home/node/.n8n directory

# Create directory for n8n storage
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

# Expose the port n8n runs on
EXPOSE 3000

# Set working directory
WORKDIR /home/node/.n8n

# Start n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]

