require "barrister-sinatra/version"
require 'barrister'
require 'sinatra/base'

module Barrister

  class SinatraContainer

    def initialize(json_path, handlers, options={})
      options = {
        mount_path: '/' + json_path.split('/')[-1].split('.')[0],
        port: 3001,
        host: 'localhost'
      }.merge(options)

      @my_app = ::Sinatra.new do
        set :bind, options[:host]
        set :port, options[:port]

        contract = Barrister::contract_from_file json_path
        server   = Barrister::Server.new(contract)

        # in case we are passed a single handler
        handlers = handlers.kind_of?(Array) ? handlers : [handlers]

        # register each provided handler
        handlers.each do |handler|
          iface_name = handler.class.to_s.split('::').last
          server.add_handler iface_name, handler
        end

        post options[:mount_path] do
          request.body.rewind
          resp = server.handle_json(request.body.read)

          status 200
          headers 'Content-Type' => 'application/json'
          resp
        end
      end
    end

    def start
      @my_app.run!
    end

  end

end
