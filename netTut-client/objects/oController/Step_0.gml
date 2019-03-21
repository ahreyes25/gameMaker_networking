// Update latency
buffer_seek(global.buffer, buffer_seek_start, 0);
buffer_write(global.buffer, buffer_u8, 1); // write tag
buffer_write(global.buffer, buffer_u32, current_time); // write data
network_send_packet(socket, global.buffer, buffer_tell(global.buffer)); // buffer_tell => buffer_size