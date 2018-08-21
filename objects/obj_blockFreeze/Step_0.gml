countdown--;
var t1 = tilemap_get_at_pixel(tilemap,x+16,y+16)& tile_index_mask;
if(countdown <= 0)
	instance_destroy();
if(t1==0)
	instance_destroy();