# Url Shortening

Url Shortening is a simple Rails gem that shortens URL

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'url_shortening'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install url_shortening
    
After you install Url Shortening run the generator

    $ rails generate url_shortening

## Usage

To generate a Short URL object for the URL “example.com/long/path” do the following:

```UrlShortening::Url.get_long_url('example.com/long/path')```

To get the original URL of your short URL "example.com/123" do the following:

```UrlShortening::Url.get_short_url('example.com/123')```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Future improvements:

* Use MD5 hashing function to generate shortened URLs.

* Add Caching layer.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
