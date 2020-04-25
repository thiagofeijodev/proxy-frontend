FROM nginx:stable
WORKDIR /usr/app
COPY . /usr/app
RUN rm /etc/nginx/conf.d/default.conf

COPY nginx-staging.conf /etc/nginx/conf.d/default.conf
RUN chmod +x /usr/app/init-docker.sh
RUN pwd && ls -la
ENTRYPOINT ["/usr/app/init-docker.sh"]