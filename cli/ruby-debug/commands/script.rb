module Debugger
  class SourceCommand < Command # :nodoc:
    self.control = true
    
    def regexp
      /^\s*so(?:urce)?\s+(.+)$/
    end
    
    def execute
      file = File.expand_path(@match[1]).strip
      unless File.exists?(file)
        print "Command file '#{file}' is not found\n"
        return
      end
      Debugger.run_script(file, @state)
    end
    
    class << self
      def help_command
        'source'
      end
      
      def help(cmd)
        %{
          source FILE\texecutes a file containing debugger commands
        }
      end
    end
  end
  
end
