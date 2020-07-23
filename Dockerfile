
### BUILD PHASE
#tag to call it builder
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

#RUN PHASE start up NGINX
FROM nginx
#for AWS elastic beanstalk to map port
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
