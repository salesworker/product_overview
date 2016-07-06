module ProductOverview
  module Utilities
    module Inspectable
      # @return [String]
      def inspect
        if self.class.name.empty?
          "#<\#<Class:0x#{self.class.object_id.abs.to_s(16)}>"
        else
          "#<#{self.class.name}"
        end << ":0x#{object_id.abs.to_s(16)} ...>"
      end
    end
  end
end

