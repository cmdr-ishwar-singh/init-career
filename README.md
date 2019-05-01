![Career Logo](https://raw.githubusercontent.com/cmdr-ishwar-singh/init-career/master/init_logo.png)

# InitCareer [![Gem Version](https://badge.fury.io/rb/rb.svg)]


By [Initcoders](http://initcoders.com/).

Init-Career is a flexible solution for Rails based. It:

* Is a complete MVC solution based on Rails engines;

## Starting with Rails?

If you are building your first Rails application, we recommend you *do not* use Init-Career.

## Getting started

Init-Career 0.1.0 works with Rails 5.2.0 onwards. Add the following line to your Gemfile:


```ruby
gem 'init_career'
```

Or install it yourself as:
```bash
$ gem install init_career
```

Then run `bundle install`

Next, you need to run the generator:

```console
$ rails generate init_career:install
```

In the following command you will replace `MODEL` with the class name used for the application’s careers (it’s frequently `Career` but could also be `Job`). This will create a model (if one does not exist) and configure it with the default Init-Career modules. The generator also configures your `config/routes.rb` file to point to the Careers controller.

```console
$ rails generate init_career MODEL
```

Next, check the MODEL for any additional configuration options you might want to add. If you add an option, be sure to inspect the migration file (created by the generator if your ORM supports them) and uncomment the appropriate section.  For example, if you add the model, you'll need to run

Then run `rails db:migrate`

### Configuring views

We built Career to help you quickly develop an application that uses career. However, we don't want to be in your way when you need to customize it.

Since Init-Career is an engine, all its views are packaged inside the gem. These views will help you get started, but after some time you may want to change them. If this is the case, you just need to invoke the following generator, and it will copy all views to your application:

```console
$ rails generate init_career:views
```

If you have more than one Career model in your application (such as `Career` and `Job`), you will notice that Career uses the same views for all models.

Init-Career will use the default view at `app/views/careers`. You can also use the generator to generate scoped views:

```console
$ rails generate init_career:views careers
```

### Configuring controllers

If the customization at the views level is not enough, you can customize each controller by following these steps:

1. Create your custom controllers using the generator which requires a scope:

    ```console
    $ rails generate init_career:controllers [scope]
    ```

    If you specify `careers` as the scope, controllers will be created in `app/controllers/careers_controllers.rb`.
    will look like this:

    ```ruby
    class CareersController < ApplicationController
      # def new
      #   @career = Career.new
      # end
      ...
    end
    ```
    (for example: `rails generate init_career:controllers careers `)

## Contributing
  * [Ishwar-Singh](https://github.com/cmdr-ishwar-singh)

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
