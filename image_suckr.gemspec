# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "image_suckr/version"

Gem::Specification.new do |s|
  s.name        = "image_suckr"
  s.version     = ImageSuckr::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Mauricio Miranda"]
  s.email       = ["mmiranda@xoomcode.com"]
  s.homepage    = ""
  s.summary     = %q{Get images randomly from the web}
  s.description = %q{Ruby class to get images randomly from some websites for seeding pourposes.}

  s.rubyforge_project = "image_suckr"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
