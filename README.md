# README

## Prerequisites

* Ruby 2.5.3
* Rails 5.2.2

You can use [this guide](https://gorails.com/setup/osx/10.14-mojave) to set up the Rails environment on a Mac.

## Setup

First clone the Github repo:

```
$ git clone https://github.com/thallock763/kapost-interview.git
```

Next setup the Rails environment:

```
bundle install
bundle exec rake db:migrate
```

Run the tests to make sure everything is working correctly:

```
bundle exec rspec
```

Finally, start the Rails server:

```
bundle exec rails s
```

The Rails server can be accessed at `http://localhost:3000` at this point.

## Usage

To create a new short link send a POST request to the server like this:

```
POST http://localhost:3000/short_link
{
	"long_url": "http://www.google.com"
}
```

The MIME type of the request should be `application/json`

You should get back a response that looks like this:

```
{
  "short_url": "http://localhost:3000/ewRKTe",
  "long_url": "http://www.google.com"
}
```

To view the link, just go to a web browser and enter the short url provided in
the POST response.
