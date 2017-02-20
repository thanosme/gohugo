# Basic gohugo.io docker image

This image runs [gohugo](http://gohugo.io) with user "hugo" with  [gosu](https://github.com/tianon/gosu) and [dumb-init](https://github.com/Yelp/dumb-init).

Example usage:

```
docker run -d --name gohugo -v /path/to/your/content/:/data thanosme/gohugo:0.17 server -w --bind 0.0.0.0
```
