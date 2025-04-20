FROM n8nio/n8n:latest

# Set environment variables for n8n configuration
ENV N8N_PORT=3000 \
    N8N_PROTOCOL=https \
    NODE_ENV=production \
    N8N_DIAGNOSTICS_ENABLED=false \
    WEBHOOK_URL=https://render-a37d.onrender.com/ \
    GENERIC_TIMEZONE=UTC \
    DB_TYPE=sqlite \
    N8N_ENCRYPTION_KEY=change-me-please \
    N8N_JWT_SECRET=change-me-please

# Install OCR tools
USER root

RUN apt-get update && apt-get install -y \
    poppler-utils        # pdftotext, pdftoppm


# Create n8n storage directory with correct permissions
RUN mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node/.n8n

USER node

# Set working directory
WORKDIR /home/node/.n8n

# Expose the port
EXPOSE 3000

# Start n8n
ENTRYPOINT ["tini", "--"]
CMD ["n8n", "start"]

