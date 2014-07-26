file = "text_files/data.out"

f = File.new(file, "w")  # create a the file or overwrite if it already exist

f.puts "Carlos A. Lopez, Rubyist"
f.close

puts File.read(file)

f = File.new(file, 'a') # append lines to the file
f.puts "diggin into Ruby"
f.close

puts File.read(file)