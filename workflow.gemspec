# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'workflow/version'

Gem::Specification.new do |spec|
  spec.name          = 'workflow'
  spec.version       = Workflow::VERSION
  spec.authors       = ['Jake Pelletier']
  spec.email         = ['jake.pelletier@sendgrid.com']
  spec.summary       = 'CI workflow tools'
  spec.description   = 'Supplies command-line tools for controlling a variety of CI interactions'
  spec.homepage      = 'https://github.com/Ghjnut/ci'
  #spec.license       = ''

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://gems.sendgrid.net'
  else
    fail 'RubyGems 2.0 or newer is required to protect against public gem pushes.'
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(/^(test|spec|features)/) }
  spec.bindir        = 'bin'
  spec.executables   = ['workflow']
  spec.require_paths = ['lib']

  spec.add_dependency 'jenkins_api_client', '~> 1.4', '>= 1.4.2'
  spec.add_dependency 'octokit', '~> 4.3'
  spec.add_dependency 'backticks', '~> 0.4.0'
  spec.add_dependency 'semantic', '~> 1.4', '>= 1.4.1'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop', '~> 0.37.2'
end
