FROM node:latest as builder
WORKDIR /app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
COPY nginx.conf /etc/nginx
RUN mkdir -p /etc/nginx/logs 
COPY --from=builder /app/build /usr/share/nginx/html

