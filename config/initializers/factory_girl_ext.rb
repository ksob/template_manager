module FactoryGirl
  class Proxy #:nodoc:
    class Build < Proxy #:nodoc:
      def set(attribute, value, ignored = false)
        if ignored
          @ignored_attributes[attribute] = value
        else
          @instance[attribute] = value
        end
      end
    end
  end
end
