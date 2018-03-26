module Knife
  module Sharpener
    class Exit
      def self.with_message(msg)
        $stderr.puts "Error: #{msg}"
        $stderr.puts Sharpener::USAGE
        exit 1
      end
    end
  end
end
