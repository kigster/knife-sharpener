require 'mixlib/cli'

module Knife
  class Sharpener::CLI::Provision < Sharpener::CLI
    banner 'Usage: provisioner provision --config <path-to-config>.yml [options] '

    def provisioner_command
      Sharpener::Command::Provision.new(template_configuration.for_template(config[:template]), config)
    end

  end
end
