d = Dir.new('/Users/calopez/Ruby/IO/files/')

p d
p d.entries
puts "\n\n"
p Dir.entries('/Users/calopez/Ruby/IO/files')


entries = d.entries
puts "\n\n"
entries.delete_if {|entry| entry =~ /^\./ }
p entries
puts "\n\n"
entries.map! {|entry| File.join(d.path, entry) }
p entries
entries.delete_if {|entry| puts  !File.file?(entry) }
print "Total bytes: "
puts entries.inject(0) {|total, entry| total + File.size(entry) }

p Dir["*dire*"]

# dir = "/usr/local/src/ruby/lib/minitest"
# entries = Dir["#{dir}/*"].select {|entry| File.file?(entry) }
# print "Total bytes: "
# puts entries.inject(0) {|total, entry| total + File.size(entry) }