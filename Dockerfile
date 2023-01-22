FROM node:16.19.0 as node

WORKDIR /app

COPY package.json .

RUN npm install --silent

COPY . .

RUN npm run build

FROM nginx:1.15

COPY --from=node /app/build/ /usr/share/nginx/html

RUN rm -rf /usr/share/nginx/html/*

COPY --from=node /app/build /usr/share/nginx/html

EXPOSE 3000 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]
