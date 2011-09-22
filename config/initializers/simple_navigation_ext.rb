module SimpleNavigation
  module Renderer
    class Base
      def expand_sub_navigation?(item)
        expand_all? || !!item.html_options[:expand] || item.selected?
      end
    end
  end
end
