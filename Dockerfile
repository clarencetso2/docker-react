
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
COPY --from=builder /app/build /usr/share/nginx/html
