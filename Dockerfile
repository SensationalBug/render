FROM n8nio/n8n:latest

# Set environment variables for n8n configuration
ENV N8N_PORT=3000 \
    N8N_PROTOCOL=https \
    NODE_ENV=production \
    N8N_DIAGNOSTICS_ENABLED=false \
    WEBHOOK_URL=https://render-a37d.onrender.com/ \
    GENERIC_TIMEZONE=UTC

# For security (change these in Render's environment variables)
ENV N8N_ENCRYPTION_KEY=aaaaaaaaaaaaaaaaaaaaaaaa \
    N8N_JWT_SECRET=aaaaaaaaaaaaaaaaaaaaaaaa

# Configure database (these should be set in Render's environment variables)
ENV DB_TYPE=postgresdb \
DB_POSTGRESDB_HOST=your-postgres-host \
DB_POSTGRESDB_PORT=5432 \
DB_POSTGRESDB_DATABASE=n8n \
DB_POSTGRESDB_USER=n8n \
DB_POSTGRESDB_PASSWORD=n8n

# Create directory for n8n storage
RUN mkdir -p /home/node/.n8n

# Expose the port n8n runs on
EXPOSE 3000

# Set working directory
WORKDIR /home/node/.n8n

# Start n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]

