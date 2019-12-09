module Wazuh
  module Configuration
    def config
      @config ||= Config.new
    end

    def configure
      yield config
    end

    class Config
      attr_accessor :api_endpoint, :http_accept, :params_encoder, :proxy, :request, :user_agent, :ca_file, :client_key, :client_cert

      def initialize
        @http_accept    = 'application/json'
        @user_agent     = "Wazuh.rb Ruby Gem #{Wazuh::VERSION}"
        @params_encoder = Faraday::FlatParamsEncoder
        @proxy          = nil
      end

      def request
        {
          params_encoder: params_encoder
        }
      end

      def http_request_headers
        headers = {
          'Accept'     => http_accept,
          'User-Agent' => user_agent,
        }
        headers.select {|_, v| !!v}
      end
    end
  end
end
