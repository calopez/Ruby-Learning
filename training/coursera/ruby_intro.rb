
class Hello
	def my_first_method
		puts "Hello, World!"
	end
end



BEGIN {
   puts "Initializing Ruby Program"
   x = Hello.new
   x.my_first_method
}





