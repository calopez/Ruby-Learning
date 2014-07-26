# You can do this either direction—regexp objects
# and string objects both respond to match, and both of these examples succeed 
# and print "Match!":

puts "Match!" if /abc/.match("The alphabet starts with abc.")

puts "Match!" if "The alphabet starts with abc.".match(/abc/)


# In addition to the match method, Ruby also features a pattern-matching 
# operator, =~ (equal sign and tilde), which goes between a string and a regexp:
# 
puts "Match!" if /abc/ =~ "carlos andres abc."
# As you might guess, this pattern-matching “operator” is an instance method 
# of both the String and Regexp classes.


## DIFERENCES
## ----------

 # >> "The alphabet starts with abc" =~ /abc/
 # => 25
 # >> /abc/.match("The alphabet starts with abc.")
 # => #<MatchData "abc">


## ESPECIAL CHARACTERES

#(^ $ ? . / \ [ ] { } ( ) + *)

## CAPTURING MATCHES

line_from_file = "Peel,Emma,Mrs.,talented amateur"
r = /([A-Za-z]+),[A-Za-z]+,(Mrs?\.)/.match(line_from_file)

puts "Dear #{$2} #{$1}," # or alternatively r[1], r[2]









