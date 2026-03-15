FROM node:20-alpine AS deps
WORKDIR /app/backend
COPY backend/package*.json ./
RUN npm ci --omit=dev

FROM node:20-alpine AS runtime
WORKDIR /app/backend
ENV NODE_ENV=production

COPY --from=deps /app/backend/node_modules ./node_modules
COPY backend/ ./

RUN addgroup -S appgroup && adduser -S appuser -G appgroup \
    && chown -R appuser:appgroup /app/backend

USER appuser
EXPOSE 5000

HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD node -e "fetch('http://localhost:5000/').then(r => process.exit(r.ok ? 0 : 1)).catch(() => process.exit(1))"

CMD ["node", "server.js"]
