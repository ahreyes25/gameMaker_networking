if (instance_exists(oMessage))
	with (oMessage)
		instance_destroy();
		
var notification = instance_create_layer(0, 0, "Instances", oMessage);
notification.message = argument0;