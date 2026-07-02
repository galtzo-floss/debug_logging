module DebugLogging
  module InstanceLogger
    class << self
      def extended(base)
        base.include(LambDartable::Log)
      end
    end

    # NOTE: These options can also be passed in / hidden in a last hash of *args
    # NOTE: They can also be passed in discretely for each method, by passing *args as an array of arrays
    # @option options [Logger] :logger Logger.new($stdout), # probably want to override to be the Rails.logger
    # @option options [Symbol] :log_level default: :debug, at what level do the messages created by this gem sent at?
    # @option options [true, false] :multiple_last_hashes default: false,
    # @option options [nil, Proc] :last_hash_to_s_proc default: nil, e.g. ->(hash) { "keys: #{hash.keys}" }
    # @option options [Integer] :last_hash_max_length default: 1_000,
    # @option options [nil, Proc] :args_to_s_proc default: nil, e.g. ->(*record) { "record id: #{record.first.id}" }
    # @option options [Integer] :args_max_length default: 1_000,
    # @option options [false, Proc] :colorized_chain_for_method default: false, e.g. ->(colorized_string) { colorized_string.red.on_blue.underline }
    # @option options [false, Proc] :colorized_chain_for_class default: false, e.g. ->(colorized_string) { colorized_string.colorize(:light_blue ).colorize( :background => :red) }
    # @option options [true, false] :add_invocation_id default: true, allows unique identification of method call; association of entry and exit log lines
    # @option options [String] :ellipsis default: " ✂️ …".freeze,
    # @option options [true, false] :mark_scope_exit default: false,
    # @option options [true, false, Proc] :add_payload default: true, # Can also be a proc returning a string, which will be called when printing the payload
    # @option options [Integer] :payload_max_length default: 1_000,
    # @option options [nil, Proc] :error_handler_proc default: nil,
    # @option options [nil, Proc] :time_formatter_proc default: DebugLogging::Constants::DEFAULT_TIME_FORMATTER,
    # @option options [true, false] :add_timestamp default: false,
    # @option options [true, false] :instance_benchmarks default: false,
    # @option options [true, false] :class_benchmarks default: false,
    def i_logged(*methods_to_log, **options)
      methods_to_log, payload, config_opts = DebugLogging::Util.extract_payload_and_config(
        method_names: methods_to_log,
        payload: nil,
        config: nil,
        options:
      )
      instance_method_modules =
        Array(methods_to_log).map do |decorated_method|
          DebugLogging::InstanceLoggerModulizer.to_mod(
            methods_to_log: Array(decorated_method),
            payload: payload,
            config: config_opts
          )
        end
      wrapped_in_logs = Module.new do
        singleton_class.send(:define_method, :included) do |host_class|
          instance_method_modules.each do |mod|
            host_class.prepend(mod)
          end
        end
      end

      send(:include, wrapped_in_logs)
    end
  end
end
