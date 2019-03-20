draw_set_color(c_white);
draw_text(10, 10, "Server Status: " + string(server > 0));
draw_text(5, 20, "Total Clients: " + string(ds_list_size(sockets)));