require_relative "IOConnections"
class UF
  include IOConnections
  
  def initialize(n)
    @id = (0..n).to_a
  end
  
  def connected? p1, p2
    @id[p1] == @id[p2]
  end
  
  def union p1, p2
    n1 = @id[p1]; n2 = @id[p2]
    
    @id.each_with_index do |node, i|
      @id[i] = n2 if @id[i] == n1
    end
  end
  
  def read_connection
    puts "To finish the caputere enter command."
    read
  end
  
end


data = UF.new 10
nodes = data.read_user_inputs
nodes.each do |nd| #O(N^2)
  data.union(nd[0], nd[1])
end

p data

