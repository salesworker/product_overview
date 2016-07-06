require 'product_overview/api/product'

module ProductOverview
  module API
    class ExternalSet < Entity
      attr_accessor :products

      def initialize(raw)
        super
        @products = []
      end

      def id
        raw["id"]
      end
      
      def name
        raw["name"]
      end
      
      def primary_target_url
        raw["primary_target_url"]
      end
      
      def related_sets
        raw["related_sets"]
      end

      def with_min_price
        products.min_by(&:price)
      end
      
      def get_field_type(field_name = nil)
        result = get_field(field_name)

        result.blank? ? nil : result.map{ |x| x[0]['type'] if x[0] }.compact.first
      end
      
      def get_field_by_type(field_type = nil)
        result = get_fields_by_type(field_type)

        result.blank? ? nil : result.map{ |x| x[0]['value'] if x[0] }.compact.first
      end

      def get_field(field_name = nil)
        return unless field_name

        products.map{ |x| x.get_fields(field_name) }
      end
      
      def fields
        products.last.field_values.map { |f| f["name"] }
      end
      
      def products
        @products = @products.any? ? @products : raw["products"].map { |p| Product.new(p) }
      end
    end
  end
end


