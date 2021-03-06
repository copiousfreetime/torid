# DO NOT EDIT - This file is automatically generated
# Make changes to Manifest.txt and/or Rakefile and regenerate
# -*- encoding: utf-8 -*-
# stub: torid 1.3.0 ruby lib

Gem::Specification.new do |s|
  s.name = "torid".freeze
  s.version = "1.3.0"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Jeremy Hinegardner".freeze]
  s.date = "2017-02-17"
  s.description = "Temporally Ordered IDs. Generate universally unique identifiers (UUID) that sort lexically in time order. Torid exists to solve the problem of generating UUIDs that when ordered lexically, they are also ordered temporally. I needed a way to generate ids for events that are entering a system with the following criteria: 1. Fast ID generation 2. No central coordinating server/system 3. No local storage 4. Library code, that is multiple apps on the same machine can use the same code    and they will not generate duplicate ids 5. Eventually stored in a UUID field in a database. So 128bit ids are totally    fine. The IDs that Torid generates are 128bit IDs made up of 2, 64bit parts. * 64bit microsecond level UNIX timestamp * 64bit hash of the system hostname, process id and a random value.".freeze
  s.email = "jeremy@copiousfreetime.org".freeze
  s.extra_rdoc_files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "Manifest.txt".freeze, "README.md".freeze]
  s.files = ["CONTRIBUTING.md".freeze, "HISTORY.md".freeze, "LICENSE".freeze, "Manifest.txt".freeze, "README.md".freeze, "Rakefile".freeze, "lib/torid.rb".freeze, "lib/torid/clock.rb".freeze, "lib/torid/generator.rb".freeze, "lib/torid/uuid.rb".freeze, "tasks/default.rake".freeze, "tasks/this.rb".freeze, "test/test_clock.rb".freeze, "test/test_generator.rb".freeze, "test/test_helper.rb".freeze, "test/test_torid.rb".freeze, "test/test_uuid.rb".freeze, "test/test_version.rb".freeze]
  s.homepage = "http://github.com/copiousfreetime/torid".freeze
  s.licenses = ["ISC".freeze]
  s.rdoc_options = ["--main".freeze, "README.md".freeze, "--markup".freeze, "tomdoc".freeze]
  s.required_ruby_version = Gem::Requirement.new(">= 1.9.3".freeze)
  s.rubygems_version = "2.6.10".freeze
  s.summary = "Temporally Ordered IDs. Generate universally unique identifiers (UUID) that sort lexically in time order.".freeze

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<fnv>.freeze, ["~> 0.2"])
      s.add_development_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_development_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_development_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_development_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    else
      s.add_dependency(%q<fnv>.freeze, ["~> 0.2"])
      s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
      s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
      s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
      s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
    end
  else
    s.add_dependency(%q<fnv>.freeze, ["~> 0.2"])
    s.add_dependency(%q<rake>.freeze, ["~> 11.3"])
    s.add_dependency(%q<minitest>.freeze, ["~> 5.0"])
    s.add_dependency(%q<rdoc>.freeze, ["~> 4.0"])
    s.add_dependency(%q<simplecov>.freeze, ["~> 0.9"])
  end
end
