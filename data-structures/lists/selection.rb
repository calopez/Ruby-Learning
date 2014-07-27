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

  end


  # l = LinkedList.new(1)
  # l.insert_sort 2
  # l.insert_sort 3
  # l.insert_sort 4
  # l.insert_sort 5
  # l.insert_sort 6
  # l.insert_sort 7
  # l.insert_sort 8
  # l.insert_sort 9
  # l.insert_sort 10
  # l.insert_sort 11

  # puts l
  # #
  # puts " middle point in the list is #{l.mindpoint.data}"
  # k = 2
  # puts " the position k=#{k} from the end of the list is #{l.kth_from_end(k).data}"


end
