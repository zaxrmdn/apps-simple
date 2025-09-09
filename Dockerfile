FROM node:18.20.8-slim
WORKDIR /data
COPY . /data
RUN npm install
ENV DB_NAME=training DB_HOST=localhost DB_USER=peserta DB_PASS=password APP_PORT=3000
CMD npm start