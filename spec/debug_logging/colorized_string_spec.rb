# frozen_string_literal: true

RSpec.describe DebugLogging::ColorizedString do
  describe ".[]" do
    it "builds a string-like colorized value" do
      colorized_string = described_class["debug"]

      expect(colorized_string).to be_a(String)
      expect(colorized_string.to_s).to eq("debug")
    end
  end

  describe "#blue" do
    it "matches the previous colorized_string blue sequence" do
      expect(described_class["debug"].blue.to_s).to eq("\e[0;34;49mdebug\e[0m")
    end
  end

  describe "#colorize" do
    it "supports chained foreground and background colorization" do
      colorized_string = described_class["debug"].colorize(:light_blue).colorize(background: :red)

      expect(colorized_string.to_s).to eq("\e[0;94;41mdebug\e[0m")
    end
  end

  describe "#underline" do
    it "supports chained format methods" do
      colorized_string = described_class["debug"].red.on_blue.underline

      expect(colorized_string.to_s).to eq("\e[4;31;44mdebug\e[0m")
    end
  end
end
