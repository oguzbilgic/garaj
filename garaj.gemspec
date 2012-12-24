# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'garaj/version'

Gem::Specification.new do |gem|
  gem.name          = "garaj"
  gem.version       = Garaj::VERSION
  gem.authors       = ["Oguz Bilgic"]
  gem.email         = ["fisyonet@gmail.com"]
  gem.description   = %q{Browse through your project's source code}
  gem.summary       = %q{Garaj is a tiny web app which lets you to browse your project`s source code locally using a web browser.}
  gem.homepage      = "https://github.com/oguzbilgic/garaj"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_dependency('sinatra', '~> 1.3')
  gem.add_dependency('pygments.rb', '~> 0.3')
end
