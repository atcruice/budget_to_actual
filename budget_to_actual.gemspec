require_relative "lib/budget_to_actual/version"

Gem::Specification.new do |spec|
  spec.authors = ["Alex Cruice"]
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.name = "budget_to_actual"
  spec.require_paths = ["lib"]
  spec.summary = "Ruby tool to transform TSV export from Budget, for import into Actual Budget."
  spec.version = BudgetToActual::VERSION

  gemspec = File.basename(__FILE__)

  spec.files = IO.popen(%w[git ls-files -z], chdir: __dir__, err: IO::NULL) do |ls|
    ls.readlines("\x0", chomp: true).reject do |f|
      (f == gemspec) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end

  spec.add_dependency("bigdecimal")
  spec.add_dependency("csv")
  spec.add_dependency("monetize", "~> 1.13")

  spec.add_development_dependency("minitest")
  spec.add_development_dependency("rake")
  spec.add_development_dependency("standard")
end
