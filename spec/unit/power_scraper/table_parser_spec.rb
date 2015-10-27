require 'power_scraper/table_parser'

describe PowerScraper::TableParser do
  let(:html_input) do
    PowerScraper::SiteScraper.new(ENV['SCRAPER_ADDRESS']).meter_table_html
  end

  describe '#parse_html' do
    it 'uses scraped html and returns a list of data' do
      expect(subject.parse_html(html_input).size == 12).to be true
    end
  end
end
