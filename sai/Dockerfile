FROM nginx:alpine
WORKDIR /usr/share/nginx/html/
COPY  ./index.html /usr/share/nginx/html/index.html
RUN chmod -R 0777 /usr/share/nginx/html/index.html
EXPOSE 80
