Gem::Specification.new do |s|
  s.name        = 'threadsync'
  s.version     = '0.1.0'
  s.summary     = 'ThreadSync Ruby SDK'
  s.description = 'Official Ruby SDK for the ThreadSync API — enterprise data integration platform.'
  s.authors     = ['Cichocki']
  s.email       = 'engineering@threadsync.io'
  s.homepage    = 'https://github.com/threadsync-infrastructure/threadsync-ruby'
  s.license     = 'MIT'
  s.required_ruby_version = '>= 3.0'
  s.files       = Dir['lib/**/*.rb']
  s.add_dependency 'net-http'
  s.add_dependency 'json'
end
