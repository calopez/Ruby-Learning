lam = -> { puts "Hi!!!"}

lam.call

mult = ->(x, y) { x * y }

p mult.call(9, 5)