module L5r

  class Card
    include CardParser

    attr_accessor :icon, :title

    class << self
      def from_card_search(html)
        Card.new.tap do |card|
          card.icon = get_icon(html)
          card.title = get_title(html)
        end
      end

      def from_card_fetch(html)
        Card.new.tap do |card|
          img = html.search('table.cardinfo>tbody>tr:nth-child(2) td:first-child img').first
          card.icon = img ? "/#{img['src']}" : nil

          node = html.search('tr.greenhead td').first
          card.title = node ? node.content : nil
        end
      end
    end

    def to_s
      "Card: #{title}"
    end
    alias_method :to_str, :to_s
  end

end
