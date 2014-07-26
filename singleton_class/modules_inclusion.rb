module M
	def talk
		# p "Hello from module!!!"
	end
end

module N
	def talk
		# p "Hello from module N!!!"
	end
end

class C
	prepend M
	def talk
		# p "hi from original class! "
	end
end

c = C.new
# p c.talk

class << c
	include N
	puts "method-lookup path: #{ancestors.unshift(self)}"
	p "singleton class ancestors " + self.singleton_class.ancestors.to_s
end

# p c.talk