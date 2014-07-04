# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'image_suckr/version'

Gem::Specification.new do |s|
  s.name        = 'image_suckr'
  s.version     = ImageSuckr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.author      = 'Mauricio Miranda'
  s.email       = 'maurimiranda@gmail.com'
  s.homepage    = 'https://github.com/maurimiranda/image_suckr'
  s.summary     = %q{Gets images randomly from the web}
  s.description = %q{ImageSuckr is a ruby gem that allows you to get random images from Google for seeding purposes.}
  s.license    = 'GPL-3.0'

  s.rubyforge_project = "image_suckr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_development_dependency 'rspec', '~> 3'
end
