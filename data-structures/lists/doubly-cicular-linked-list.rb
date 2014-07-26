class Node
  attr_accessor :prevn, :data, :nextn
  def initialize(data, prev_node = nil, next_node = nil)
    @data      = data
    @prev_node = prev_node
    @next_node = next_node
  end
end

class DoublyLinkedList
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
    node = Node.new data
    if @head.nil?
      @head = Node.new data
      @head.prevn = @head.nextn = @head
    else
      node = Node.new(data, @head, @head.prevn)
      @head.prevn.nextn = node
      @head.prevn = node
      @head = node
    end
  end

  def remove target
    if @head.nextn == @head
      @head = nil
    else
      @head = target.nextn if target == @head
      target.prevn.nextn = target.nextn
      target.nextn.prevn = target.prevn
    end
  end

  def find_value value
    return find { |node| node.data == value }
  end
end
