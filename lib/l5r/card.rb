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
    end

    def to_s
      "Card: #{title}"
    end
  end

end
