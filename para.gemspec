$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'para/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'para'
  s.version     = Para::VERSION
  s.authors     = ['Valentin Ballestrino']
  s.email       = ['contact@glyph.fr']
  s.homepage    = 'http://github.com/glyph-fr/para'
  s.summary     = 'Rails admin engine'
  s.description = 'Rails admin engine'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails', '~> 4.0'
  s.add_dependency 'haml-rails'
  s.add_dependency 'sass-rails'
  s.add_dependency 'devise', '~> 3.0'
  s.add_dependency 'bootstrap-sass', '~> 3.2.0'
  s.add_dependency 'font-awesome-rails', '>= 4.0.0'
  s.add_dependency 'simple_form', '3.1.0.rc2'
  s.add_dependency 'simple_form_extension'
  s.add_dependency 'cocoon'
  s.add_dependency 'friendly_id', '~> 5.0'
  s.add_dependency 'paperclip', '~> 4.2'
  s.add_dependency 'cancancan', '~> 1.9'
  s.add_dependency 'rolify', '~> 3.4'
  s.add_dependency 'kaminari'
  s.add_dependency 'ransack'
  s.add_dependency 'compass-rails'
  s.add_dependency 'font-awesome-sass'
  s.add_dependency 'request_store'
  s.add_dependency 'rspec-core'
  s.add_development_dependency 'sqlite3'
end
