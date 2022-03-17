FROM node:16.10-alpine as node-angular-cli
WORKDIR /usr/local/app 
RUN apk update \
  && apk add --update alpine-sdk \
  && apk del alpine-sdk \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

RUN npm install -g @angular/cli

RUN ng config -g cli.warnings.versionMismatch false

COPY ./ /usr/local/app/ 

RUN npm install 

RUN ng build  

FROM nginx:latest 

COPY --from=node-angular-cli /usr/local/app/dist/EzyContracts /usr/share/nginx/html 

EXPOSE 80
