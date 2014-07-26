class C
end
def C.a_class_method
  puts "Singleton method defined on #{self}"
end

C.a_class_method

class D < C
end

D.a_class_method