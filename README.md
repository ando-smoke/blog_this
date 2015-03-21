Blog This!
======================

Manages a simple blog with posts and underlying comments for a
single user.

Installation
------------

Upon cloning of this project onto your local system, navigate via the
command-line to the project folder and run the included Gemfile. Below
is a list of gems included in the Gemfile grouped by execution environment:

```ruby
TEST / DEVELOPMENT / PRODUCTION:
  rails
  pg
  sass-rails
  uglifier
  coffee-rails
  jquery-rails
  turbolinks
  bootstrap-sass

TEST / DEVELOPMENT:
  rspec-rails

DEVELOPMENT:
  byebug
  web-console
  spring
  quiet-assets

TEST:
  shoulda-matchers
  capybara
```

If you want to run the included Gemfile, enter the following statements into
the command line:
```ruby
gem install bundler
bundle
```

Before the application can run, the user must have a version of
a Postgres database installed on their system, and running in an active
session. At the time of creation of this application, Postgres 9.4 was
used. To create the necessary database schema, enter the following Rake
statements into the command line:
```rake
rake db:create
rake db:migrate
rake db:test:prepare
```

At the time of initial creation of this application, Ruby
version 2.0.0 was used along with Ruby on Rails 4.2.0.

Database Schema
-----

The following database schema was used for this application:

```
DATABASES:
  blog_this_development
  blog_this_test

TABLES:
  posts
    id (integer PRIMARY KEY)
    title (varchar)
    body (text)
    created_at (timestamp)
    updated_at (timestamp)

  comments
    id (integer PRIMARY KEY)
    body (text)
    post_id (integer)
    created_at (timestamp)
    updated_at (timestamp)
```

Usage
-----

Upon completion of the above steps in the Installation section, open
two separate terminal windows to run active sessions of ```rails server```
and ```postgres```, respectively. Next, open up your preferred web browser
and enter the following address:

```url
localhost:3000/
```

The initial home page displays a list of current post titles currently
within the blogging app. Clicking on *Add New Post* allows for new
posts to be added to the blog. Once entered, an individual post
can be clicked upon for detail of the post title and message body.
The provided *Edit Post* and *Delete Post* buttons provide the
expected functionality.

Currently, the app only allows for a single user. However, in
expectation of multiple users allowed for the app, a comments
feature has been added so that individual comments can be added
and tied to a given blog post. Within the post detail page, all
currently added comments are displayed towards the bottom of
the page. As with posts, the user can either add, edit or delete
a comment by clicking on the appropriately named button or links.

Known Bugs
----------

None as of 2015-03-20.

Author
------

Andy Uppendahl

License
-------

MIT license.
