require "google_scraper/version"
require 'nokogiri'   
require 'csv'

module GoogleScraper

  def self.run(query, options = {})
    puts "Query is #{query}"
    query = URI.escape(query)
    data = []

    (0..9).each do |count|
      puts "scraping page #{count+1} with query #{query}"
      doc = Nokogiri::HTML(open("https://www.google.ca/search?q=#{query}&start=#{count*10}"))

      link = doc.search('h3')
      puts "Found #{link.size} possible results"

      link.each do |l| 
        a = l.search('a').first
        next unless a['href'].match(/^\/url/)
        result = {
          :url => a['href'].gsub(/^\/url\?q\=/,'').gsub(/\&sa=.*$/, ''),
          :text => a.content
        }
        data << result
      end
    end

    CSV.open('output.csv', 'w') do |csv|
      csv << ["url", "text"]
      data.each do |entry|
        begin
          csv << [entry[:url], entry[:text]]
        rescue => e
          puts "ugh. #{e} - skipping"

        end
      end
    end   
  end

end
