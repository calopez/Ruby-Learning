require_relative "IOConnections"
class QuickUnionUF
  include IOConnections
  
  def initialize n
    @id = (0..n).to_a
  end
  
  def connected p, q
    root(p) == root(q)
  end
  
  def union p, q
    @id[root(p)] = root(q)
  end
  
  def root node
    parent = ''
    begin
      parent = @id[node]
      node   = @id[parent]
    end while parent != node
    parent
  end
end


data = QuickUnionUF.new 9
nodes = data.read_user_inputs
p nodes
nodes.each do |nd| #O(N^2)
  data.union(nd[0], nd[1])
end
# [[4, 3], [3, 8], [6, 5], [9, 4], [2, 1], [5, 0], [7, 2], [6, 1], [7, 3]]
p data