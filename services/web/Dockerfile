FROM nginx:alpine

LABEL maintainer="jpelefantino"
LABEL proyecto="EPA-Infraestructura"
LABEL servicio="SRV-WEB-01"

RUN rm /etc/nginx/conf.d/default.conf

COPY nginx.conf /etc/nginx/conf.d/
COPY html/ /usr/share/nginx/html/

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
