jeet-gulp
=========

A template gulp project for [Jeet](http://jeet.gs/).

## GettingStarted

```
$ git clone https://github.com/muraken720/jeet-gulp.git
$ npm install
$ gulp
```

Open your browser 'http://localhost:8080' with [LiveReload](https://chrome.google.com/webstore/detail/livereload/jnihajbhpnppcggbcgedagnkighmdlei).

## FileStructure

```
$ tree src public
  src
  └── styl
      └── app.styl
  public
  ├── css
  │   └── app.css
  └── index.html
```

Let's edit src/styl/app.styl !

## gulpfile.coffee

```
gulp = require 'gulp'
stylus = require 'gulp-stylus'
jeet = require 'jeet'
connect = require 'gulp-connect'

gulp.task 'stylus', ->
  gulp.src('src/styl/**/*.styl')
    .pipe(stylus(
      use: [jeet()]
    ))
    .pipe(gulp.dest('public/css'))
    .pipe(connect.reload())

gulp.task 'html', ->
  gulp.src('public/**/*.html')
    .pipe(connect.reload())

gulp.task 'connect', ->
connect.server(
  root: ['public']
  livereload: true
)

gulp.task 'watch', ->
  gulp.watch ['src/styl/**/*.styl'], ['stylus']
  gulp.watch ['public/**/*.html'], ['html']

gulp.task 'default', ['stylus', 'connect', 'watch']
```

## LICENSE
MIT
