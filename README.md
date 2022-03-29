# docs.opensvc.com
The sphinx documentation published on https://docs.opensvc.com

Contributors should read the following doc sections:

* https://docs.opensvc.com/latest/contribute.html#contribute-translations
* https://docs.opensvc.com/latest/contribute.html#contribute-documentations

---

# development environment howto
## build docker image
`docker build -t osvcsphinx:dev .`

## launch webserver
`docker run --name osvcsphinx --rm -d -v $PWD:/data osvcsphinx:dev`

## dev & build doc
`docker exec -it osvcsphinx /bin/bash`
`cd /data ; make html`

## open your favorite browser to http://ip.of.container:8000/build/html/

## stop and remove container
`docker rm -f osvcsphinx`
