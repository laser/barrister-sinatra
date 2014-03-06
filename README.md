# Barrister::Sinatra

A Sinatra container for services using Barrister RPC framework

## Before Getting Started

First, check out Barrister RPC here: http://barrister.bitmechanic.com

## Usage

Instantiating a Redis container is easy. By default, the container 
requires a path to the JSON output of the IDL to JSON conversion and an
instantiated handler whose name matches the name of an interface in the IDL.
By default, the SinatraContainer will use the name of the JSON file for the
path where clients can locate the service (e.g. './foo/user\_service.json' 
will result in the '/user\_service' path). By default, the SinatraContainer
will bind to localhost, port 3001. 

```ruby

container_a = Barrister::SinatraContainer.new './user_service.json', UserService.new
container_a.start

```

For more advanced users, additional options can be specified:

```ruby

opts = { mount_path: '/api/user_service', port: 4545, host: 'localhost' }
container_b = Barrister::RedisContainer.new './user_service.json', [HandlerA.new, HandlerB.new], opts
container_b.start

```

Calling the 'start' method of an instantiated SinatraContainer will consume 
the JSON file, bind handlers, and start Sinatra.

## Installation

Add this line to your application's Gemfile:

    gem 'barrister-sinatra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install barrister-sinatra
    
## Reference Implementation

To see a working implementation of a SinatraContainer being used in conjunction
with a Rails UI, see https://github.com/laser/ruby-micro-services-redis

## Contributing

1. Fork it ( http://github.com/<my-github-username>/barrister-sinatra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
