FROM node:18-slim
WORKDIR /app
COPY package*.json ./
COPY server.js .
RUN npm install
CMD ["npm", "start"]
EXPOSE 3000
