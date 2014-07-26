require 'socket'

# s = TCPServer.new 3933
# conn = s.accept
# conn.puts "Hi. Here's the date."
# conn.puts `date` # <-- date in backticks executes the system date command
# conn.close
# s.close



# while true
#   conn = s.accept
#   conn.print "Hi. What's your name? "
#   name = conn.gets.chomp
#   conn.puts "Hi, #{name}. Here’s the date."
#   conn.puts `date`
#   conn.close
# end

# But if a second client connects to the server while the server is still waiting
# for the first client’s input, the second client sees nothing—not even What’s your name?
# —because the server is busy.

# That’s where threading comes in:

s = TCPServer.new 3933
while (conn = s.accept)
  Thread.new(conn) do |c|
    c.print "Hi. What's your name?"
    name = c.gets.chomp
    c.puts "Hi, #{name}, Here's the date."
    c.puts `date`
    c.close
  end
end
