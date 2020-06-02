require 'open-uri'
require 'nokogiri'
require_relative '../lib/scraper.rb'

describe Scraper do
  let(:url) { 'https://www.apple.com/shop/refurbished/mac' }
  let(:html) { URI.open(url).read }

  describe '#mac_specs' do
    it 'Return specifications as array.' do
      scraper = Scraper.new
      expect(scraper.mac_specs).to be_an_instance_of(Array)
    end

    it 'Mac Pro Computers are available!' do
      scraper = Scraper.new
      expect(scraper.mac_specs).to include 'Refurbished 13.3-inch MacBook Pro 2.3GHz quad-core Intel Core i5 with Retina display - Silver'
    end
  end

  describe '#prices' do
    it 'Return prices as array.' do
      scraper = Scraper.new
      expect(scraper.mac_prices).to be_an_instance_of(Array)
    end

    it 'Mac prices of $1,300 are available!' do
      scraper = Scraper.new
      expect(scraper.mac_prices).to include(/1,3./)
    end

    it 'Return discounts as array.' do
      scraper = Scraper.new
      expect(scraper.amt_saved).to be_an_instance_of(Array)
    end
  end
end
