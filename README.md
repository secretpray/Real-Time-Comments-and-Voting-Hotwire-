
# Real-Time Comments and Voting (Rails 7.0.1 Hotwire)


## prepare

* node --version

* yarn --version

* psql --version

* ruby --version
...
  ruby 3.1.0p0
...
or
* rvm install 3.1.0
* rvm use 3.1.0

* rails --version
...
  Rails 7.0.1
...
or
* gem install rails

## install

* rails new RealTime_Comments_and_Voting -j esbuild -css bootstrap d postgresql -T

<!-- edit Procfile.dev
...
web: bin/rails server -p 3000
js: yarn build --watch
css: yarn build:css --watch
... -->

bin/rails css:install:bootstrap
yarn run build:css
