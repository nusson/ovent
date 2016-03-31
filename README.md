# ovent

## installation

This is only a wp theme
so just add this theme to a wordpress install and it should work

[edit - not now... work only in dev mode (see bellow)]


## dev

#### dependencies

+ npm (just install nodejs)

from this dir (wp-content/themes/ovent) :

```
npm install -g coffee-script
npm install -g webpack webpack-dev-server
npm install
webpack
```


#### developpment

just use `webpack --watch` from this theme dir

in wp-config.php
```
define('WP_DEBUG', true);
```


#### production

in wp-config.php
```
define('WP_DEBUG', false);
```

to compile libs (styles etc)
just use `webpack` from this theme dir

