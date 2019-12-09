require "wazuh/version"
require "wazuh/client"

module Wazuh
  class << self
    private

    def respond_to_missing?(method_name, include_private=false)
      client.respond_to?(method_name, include_private)
    end

    def method_missing(method_name, *args, &block)
      if client.respond_to?(method_name)
        client.send(method_name, *args, &block)
      else
        super
      end
    end

    def client
      @client ||= Client.new
    end
  end
end
