server {
    listen 80;
    listen 443 ssl;
    server_name sodahair.com *.sodahair.com;
    ssl_certificate sodahair.crt;
    if ($host != 'sodahair.com' ) {
        rewrite ^/(.*)$ http://sodahair.com/$1 permanent;
    }
    set $OC_ROOT /usr/share/nginx/html/opencart;
    set $OC_MODE developer;
    include /usr/share/nginx/html/opencart/nginx.conf.sample;
}

