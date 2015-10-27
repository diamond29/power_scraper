require 'nokogiri'

module PowerScraper
  # read the table from the html
  class TableParser
    def initialize
    end

    def parse_html(html)
      doc = Nokogiri::HTML html
      headers = doc.xpath('//table/tr/th').map do |header|
        header.text.strip
      end

      rows = doc.xpath('//table/tr').to_a
      rows.delete_at(0)

      document_objects = rows.map do |row|
        td_children = row.children.select do |child|
          child.class == Nokogiri::XML::Element
        end

        children_text = td_children.map { |child| child.text.strip }

        Hash[headers.zip children_text]
      end
    end
  end
end
