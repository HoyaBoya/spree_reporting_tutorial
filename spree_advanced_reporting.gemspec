Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'spree_advanced_reporting'
  s.version     = '2.1.0'
  s.summary     = 'Advanced Reporting for Spree'
  s.homepage    = 'https://github.com/bonobos/spree_advanced_reporting'
  s.authors	    = ['Bonobos']
  s.email	      = ['tech@bonobos.com']
  s.required_ruby_version = '>= 1.8.7'

  s.files        = `git ls-files`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'spree_core', '>= 2.1.0'

  # Auto generated dev/test dependencies
  s.add_development_dependency 'capybara',            '~> 2.1'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl',        '~> 4.2'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',         '~> 2.13'
  s.add_development_dependency 'sass-rails'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
