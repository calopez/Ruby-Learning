# THE STANDARD I/O GLOBAL VARIABLES
# The main difference between STDIN and $stdin (and the other pairs likewise)
# is that you’re not supposed to reassign to the constant but you can reassign to 
# the variable. 
# 
# The variables give you a way to modify default standard I/O stream behaviors 
# without losing the original streams.

record = File.open("/tmp/record", "w")
old_stdout = $stdout
$stdout = record
$stderr = $stdout

puts "this is a record"

z = 10/0 # the Exception and the follow line are put in STDERR
STDERR.puts "There is a problem!!!"