module Wazuh
  class Client
    module Agents
      def agents(options = {})
        response = get 'agents', options
        response.body["data"]["items"]
      end
    end
  end
end
