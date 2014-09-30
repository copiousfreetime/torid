# vim: syntax=ruby
load 'tasks/this.rb'

This.name     = "torid"
This.author   = "Jeremy Hinegardner"
This.email    = "jeremy@copiousfreetime.org"
This.homepage = "http://github.com/copiousfreetime/#{ This.name }"

This.ruby_gemspec do |spec|
  spec.add_dependency( 'fnv', '~> 0.2' )

  spec.add_development_dependency( 'rake'     , '~> 10.1')
  spec.add_development_dependency( 'minitest' , '~> 5.0' )
  spec.add_development_dependency( 'rdoc'     , '~> 4.0' )
  spec.add_development_dependency( 'simplecov', '~> 0.9' )
end

load 'tasks/default.rake'
