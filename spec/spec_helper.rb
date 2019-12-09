$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'wazuh'
require 'webmock/rspec'

Wazuh.configure do |config|
end
