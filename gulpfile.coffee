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

