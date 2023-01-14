FROM node:16.19.0

WORKDIR /app

COPY . .

RUN npm install 

CMD ["npm", "start"]





