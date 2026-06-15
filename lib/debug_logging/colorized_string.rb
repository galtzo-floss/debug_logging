# frozen_string_literal: true

module DebugLogging
  class ColorizedString < String
    FOREGROUND_CODES = {
      black: 30,
      red: 31,
      green: 32,
      yellow: 33,
      blue: 34,
      magenta: 35,
      cyan: 36,
      white: 37,
      light_black: 90,
      light_red: 91,
      light_green: 92,
      light_yellow: 93,
      light_blue: 94,
      light_magenta: 95,
      light_cyan: 96,
      light_white: 97,
      default: 39
    }.freeze
    BACKGROUND_CODES = FOREGROUND_CODES.transform_values { |code| code + 10 }.merge(default: 49).freeze
    FORMAT_CODES = {
      bold: 1,
      italic: 3,
      underline: 4,
      blink: 5,
      reverse_color: 7,
      conceal: 8,
      hide: 8,
      strikethrough: 9,
      double_underline: 21
    }.freeze

    class << self
      def [](value)
        new(value.to_s)
      end
    end

    def initialize(value, foreground: nil, background: nil, formats: [])
      @raw = value.to_s
      @foreground = foreground
      @background = background
      @formats = formats.dup
      super(render)
    end

    def colorize(color = nil, options = {})
      options = color if color.is_a?(Hash)
      foreground = options.fetch(:color, nil) || options.fetch("color", nil)
      foreground ||= color unless color.is_a?(Hash)
      background = options.fetch(:background, nil) || options.fetch("background", nil)
      formats = Array(options[:mode]) + Array(options[:modes])

      self.class.new(
        @raw,
        foreground: foreground ? normalized_color(foreground) : @foreground,
        background: background ? normalized_color(background) : @background,
        formats: merge_formats(formats)
      )
    end

    def colorized?
      @foreground || @background || @formats.any?
    end

    def uncolorize
      @raw.dup
    end

    FOREGROUND_CODES.each_key do |color|
      next if color == :default

      define_method(color) do
        colorize(color)
      end

      define_method(:"on_#{color}") do
        colorize(background: color)
      end
    end
    alias_method :on_gray, :on_light_black
    alias_method :on_grey, :on_light_black

    FORMAT_CODES.each_key do |format|
      define_method(format) do
        self.class.new(@raw, foreground: @foreground, background: @background, formats: merge_formats([format]))
      end
    end

    private

    def background_code
      BACKGROUND_CODES.fetch(@background, 49)
    end

    def foreground_code
      FOREGROUND_CODES.fetch(@foreground, 39)
    end

    def style_codes
      format_codes = @formats.map { |format| FORMAT_CODES.fetch(format) }
      format_codes = [0] if format_codes.empty?
      [*format_codes, foreground_code, background_code]
    end

    def normalized_color(color)
      color.to_s.tr(" ", "_").downcase.to_sym
    end

    def merge_formats(formats)
      normalized_formats = formats.filter_map do |format|
        normalized = format.to_sym
        normalized if FORMAT_CODES.key?(normalized)
      end
      @formats | normalized_formats
    end

    def render
      return @raw.dup unless colorized?

      "\e[#{style_codes.join(";")}m#{@raw}\e[0m"
    end
  end
end

ColorizedString = DebugLogging::ColorizedString unless Object.const_defined?(:ColorizedString)
