module L5r

  class HtmlParserIncluded < HTTParty::Parser
    SupportedFormats.merge! 'text/html' => :html
    def html
      Nokogiri::HTML(body)
    end
  end

end
