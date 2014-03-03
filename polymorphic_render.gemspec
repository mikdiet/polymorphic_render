$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "polymorphic_render/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "polymorphic_render"
  s.version     = PolymorphicRender::VERSION
  s.authors     = ["Mikhail Dieterle"]
  s.email       = ["mikdiet@gmail.com"]
  s.homepage    = ""
  s.summary     = "Extend rails views rendering"
  s.description = "Extend rails views rendering"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "> 3.0"

  s.add_development_dependency "sqlite3"
end
