require 'forwardable'

module Knife
  module Sharpener
    class Hosts
      extend Forwardable
      def_delegators :@numbers, :size, :each, :[]

      attr_accessor :numbers, :sprintf_template, :index
      def initialize(number_spec:, sprintf_template:)
        self.numbers          = expand(number_spec)
        self.sprintf_template = sprintf_template
        self.index            = numbers.first
      end

      def expand(numbers)
        array = case numbers
                  when Array
                    numbers
                  when Range
                    numbers.to_a
                  when String
                    eval(numbers).to_a
                end
        array.flatten.select { |i| i.is_a?(Numeric) }.uniq.sort
      end

      def name(number = nil)
        if number.nil?
          number = (self.index += 1)
        end
        sprintf(sprintf_template, number)
      end
    end
  end
end

