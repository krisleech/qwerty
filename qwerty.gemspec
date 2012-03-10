$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "qwerty/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "qwerty"
  s.version     = Qwerty::VERSION
  s.authors     = ["Kris Leech"]
  s.email       = ["kris.leech@interkonect.com"]
  s.homepage    = "https://github.com/krisleech/qwerty"
  s.summary     = "Content Management Toolkit"
  s.description = "The core functionality on which to build a fully featured Content Management System using Rails 3"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "nested_set"
  s.add_dependency "acts_as_list"
  s.add_dependency "inherited_resources"
  s.add_dependency "simple_form"
  s.add_dependency "jquery-rails"
  s.add_dependency "sanitize"
  s.add_dependency "dragonfly"
  s.add_dependency "faker"
  # s.add_dependency "kaminari"
  
  s.add_development_dependency "rails", "~> 3.0"
  s.add_development_dependency "sqlite3"
  s.add_development_dependency "mysql2"
  s.add_development_dependency "rspec-rails", "~> 2.8.0"
  s.add_development_dependency "factory_girl_rails"
  s.add_development_dependency "timecop"
end
