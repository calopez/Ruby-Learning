module List
  class Node
    attr_accessor :data, :nextn
    def initialize(data, nextn=null)
      @data, @nextn = data, nextn
    end
  end

  class LinkedList
    include Enumerable
    attr_accessor :head

    def initialize data
      insert data
    end

    # Insert
    def insert data
      @head = Node.new(data, @head)
    end

    # Iterate
    def each
      item = @head
      while item
        yield item
        item = item.nextn
      end
    end

    # Insertion sort
    def insert_sort data

      if @head.nil? || @head && data <= @head.data
        self.insert data
      else
        current = @head
        while current.nextn && current.nextn.data < data
          current = current.nextn
        end
        current.nextn = Node.new(data, current.nextn)
      end
    end

    # Find
    def find_value data
      # this Class mixin Enumerable via build its own each function
      return self.find() { |node| node.data == data }
    end

    # Remove
    def remove target
      raise ArgumentError.new('Argument must be a valid Node') if !target.is_a? Node
      if target.equal? @head
        @head = @head.nextn
      else
        prev = self.find() { |node| node.nextn.equal?(target) }
        prev.nextn = target.nextn if prev
      end
    end

    def to_s
      list = ''
      self.each { |nd| list << " #{nd.data} "  }
      list
    end
  end
end
# l = LinkedList.new(7)
# l.insert_sort 4
# l.insert_sort 0
# l.insert_sort 5
# l.insert_sort 23
# l.insert_sort 2
# l.insert_sort 1
# l.insert_sort 3
# puts l

# puts "delete 5"
# l.remove l.find_value(5)
# puts l

# puts "delete 0"
# l.remove l.find_value(0)
# puts l

# puts "delete 1"
# l.remove l.find_value(1)
# puts l

# puts "delete 23"
# node_to_delete = l.find_value(23)
# l.remove node_to_delete
# node_to_delete = nil
# puts node_to_delete
# puts l
