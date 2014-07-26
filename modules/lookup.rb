module M
  def report
    puts "'report' method in module M"
  end
end

class C 
  include M
  def report
    puts "'report' method in class C"
  end  
end

class D < C
end

obj = D.new
obj.report