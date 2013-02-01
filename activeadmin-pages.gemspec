$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "activeadmin-pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin-pages"
  s.version     = ActiveadminPages::VERSION
  s.authors     = ["Francesco Disperati"]
  s.email       = ["me@nebirhos.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActiveadminPages."
  s.description = "TODO: Description of ActiveadminPages."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.2.11"

  s.add_development_dependency "sqlite3"
end
