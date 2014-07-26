# --------------------
# pos and seed methods
# --------------------
f = File.new "/Users/calopez/Ruby/files/ticket2.rb"

puts "#{f.pos}. #{f.gets}" 
puts "#{f.pos}. #{f.gets}" 
puts "#{f.pos}. #{f.gets}" 

f.pos = 48
puts "#{f.pos}.      #{f.gets}" 

f.pos = 53
puts "#{f.pos}.           #{f.gets}"


# The seek method lets you move around in a file by moving the position pointer 
# to a new location. 
# 
# The location can be a specific offset into the file, 
# or it can be relative to either the current pointer position or the end of the file. 
# You specify what you want using special constants from the IO class:

f.seek(20, IO::SEEK_SET)
f.seek(15, IO::SEEK_CUR)
f.seek(-10, IO::SEEK_END)


