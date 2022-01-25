FROM node:alpine
ADD app.js /app.js
RUN apk add --update curl && \
  rm -rf /var/cache/apk/*
ENTRYPOINT ["node", "app.js"]
