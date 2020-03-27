# README
## open_kitchen

* Clone the repository

```shell
https://github.com/SpencerBlum/open_kitchen.git
cd open_kitchen
```

* Check your Ruby version

```shell
ruby -v
```

The ouput should start with something like `ruby 2.6.1`

If not, install the right ruby version using [rbenv](https://github.com/rbenv/rbenv) (it could take a while):

* Ruby version
  ruby '2.6.1'

* System dependencies
  Using [Bundler](https://github.com/bundler/bundler)
```shell
bundle
```
* Database creation
```shell
rails db:create
```
* Database initialization
```shell
rails db:migrate db:seed
```
* How to run the test suite
```shell
bundle exec rspec
```
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...