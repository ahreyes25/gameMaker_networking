#region Notes
	#region Network Type
	//	- TCP
	//	-	Most reliable form of communication. Send a packet and then wait
	//		for a message to say that it has been received, and then we do NOT
	//		send it again. It can be slower, but we are guaranteeing that our
	//		packet gets delivered.
	//	- UDP
	//	-	Repeatedly "spam" data regardless of whether or not it gets received.
	//		This method does not guarantee that our packet gets delivered, but is
	//		faster.
	#endregion
			
	#region Buffer Type
	//	- buffer_grow
	//	-	Buffer will grow in size if a packet that is larger than the specified
	//		size is received. If buffer size is 1024 and a packet of 1025 comes in,
	//		the new buffer will be 1025 and will never automatically reduce in size,
	//		but can continue to automatically grow in size to continuously match the
	//		largest packet receieved
	//	- buffer_wrap
	//	-	When a packet that is larger than the buffer size is received, it will
	//		store all 1024, and then wrap the data around to the back of the buffer
	//		overwritting the data already stored there.
	#endregion
	
	#region Buffer Alignment
	#endregion
#endregion

networkType		= network_socket_tcp;
port			= 50000;
maxPlayers		= 32;
bufferSize		= 1024; // 1KB
bufferType		= buffer_fixed;
bufferAlignment = 1;

// Create server, buffers, and sockets
server			= network_create_server(networkType, port, maxPlayers); // returns 1 if server created successfully
global.buffer	= buffer_create(bufferSize, bufferType, bufferAlignment); // global WRITE buffer
sockets			= ds_list_create();

new_notification("Server is up.");