module ProductOverview
  module API
    class Product < Entity
      def name
        raw["name"]
      end

      def template_name
        raw["template_name"]
      end

      def count_clicks
        raw["count_clicks"]
      end

      def manufacturer
        raw["manufacturer"]
      end

      def customer
        raw["customer"]
      end

      def price
        raw["price"]
      end

      def reduced_price
        raw["reduced_price"]
      end

      def shipping_cost
        raw["shipping_cost"]
      end

      def test_result
        raw["test_result"]
      end

      def price_winner?
        raw["price_winner"]
      end
      
      def test_winner?
        raw["test_winner"]
      end

      def affiliate_link
        raw["affiliate_link"]
      end

      def tracking_pixel
        raw["tracking_pixel"]
      end

      def field_values
        raw["field_values"]
      end
      
      def get_fields_by_type(field_type)
        field_values.select { |x| x['type'] == field_type }
      end
      
      def get_fields(field_name)
        field_values.select { |x| x['name'] == field_name }
      end
    end
  end
end
