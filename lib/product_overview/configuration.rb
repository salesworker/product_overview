module ProductOverview
  class Configuration
    DEFAULT_API_VERSION = "v1"
    OPTIONS = [:api_key, :api_version, :api_server].freeze

    attr_accessor :api_key, :api_version, :api_server

    def initialize
      @api_version = DEFAULT_API_VERSION
    end
  end
end
