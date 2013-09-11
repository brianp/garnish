![Garnish](http://www.brianpearce.ca/images/garnish.png)

[![Build Status](https://travis-ci.org/brianp/garnish.png?branch=master)](https://travis-ci.org/brianp/garnish)
[![Code Climate](https://codeclimate.com/github/brianp/garnish.png)](https://codeclimate.com/github/brianp/garnish)

[RDocs](http://rdoc.info/projects/brianp/garnish)

Garnish is a Presenter / Decorator pattern for models in Rails. It gives a home to presentation level view logic that normally litters helpers and view files. Using it can help you:

* Keep helper files and views clean of if/else statements and other logic
* Better define an interface for views to interact with models
* Maintain a very familiar OOP pattern within your project directory
* Keep you controller code clean by never having to instantiate the presenters
* Handle Decorating / Presenting standard Rails relationships

## Requirements

Garnish Has been tested with

* Rails 3.1+
* Ruby 1.8.7, 1.9.2, 1.9.3, 2.0.0, REE, JRuby, Rubinius
* ActiveRecord, Mongoid

## Installation

In **Rails 3**, add this to your Gemfile and run the `bundle` command.

`gem "garnish"`

## Getting Started

A lot of magic happens with Garnish in an attempt to make things incredibly simple for you.

### 1. Define You Presenters

Create a folder in `app/` called presenters. ex `app/presenters/`

Create a presenter matching the name of your model in your presenters folder. ex `app/presenters/user_presenter.rb`

Define the `user_presenter`

```ruby
module UserPresenter
  include Garnish::Presenter
end
```

## 2. Add methods to your presenter

Define methods in your presenter as regular instance methods

```ruby
module UserPresenter
  include Garnish::Presenter

  def greeting
    if last_login.nil?
      "Welcome #{name}, can we offer you a tour?"
    else
      "Welcome back #{name}"
    end
  end

end
```

### 3. Add the `garnish` call

In `app/controllers/application_controller.rb` add the garnish call.

```ruby
class ApplicationController < ActionController::Base
  protect_from_forgery

  garnish
end
```

Or If you don't want to use Garnish application wide simply add the call into a specific controller.

### 4. Use respond_with

The only change you need to make to start using your presenters now is to use respond_with inside any controller that has been garnished

`app/controllers/user_controller.rb`

```ruby
def show
  @user = User.find(params[:id])

  respond_with @user do |format|
    format.html # show.html.erb
  end
end
```

Garnish will now find and load presenters for any instance variables you set inside your action. *NOT* just the ivar passed to the respond_with block.

### 5. Start using your presenter methods

`app/views/users/show.html.erb`

```erb
  <span><%= @user.greeting %></span>
```

## View Helpers

Garnish plays very nicely when adding view helper methods into your presenter. Just treat them like a regular method.

```ruby
module UserPresenter
  include Garnish::Presenter

  def profile_pic
    image_tag profile_pic unless profile_pic.nil?
  end
end
```

## Relationships

The real reason I got down to business. If I'm using presenters in my views I probably have presenters for multiple objects.

```ruby
class User < ActiveRecord::Base
  has_many :items
end

class Item < ActiveRecord::Base
  belongs_to :user
end
```

Assuming I have presenters for both of these models

```ruby
module UserPresenter
  include Garnish::Presenter
end

module ItemPresenter
  include Garnish::Presenter

  def picture
    image_tag profile_pic unless profile_pic.nil?
  end
end
```

In my view when I'm accessing a user's items via the association what I really want is an Item extended with presenter methods not just a regular item.

Garnish handles this for us. Anytime a relationship is accessed on a garnished resource the returned resources will also be extended with their presenter methods.

```erb
<%= @user.items.first.picture %>
```

Works with no effort what so ever.

## Questions or Problems?

If you have any issues with Garnish which you cannot find the solution to, please add an [issue on GitHub](https://github.com/brianp/garnish/issues) or fork the project and send a pull request.

To get the specs running you should call `bundle` and then `rake`. See the [spec/README](https://github.com/brianp/garnish/blob/master/spec/README.md) for more information.

## Special Thanks

[Fraser Valley Ruby Brigade](http://www.fvrb.org/)

The Ruby Moguls

Garnish was inspired by [draper](https://github.com/jcasimir/draper/) and the RailsCast Pro episode #287 Presenters from Scratch. See the [CHANGELOG](https://github.com/brianp/garnish/blob/master/CHANGELOG.rdoc) for the full list.
