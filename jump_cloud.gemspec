require_relative 'lib/jump_cloud/version'

Gem::Specification.new do |spec|
  spec.name          = "jump_cloud"
  spec.version       = JumpCloud::VERSION
  spec.authors       = ["Dale Stevens"]
  spec.email         = ["dale@twilightcoders.net"]

  spec.summary       = %q{JumpCloud API}
  spec.description   = %q{JumpCloud API}
  spec.homepage      = "https://github.com/twilightcoders/jump_cloud"
  spec.license       = "MIT"

  spec.metadata['allowed_push_host'] = 'https://rubygems.org'
  # spec.allowed_hosts = ['https://rubygems.org']

  spec.files         = Dir['CHANGELOG.md', 'README.md', 'LICENSE', 'lib/**/*']
  spec.bindir        = 'bin'
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib', 'spec']

  spec.required_ruby_version = '>= 2.2'

  spec.add_runtime_dependency 'her', '~> 0.10.0'

  spec.add_development_dependency 'pry-byebug'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake', '~> 12.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'dotenv', '~> 2.2'

end
