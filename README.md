Blog This!
======================

Manages a simple blog with posts and underlying comments.

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
  devise
  rest-client

TEST / DEVELOPMENT:
  rspec-rails
  pry
  dotenv-rails
  launchy

DEVELOPMENT:
  byebug
  web-console
  spring
  better_errors
  binding_of_caller
  quiet-assets

TEST:
  shoulda-matchers
  capybara
  factory_girl_rails
  poltergeist
  database_cleaner
  vcr
  webmock

PRODUCTION:
  rails_12factor
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
  users
    id (integer PRIMARY KEY)
    email (varchar DEFAULT "" NOT NULL)
    encrypted_password (varchar DEFAULT "" NOT NULL)
    reset_password_token (varchar)
    reset_password_sent_at (timestamp)
    remember_created_at (timestamp)
    sign_in_count (varchar DEFAULT 0 NOT NULL)
    current_sign_in_at (timestamp)
    last_sign_in_at (timestamp)
    current_sign_in_ip (inet)
    last_sign_in_ip (inet)
    created_at (timestamp)
    updated_at (timestamp)
    phone_number (varchar)

  posts
    id (integer PRIMARY KEY)
    title (varchar)
    body (text)
    user_id (integer FOREIGN KEY REFERENCES users(id))
    created_at (timestamp)
    updated_at (timestamp)

  comments
    id (integer PRIMARY KEY)
    body (text)
    post_id (integer FOREIGN KEY REFERENCES posts(id))
    user_id (integer FOREIGN KEY REFERENCES users(id))
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

Alternatively, this app has been deployed onto Heroku and is
accessible at the following url:

```url
https://aqueous-peak-7572.herokuapp.com/
```

The initial welcome page allows for a user to either *Sign Up*
for a new user account, *Sign In* with a preexisting account,
or to simply *Enter As Guest*. Upon successful user
authentication/authorization (or guest user enter), all blog
posts currently in the system are displayed. Clicking on *Add
New Post* allows for new posts to be added to the blog.
Once entered, an individual post can be clicked upon for detail
of the post title and message body. The provided *Edit Post* and
*Delete Post* buttons provide the expected functionality.
Of note, users signed in as a guest are not authorized to add
new posts or comments. Finally, after every new comment is
entered on a post, the original post user is sent a text
message via a call to the Twilio API text message service.

Known Bugs
----------

None as of 2015-04-03.

Author
------

Andy Uppendahl

License
-------

MIT license.
