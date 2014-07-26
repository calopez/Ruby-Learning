# Ruby provides an alternate way to open files that puts the housekeeping
# task of closing the file in the hands of Ruby: File.open with a code block:

File.open("text_files/records.txt") do |f|
  while record = f.gets
    # chomp method remove the final new- line character, if any.
    name, nationality, instrument, dates = record.chomp.split('|')
    puts "#{name} (#{dates}), who was #{nationality}, played #{instrument}"
  end
end



# Thanks to the fact that ENUMERABLE is among the ancestors of File,
# you can replace the while idiom in the previous example with each:


File.open("text_files/records.txt") do |f|
  f.each do |record|
    name, nationality, instrument, dates = record.chomp.split('|')
    puts "#{name} (#{dates}), who was #{nationality}, played #{instrument}"
  end
end
