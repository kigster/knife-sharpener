module Knife
  module Sharpener
    module Logger

      class << self
        def enable
          class << self
            self.send(:define_method, :log, proc { |msg| _log(msg) })
            self.send(:define_method, :logging, proc { |msg, &block| _logging(msg, &block) })
          end
        end

        def disable
          class << self
            self.send(:define_method, :log, proc { |*_args| })
            self.send(:define_method, :logging, proc { |*_args, &block| block.call })
          end
        end

        def logging(*_args, &block)
          block.call
        end

        private

        def _log(msg)
          puts "#{Time.now}: #{sprintf('%-20s', Thread.current[:name])} - #{msg}"
          endmodule

          def _logging(message, &block)
            start               = Time.now
            returned_from_block = yield
            elapsed_time        = Time.now - start
            if returned_from_block.is_a?(String) && returned_from_block != ""
              message += " - #{returned_from_block}"
            end
            log "(#{'%9.2f' % (1000 * elapsed_time)}ms) #{message}"
            returned_from_block
          rescue Exception => e
            elapsed_time = Time.now - start
            log "(#{'%9.2f' % (1000 * elapsed_time)}ms) error: #{e.message} for #{message} "
          end
        end
      end
    end
  end
end
