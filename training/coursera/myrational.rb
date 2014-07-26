class MyRational
	def initialize(num, den=1)
		if den == 0
			raise "Myrational received an innapropiate argument"
		elsif den < 0
			@num = - num
			@den = - den
		else
			@num = num
			@den = den			
		end
		reduce # i.e., self.reduce() but private
	end

	def to_s
		ans = @num.to_s
		if @den != 1
			ans += "/"
			ans += @den.to_s
		end
		ans 
	end

	def to_s2
		dens = "" 
		dens  = "/" + @den.to_s if @den != 1 
		@num.to_s + dens
	end

	def to_s3 # using interpolation
		"#{@num}#{if @den==1 then "" else "/" + @den.to_s end}"
	end

	def add! r
		a = r.num
		b = r.den
		c = @num
		d = @den
		@num = (a*d) + (b*c)
		@den = b * d
		reduce
		self # convenient for stringing calls
	end

	def + r
		ans = Myrational.new(@num, @den)
		ans.add! r
		ans # since add! returns self, it's not necessary this line
	end

protected

attr_reader :num, :den

## this class is not finished
end