# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the container
#COPY package*.json ./

# Install application dependencies
RUN npm install

# Install PM2 globally
RUN npm install pm2 -g

# Copy the rest of the application code to the container
COPY . .

# Expose port 80 for the Node.js application
EXPOSE 80

# Use PM2 to start your Node.js application on port 80
CMD ["pm2-runtime", "app.js"]

