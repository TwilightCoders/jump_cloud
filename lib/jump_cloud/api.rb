module JumpCloud
  module V1
    API = Her::API.new
    API.setup url: "https://console.jumpcloud.com/api", send_only_modified_attributes: true do |c|

      # Auth
      c.use JumpCloud::Middleware::Authentication

      # Request
      # c.use Faraday::Request::UrlEncoded
      c.use JumpCloud::Middleware::JSONRequest

      # Response
      # c.use Her::Middleware::DefaultParseJSON
      c.use JumpCloud::Middleware::ResponseParser

      # Adapter
      c.adapter Faraday::Adapter::NetHttp
    end
  end

  module V2
    API = Her::API.new
    API.setup url: "https://console.jumpcloud.com/api/v2", send_only_modified_attributes: true do |c|

      # Auth
      c.use JumpCloud::Middleware::Authentication

      # Request
      # c.use Her::Middleware::AcceptJSON
      # c.use Faraday::Request::UrlEncoded
      c.use JumpCloud::Middleware::JSONRequest

      # Response
      c.use JumpCloud::Middleware::ResponseParser
      # c.use Parser

      # Adapter
      c.adapter Faraday::Adapter::NetHttp
    end
  end
end
