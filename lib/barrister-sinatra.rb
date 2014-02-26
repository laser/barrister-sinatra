require "barrister-sinatra/version"
require 'barrister'
require 'sinatra/base'

module Barrister

  module Sinatra

    class Container

      def initialize(json_path, mount_path, handlers, port=4567, host='localhost')
        @my_app = ::Sinatra.new do
          set :bind, host
          set :port, port

          contract = Barrister::contract_from_file json_path
          server   = Barrister::Server.new(contract)

          # register each provided handler
          handlers.each do |handler_klass|
            server.add_handler handler_klass.to_s, handler_klass.new
          end

          post mount_path do
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

end
