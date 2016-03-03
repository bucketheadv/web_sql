$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "web_sql/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "web_sql"
  s.version     = WebSql::VERSION
  s.authors     = ["sven199109"]
  s.email       = ["sven199109"]
  s.homepage    = "https://github.com/sven199109/web_sql.git"
  s.summary     = "Use SQL on web page."
  s.description = "Use SQL on web page"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 4.2.5"
  s.add_dependency "bootstrap-sass", "~> 3.3.6"

  # s.add_development_dependency "sqlite3"
end
