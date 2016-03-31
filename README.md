# ovent

## installation

This is only a wp theme
so just add this theme to a wordpress install and it should work

[edit - not now... work only in dev mode (see bellow)]



## dev

#### dependencies

+ npm (just install nodejs)

from this dir

```
npm install -g coffee-script
npm install -g webpack webpack-dev-server
npm install

```


#### developpment

For dev ease, I use `webpack-dev-server` to enjoy Hot Module Remplacement
it will serve files in http://ovent.int:8080/dist
from this dir
```
webpack-dev-server --hot --inline

```

make `ovent.int` vhost

in wp-config.php
```
define('WP_DEBUG', true);
define('PATH_LIBS_DEV', 'http://ovent.int:8080');
```


#### production

in wp-config.php
```
define('WP_DEBUG', false);
```

to compile libs (styles etc)

```
cd path/to/theme
webpack
```
