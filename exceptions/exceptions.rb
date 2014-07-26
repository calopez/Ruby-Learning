

begin
  raise ArgumentError
rescue => e
  p e.class
end



begin
 # result = 100 / 0
 raise ArgumentError, "I need a number under 10" 
rescue ZeroDivisionError, ArgumentError => e
  puts "That was not an acceptable number!"
  puts "Here's the backtrace for this exception:"
  puts e.backtrace
  puts "And here's the exception object's message:"
  puts e.message  
end



#RE-RAISING AN EXCEPTION
begin
  fh = File.open(filename)
rescue => e
  logfile.puts("User tried to open #{filename}, #{Time.now}")
  logfile.puts("Exception: #{e.message}")
  raise
end



# The ensure clause 
# the ensure clause is executed whether an exception is raised or not.
 def line_from_file(filename, substring)
          fh = File.open(filename)
          begin
            line = fh.gets
            raise ArgumentError unless line.include?(substring)
          rescue ArgumentError
            puts "Invalid line!"
raise ensure
fh.close end
          return line
        end



# Creating your own exception classes
class MyNewException < Exception
end
raise MyNewException, "some new kind of error has occurred!"

# class InvalidLineError < StandardError
# end
# def line_from_file ...



# Namespacing exceptions this way is polite, in the sense that it lets other people 
# name exceptions as they like without fearing name clashes. It also becomes a necessity
# once you start creating more than a very small number of exception classes.

module TextHandler
  class InvalidLineError < StandardError
  end
end
def line_from_file(filename, substring)
  fh = File.open(filename)
            line = fh.gets
            raise TextHandler::InvalidLineError unless line.include?(substring) # <<< Nicely namespaced exception name!  