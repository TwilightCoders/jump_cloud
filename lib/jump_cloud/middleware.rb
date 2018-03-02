require 'pry'
module JumpCloud
  module Middleware

    class Authentication < Faraday::Middleware
      def call(env)
        env[:request_headers]["x-api-key"] = ENV['JUMPCLOUD_KEY']
        # env[:request_headers]["x-api-key"] = RequestStore.store[:my_api_token]
        @app.call(env)
      end
    end

    class ResponseParser < Her::Middleware::DefaultParseJSON
      def parse(body)
        json = parse_json(body)
        metadata = {
          errors: (json.delete(:message) || "").scan(/Error: (.*)/).flatten,
          data: clean_attributes(json.delete(:results) || json),
          metadata: json.delete(:metadata) || {}
        }
      end

      def on_complete(env)
        result = super
        result
      end

      private

      def clean_attributes(data)
        case data
        when Hash
          data.except(:attributes)
        when Array
          data.collect { |d| clean_attributes(d) }
        end
      end

    end

    # This middleware adds a "Content-Type: application/json" HTTP header
    class JSONRequest < Faraday::Middleware
      # @private
      def add_header(headers)
        headers.merge! "Content-Type" => "application/json"
      end

      # @private
      def call(env)
        puts "#{env.method}: #{env.url.to_s}"
        add_header(env[:request_headers])
        unless env.method == :get
          env[:body] = encode env[:body] unless env[:body].respond_to?(:to_str)
        end
        puts "params: #{env.params}"
        puts "body: #{env.body}"
        @app.call(env)
      end

      def encode(data)
        ::JSON.dump data
      end

    end
  end

end
