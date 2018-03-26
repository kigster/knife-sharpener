require 'json'

module Knife
  module Sharpener
    module Command
      class Provision < Base

        private

        def shell_commands_for(number)
          host_name = host_name(number)
          command   = [
              'knife ec2 server create',
              "--image #{image}",
              "--flavor #{flavor}",
              "--subnet #{subnet}",
              "--security_group_id #{security_group_id}",
              "--environment #{environment}",
              "--node-name #{host_name}",
          ]


          log_path = "#{log_dir}/#{host_name}_provision.log"
          command << "--run-list #{run_list}" if run_list
          command << "--ssh-user #{ssh_user}" if ssh_user
          command << "--ssh_key '#{encoded_ssh_key}'" if ssh_key
          command << "2>&1 > #{log_path} &"

          command.join(' ')
        end

        def encoded_ssh_key
          JSON.dump(ssh_key)
        end

      end
    end
  end
end
