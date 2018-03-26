require 'mixlib/cli'

module Knife
  class Sharpener::CLI::Bootstrap < Sharpener::CLI

    banner 'Usage: provisioner bootstrap --config <path-to-config>.yml [options] '

    option :reset,
           short:       '-R',
           long:        '--reset',
           description: 'Path to the config file (YML)',
           boolean:     true,
           required:    false

    option :sudo,
           long:        '--sudo',
           description: 'Execute bootstrap via sudo',
           boolean:     false,
           required:    false

    def provisioner_command
      Sharpener::Command::Bootstrap.new(template_configuration.for_template(config[:template]), config)
    end

  end
end
