require 'socket'

#example socket Ipv4
# = Socket.new(Socket::AF_INET, Socket::SOCK_STREAM)

#example socket Ipv6 with symbols instead of constants
#socket = Socket.new(:INET6, :STREAM)

# initiatior = Client; listener = Server
# Server Lifecycle
#
# 1. create
# 2. bind
# 3. listen 
# 4. accept
# 5. close

# Server Bind
# This socket will bind to the loopback interface and will only
# be listeing for clients from localhost
#local_socket = Socket.new(:INET, :STREAM)
#local_addr = Socket.pack_sockaddr_in(4481, '127.0.0.1') # use ports between 1025-48999
#local_socket.bind(local_addr)

# This socket will bind to any of the known interfaces and will be 
# listening for any client that can route message to it.
# any_socket = Socket.new(:INET, :STREAM)
# any_addr = Socket.pack_socaddr_in(4481, '0.0.0.0')
# any_socket.bind(any_addr)


# Create de server socket.
server = Socket.new(:INET, :STREAM)
addr = Socket.pack_sockaddr_in(4481, '0.0.0.0')
server.bind(addr)
server.listen(128) # Tell it to listen for incoming connections (recall: listen queue)
                   # Maximum allowed Socket::SOMAXCONN constant.
                   # 128 is the maximun number of pending connections (listen queue)
# Accept a connection.

# Enter a endless loop of accepting and handling connections
loop do
      connection, _ = server.accept # The accept call is a blocking call. 
                                    # It will block the current
                                    # indefinitely until it receives a new connection
                                    # <accept> return a connection
      connection.close
end 
                            
                              
                              
print "Connection class:"
p connection.class                              
                            
print "\nConnection Fileinfo:"
p connection.fileno

print "\nServer Fileinfo:"
p server.fileno

print "\nLocal Address:"
p connection.local_address

print "\nRemote Address"
p connection.remote_address

# Run the script and write in the console: echo ohai | nc localhost 4481
# as result the script will show up:

#Connection class:Socket
#Connection Fileinfo:10
#Server Fileinfo:9
#Local Address:#<Addrinfo: 127.0.0.1:4481 TCP>
#Remote Address#<Addrinfo: 127.0.0.1:53240 TCP>

# The file descriptor number is the kernel's method for keeping track of open files in the 
# current process. Yes, sockets are files, at leats in Unix land

































