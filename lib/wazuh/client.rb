require 'wazuh/configuration'
require 'wazuh/connection'
require 'wazuh/client/agent'
require 'wazuh/client/agent'
require 'wazuh/response/raise_error'

module Wazuh
  class Client
    include Configuration
    include Connection
    include Agents
  end
end
