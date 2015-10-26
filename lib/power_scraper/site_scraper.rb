require 'mechanize'
require 'power_scraper/power_scraper_error'

module PowerScraper
  # This class uses mechanize to do the work on the site to find the table
  class SiteScraper
    def initialize(address)
      @mechanize_agent = Mechanize.new
      @address = address
    end

    def main
      @mechanize_agent.get @address
    end

    def nav_tabs_frame
      nav_tabs_frame = main.frames.find do |web_frame|
        web_frame.src == 'navtabs.htm'
      end

      if nav_tabs_frame.nil?
        fail 'nav tabs frame does not exist at site: #{address}'
      end

      nav_tabs_frame
    end

    def active_table
      # var = active_tab

      # binding.pry
    end
  end
end
