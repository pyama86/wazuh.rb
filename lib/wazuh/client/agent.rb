module Wazuh
  class Client
    module Agents
      def agents(options = {})
        response = get 'agents', options
        response.body["data"]
      end

      def delete_agents(options = {})
        response = delete 'agents', options
        response.body["data"]
      end
    end
  end
end
