FROM nginx:1.19

# Modify timezone
ENV TZ=Asia/Shanghai

RUN apt-get update; \
    apt-get install -y \
        vim \
        curl \
        ca-certificates && \
        rm -rf /var/lib/apt/lists/*; \
    chown -R www-data:www-data /usr/share/nginx/html;

# Nginx conf
ADD default.conf /etc/nginx/conf.d/default.conf

RUN cp /etc/apt/sources.list /etc/apt/sources.list.bak; \
    sed -i 's http://.*.debian.org http://mirrors.aliyun.com g' /etc/apt/sources.list

EXPOSE 8080