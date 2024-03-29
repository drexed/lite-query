# Lite::Query

[![Gem Version](https://badge.fury.io/rb/lite-query.svg)](http://badge.fury.io/rb/lite-query)
[![Build Status](https://travis-ci.org/drexed/lite-query.svg?branch=master)](https://travis-ci.org/drexed/lite-query)

Lite::Query is a library for using the query pattern to separate complex query
logic from classes such as controllers and models.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'lite-query'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lite-query

## Table of Contents

* [Setup](#setup)
* [Usage](#usage)

## Setup

#### Generators

`rails g query NAME` will generate the following file in your application root:

```erb
app/queries/[NAME]_query.rb
```

If a `ApplicationQuery` file in the `app/queries` directory is available, the
generator will create file that inherit from `ApplicationQuery` if not it will
fallback to `Lite::Query::Base`.

#### Query

You will need to fill this class with the required `call` method as shown below:

```ruby
class AgeQuery < Lite::Query::Base

  def call
    return relation unless args[:age]

    relation.where('age > ?', args[:age])
  end

end
```

## Usage

There are multiple ways to access the query call:

#### Instance
```ruby
relation = User.limit(1)
query = AgeQuery.new(relation, age: 10)
query.call #=> SELECT * FROM users WHERE age = 10 LIMIT 1
```

#### Class
```ruby
AgeQuery.call(User, age: 20) #=> SELECT * FROM users WHERE age = 10
```

#### Scope
```ruby
class User < ApplicationRecord

  scope :min_age, ->(age) { MinAgeQuery.new(self, age: age) }

end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/drexed/lite-query. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Lite::Query project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/drexed/lite-query/blob/master/CODE_OF_CONDUCT.md).
