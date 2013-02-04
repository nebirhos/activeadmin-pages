# ActiveAdmin Pages

```
WARNING - this is a WIP, use at your own risk!
```

## Installation

```ruby
gem 'activeadmin-pages', :github => "nebirhos/activeadmin-pages", :branch => "master"
```

```
rake activeadmin_pages:install:migrations
rails g active_admin:pages:install
rake db:migrate
```


## Usage

First set the default locale and available languages in config/application.rb:
```ruby
config.i18n.default_locale = :en
config.i18n.available_locales = [:en, :it]
```
