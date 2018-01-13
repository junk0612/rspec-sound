# RSpec::Sound

[![Build Status](https://travis-ci.org/junk0612/rspec-sound.svg?branch=master)](https://travis-ci.org/junk0612/rspec-sound)

rspec-sound provides sound while executing specs and notify to you when they finished.

This gem is inspired by [minitest-sound](https://github.com/y-yagi/minitest-sound).

## Requirements

- [mpg123](http://www.mpg123.de/)
- RSpec

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rspec-sound'
```

And then execute:

```sh
bundle
```

## Usage

```ruby
require 'rspec/sound'

RSpec::Sound.success = '/aaa/bbb/xxx.mp3' # Sound file which does play when a test succeeded.
RSpec::Sound.failure = '/aaa/bbb/xxx.mp3' # Sound file which does play when a test failed.
RSpec::Sound.during_test = '/aaa/bbb/xxx.mp3' # Sound file which does play during test.
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/junk0612/rspec-sound.

## Lisence

MIT
