var buffer = argument0;
var msgId  = buffer_read(buffer, buffer_u8); // unsigned int of size 8 bytes

switch(msgId) {
	
	case 1: // latency request tag => 1
	
		var time = buffer_read(buffer, buffer_u32);
		latency = current_time - time;
	
	break;
}