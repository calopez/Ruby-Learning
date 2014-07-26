# You create a Proc object by instantiating the Proc class,
# including a code block:
pr = Proc.new { puts "Inside a Proc's block" }

pr.call

# The proc method takes a block and returns a Proc object.
pr2 = proc { puts "Hi!!" } # proc serve as a synonym for lambda
pr2.call

# although there are still two variants of the Proc object, 
# Proc.new and proc do the same thing, 
# whereas lambda produces the other variant.

