puts 'Defining Enumerators:'
puts '1. # Using a block.'
# Using a block

e = Enumerator.new do |y|
	(1..3).each { |i| y << i }
end

e.each {|x| p "item #{x}"}

# Attaching enumerators to other objects
puts '2. # Attaching enumerators to other objects.'; puts '-'*45
names = %w{ Carlos Andres Lopez Gil }
e = names.enum_for(:select)

p e.each {|n| n.include? 'a' }


puts "\n - Another Example:\n"; puts '-' * 19
names = %w{ Carlos Andres Lopez Gil }
e = names.enum_for(:inject, "Names: ")
p e.each {|string, name| string << "#{name}..."}





