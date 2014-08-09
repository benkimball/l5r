module L5r

  class CardSearch
    FIELD_MAP = {
      :card_title  => 'search_13',
      :card_number => 'search_26',
      :card_type   => 'search_sel_13[]',
      :clan        => 'search_sel_12[]',
      :set         => 'search_sel_35[]',
      :rarity      => 'search_sel_38[]',
      :legality    => 'search_sel_10[]'
    }.freeze

    class << self
      def to_post_args(opts)
        unless opts.kind_of?(Hash)
          opts = {:card_title => opts.to_s}
        end
        post_args = {}
        opts.each do |key, value|
          post_key = FIELD_MAP[key]
          post_args[post_key] = value if post_key
        end
        post_args
      end

      def parse_response(response)
        response.search('table.listing .cardline').map do |html|
          Card.from_card_search(html)
        end
      end
    end
  end

end
