class Rainbow
  include Enumerable
  def each
    yield "red"
    yield "orange"
    yield "yellow"
    yield "green"
    yield "blue"                
    yield "indigo"  
    yield "violet"          
  end
end


r = Rainbow.new
r.each do |color|
  puts color
end

# Create enumerator from Rainbow each method 
en = r.enum_for(:each)
p en.next
p en.next
