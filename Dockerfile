FROM nginx:1.15.2-alpine
RUN apk add --no-cache \
    bash \
    python2 \
    py2-pip \
    python2-dev \
    gcc \
    musl-dev \
    libffi-dev \
    openssl-dev 
RUN cp -rf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
RUN pip install pymysql pyyaml 
ADD default.conf /etc/nginx/conf.d/default.conf