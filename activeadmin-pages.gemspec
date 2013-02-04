$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "active_admin/pages/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "activeadmin-pages"
  s.version     = ActiveAdmin::Pages::VERSION
  s.authors     = ["Francesco Disperati"]
  s.email       = ["me@nebirhos.com"]
  s.homepage    = "TODO"
  s.summary     = "TODO: Summary of ActiveadminPages."
  s.description = "TODO: Description of ActiveadminPages."

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]

  s.add_dependency "activeadmin-seo"
  s.add_dependency "ancestry"
  s.add_dependency "activeadmin-sortable-tree"
  s.add_dependency "activeadmin-globalize3"
  s.add_dependency "activeadmin-wysihtml5"

  s.add_development_dependency "sqlite3"
end
