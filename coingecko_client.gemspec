require_relative 'lib/coingecko_client/version'

Gem::Specification.new do |spec|
  spec.name          = "coingecko_client"
  spec.version       = CoingeckoClient::VERSION
  spec.authors       = ["Bruck1701"]
  spec.email         = ["kummel@gmail.com"]

  
  spec.summary       = 'A simple coingecko API client '
  spec.description   = 'Simple client for the coingecko API. This is a work in progress and not all API calls are available at this time.'
  spec.homepage      = 'https://github.com/Bruck1701/coingecko_client'
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")
  spec.add_runtime_dependency 'excon', '~> 0.75.0'
  spec.add_runtime_dependency 'json',  '~> 2.3'
  


  spec.metadata["allowed_push_host"] = 'https://rubygems.org'

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/Bruck1701/coingecko_client"
  #spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
end
