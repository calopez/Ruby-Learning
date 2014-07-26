f = File.new "/Users/calopez/Ruby/files/ticket2.rb"

puts f.getc # Read a character
puts f.ungetc 'X' # put a character back onto the file input stream
puts f.gets # read one line


# Just as readline differs from gets in that readline raises a 
# fatal error if you use it at the end of a file, the methods readchar and 
# readbyte differ from getc and getbyte, respectively, in the same way.

puts f.gets
puts f.gets
puts f.gets 
puts f.gets # end file or last line

f.getc # nil
#f.readchar #raise a EOFError exception

f.getbyte # nil
#f.readbyte  #raise a EOFError exception


f.close