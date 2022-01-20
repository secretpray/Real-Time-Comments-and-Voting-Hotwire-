
# Real-Time Comments and Voting (Rails 7.0.1 Hotwire)

<details>
  <summary>Getting Started</summary>

  ## Check version:
  
  * Yarn
  ```ruby
  yarn --version
  ```
  * PostgreSQL
  ```ruby
  psql --version
  ```
  * Ruby (ruby 3.1.0p0)
  ```ruby
  ruby --version
  ```
  if need
  ```ruby
  rvm install 3.1.0
  rvm use 3.1.0
  ```
  * Rails (Rails 7.0.1)
  ```ruby
  rails --version
  ```
  if need
  ```ruby
  gem install rails
  ```
  ## Install application:
  
  1) Bundle install:
  
  ```ruby
  bundle install
  ```
  2) Yarn install:
 
  ```ruby
  yarn install --check-files
  ```
  3) Prepare database (db:setup or db:prepare)
 
  ```ruby
  bin/rails db:prepare
  ```
  or
  ```ruby
  bin/rails db:setup
  ```
  4) Compile JS/CSS

  ```ruby
  yarn run build
  yarn run build:css
  ```
  
  ## Start application:
  
  ```ruby
  bin/rails s
  ```
  or with foreman
  ```ruby
  gem install foreman
  bin/dev
  ```
</details>

<details>
  <summary>Video Preview</summary>
  Fisrt stage
  
  https://user-images.githubusercontent.com/17977331/149556454-0d8616c9-a1e0-462f-95aa-6a134c742c58.mp4
  
  Second stage
  
  https://user-images.githubusercontent.com/17977331/150297843-4a9a29cc-fbc7-40db-90a3-23301f9c15e2.mov


</details>

