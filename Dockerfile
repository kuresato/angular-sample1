FROM node:14.2-alpine as builder
WORKDIR /usr/src/app
COPY package.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:1.18-alpine
COPY --from=builder /usr/src/app/dist/angular-sample1 /usr/share/nginx/html

