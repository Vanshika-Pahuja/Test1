# Step 1: Build Angular app
FROM node:20 as build

WORKDIR /app
COPY . .

RUN npm install
RUN npm run build

# Step 2: Serve with nginx
FROM nginx:alpine

COPY --from=build /app/apps/my-angular-app/dist/my-angular-app /usr/share/nginx/html

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
