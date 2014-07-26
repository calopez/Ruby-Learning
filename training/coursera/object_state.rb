class A
	def initialize(f=0)
		@foo = f
	end
	def m1
		@foo = 0
	end
	def m2 x
		@foo += x
	end
	def foo
		return @foo
	end

end