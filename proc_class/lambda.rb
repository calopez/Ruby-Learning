lam = lambda { puts "A lambda" }

lam.call

#direrences between Proc's and lambdas

# 1. you cannot create lambdas explicity like Proc's ex. def m(&block)
# 2. 'return' inside a lambda triggers and exit from the body of the lambda
#    'return' inside a proc triggers a return from the method in which the proc
#     is being executed. here is illustration:

def return_test
  l = lambda { return }
  l.call
  puts "Still here!!"
  p = Proc.new { return }
  p.call
  puts "You won't see this message!"
end

return_test


# 3. Finally, and most important, lambda-flavored procs don’t like being called with 
# the wrong number of arguments. They’re fussy:

a = Proc.new { |x| puts "I'm #{x}" }
b = lambda { |x| puts "I'm #{x}" }

a.call
#b.call  # ==> wrong number of arguments (0 for 1) (ArgumentError)


