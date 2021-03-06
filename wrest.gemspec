lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
 
require 'wrest/version'

Gem::Specification.new do |s|  
  s.name        = "wrest"
  s.version     = Wrest::VERSION
  s.authors     = ["Sidu Ponnappa", "Niranjan Paranjape"]
  s.email       = ["sidu@c42.in"]
  s.homepage    = "http://c42.in/open_source"
  s.summary     = "Wrest is a fluent, object oriented HTTP client library for 1.8, 1.9, JRuby and Rubinius."
  s.description = "Wrest is a fluent, easy-to-use, object oriented Ruby HTTP/REST client library with support for RFC2616 HTTP caching, multiple HTTP backends and async calls using EventMachine. It runs on CRuby, JRuby and Rubinius."
 
  s.required_rubygems_version = ">= 1.3.0"
  s.rubyforge_project = "wrest"

  s.requirements << "To use Memcached as caching back-end, install the 'dalli' gem."
  s.requirements << "To use multipart post, install the 'multipart-post' gem."
  s.requirements << "To use curl as the http engine, install the 'patron' gem. This feature is not available (and should be unneccessary) on jruby."
  s.requirements << "To use eventmachine as a parallel backend, install the 'eventmachine' gem."
  
  s.files             = Dir.glob("{bin/**/*,lib/**/*.rb}") + %w(README.rdoc CHANGELOG LICENCE)
  s.extra_rdoc_files  = ["README.rdoc"]
  s.rdoc_options      = ["--charset=UTF-8"]
  s.executables       = ['wrest']
  s.require_path      = 'lib'

  s.add_development_dependency "rubyforge"

  # Test dependencies
  s.add_development_dependency "rspec", ["~> 2.6"]
  s.add_development_dependency "sinatra", ["~> 1.0.0"]
  s.add_development_dependency "metric_fu" unless Object.const_defined?('RUBY_ENGINE') && RUBY_ENGINE =~ /rbx/

  s.add_runtime_dependency "activesupport", ["~> 3"]
  s.add_runtime_dependency "builder", ["> 2.0"]
  s.add_runtime_dependency("multi_json", ["~> 1.0"])
  
  case RUBY_PLATFORM
  when /java/
    s.add_runtime_dependency("jruby-openssl", ["~> 0.7"])
    s.platform    = Gem::Platform::CURRENT
  end
end
 
