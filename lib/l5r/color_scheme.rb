module L5r
  class ColorScheme
    COLORS = {
      :event      => :white,
      :holding    => :rgb_fcbf55,
      :crab       => :rgb_2c314e,
      :crane      => :rgb_83c9e2,
      :dragon     => :rgb_b2b44f,
      :lion       => :rgb_b3936d,
      :mantis     => :rgb_175639,
      :phoenix    => :rgb_c8653e,
      :scorpion   => :rgb_671112,
      :spider     => :rgb_929290,
      :unaligned  => :rgb_241009,
      :unicorn    => :rgb_7e7999,
      :follower   => :rgb_735a31,
      :item       => :rgb_234f76,
      :sensei     => :rgb_51616e,
      :spell      => :rgb_9ebbcd,
      :strategy   => :rgb_522019,
      :stronghold => :rgb_eeedd9,
      :proxy      => :rgb_c98824  
    }

    class << self
      def build
        HighLine::ColorScheme.new do |cs|
          COLORS.each do |key, color|
            cs.send(:[]=, key, [color])
          end
        end
      end
    end

  end
end

