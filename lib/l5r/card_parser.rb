module L5r

  module CardParser
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def get_icon(html)
        img = html.search('tr:first-child td:first-child img').first
        img ? "/#{img['src']}" : nil
      end

      def get_title(html)
        node = html.search('td.greenhead span.l5rfont').first
        node ? node.content : nil
      end
    end
  end

end
