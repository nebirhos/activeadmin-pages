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
rake db:migrate
rails g active_admin:pages:install
```


## Usage

First set the default locale and available languages in config/application.rb:
```ruby
config.i18n.default_locale = :en
config.i18n.available_locales = [:en, :it]
```

Page logic is handled by the engine, all you have to do is redefine
`app/views/active_admin/pages/show.html.erb` to fit your needs.

To get the url of a page object, use the helper
```ruby
link_to "Home", page_path(@home)
```
