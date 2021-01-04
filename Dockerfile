FROM node:alpine as base

WORKDIR /app
COPY package.json  /app
RUN npm install
COPY . .
RUN npm run build

FROM nginx

COPY --from=base /app/build /usr/share/nginx/html