# ---------------------------------------------------
# Reading files with file Class don't create instance
# ---------------------------------------------------

file = "/Users/calopez/Ruby/files/ticket2.rb"

full_text = File.read file
line      = File.readlines file

puts full_text # A string containing the entire contents of the file

p line # An array of lines

# Anyway, most of the time, you’ll want to do something more complex 
# and/or more effi- cient than reading the entire contents of a file 
# into a string or an array at one time.