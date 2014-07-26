

puts "What does it mean to say that greedy quantifiers"
puts "give you as many characters as they can:\n\n"

string = "abc!def!ghi!"
match = /.+!/.match(string)
puts "Example 1>. #{match[0]}"

r = /(\d+)(5)/.match("Digits-R-Us 2345")
puts "Example 2>. #{[r[1], r[2]]}"
puts "\n"

puts "We can make + as well as * into non-greedy quantifiers"
puts "by putting a question mark after them:\n\n"
match = /.+?!/.match(string)
puts "Example 3>. #{match[0]}"


/(\d+?)/.match("Digits-R-Us 2345")
puts "Example 4>. #{$1}"


## This is other topic but worth see it:

# The point of the x modifier is to let you add comments
# to your regular expressions:

my_re = /
         \((\d{3})\)  # 3 digits inside literal parens (area code)
           \s         # One space character
         (\d{3})      # 3 digits (exchange)
            -         # Hyphen
         (\d{4})      # 4 digits (second part of number
        /x
