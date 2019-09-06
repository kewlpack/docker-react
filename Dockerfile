# MULTISTEP BUILD PROCESS
#build phase
FROM node:alpine as buildphase

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

#run phase (for nginx image)
FROM nginx
COPY --from=buildphase /app/build /usr/share/nginx/html
