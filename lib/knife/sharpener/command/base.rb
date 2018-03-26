module Knife
  module Sharpener
    module Command
      class Base
        attr_accessor :image, :zone, :flavor, :run_list,
                      :host_sequence, :host_prefix, :host_suffix,
                      :environment,
                      :host_presuffix, :log_dir, :host_number, :options, :ssh_user,
                      :ssh_key, :identity_file

        def initialize(template_configuration, options = {})
          @options     = options
          @host_number = options[:number]
          template_configuration.each_pair do |key, value|
            self.send("#{key}=", value)
          end
          @ssh_user = options[:ssh_user] if options[:ssh_user]
          raise "Log path is required" unless @log_dir
          Dir.mkdir(log_dir) unless Dir.exists?(log_dir)
        end

        def run
          shell_commands.each do |command|
            shellout command
            sleep 0.5
          end
        end

        def shell_commands_for host_number
          raise 'Abstract method, implement in subclasses'
        end

        def shell_commands
          host_numbers.map do |i|
            shell_commands_for(i.to_i)
          end.flatten
        end

        protected



        def shellout(command)
          puts "Running provision command:"
          puts command
          system(command)
        end
      end
    end
  end
end
require_relative 'provision'
require_relative 'bootstrap'
