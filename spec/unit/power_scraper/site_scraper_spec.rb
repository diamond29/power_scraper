require 'power_scraper/site_scraper'

describe PowerScraper::SiteScraper do
  let(:subject) { PowerScraper::SiteScraper.new ENV['SCRAPER_ADDRESS'] }

  describe '#main' do
    it 'finds the main page' do
      expect { subject.main }.not_to raise_error
    end
  end

  describe '#nav_tabs_frame' do
    it 'finds the nav_tabs.htm frame' do
      expect { subject.nav_tabs_frame }.not_to raise_error
    end
  end
end
