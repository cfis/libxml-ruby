# Default GEM Specification
# ------- Default Package ----------
require 'rake'

FILES = Rake::FileList[
  'Rakefile',
  'CHANGES',
  'LICENSE',
  'README',
  'setup.rb',
  'doc/**/*',
  'ext/libxml/*',
  'ext/mingw/Rakefile',
  'ext/mingw/build.rake',
  'ext/vc/*.sln',
  'ext/vc/*.vcproj',
  'lib/**/*',
  'benchmark/**/*',
  'test/**/*'
]

Gem::Specification.new do |spec|
  spec.name = "libxml-ruby"

  spec.homepage = "http://libxml.rubyforge.org/"
  spec.summary = "Ruby libxml bindings"
  spec.description = <<-EOF
    The Libxml-Ruby project provides Ruby language bindings for the GNOME
    Libxml2 XML toolkit. It is free software, released under the MIT License.
    Libxml-ruby's primary advantage over REXML is performance - if speed
    is your need, these are good libraries to consider, as demonstrated
    by the informal benchmark below.
  EOF

  # Determine the current version of the software
  spec.version =
    if File.read('ext/libxml/ruby_xml_version.h') =~ /\s*RUBY_LIBXML_VERSION\s*['"](\d.+)['"]/
      CURRENT_VERSION = $1
    else
      CURRENT_VERSION = "0.0.0"
    end

  spec.author = "Charlie Savage"
  spec.email = "libxml-devel@rubyforge.org"
  spec.platform = Gem::Platform::RUBY
  spec.require_paths = ["lib", "ext/libxml"]
  spec.bindir = "bin"
  spec.extensions = ["ext/libxml/extconf.rb"]
  spec.files = FILES.to_a
  spec.test_files = Dir.glob("test/tc_*.rb")

  spec.required_ruby_version = '>= 1.8.4'
  spec.date = DateTime.now
  spec.rubyforge_project = 'libxml'

  spec.has_rdoc = true
end
