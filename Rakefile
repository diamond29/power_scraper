require "bundler/gem_tasks"
require "rspec/core/rake_task"

Bundler.require(:development)

require 'power_scraper/site_scraper'

RSpec::Core::RakeTask.new(:spec)

task :default => :spec

desc 'Scrape site in ENV[\'site_address\']'
task :scrape_site do
  scraper = PowerScraper::SiteScraper.new ENV['site_address']

  scraper.get_table
end
