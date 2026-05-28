# Std Lib
require "rational"

# NOTE: Gemfiles for non-coverage appraisals may not have kettle-soup-cover.
begin
  # This does not require "simplecov",
  #   because that has a side-effect of running `.simplecov`
  require "kettle-soup-cover"
  require "simplecov" if Kettle::Soup::Cover::DO_COV
rescue LoadError => error
  raise error unless error.message.include?("kettle")
end

# RSpec Configs
require "config/byebug"
require "config/rspec/rspec_block_is_expected"
require "config/rspec/rspec_core"
require "config/rspec/silent_stream"
require "config/rspec/version_gem"
require "config/rspec/helpers"

# This gem!
require "debug_logging"
require "support/shared_context"
