f = File.new "/Users/calopez/Ruby/files/ticket2.rb"

# you can use read to read the whole file in a single string 
puts f.read

# rewind operation moves the File object’s internal position pointer 
# back to the beginning of the file:
f.rewind
# gets read next line of the file:
# 
puts "1  " + f.gets
puts "2  " + f.gets
puts "3  " + f.gets 
puts "4  " + f.gets 
puts "5  " + f.gets 

# use readlines If you want to get the entire file at once as an array of lines
f.rewind
p f.readlines
f.close

# Keep in mind that File objects are ENUMERABLE.
# 
f = File.new "/Users/calopez/Ruby/files/ticket2.rb"
f.each {|line| puts "Next line: #{line}"}
