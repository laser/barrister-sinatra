# Barrister::Sinatra

A Sinatra container for services using Barrister RPC framework

## Usage

Instantiating a Sinatra container is easy:

```ruby

json_path  = './user_service.json'
mount_path = '/user_service'
handlers   = [UserService]

container = Barrister::SinatraContainer.new json_path, mount_path, handlers
container.start

```

Calling the 'start' method of an instantiated SinatraContainer will start the
underlying HTTP server and Sinatra application.

## Installation

Add this line to your application's Gemfile:

    gem 'barrister-sinatra'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install barrister-sinatra

## Contributing

1. Fork it ( http://github.com/<my-github-username>/barrister-sinatra/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
