# l5r

Decks for the Legend of the Five Rings CCG. Should be pretty self-explanatory. I typically use the list format from [Oracle of the Void](http://imperialassembly.com/oracle). I might also use the [Untap](http://untap.in) format, which as far as I can tell is the same except that it doesn't support commented lines.

## Installation

Add this line to your application's Gemfile:

    gem 'l5r'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install l5r

## Usage

Largely still TODO. Here are a couple things I'd like to be able to do:

    L5R> lookup Oracle of the Void
    Searching...
      1847. (Holding) Dark Oracle of the Void (Experienced)
      5773. (Holding) Oracle of the Void
     10408. (Holding) Oracle of the Void (Experienced)
    L5R> lookup #10408
    Cache hit
      #10408 Oracle of the Void
      Promo Holding, Promotional-Emperor
      Legal: Emperor, Ivory
      Void, Oracle, Retainer, Experienced, Unique
      GC 6
      This card cannot be destroyed.
      Limited, [b]: The next two cards in provinces you refill (this turn) may
      be refilled face-up.
      Limited, [b]: Draw a card.
      "I see all. There is nothing beyond my sight."

## Contributing

1. Fork it ( https://github.com/benkimball/l5r/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Versioning

I'm going to try to conform to [Semantic Versioning v2.0.0](http://semver.org/spec/v2.0.0.html). I haven't used this precise spec before so I may fuck it up.
