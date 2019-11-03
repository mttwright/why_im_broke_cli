
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require_relative "./lib/why_im_broke_cli/version"
​
Gem::Specification.new do |spec|
​
  spec.name          = "why_im_broke"
  spec.version       = WhyImBrokeCli::VERSION
  spec.date          = "2019-11-3"
  spec.summary       = "Program that takes a number of different activities to do in NYC."
  spec.description   = "Program that takes a number of different activities to do in NYC and allows users to select an option for a more detailed description."
  spec.authors       = ["'Matt Wright'"]
  spec.email         = ["'mttwright@gmail.com'"]
  spec.files         = ["lib/why_im_broke_cli.rb", "lib/why_im_broke_cli/cli.rb", "lib/why_im_broke_cli/item.rb", "lib/why_im_broke_cli/scraper.rb", "lib/why_im_broke_cli/version.rb"]
  spec.homepage      = "https://github.com/mttwright/why_im_broke_cli.git"
  spec.license       = "MIT"
  spec.executables << 'why_im_broke'
  spec.add_development_dependency "bundler", "~> 2.0"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"
  spec.add_dependency "nokogiri"
  
end

