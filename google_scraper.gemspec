# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'google_scraper/version'

Gem::Specification.new do |gem|
  gem.name          = "google_scraper"
  gem.version       = GoogleScraper::VERSION
  gem.authors       = ["John Tajima"]
  gem.email         = ["john@shopify.com"]
  gem.description   = %q{Scrapes first 10 pages of google with given query}
  gem.summary       = %q{Scrapes first 10 pages of google with given query}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_development_dependency('rdoc')
  gem.add_development_dependency('aruba')
  gem.add_development_dependency('rake', '~> 0.9.2')
  gem.add_dependency('methadone', '~> 1.2.2')
  gem.add_dependency('nokogiri')
  
end
