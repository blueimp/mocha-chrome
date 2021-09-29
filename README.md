# mocha-chrome Dockerfile

This is a [Dockerfile](https://docs.docker.com/engine/reference/builder/) to
create a [mocha-chrome](https://github.com/shellscape/mocha-chrome) Docker image
based on [blueimp/chromedriver](https://github.com/blueimp/chromedriver).

- [Usage](#usage)
- [Tags](#tags)
- [License](#license)
- [Author](#author)

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

## Tags

For any critical infrastructure (e.g. your company's Continuous Integration
tests) it is **strongly** recommended to use your own tagged Docker images
instead of `blueimp/mocha-chrome` directly, as changes in the included Software
might break your tests inadvertently. For example:

```yml
version: "3.7"
services:
  chromedriver:
    image: YOUR_ORG/mocha-chrome:2021-09-27
    # ...
```

For full control, you should also set up a build for your own version of
[blueimp/chromedriver](https://github.com/blueimp/chromedriver) and edit the
parent image reference at the start of the `Dockerfile` in this repository
accordingly, e.g.:

```Dockerfile
FROM YOUR_ORG/chromedriver:2021-09-27
```

## License

Released under the [MIT license](https://opensource.org/licenses/MIT).

## Author

[Sebastian Tschan](https://blueimp.net/)
