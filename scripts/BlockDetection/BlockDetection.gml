//vertical move
y+=dy;
if(dy>0) { //downwards
	if(t1==0 && t2 == 0){
		if(!crouching)
			sprite_index = spr_playerJumpDown;
	}
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	if(!crouching &&(t1 !=0 || t2!=0))	{
		y = ((bbox_bottom & ~31) - 1) - sprite_bbox_bottom;
		v_speed = 0;
		dy = 0;
	}
	else if (t1 !=0 || t2!=0)
	{
		y = ((bbox_bottom & ~31) - 1) - sprite_bbox_bottom + 16;
		v_speed = 0;
		dy = 0;
	}
	if(position_meeting(bbox_left,(bbox_bottom + dy ), obj_objTest) || position_meeting(bbox_right, (bbox_bottom + dy ), obj_objTest))
		{
		
			while(dy >= 0 && (position_meeting(bbox_left,(bbox_bottom + dy), obj_objTest) || position_meeting(bbox_right, (bbox_bottom + dy ), obj_objTest)))
			{
				dy -= 1;
			}
			y+=dy;
			dy=0;
			v_speed = 0;
		}
	
}
else if(dy<0) { //upwards
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	if(!crouching && (t1 !=0 || t2!=0))	{
		y = ((bbox_top + -32 + sprite_height) & ~31) - sprite_bbox_top + 2;
		v_speed = 0;
		dy = 0;
	}
	else if (t1 !=0 || t2!=0)
	{
		y = ((bbox_top + -32 + sprite_height) & ~31) - sprite_bbox_top + +18;
		v_speed = 0;
		dy = 0;
	}
	if(position_meeting(bbox_left,(bbox_top + dy - 1), obj_objTest) || position_meeting(bbox_right, (bbox_top + dy - 1), obj_objTest))
		{
		y+=1;
			while(dy <= 0 && (position_meeting(bbox_left,(bbox_top + dy - 1), obj_objTest) || position_meeting(bbox_right, (bbox_top + dy - 1), obj_objTest)))
			{
				dy += 1;
			}
			y+=dy;
			dy=0;
			v_speed = 0;
		}
}


//Running

//horizontal move
x+=dx;
if(!crouching){
if(dx>0) { //rightwards
	leftBlock = false;
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right+1, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right+1, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_right+1, bbox_bottom-32) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3!=0)	{
		x = ((bbox_right + 1 & ~31) -1) - sprite_bbox_right;
		dx = 0;
		rightBlock = true;
	}
	if(position_meeting((bbox_right + dx + 1), bbox_top+2, obj_objTest) || position_meeting((bbox_right + dx + 1), bbox_bottom, obj_objTest) || position_meeting((bbox_right + dx+ 1), -2+(bbox_top-bbox_bottom)/2, obj_objTest))
	{
		while(dx >= 0 && (position_meeting((bbox_right + dx + 1), bbox_top+4, obj_objTest) || position_meeting((bbox_right + dx + 1), bbox_bottom, obj_objTest) || position_meeting((bbox_right + dx+ 1), -2+(bbox_top-bbox_bottom)/2, obj_objTest)))
		{
			dx -= 1;
		}
		x+=dx;
		dx=0;
	}
}
else { //leftwards
	if(dx<0){
		rightBlock = false;
	}
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left-1, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_left-1, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_left-1, bbox_bottom-32) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3 != 0)	{
		leftBlock = true;
		x = ((bbox_left + 16 & ~31) + 1) - sprite_bbox_left;
		dx = 0;
	}
	if(position_meeting((bbox_left + dx - 1), bbox_top+2, obj_objTest) || position_meeting((bbox_left + dx - 1), bbox_bottom, obj_objTest) || position_meeting((bbox_left + dx - 1), -2+(bbox_top-bbox_bottom)/2, obj_objTest))
	{
		while(dx <= 0 && (position_meeting((bbox_left + dx - 1), bbox_top+4, obj_objTest) || position_meeting((bbox_left + dx - 1), bbox_bottom, obj_objTest) || position_meeting((bbox_left + dx - 1), -2+(bbox_top-bbox_bottom)/2, obj_objTest)))
		{
			dx += 1;
		}
		x+=dx;
		dx=0;
	}
}
}
