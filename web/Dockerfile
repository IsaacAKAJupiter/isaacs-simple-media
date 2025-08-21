FROM node:22-alpine AS builder

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install

COPY . .

RUN npm run build


FROM node:22-alpine

WORKDIR /usr/src/app

COPY --from=builder /usr/src/app/dist ./dist

COPY package*.json ./
RUN npm prune --omit=dev

EXPOSE 3334

CMD [ "node", "dist/web/server/server.mjs" ]