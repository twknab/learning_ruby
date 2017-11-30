# Rails is a MVC framework which utlizes the Ruby language.
- You can setup a ruby project actually pretty easily from terminal:

# Installing Rails:
- Depending upon your OS, there are different ways to install Rails. The best method is to google "Install Rails for {{Insert your OS here}}". Once you've installed Rails you can check the version via:

- `rails -v`

- From my experience thus far, having the most up to date version of Rails ensures that various gems will work properly. (Gems are packages, similar to pip or npm packages).


- Once you've got Rails installed, go ahead and try creating a new project:

- type:
- `rails new first-project`

- go into the new project directory which Rails will automatically create and populate for you:
- `cd first-project`

- And start the web server:
- `rails server -b 0.0.0.0` or `rails s -b 0.0.0.0`
- To stop the web server, use `ctrl+C`

- Load http://localhost:3000 in your web browser and see what happens!

## ** Note:
- To add some greater logging and diagnostic tools, adding/modifying these gems are advised:

- Making querying in terminal much easier:
- `gem 'hirb'`

*Note:* To use Hirb, you must write `Hirb.enable` from within the `rails console`. You may also enable pagination via, `Hirb.enable :pager=>true`. Use `G` to navigate to the end of the list and `:q!` to return to console. Without enabling paging options to true, you'll have trouble with large query sets when trying to return to the console.

- Gives more info for you with page errors (note how we specify a version number and a restriction):
# `gem 'rails-footnotes', '>= 4.0.0', '<5'`

- After modifying your Gem file, run this in terminal (THIS DOES NOT GO INTO YOUR GEM FILE BUT IS TO BE RUN AS A COMMAND IN TERMINAL):
-`rails generate rails_footnotes:install`

## ** Side Note: If your rails is out of date, changing your gem to this ensures latest version:
- `gem install 'rails'`

## Updating your Bundle:
- Whenever done modifying your Gem file, be sure to update and install once more:
- `bundle update`
- `bundle install`
