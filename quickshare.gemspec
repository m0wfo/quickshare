# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{quickshare}
  s.version = "0.0.2"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Chris Mowforth"]
  s.date = %q{2009-01-29}
  s.default_executable = %q{share}
  s.description = %q{Command line utility for serving the current directory over HTTP.}
  s.email = ["chris@mowforth.com"]
  s.executables = ["share"]
  s.extra_rdoc_files = ["History.txt", "Manifest.txt", "README.rdoc"]
  s.files = ["History.txt", "Manifest.txt", "README.rdoc", "Rakefile", "bin/share", "lib/quickshare.rb", "lib/share/cli.rb", "script/console", "script/destroy", "script/generate", "test/test_helper.rb", "test/test_quickshare.rb", "test/test_share_cli.rb"]
  s.has_rdoc = true
  s.homepage = %q{Command line utility for serving the current directory over HTTP.}
  s.post_install_message = %q{PostInstall.txt}
  s.rdoc_options = ["--main", "README.rdoc"]
  s.require_paths = ["lib"]
  s.rubyforge_project = %q{quickshare}
  s.rubygems_version = %q{1.3.1}
  s.summary = %q{Command line utility for serving the current directory over HTTP.}
  s.test_files = ["test/test_helper.rb", "test/test_quickshare.rb", "test/test_share_cli.rb"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 2

    if Gem::Version.new(Gem::RubyGemsVersion) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_development_dependency(%q<hoe>, [">= 1.8.0"])
    else
      s.add_dependency(%q<newgem>, [">= 1.2.3"])
      s.add_dependency(%q<hoe>, [">= 1.8.0"])
    end
  else
    s.add_dependency(%q<newgem>, [">= 1.2.3"])
    s.add_dependency(%q<hoe>, [">= 1.8.0"])
  end
end
