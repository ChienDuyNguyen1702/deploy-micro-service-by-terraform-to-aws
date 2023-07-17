FROM node:16-alpine

WORKDIR /src
COPY package.json /src/
RUN npm install

COPY . /src

ENV PORT=3000
ENV SERVER_URL=http://localhost:4000

EXPOSE $PORT
CMD ["npm" ,"run", "dev"]