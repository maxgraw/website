FROM ghcr.io/static-web-server/static-web-server:2
COPY ./index.html ./dist/index.html
ENV SERVER_ROOT="./dist"
ENV SERVER_PORT=3175