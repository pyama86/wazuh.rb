require 'faraday'
require 'wazuh/error'

module Wazuh
  module Response
    class RaiseError < Faraday::Response::Middleware
      private

      def on_complete(response)
        error = Wazuh::Error.from_response(response)
        raise error if error
      end
    end
  end
end
