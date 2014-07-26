class Arreglo < Array
  def initialize n
    n.times { |x| self << x}
  end
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
end

class Array
  def my_map
    c = 0
    acc = []
    until c == size
      acc << yield(self[c])
      c += 1
    end
    acc
  end
end


names = ['carlos','andres','diana']

p names.my_map { |name| name.upcase }

# building Map on top of each

class Array
  def my_each
    c = 0
    until c == size
      yield self[c]
      c += 1
    end
    self
  end
  
  def my_map2
    acc = []
    my_each { |e| acc << yield(e) }
    acc
  end  
end

p names.my_map2 { |name| name.capitalize }






def block_local_parameter
  x = 100
  y = 444
  z = 999
  [1,2,3].each do |x; z| # it means you want to use a local variable(z) inside the block
    puts "Parameter x is #{x}"
    x = x + 10
    puts "Reassigned to x in block; it's now #{x}"
    y = 333
    z = 222
  end
  puts "Outer x is still #{x}"
  puts "Outer y has changed #{y}"  
  puts "But outer z remains the same #{z}"   
end


block_local_parameter

  



















