puts "Top Level"
puts "self is #{self}"


class C
  puts "Class definition block:"
  puts "self is #{self}"
  
  def self.x
    puts "Class method C.x:"
    puts "self is #{self}"
  end
  
  def m
    puts "instance method C#m:"
    puts "self is #{self}"
  end
end


# First Example
a = C.new

C::x
a.m

puts "\n\n"



class A
  def A.no_dot
    puts "As long as self is C, you can call this method with no dot"
  end
  
  no_dot
end

A.no_dot



# Resolving instance variables through self

puts $$