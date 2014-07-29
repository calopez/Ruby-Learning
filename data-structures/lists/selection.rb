require_relative "linked_list"

module List
  class LinkedList

    def list_size
      iter = @head
      size = 1
      while iter.nextn
        iter = iter.nextn
        size += 1
      end
      size
    end

    def mindpoint_by_counting #( n + n/2)~
      if @head
        node = @head
        middle = list_size / 2
        middle.times { node = node.nextn }
        node.data
      end
    end

    def mindpoint # O(n)
      i1 = @head # index 1
      i2 = @head # index 2

      while i1
        i1 = i1.nextn
        if i1
          i1 = i1.nextn #when i1 be null, i2 will be in the middle.
          i2 = i2.nextn
        end
      end
      i2
    end

    def kth_from_end k
      index  = @head
      target = @head
      k.times { index = index.nextn if index }
      while index
        target = target.nextn
        index = index.nextn
      end
      target
    end

    def remove_value value
      @head = @head.nextn while @head && @head.data == value
      index = @head
      while index && index.nextn
        if index.nextn.data == value
          index.nextn = index.nextn.nextn
        end
        index = index.nextn
      end
    end

    def reverse
      prev = nil
      index = @head if @head.nextn != @head

      while index
        next_ = index.nextn
        index.nextn = prev
        prev = index
        index = next_
      end
      @head = prev
      self
    end

  end # end class
end # end module


l = List::LinkedList.new(1)
l.insert 2
l.insert 9
l.insert 4
l.insert 9
l.insert 100
l.insert 7
l.insert 1
l.insert 9
l.insert 1
l.insert 1

puts l
#
puts " middle point in the list is #{l.mindpoint.data}"
k = 2
puts " the position k=#{k} from the end of the list is #{l.kth_from_end(k).data}"

# l.remove_value 9
# puts l
puts "list:[#{l}]"
l.remove_value 1
puts "removing 1 from list,"
puts "list:[#{l}]"


puts "list:[#{l.reverse}]"
