
# Real-Time Comments and Voting (Rails 7.0.1 Hotwire)


### prepare
#### check:

* Node
```bash
node --version
```
* Yarn
```bash
yarn --version
```
* PostgreSQL
```bash
psql --version
```
* Ruby (ruby 3.1.0p0)
```bash
ruby --version
```
#### if need
```bash
rvm install 3.1.0
rvm use 3.1.0
```
* Rails (Rails 7.0.1)
```bash
rails --version
```
#### if need
```bash
gem install rails
```

### install 
* new Rails app
```bash
rails new RealTime_Comments_and_Voting -j esbuild -css bootstrap d postgresql -T
```
* Bootstarp
```bash
bin/rails css:install:bootstrap
yarn run build:css
```
### setup PostreSQL
```bash
bin/rails db:setup
```
