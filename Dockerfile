FROM node:18-alpine

WORKDIR app

COPY package*.json ./

RUN npm install
RUN npm install -g pm2

COPY . .

ENV NODE_ENV=development PORT=3000


EXPOSE 3000

CMD ["pm2-runtime", "app.js"]
