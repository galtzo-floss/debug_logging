# kettle-jem:freeze
# To retain chunks of comments & code during debug_logging templating:
# Wrap custom sections with freeze markers (e.g., as above and below this comment chunk).
# debug_logging will then preserve content between those markers across template runs.
# kettle-jem:unfreeze

# Minimum coverage thresholds are set by kettle-soup-cover.
# They are controlled by ENV variables loaded by `mise` from `mise.toml`
# (with optional machine-local overrides in `.env.local`).
# If the values for minimum coverage need to change, they should be changed both there,
#   and in 2 places in .github/workflows/coverage.yml.
SimpleCov.configure do
  cover "lib/**/*.rb", "lib/**/*.rake", "exe/*.rb"
end
if SimpleCov.respond_to?(:skip)
  SimpleCov.skip("/lib/simple_debug_logging.rb")
else
  SimpleCov.add_filter("/lib/simple_debug_logging.rb")
end
