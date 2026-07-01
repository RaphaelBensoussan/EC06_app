# Stage 1 : Build et installation pour la CI (tests / linter)
FROM node:20-alpine AS builder
WORKDIR /usr/src/app
COPY package*.json ./
# Cache npm pour accelerer le build (Bonus)
RUN --mount=type=cache,target=/root/.npm npm install
COPY . .

# Stage 2 : Image finale pour la prod
FROM node:20-alpine AS runner
WORKDIR /usr/src/app
ENV NODE_ENV=production
COPY package*.json ./
# Cache npm pour de la production (Bonus)
RUN --mount=type=cache,target=/root/.npm npm install --only=production
COPY --from=builder /usr/src/app/src ./src

# Securite : non-root
USER node
EXPOSE 3000

# Healthcheck requis par le sujet
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD wget --no-verbose --tries=1 --spider http://localhost:3000/health || exit 1

CMD ["npm", "start"]
