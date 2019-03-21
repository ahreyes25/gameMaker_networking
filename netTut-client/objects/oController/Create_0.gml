socket			= network_create_socket(network_socket_tcp);
ip				= "127.0.0.1";
isConnected		= network_connect(socket, ip, 50000);
global.buffer	= buffer_create(1024, buffer_fixed, 1);
latency			= 0;

new_notification("Client initialized.");