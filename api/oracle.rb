require 'httparty'
require 'nokogiri'
require 'dotenv'
Dotenv.load

class HtmlParserIncluded < HTTParty::Parser
  SupportedFormats.merge! 'text/html' => :html
  def html
    Nokogiri::HTML(body)
  end
end


class Card
  def initialize(html)
    @html = html
  end

  def icon
    @icon ||= begin
      img = @html.search('tr:first-child td:first-child img').first
      img ? "/#{img[src]}" : nil
    end
  end

  def title
    @title ||= begin
      node = @html.search('td.greenhead span.l5rfont').first
      node ? node.content : nil
    end
  end

  def to_s
    "Card: #{title}"
  end
end


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
        Card.new(html)
      end
    end
  end
end


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

  def card_search(opts)
    query = CardSearch.to_post_args(opts)
    response = self.class.post('/dosearch', :body => query)
    CardSearch.parse_response(response)
  end

end
