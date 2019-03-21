var eventType = ds_map_find_value(async_load, "type");

switch(eventType) {
	
	case network_type_data:
	
		var buffer = ds_map_find_value(async_load, "buffer");
		buffer_seek(buffer, buffer_seek_start, 0); // move our write READ index to the beginning of the buffer
		handle_incoming_packets(buffer);
	
	break;
}