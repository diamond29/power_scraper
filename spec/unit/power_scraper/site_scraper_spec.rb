require 'power_scraper/site_scraper'

describe PowerScraper::SiteScraper do
  let(:subject) { PowerScraper::SiteScraper.new ENV['SCRAPER_ADDRESS'] }

  describe '#main' do
    it 'finds the main page' do
      expect(subject.main).to be_an_instance_of Mechanize::Page
    end
  end

  describe '#nav_tabs_frame' do
    it 'finds the nav_tabs.htm frame' do
      expect(subject.nav_tabs_frame).to be_an_instance_of Mechanize::Page::Frame
    end
  end

  describe '#active_link' do
    it 'finds the active_link' do
      expect(subject.active_link).to be_an_instance_of Mechanize::Page::Link
    end
  end

  describe '#active_page' do
    it 'finds the active page' do
      expect(subject.active_page).to be_an_instance_of Mechanize::Page
    end
  end

  describe '#meta_refresh_page' do
    it 'finds the meta refresh page' do
      expect(subject.meta_refresh_page).to be_an_instance_of Mechanize::Page
    end
  end

  describe '#meter_table_html' do
    it 'returns the html for the page of interest with the table' do
      expect(subject.meter_table_html.size > 40).to be true
    end
  end
end
