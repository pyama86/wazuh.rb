require 'faraday'
require 'faraday_middleware'
require 'openssl'

module Wazuh
  module Connection
    def get(url, params = {})
      connection.get(url, params)
    end

    def post(url, params = {})
      connection.post(url) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
    end

    def put(url, params = {})
      connection.put(url) do |req|
        req.headers['Content-Type'] = 'application/json'
        req.body = params.to_json
      end
    end

    def delete(url)
      connection.delete(url) do |req|
        req.headers['Content-Type'] = 'application/json'
      end
    end

    def request(method, url, params = {})
      connection.send(method, url, params)
    end

    def connection
      options = { url: config.api_endpoint, headers: config.http_request_headers, request: config.request, proxy: config.proxy }
      options[:ssl] = {
        ca_file: config.ca_file,
        client_key: ::OpenSSL::PKey::RSA.new(File.read(config.client_key)),
        client_cert: ::OpenSSL::X509::Certificate.new(File.read(config.client_cert))
      } if config.client_cert && config.client_key && config.ca_file

      @connection ||= Faraday.new(options) do |faraday|
        faraday.use Wazuh::Response::RaiseError
        faraday.use Faraday::Response::Logger if ENV['DEBUG'] == '1'
        faraday.use FaradayMiddleware::ParseJson
        faraday.adapter Faraday.default_adapter
      end
    end
  end
end
