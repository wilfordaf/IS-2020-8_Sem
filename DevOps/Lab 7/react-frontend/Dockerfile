FROM node:12-alpine AS build

WORKDIR /app
COPY *.json .
RUN npm install

COPY public /app/public
COPY src /app/src
RUN npm run build

RUN rm -rf /var/cache/apk/*

FROM nginx:alpine

COPY ./nginx/nginx.conf /etc/nginx/nginx.conf
RUN rm -rf /usr/share/nginx/html/*
COPY --from=build /app/build /usr/share/nginx/html
ENTRYPOINT ["nginx", "-g", "daemon off;"]