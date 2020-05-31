require_relative 'lib/quiz/version'

Gem::Specification.new do |spec|
  spec.name          = "quiz"
  spec.version       = Quiz::VERSION
  spec.authors       = ["Yarvin Hernandez"]
  spec.email         = ["yarvinhhernandez@gmail.com"]

  spec.summary       = "10 questions quiz about soccer."
  spec.description   = "Find out how much you know about soccer."
#   spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

#   # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

#   # spec.metadata["homepage_uri"] = spec.homepage
#   # spec.metadata["source_code_uri"] = "TODO: Put your gem's public repo URL here."
#   # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
    # spec.files         = Dir.chdir(File.expand_path('..', __FILE__)) do
    #      `git ls-files -z`.split("\x0").reject { |f|  f.match(%r{^(test|spec|features)/}) }
    # end
  spec.files = ["lib/quiz.rb","lib/quiz/balon_d_or.rb","lib/quiz/cli.rb","lib/quiz/champion_league.rb","lib/quiz/scraper.rb","lib/quiz/version.rb","lib/quiz/world_cup.rb","config/environment.rb"]
    # spec.bindir        = "exe"
  spec.require_paths = ["lib"]
  spec.executables << "quiz"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  
  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "nokogiri"
  spec.add_development_dependency "pry"
 end


