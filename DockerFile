FROM nginx:alpine
# Copy your custom HTML into the Nginx web server folder
COPY index.html /usr/share/nginx/html/index.html
