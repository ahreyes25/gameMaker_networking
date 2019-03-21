var buffer = argument0;
var socket = argument1;
var msgId  = buffer_read(buffer, buffer_u8); // unsigned int of size 8 bytes

switch(msgId) {
	
	case 1: // latency request tag => 1
	
		var time = buffer_read(buffer, buffer_u32);
		buffer_seek(global.buffer, buffer_seek_start, 0);
		
		buffer_write(global.buffer, buffer_u8, 1); // write back to the buffer
		buffer_write(global.buffer, buffer_u32, time);
		network_send_packet(socket, global.buffer, buffer_tell(global.buffer));
	
	break;
}