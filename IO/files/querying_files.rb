# Does the file exist
FileTest.exist?("/usr/local/src/ruby/README")

# Is the file a directory? A regular file? A symbolic link?

FileTest.directory?("/home/users/dblack/info")
FileTest.file?("/home/users/dblack/info")
FileTest.symlink?("/home/users/dblack/info")

# This family of query methods also includes blockdev?, pipe?, chardev?, and
# socket?.


# Is a file readable? Writable? Executable?

FileTest.readable?("/tmp")
FileTest.writable?("/tmp")
FileTest.executable?("/home/users/dblack/setup")
# It also includes variants of the basic three methods with _real appended.
# These test the permissions of the script’s actual runtime ID as opposed to
# its effective user ID.

# What is the size of this file? Is the file empty (zero bytes)?

FileTest.size("/home/users/dblack/setup")
FileTest.zero?("/tmp/tempfile")
