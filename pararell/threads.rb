# A new thread starts executing immediately, 
# but the execution of the code around the thread doesn’t stop.
# If the program ends while one or more threads are running,
# those threads are killed:

t = Thread.new do
puts 'Starting the thread'
sleep 1
puts 'At the end of the thread'
end

puts 'Outside the thread'

# what if we want to allow the thread to finish executing? 
# To do this, we have to use the instance method join:

## t.join   <<--- UNCOMMENT


# In addition to joining a thread, you can manipulate it in a variety of other ways, 
# including killing it, putting it to sleep, waking it up, and forcing it 
# to pass control to the next thread scheduled for execution.


# Killing, stopping, and starting threads:

puts "Trying to read some files..."

t = Thread.new do
  (0..2).each do |n|
    begin
      File.open("part0#{n}") do |f|
        text << f.readlines
      end
    rescue Errno::ENOENT
      puts "Message from thread: Failed on n=#{n}"
      Thread.exit # terminate
    end
    end
  end
  t.join
  puts "Finished!"


  # t.status, t.stop, t.stop?, t.alive?, t.wakeup