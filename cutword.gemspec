require_relative 'lib/cutword/version'

Gem::Specification.new do |spec|
    spec.name          = 'cutword'
    spec.version       =  Cutword::VERSION
    spec.authors       = 'Demjhon Silver'
    spec.email         = 'none'
    spec.summary       = 'A simple gem for cut words/string truncation in Ruby on Rails.'
    spec.description   = 'This gem provides a string truncation/cut words method for Ruby on Rails applications.'
    spec.homepage      = 'https://github.com/demjhonsilver/cutword'
    spec.license       = 'MIT'
    
    spec.files         = Dir['lib/**/*.rb']
end