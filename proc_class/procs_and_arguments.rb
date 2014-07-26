
pr = Proc.new { |x| puts "Called with argument #{x}" }
pr.call 100

# can be called with any number of arguments, including none. 
# If it’s called with no arguments, its single parameter gets set to nil:
pr.call
# If it’s called with more than one argument, the single parameter is bound to 
# the first argument, and the remaining arguments are discarded:

pr.call 1,2,3