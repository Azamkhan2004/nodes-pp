# ---------- Build Stage ----------
FROM node:18-alpine AS builder

# Set working directory
WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy source code
COPY . .

# If you have a build step (like React/Vue/Next), run it here
# For plain Node.js/Express apps, this will just copy files
RUN npm run build || echo "No build step defined"

# ---------- Production Stage ----------
FROM node:18-slim

# Set working directory
WORKDIR /app

# Copy built app and node_modules from builder
COPY --from=builder /app /app

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
