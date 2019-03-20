var eventType = ds_map_find_value(async_load, "type");

switch(eventType) {
	case network_type_connect:
	
		var socket = ds_map_find_value(async_load, "socket");
		ds_list_add(sockets, socket);
		
		new_notification("New player has connected.");
		
	break;
	
	case network_type_disconnect:

		var socket = ds_map_find_value(async_load, "socket");
		var socketIndex = ds_list_find_index(sockets, socket);
		
		if (socketIndex >= 0)
			ds_list_delete(sockets, socketIndex);
			
		new_notification("A player has left.");
		
	break;
	
	case network_type_data:
	
		var buffer = ds_map_find_value(async_load, "buffer");
		var socket = ds_map_find_value(async_load, "id");
		buffer_seek(buffer, buffer_seek_start, 0); // move our write READ index to the beginning of the buffer
		handle_incoming_packets(buffer, socket);
	
	break;
}