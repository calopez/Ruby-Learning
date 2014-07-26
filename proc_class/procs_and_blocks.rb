# Procs and blocks and how they differ

[1,2,3].each { |x| puts x * 10 }


# A method can capture a block, objectified into a proc,
# using the special parame- ter syntax:

def call_a_block(&block)
  block.call
end

call_a_block { puts "I'm the block ... or Proc .. or something.." }

# But it’s also possible for a proc to serve in place of the code block in a method call,
# using a similar special syntax:

p = Proc.new { |x| puts x.upcase }

%w{ David Black }.each(&p)


# CAPTURING A CODE BLOCK AS A PROC:
# What happens is a kind of implicit call to Proc.new, using the same block.
# The proc thus created is bound to the parameter block:

def capture_block(&block)
  block.call
end

a = capture_block { puts "Inside the block" } ## the block turns in a Proc.new { ... }
## and passed as parameter to capture_block

## USING PROCS FOR BLOCKS
#
p = Proc.new { puts "This proc argument will serve as a code block." }
capture_block(&p)



# DONT DO THIS:  capture_block(&p) { puts "This is the explicit block" }
# it will result in the error: both block arg and actual block given
# ---------------------------------------------------------------------


# Using Symbol#to_proc for conciseness
# -------------------------------------

puts %w{ david black }.map(&:capitalize) # ==> %w{ david black }.map {|str| str.capitalize }
# knowing how it parses—knowing that :capitalize is a symbol and & is a to_proc trigger—allows y
# ou to interpret it correctly and appreciate its expressiveness.
#
puts %w{ david black }.map &:capitalize


# --------------------
# PROCS AS A CLOUSURES
# --------------------
#
def multiply_by(m)
  Proc.new { |x| puts x * m }
end

mult = multiply_by(10)
mult.call 12

# other example:

def call_some_proc(pr)
  a = "irrelevant 'a' in method scope"
  puts a
  pr.call # the 'a' variable defined in the used in Proc definition remain unaltered.
end
a = "'a' to be used in Proc block"
pr = Proc.new { puts a }
pr.call
call_some_proc(pr)

# the classic clousure example is a counter:

def make_counter
  n = 0
  return Proc.new { n += 1 }
end

c = make_counter
puts "counting #{c.call}"
d = make_counter
puts "counting #{d.call}"

puts d.call
puts c.call
puts c.call
puts c.call

# Alternative techniques for calling callable objects

mult = lambda { |x, y| x * y }
puts "Alternative techniques for calling callable objects mult[] --> #{mult[3,4]}" 
puts "Alternative techniques for calling callable objects mult.()--> #{mult.(3,4)}" 







