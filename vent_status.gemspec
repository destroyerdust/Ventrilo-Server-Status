Gem::Specification.new do |s|
  s.name        = "vent_status"
  s.version     = "0.0.1"
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Sean Barkley"]
  s.email       = ["sean@seanbarkley.com"]
  s.homepage    = "http://www.seanbarkley.com"
  s.summary     = %q{Gathers ventrilo server status and returns information to user.}
  s.description = %q{Vent_status will webscape the official ventrilo server status page and return information regarding information about the server and who's online etc.}
  s.license     = 'MIT'
  s.files       = ["lib/vent_status.rb"]

  s.add_runtime_dependency "mechanize", "~>2.7"
end