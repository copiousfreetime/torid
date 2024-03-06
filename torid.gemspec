# DO NOT EDIT - This file is automatically generated
# Make changes to Manifest.txt and/or Rakefile and regenerate
# -*- encoding: utf-8 -*-
# stub: torid 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "torid".freeze
  s.version = "1.3.0".freeze

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.metadata = { "bug_tracker_uri" => "https://github.com/copiousfreetime/torid/issues", "changelog_uri" => "https://github.com/copiousfreetime/torid/blob/master/HISTORY.md", "homepage_uri" => "https://github.com/copiousfreetime/torid", "source_code_uri" => "https://github.com/copiousfreetime/torid" } if s.respond_to? :metadata=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeremy Hinegardner".freeze]
  s.date = "2024-03-04"
  s.description = "Temporally Ordered IDs. Generate universally unique identifiers (UUID) that sort lexically in time order.".freeze
  s.email = "jeremy@copiousfreetime.org".freeze
  s.extra_rdoc_files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "LICENSE".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/torid.rb".freeze, "lib/torid/clock.rb".freeze, "lib/torid/generator.rb".freeze, "lib/torid/uuid.rb".freeze, "tasks/default.rake".freeze, "tasks/this.rb".freeze, "test/test_clock.rb".freeze, "test/test_generator.rb".freeze, "test/test_helper.rb".freeze, "test/test_torid.rb".freeze, "test/test_uuid.rb".freeze, "test/test_version.rb".freeze]
  s.homepage = "http://github.com/copiousfreetime/torid".freeze
  s.licenses = ["ISC".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--markup".freeze, "tomdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 2.3.0".freeze)
  s.rubygems_version = "3.5.3".freeze
  s.summary = "Temporally Ordered IDs. Generate universally unique identifiers (UUID) that sort lexically in time order.".freeze

  s.specification_version = 4

  s.add_development_dependency(%q<rake>.freeze, ["~> 13.0".freeze])
  s.add_development_dependency(%q<minitest>.freeze, ["~> 5.21".freeze])
  s.add_development_dependency(%q<minitest-junit>.freeze, ["~> 1.1".freeze])
  s.add_development_dependency(%q<minitest-focus>.freeze, ["~> 1.3".freeze])
  s.add_development_dependency(%q<rdoc>.freeze, ["~> 6.6".freeze])
  s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.21".freeze])
end
