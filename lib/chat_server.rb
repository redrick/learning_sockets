require 'socket'

class ChatServer

	def initialize(port)
		@descriptors = Array::new
		@serverSocket = TCPServer.new("", port)
		@serverSocket.setsockopt(Socket:SOL_SOCKET, Socket::SO_REUSEADDR, 1)
		printf("Chatserver started on port "+port+"\n")
		@descriptors.push(@serverSocket)
	end

	def run
		
	end
	
	private

		def broadcast_string(str, omit_sock)
			
		end

		def accept_new_connection
			
		end
	
end