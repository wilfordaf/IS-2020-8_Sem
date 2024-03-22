FROM alpine:latest

RUN apk --no-cache add nginx bash

USER nginx

RUN rm -rf /var/cache/apk/*

EXPOSE 5000

CMD ["nginx", "-g", "daemon off;"]