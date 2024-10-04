# Stage 1: Build stage
FROM node:latest AS build

# Set up work directory
WORKDIR /app

# Copy package.json and package-lock.json for better caching
COPY package*.json ./

# Install dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# List files for debugging
RUN ls -la

# Stage 2: Production stage
FROM node:22-bookworm-slim

# Set up work directory
WORKDIR /app

# Copy the built application from the previous stage
COPY --from=build /app . 

# Expose the application port
EXPOSE 3000

# Start the application (update to the correct entry point)
CMD ["npm", "run", "dev"]


# old dockerfile
# FROM node:latest
# RUN npm install -g nodemon 
# WORKDIR /app
# COPY . .
# RUN npm install
# EXPOSE 5000
# CMD [ "node", "index.js" ]
# CMD ["node", "run", "dev"]