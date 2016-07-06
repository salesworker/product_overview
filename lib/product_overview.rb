require 'yaml'
require 'facets/string/titlecase'

require 'product_overview/configuration'
require 'product_overview/version'


require 'product_overview/utils/inspectable'
require 'product_overview/api/entity'

require 'product_overview/api/client'
require 'product_overview/api/external_set'


module ProductOverview
  class << self
    attr_writer :configuration

    def api
      @client ||= API::Client.new
    end

    def configure(&block)
      api.configure(&block)
    end

    def configuration
      api.configuration
    end

    def root
      Gem::Specification.find_by_name("product_overview").gem_dir
    end
  end
end

