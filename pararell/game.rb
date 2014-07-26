module Game
	class RPS
    include Comparable
    WINS = [ %w{ rock scissors },
             %w{ scissors paper },
             %w{ paper rock } ]
    attr_accessor :move

    def initialize(move)
      @move = move.to_s
    end

    def <=> (other)
      if move == other.move
      elsif WINS.include?([move, other.move])
        1
      elsif WINS.include?([other.move, move])
        -1
      else
        raise ArgumentError, "Something's wrong"
      end     
    end

  end
end

def play(other)
  if self > other
    self
  elsif other > self
    other
  else
    false
  end 
end

# USING THE RPS CLASS IN A THREADED GAME


require 'socket'
s = TCPServer.new 3939
threads = []

2.times do |n|
  conn = s.accept
  threads << Thread.new(conn) do |c|
    Thread.current[:number] = n + 1
    Thread.current[:player] = c
    c.puts "Welcome, player #{n+1}"
    c.print "Your move? (rock, paper, scissors)"
    Thread.current[:move] = c.gets.chomp
    c.puts "Thanks.. hang on."
  end
end

a, b = threads
a.join
b.join
#.......
#.....
#...
#..
#.


