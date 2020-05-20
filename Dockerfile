FROM node:14.2.0-alpine3.11 AS dev
LABEL MAINTAINER="anandujjwal13@gmail.com"
WORKDIR /usr/app
COPY ./package.json .
RUN npm install 
COPY . .
RUN npm run build


FROM nginx
LABEL MAINTAINER="anandujjwal13@gmail.com"
LABEL ENVIRONMENT="PRODUCTION"
COPY --from=dev /usr/app/build /usr/share/nginx/html