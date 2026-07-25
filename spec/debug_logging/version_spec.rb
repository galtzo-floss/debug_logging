require "anonymous_loader"
RSpec.describe DebugLogging::Version do
  it_behaves_like "a Version module", described_class

  it "executes the version file for coverage without redefining constants" do
    path = File.expand_path("../../lib/debug_logging/version.rb", __dir__)
    anonymous_namespace = AnonymousLoader.load(files: path)

    expect(anonymous_namespace::DebugLogging::Version::VERSION).to eq(described_class::VERSION)
  end
end
