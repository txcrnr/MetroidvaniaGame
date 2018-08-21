x += (spd * firingDirection[0]);
y += (spd * firingDirection[1]);

var t1 = tilemap_get_at_pixel(tilemap, bbox_right - (bbox_right - bbox_left)/2, bbox_top)& tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap, bbox_right - (bbox_right - bbox_left)/2, bbox_bottom)& tile_index_mask;
var t3 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top - (bbox_top - bbox_bottom)/2)& tile_index_mask;
var t4 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top - (bbox_top - bbox_bottom)/2)& tile_index_mask;

if(t1 !=0)	{ // top
	if(obj_playerTest.shotType == "ice")
		instance_create_layer(((bbox_left+((bbox_right - bbox_left)/2)) & ~31),((bbox_top - 1) & ~31), "Instances", obj_blockFreeze);
	instance_destroy();
}

else if(t2 !=0)	{ // bottom
	if(obj_playerTest.shotType == "ice")
		instance_create_layer(((bbox_left+((bbox_right - bbox_left)/2)) & ~31),((bbox_bottom + 1) & ~31),"Instances",obj_blockFreeze);
	instance_destroy();
}

else if(t3 !=0)	{ // right
	if(obj_playerTest.shotType == "ice")
		instance_create_layer(((bbox_right + 1) & ~31), ((bbox_bottom - (bbox_bottom - bbox_top)/2) & ~31),"Instances",obj_blockFreeze);
	instance_destroy();
}

else if(t4 !=0)	{ // left
	if(obj_playerTest.shotType == "ice")
		instance_create_layer(((bbox_left - 1) & ~31), ((bbox_bottom - (bbox_bottom - bbox_top)/2) & ~31),"Instances",obj_blockFreeze);
	instance_destroy();
}