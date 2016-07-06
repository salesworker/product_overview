require 'faraday'
require 'faraday_middleware'

module ProductOverview
  module API
    class Client
      def configuration
        @configuration ||= Configuration.new
      end

      def configure
        yield configuration
      end

      def external_sets(id = nil)
        response = get('external_sets', id)
        
        if id
          ExternalSet.new(response)
        else
          response.map { |set| ExternalSet.new(set) }
        end
      end

      def get(method, id = nil, params = {})
        do_request(method, id, params)
      end

      private

      def do_request(method, id = nil, params)
        method_version = params.delete(:api_version) || configuration.api_version
        url = "#{configuration.api_server}/#{method_version}/#{method}"

        url << "/#{id}" if id

        @faraday = Faraday.new(url) do |faraday|
          faraday.response :json
          faraday.adapter Faraday.default_adapter
          faraday.headers['X-Auth-Token'] = configuration.api_key
        end

        response = @faraday.get do |request|
          request.url(url, params)
        end
        response.body
      end
    end
  end
end


