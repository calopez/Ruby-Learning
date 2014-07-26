class Node
  attr_accessor :data, :nextn
  def initialize(data, nextn=nil)
    @data, @nextn = data, nextn
  end
  def to_s
    node = ini = self; list = [node.data]
    while node.nextn != ini
      node = node.nextn
      list << node.data
    end
    list.join(' -> ')
  end
end

class CircularList
  attr_accessor :head

  include Enumerable

  def each
    item = @head
    while item
      yield item
      item = item.nextn
      break if item.equal? @head
    end
  end

  def insert data
    new_node = Node.new data
    if @head.nil?
      new_node.nextn = new_node
      @head = new_node
    else
      new_node.nextn = @head.nextn
      @head.nextn = new_node
      @head.data, new_node.data = new_node.data, @head.data
    end

  end    

  def find_value value
    return self.find { |n| n.data == value }
  end

  def remove target
    if not @head or @head.nextn == @head
      @head =  nil
    end
    next_node    = target.nextn
    target.data  = next_node.data
    target.nextn = next_node.nextn
    @head = target if @head == next_node

  end

  def to_obj
    list = []
    self.each { |nd| list << nd  }
    list
  end

end

l = CircularList.new
l.insert 1
l.insert 2
l.insert 3
l.insert 4
l.insert 5
l.insert 6
l.insert 7
l.insert 8

node = l.find_value 1
puts node

l.remove l.find_value 3;
puts node

node2 = l.find_value 2
l.remove l.find_value 1;
puts node2
    
# (1..5).each { print "#{node.data}, "; node = node.nextn  }
# l.remove l.find_value 8;# p l
# p "head: #{l.head.data}; tail_end: #{l.tail_end.data}"
