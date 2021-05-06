**基于centos7制作nginx1.19.10镜像**

版本信息：<br>
nginx   version:  1.19.10<br>
openssl version:  1.1.1f<br>
zlib    version:  1.2.11<br>
pcre    version:  8.44<br>

---

**默认配置文件**
```
/usr/local/nginx/conf/nginx.conf
```
---

**默认网页目录**
```
/usr/local/nginx/html/
```
---

**配置编译参数**
```
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
--with-zlib=/usr/src/zlib-1.2.11
```
