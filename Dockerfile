FROM centos:7
MAINTAINER JinChuang|https://me.jinchuang.org/archives/596.html

# 添加文件
COPY nginx.conf *.tar.gz /usr/src/

# 创建用户
RUN useradd -M -s /sbin/nologin nginx && \
# 安装依赖包
yum install wget deltarpm -y && \
wget -O /etc/yum.repos.d/epel-7.repo http://mirrors.aliyun.com/repo/epel-7.repo && \
yum -y install unzip bzip2 zlib zlib-devel pcre pcre-devel openssl openssl-devel \
geoip geoip-devel gd gd-devel gcc gcc-c++ make libtool && \
# 安装nginx
cd /usr/src/ && tar xf nginx-1.18.0.tar.gz && tar xf openssl-1.1.1f.tar.gz && tar xf pcre-8.44.tar.gz && tar xf zlib-1.2.11.tar.gz && \
cd nginx-1.18.0 && \
./configure \
--prefix=/usr/local/nginx \
--pid-path=/var/run/nginx.pid \
--lock-path=/var/run/nginx.lock \
--http-client-body-temp-path=/usr/local/nginx/client_temp \
--http-proxy-temp-path=/usr/local/nginx/proxy_temp \
--http-fastcgi-temp-path=/usr/local/nginx/fastcgi_temp \
--http-uwsgi-temp-path=/usr/local/nginx/uwsgi_temp \
--http-scgi-temp-path=/usr/local/nginx/scgi_temp \
--user=nginx \
--group=nginx \
--with-mail \
--with-stream \
--with-threads \
--with-file-aio \
--with-poll_module \
--with-select_module \
--with-http_v2_module \
--with-http_flv_module \
--with-http_mp4_module \
--with-http_sub_module \
--with-http_dav_module \
--with-http_flv_module \
--with-http_ssl_module \
--with-http_geoip_module \
--with-http_slice_module \
--with-http_gunzip_module \
--with-http_realip_module \
--with-http_addition_module \
--with-http_image_filter_module \
--with-http_gzip_static_module \
--with-http_random_index_module \
--with-http_secure_link_module \
--with-http_degradation_module \
--with-http_stub_status_module \
--with-mail_ssl_module \
--with-stream_ssl_module \
--with-stream_realip_module \
--with-stream_ssl_preread_module \
--with-pcre=/usr/src/pcre-8.44 \
--with-openssl=/usr/src/openssl-1.1.1f \
--with-zlib=/usr//src/zlib-1.2.11 && \
make && make install && \
# 清理文件
rm -rf /usr/src/openssl-1.1.1f/test/ && yum clean all && \
# 配置文件
\cp /usr/src/nginx.conf /usr/local/nginx/conf/ && \
# 日志输出
ln -sf /dev/stdout /usr/local/nginx/logs/access.log && \
ln -sf /dev/stderr /usr/local/nginx/logs/error.log

# 环境变量
ENV PATH $PATH:/usr/local/nginx/sbin

# 开放端口
EXPOSE 80 443

# 工作目录
WORKDIR /usr/local/nginx

# 执行命令
CMD [ "nginx","-g","daemon off;" ]
