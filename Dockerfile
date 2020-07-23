
### BUILD PHASE
#tag to call it builder, jk there is bug in AWS cant used named tags
#FROM node:alpine as builder
FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#RUN PHASE start up NGINX
FROM nginx
#for AWS elastic beanstalk to map port
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html
