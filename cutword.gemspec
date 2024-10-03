require_relative 'lib/cutword/version'

Gem::Specification.new do |spec|
    spec.name          = 'cutword'
    spec.version       =  Cutword::VERSION
    spec.authors       = 'Demjhon Silver'
    spec.email         = 'none'
    spec.summary       = 'A simple gem for truncating words/strings or shortening words and names, compatible with Rails and Hanami Framework.'
    spec.description   = 'This gem provides string truncation and word cutting functionality for both Rails and Hanami Framework.'
    spec.homepage      = 'https://github.com/demjhonsilver/cutword'
    spec.required_ruby_version = ">= 3.0.0"
    spec.license       = 'MIT'

    spec.files         = Dir['lib/**/*.rb']
end