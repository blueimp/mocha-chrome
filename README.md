# mocha-chrome Dockerfile

This is a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to
create a [mocha-chrome](https://github.com/shellscape/mocha-chrome) Docker image
based on [blueimp/chromedriver](https://github.com/blueimp/chromedriver).

## Usage

The `blueimp/mocha-chrome` image runs [Mocha](https://mochajs.org/) tests using
headless Google Chrome.

Sample [docker-compose](https://docs.docker.com/compose/compose-file/)
configuration using [NGINX](https://nginx.org/) as HTTP server providing a test
directory containing the Mocha tests:

```yml
version: "3.7"
services:
  nginx:
    image: nginx:alpine
    volumes:
      - ./test:/usr/share/nginx/html:ro
  mocha:
    image: blueimp/mocha-chrome
    command: http://nginx/
    environment:
      - WAIT_FOR_HOSTS=nginx:80
    depends_on:
      - nginx
```

Please have a look at the
[blueimp/JavaScript-Load-Image](https://github.com/blueimp/JavaScript-Load-Image)
project for a complete test configuration example.

## License

Released under the [MIT license](https://opensource.org/licenses/MIT).

## Author

[Sebastian Tschan](https://blueimp.net/)
