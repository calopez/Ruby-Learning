re = /(?<first>\w+)\s+((?<middle>\w\.)\s+)?(?<last>\w+)/

m = re.match("Carlos A. Lopez")

p m

puts "First Name : #{m[:first]}"
puts "Second Name: #{m[:middle]}"
puts "Last Name  : #{m[:last]}"

p $~