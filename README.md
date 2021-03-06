# Guts

[![Build Status](https://secure.travis-ci.org/ohmybrew/guts.svg?branch=master)](http://travis-ci.org/ohmybrew/guts)
[![codecov](https://codecov.io/gh/ohmybrew/guts/branch/master/graph/badge.svg)](https://codecov.io/gh/ohmybrew/guts)
[![Docs](http://inch-ci.org/github/ohmybrew/guts.svg)](http://inch-ci.org/github/ohmybrew/guts)
[![Gem Version](https://badge.fury.io/rb/guts.svg)](https://badge.fury.io/rb/guts)

A mountable, extendable, multisite, CMS engine for Rails 5.

This engine is simply released to provide a basic, but full-featured CMS solution for Rails applications. It is not indented to mimic or become an all-inclusive Wordpress-like system.

## Installation

Include the gem in your `Gemfile` and run `bundle install`:

``` ruby
gem 'guts' # to grab latest, or specify a specific version
# or for master: gem 'guts', git: 'git@github.com:ohmybrew/guts.git'
```

Next, run the following commands for a install of routes, initializer, and editor configurations:

``` bash
bin/rails generate guts:install
```

*Note: If you'd prefer to install individually, see all generators via `bin/rails generate --help | grep guts`*

Next, run:

``` bash
bundle exec rake guts:install:migrations # installs Guts migrations
bundle exec rake db:migrate # load migrations into your database
bundle exec rake guts:db:seed:all # pre-configures required admin group, content types, etc
bundle exec rake guts:user:create[{name},{email},{password}] # creates a user (replace the values)
bundle exec rake guts:user:set_master[{email}] # allows user to access everything in the admin panel, should be done for initial user (replace the values)
```

You will now be able to access Guts by visiting `/admin` in your Rails application.

### Commands

To see all commands available simply run `bundle exec rake -T guts`. It contains tasks for user creation, user deletion, changing user passwords, database seeds for install, and migration installs.

## Configuration

No post-install configuration is required but if you wish to change anything see [configurations](doc/extra/configurations.md) in docs.

## Documentation

See [extra](doc/extra) under docs for information on Guts itself. The docs contain information for configuration usage, extending, and how to implement multisite support.

For code documentation, you can run `bundle exec yardoc` of visit `rubydocs.info`.

Code is also ran through rubocop.

### Testing

This Gem is tested. Run `bundle exec rake test` (or `appraisal rake test`) after `bundle install` (or `appraisal install`).

Both development and testing environments use SQLite located in `test/dummy/db`.

#### Notes

1. SQLite is used during testing
2. Appraisal Gem is used to test against multiple Rails versions, you can simply run `bundle exec rake test` or use `appraisal {gemfile} rake test`

## Feature Overview

+ Unit tested and documented
+ Multisite support
+ Dynamic content types
+ File management (with multi-upload)
+ Media post-processing
+ WYSIWYG editors
+ Metafields for all objects
+ Dynamic navigations
+ Categories
+ Basic user management
+ Basic user groups
+ Basic session management
+ User and group authorizations

## Notable Gems

+ [pundit](https://github.com/elabs/pundit/) - Used for user and group authorization
+ [tinymce-rails](https://github.com/spohlenz/tinymce-rails) - Used for editors
+ [paperclip](https://github.com/thoughtbot/paperclip) - Used for media post-processing
+ [friendly-id](https://github.com/norman/friendly_id) - For slug generations on object

## Todo

+ Translation support

## License

This project is released under the "MIT" license. See `LICENSE` file for more details.
