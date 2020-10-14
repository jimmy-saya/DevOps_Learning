FROM node:latest

WORKDIR /usr/src/app

COPY ~/DevOps_Learning/dev/nodejs_project .

RUN npm install

EXPOSE 8080

CMD [ "node", "server.js"]