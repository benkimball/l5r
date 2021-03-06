require 'httparty'
require 'dotenv'
Dotenv.load

module L5r

  class Oracle
    include HTTParty
    parser HtmlParserIncluded

    base_uri 'http://imperialassembly.com/oracle'

    def initialize(opts={})
      response = self.class.get('/')
      response = self.class.post(
        '/logon',
        :body => {
          :txtUsername => opts[:username] || ENV['ORACLE_USERNAME'],
          :txtPassword => opts[:password] || ENV['ORACLE_PASSWORD']
        },
        :headers => {
          'Cookie' => response.headers['Set-Cookie'],
          'X-Requested-With' => 'XMLHttpRequest'
        }
      )
      @cookie = response.request.options[:headers]['Cookie']
    end

    def home
      self.class.get('/', :headers => {'Cookie' => @cookie})
    end

    def logged_in?
      home.search('#area-menu span.label').any? { |e| e.content == 'Logout' }
    end

    def logged_out?
      home.include? "You are not logged in"
    end

    def card_fetch(card_id)
      response = self.class.post('/docard', :body => {:cardid => card_id})
      table = response.search('table.cardinfo').first
      if table
        Card.from_card_fetch(table)
      end
    end

    def card_search(opts)
      query = CardSearch.to_post_args(opts)
      response = self.class.post('/dosearch', :body => query)
      CardSearch.parse_response(response)
    end

  end

end
