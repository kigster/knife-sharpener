require_relative 'cli'
module Knife
  module Sharpener
    USAGE = <<-EOF

Usage:
  [bundle exec] sharpen command ...

Where the command is one of the following:
  #{Sharpener::CLI.supported_commands.join(', ')}
    EOF
  end
end
