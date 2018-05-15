module JumpCloud
  module Middleware

    class Authentication < Faraday::Middleware
      def call(env)
        env[:request_headers]["x-api-key"] = JumpCloud.config.api_key
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
        super.tap do
          JumpCloud.logger.info "status: #{env.status}"
        end
      end

      private

      def clean_attributes(data)
        case data
        when Hash
          return data if data.empty?
          id = data.delete(:_id) || data.delete(:id)
          ((attributes = data.delete(:attributes)) || data).merge({
            id: (data.delete(:id) || id || fail("no id!")),
            meta: attributes ? data : {}
          })
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
        JumpCloud.logger.debug "#{env.method}: #{env.url.to_s}"
        add_header(env[:request_headers])
        unless env.method == :get
          env[:body] = encode env[:body] unless env[:body].respond_to?(:to_str)
        end
        JumpCloud.logger.debug "params: #{env.params}"
        JumpCloud.logger.debug "body: #{env.body}"
        @app.call(env)
      end

      def encode(data)
        ::JSON.dump data
      end

    end
  end

end
