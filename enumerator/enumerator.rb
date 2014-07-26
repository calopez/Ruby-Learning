
# Consider the following class, 
# which doesn’t mix in Enumerable but does have one iterator method

class Mussic
  class Scale
  	NOTES = %w{ c c# d d# e f f# g a a# b}
  	def play
  		NOTES.each {|note| yield note}
  	end
  end
end

scale = Mussic::Scale.new
scale.play {|note| puts "Next note is #{note}"}


# But the scale isn’t technically an enumerable. 
# The standard methods from Enumerable won’t work because the class 
# Music::Scale doesn’t mix in Enumerable and doesn’t define each:

# scale.map { |note| note.upcase }
# 
# The result would be: NoMethodError: unknown method `map’ for #<Music::Scale:0x3b0aec>

# you could do scale enumerable mixing Enumerable,
# but you can also make a scale enumerable by hooking it up to an enumerator.

enum = scale.enum_for(:play)

# The enumerator, enum, has an each method; that method performs the same 
# iteration that the scale’s play method performs. Furthermore, unlike the scale,
# the enumera- tor is an enumerable object; it has map, select, inject, 
# and all the other standard methods from Enumerable. 
# If you use the enumerator, you get enumerable operations on a fundamentally 
# non-enumerable object:
# 

p enum.map { |note| note.upcase }
p enum.select { |note| note.include? 'f' }
