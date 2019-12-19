$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wazuh'
require 'webmock/rspec'

Wazuh.configure do |config|
  config.api_endpoint = "https://localhost:55000"
end

def stub_api(method, path)
  url = "https://localhost:55000#{path}"
  file = "spec/fixtures#{path}/#{method}.json"
  file << '_list' if File.directory?(file)
  stub_request(method, url).to_return(status: 200, body: File.read(file))
end
