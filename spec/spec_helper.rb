# Std Lib

# NOTE: Gemfiles for non-coverage appraisals may not have kettle-soup-cover.
begin
  require "kettle-soup-cover"
  if Kettle::Soup::Cover::DO_COV
    require "simplecov"
    require "kettle/soup/cover/config"
    SimpleCov.start
  end
rescue LoadError => error
  raise error unless error.message.include?("kettle")
end

# External RSpec & related config
require "kettle/test/rspec"
# `kettle/test/rspec` installs harness helpers documented in spec/README.md.

# RSpec Configs
require "debug" if Gem::Version.new(RUBY_VERSION) >= Gem::Version.new("2.7") && ENV["CI"].nil? && ENV.fetch("DEBUG", "false").casecmp("true").zero?
require "config/rspec/rspec_block_is_expected"
require "config/rspec/rspec_core"
require "config/rspec/silent_stream"
require "config/rspec/version_gem"
require "config/rspec/helpers"

# This gem!
require "debug_logging"
RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
require "support/shared_context"
