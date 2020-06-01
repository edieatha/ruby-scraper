require 'open-uri'
require 'nokogiri'
require_relative '../lib/scraper.rb'

describe Scraper do
  url = 'https://www.apple.com/shop/refurbished/mac'
  html = URI.open(url).read
  describe '#mac_specs' do
    it 'Return specifications as array.' do
      scraper = Scraper.new
      expect(scraper.mac_specs).to be_an_instance_of(Array)
    end

    it 'Mac Pro Computers are available!' do
      scraper = Scraper.new
      expect(scraper.mac_specs).to include "Refurbished Mac Pro 3.2GHz 16-core Intel Xeon W, Two Radeon Pro Vega II Duo, Apple Afterburner"
    end

  end

    describe '#prices' do
      it 'Return prices as array.' do
        scraper = Scraper.new
        expect(scraper.mac_prices).to be_an_instance_of(Array)
      end

      it 'Mac prices of $1,300 are available!' do
        scraper = Scraper.new
        expect(scraper.mac_prices).to include /1,3./
      end
    end
end