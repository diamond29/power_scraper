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
      nav_frame = main.frames.find do |web_frame|
        web_frame.src == 'navtabs.htm'
      end

      if nav_frame.nil?
        fail PowerScraperError,
             "nav tabs frame does not exist at site: #{address}"
      end

      nav_frame
    end

    def active_link
      link = nav_tabs_frame.content.links.find do |page_link|
        page_link.text =~ /Active/
      end

      if link.nil?
        fail PowerScraperError,
             "active link cannot be found at site: #{address}"
      end

      link
    end

    def active_page
      page = active_link.click

      if page.nil?
        fail PowerScraperError,
             "active page cannot be found at site: #{address}"
      end

      page
    end

    def meta_refresh_page
      page = active_page.meta_refresh.first.click

      if page.nil?
        fail PowerScraperError,
             "meta refresh page cannot be found at site: #{address}"
      end

      page
    end

    def meter_table_html
      html = meta_refresh_page.content

      if html.size < 30
        fail PowerScraperError,
             "Didn't find a big table at this site: #{address}"
      end

      html
    end
  end
end
