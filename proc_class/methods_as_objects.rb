class C
	def talk
		puts "Method-grabbing test! self is #{self}."
	end
end

c = C.new
meth = c.method(:talk)

meth.call