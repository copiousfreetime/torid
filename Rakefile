# vim: syntax=ruby
load 'tasks/this.rb'

This.name     = "torid"
This.author   = "Jeremy Hinegardner"
This.email    = "jeremy@copiousfreetime.org"
This.homepage = "http://github.com/copiousfreetime/#{ This.name }"

This.ruby_gemspec do |spec|
  spec.add_dependency( 'fnv', '~> 0.2' )

  spec.add_development_dependency( 'rake',           '~> 13.0')
  spec.add_development_dependency( 'minitest',       '~> 5.17' )
  spec.add_development_dependency( 'minitest-junit', '~> 1.0' )
  spec.add_development_dependency( 'minitest-focus', '~> 1.3' )

  spec.add_development_dependency( 'rdoc'     , '~> 6.4' )
  spec.add_development_dependency( 'simplecov', '~> 0.21' )
  spec.metadata = {
    "bug_tracker_uri" => "https://github.com/copiousfreetime/#{This.name}/issues",
    "changelog_uri"   => "https://github.com/copiousfreetime/#{This.name}/blob/master/HISTORY.md",
    "homepage_uri"    => "https://github.com/copiousfreetime/#{This.name}",
    "source_code_uri" => "https://github.com/copiousfreetime/#{This.name}",
  }

  spec.license = "ISC"
end

load 'tasks/default.rake'
