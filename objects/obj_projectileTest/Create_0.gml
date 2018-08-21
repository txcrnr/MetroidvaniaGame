if((keyboard_check(vk_right)-keyboard_check(vk_left))==0 && (keyboard_check(vk_down)-keyboard_check(vk_up))==0)
	firingDirection = [spr_playerTest.image_xscale*1,0]
else
	firingDirection = [(keyboard_check(vk_right)-keyboard_check(vk_left)),(keyboard_check(vk_down)-keyboard_check(vk_up))];
spd = 10;

var l = layer_get_id("Collision_Map");

tilemap = layer_tilemap_get_id(l);

image_angle = point_direction(x,y,x+firingDirection[0],y+firingDirection[1]);

if(obj_playerTest.shotType == "normal")
	image_index = 1;
else if(obj_playerTest.shotType == "ice")
	image_index = 2;
	