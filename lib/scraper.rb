class Scraper
  attr_accessor :parse_page

  def initialize
    url = 'https://www.apple.com/shop/refurbished/mac'
    html = URI.open(url).read
    @parse_page = Nokogiri::HTML(html)
  end

  def mac_specs
    parse_page.css('h3').css('a').children.map { |detail| detail.text }.compact
  end

  def mac_prices
    parse_page.css('.as-price-currentprice').children.map { |price| price.text.gsub(/(\n)(\s)/, "") }.compact
  end
end