require 'hashie/mash'
module Knife
  module Sharpener
    class Template

      attr_accessor :cli_options, :config, :mash, :log_dir
      attr_accessor :host

      def initialize(log_dir:, cli_options:)
        self.cli_options = cli_options
        self.log_dir     = log_dir
        self.config      = Sharpener::Configuration.from_path(cli_options[:config_file])
      end
    end
  end
end
