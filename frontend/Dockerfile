FROM node:20-alpine AS build
WORKDIR /app/frontend
COPY frontend/package*.json ./
RUN npm ci
COPY frontend/ ./
ARG VITE_API_URL=http://localhost:5000
ENV VITE_API_URL=$VITE_API_URL
RUN npm run build

FROM node:20-alpine AS runtime
WORKDIR /app/frontend
ENV NODE_ENV=production
RUN npm install -g serve@14.2.4 \
    && addgroup -S appgroup && adduser -S appuser -G appgroup
COPY --from=build /app/frontend/dist ./dist
USER appuser
EXPOSE 4173
HEALTHCHECK --interval=30s --timeout=3s --retries=3 CMD wget -qO- http://localhost:4173/ || exit 1
CMD ["serve", "-s", "dist", "-l", "4173"]
