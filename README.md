# RackStripClientIp

[![Build Status](https://travis-ci.org/alext/rack_strip_client_ip.png?branch=master)](https://travis-ci.org/alext/rack_strip_client_ip)

Rack middleware to strip the Client-Ip HTTP header.  This is intended to prevent a spoofed Client-Ip header from triggering an IpSpoofAttackError exception.

## Installation

Add this line to your application's Gemfile:

    gem 'rack_strip_client_ip'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack_strip_client_ip

## Usage

### Rails

Add the gem to the Gemfile as above, and it will automatically add itself to the middleware stack.

### Other rack applications

Add the gem to the Gemfile, and add it to the middleware stack.  e.g.

    use RackStripClientIp::Middleware


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
