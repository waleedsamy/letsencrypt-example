# letsencrypt-example
> letsencrypt, nginx and docker example

#### Build and run
```bash
  docker build -t ii .
  docker rm -f ii ; mkdir -p /letsencrypt ; docker run -d -v /letsencrypt:/etc/letsencrypt -d -p 80:80 -p 443:443 ii
```

#### How does it works?
 * start nginx with http server to get ssl certs by letsencrypt using conf `/etc/nginx/letsencrypt.conf`
 * restart nginx with `/etc/nginx/nginx.conf`
