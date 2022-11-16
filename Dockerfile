FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install --force
ENV NODE_OPTIONS=--openssl-legacy-provider
RUN npm run build 

# stage 2 for prod 
FROM nginx:alpine
COPY --from=node /app/dist/myapp /usr/share/nginx/html
