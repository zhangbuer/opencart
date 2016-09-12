server {
    listen 80;
    server_name sodahair.com *.sodahair.com;
    if ($host != 'sodahair.com' ) {
        rewrite ^/(.*)$ http://sodahair.com/$1 permanent;
    }
    set $OC_ROOT /usr/share/nginx/html/opencart;
    set $OC_MODE developer;
    include /usr/share/nginx/html/opencart/nginx.conf.sample;
}

