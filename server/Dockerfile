FROM node:16-alpine

WORKDIR /src

COPY package.json /src/
RUN npm install

COPY . /src

ENV PORT=4000
ENV ENVIRONMENT=production

EXPOSE $PORT

CMD ["npm", "run", "start"]