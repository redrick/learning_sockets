require 'socket'

class ChatServer

	def initialize(port)
		@descriptors = Array::new
		@serverSocket = TCPServer.new("", port)
		@serverSocket.setsockopt(Socket::SOL_SOCKET, Socket::SO_REUSEADDR, 1)
		printf("Chatserver started on port "+port.to_s+"\n")
		@descriptors.push(@serverSocket)
	end

	def run
		while true
			res = select(@descriptors, nil, nil, nil)

			if res != nil 
				for sock in res[0]
					if sock == @serverSocket
						accept_new_connection
					else 
						if sock.eof?
							str = sprintf("Client left "+sock.peeraddr[2].to_s+" "+sock.peeraddr[1].to_s+"\n")
							broadcast_string(str, sock)
							sock.close
							@descriptors.delete(sock)
						else
							str = sprintf(sock.peeraddr[2].to_s+" "+sock.peeraddr[1].to_s+" "+sock.gets().to_s+"\n")
							broadcast_string(str, sock)
						end
					end
				end
			end
		end
	end
	
	private

		def broadcast_string(str, omit_sock)
			@descriptors.each do |clisock|
				if clisock != @serverSocket && clisock != omit_sock
					clisock.write(str)
				end
			end

			print(str)
		end

		def accept_new_connection
			newsock = @serverSocket.accept
			@descriptors.push(newsock)
			newsock.write("You are now connected to my RubyChatServer!\n")
			str = sprintf("New client joined"+newsock.peeraddr[2].to_s+" "+newsock.peeraddr[1].to_s+"\n")
			broadcast_string(str,newsock)
		end
	
end