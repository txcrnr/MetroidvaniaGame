
#region //Ground Check
var dy = v_speed;
v_speed += grav;
//Looks for ground below player
var t1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom+1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom+1) & tile_index_mask;
if(actionState == "crouch"){
var b1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_top-2) & tile_index_mask;
var b2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_top-2) & tile_index_mask;
}
else 
{
var b1 = 0;
var b2 = 0;
}



if(dy < -0.5 && actionState != "crouch"){
	sprite_index = spr_playerJumpUp;
}

if(actionState != "crouch"){
if(t1!=0 || t2!=0) {
	if(keyboard_check(vk_space)){
		sprite_index = spr_playerJumpUp;
		actionState = "jump";
		v_speed = -jump_force;
		dy = v_speed;
	}
}
}
#endregion

#region //Items
if(itemsList.jumpBoots == true)
	jump_Force = 12;
#endregion

#region //Ice check
if(position_meeting(bbox_left,(bbox_bottom+1),obj_blockFreeze) || position_meeting(bbox_right,(bbox_bottom+1),obj_blockFreeze))
onIce = true;
else
onIce = false;
#endregion

#region//player input
if (keyboard_check(ord("S")) && (actionState == "idle" || actionState == "running"))
{
	actionState = "crouch";
	sprite_index = spr_playerCrouch;
	y += 16;
	if(!onIce && (t1!=0||t2!=0))
		dx=0;
}
else if (actionState == "crouch" && keyboard_check(ord("W")) && (b1==0&&b2==0))
{
	actionState = "idle"
	sprite_index = spr_playerIdle;
	y -= 16;
}
else if(!onIce && actionState != "crouch"){
	if (keyboard_check(ord("D")) == keyboard_check(ord("A")))
	{
		dx = 7*dx/8;
	}
	else if(abs(dx)<move_speed && (keyboard_check(ord("D")) || keyboard_check(ord("A"))))
	{
		dx += ((move_speed/16) * (keyboard_check(ord("D"))-keyboard_check(ord("A"))));
	}
	else if (keyboard_check(ord("D")) || keyboard_check(ord("A")))
	{
		dx -= (.1*dx/abs(dx));
	}
	
}
else if (actionState != "crouch" && (abs(dx)<move_speed && (keyboard_check(ord("D")) || keyboard_check(ord("A")))))
{
	dx += ((move_speed/64) * (keyboard_check(ord("D"))-keyboard_check(ord("A"))));
}
else if (actionState == "crouch" && !onIce && (t1||t2))
{
	dx = 0;
}
#endregion

//vertical move
//downwards
#region
if(dy>0) { 
	if(t1==0 && t2 == 0){
		if(actionState != "crouch")
			sprite_index = spr_playerJumpDown;
			actionState = "falling";
	}
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom+1) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom+1) & tile_index_mask;
	if(actionState != "crouch" &&(t1 !=0 || t2!=0))	{
		y = ((bbox_bottom + 1 & ~31)) - sprite_bbox_bottom - 1;
		v_speed = 0;
		dy = 0;
	}
	else if (t1 !=0 || t2!=0)
	{
		y = ((bbox_bottom + 1 & ~31) - 1) - sprite_bbox_bottom + 16;
		v_speed = 0;
		dy = 0;
	}
	else 
	{
		var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom+dy+1) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom+dy+1) & tile_index_mask;
		if(t1 !=0 || t2!=0)
			{
				while(t1 !=0 || t2!=0)
				{
					dy -= 1;
					var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom+dy+1) & tile_index_mask;
					var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom+dy+1) & tile_index_mask;
				}
				y+=dy;
				dy=0;
				v_speed = 0;
			}
		
		else 
		{
			y+=dy;
		}
	}
}
#endregion
//upwards
#region
else if(dy<0) { 
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	if(actionState != "crouch" && (t1 !=0 || t2!=0))	{
		y = ((bbox_top + -32 + sprite_height) & ~31) - sprite_bbox_top;
		v_speed = 0;
		dy = 0;
	}
	else if (t1 !=0 || t2!=0)
	{
		y = ((bbox_top + -32 + sprite_height) & ~31) - sprite_bbox_top + 16;
		v_speed = 0;
		dy = 0;
	}
	else 
	{
		var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top+dy-1) & tile_index_mask;
		var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top+dy-1) & tile_index_mask;
		if(t1 !=0 || t2!=0)
			{
				while(t1 !=0 || t2!=0)
				{
					dy += 1;
					var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top+dy-1) & tile_index_mask;
					var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top+dy-1) & tile_index_mask;
				}
				y+=dy;
				dy=0;
				v_speed = 0;
			}
		
		else 
		{
			y+=dy;
		}
	}
}
#endregion


//Running

//horizontal move
#region
x+=dx;
if(actionState != "crouch"){
if(dx>0) { 
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right+2, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right+2, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_right+2, bbox_bottom-32) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3!=0)	{
		x = ((bbox_right +2 & ~31) -1 ) - sprite_bbox_right;
		dx = 0;
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
	}
	var t1 = tilemap_get_at_pixel(tilemap, bbox_left-2, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_left-2, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_left-2, bbox_bottom-32) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3 != 0)	{
		x = ((bbox_left + 14 & ~31) ) - sprite_bbox_left;
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
#endregion

//MODIFIED MOVE FOR CROUCHING
#region
if(actionState == "crouch"){
if(dx>0) { //rightwards
	var t1 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_right, bbox_bottom-16) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3!=0)	{
		x = ((bbox_right + 1 & ~31) -1) - sprite_bbox_right;
		dx = 0;
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

	var t1 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_top) & tile_index_mask;
	var t2 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom) & tile_index_mask;
	var t3 = tilemap_get_at_pixel(tilemap, bbox_left, bbox_bottom-16) & tile_index_mask;
	if(t1 !=0 || t2!=0 || t3 != 0)	{
		x = ((bbox_left + 32 & ~31) + 1) - sprite_bbox_left;
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
if(actionState == "crouch" && abs(dx)<=.01 && (b1!=0||b2!=0)){
	x -= image_xscale*.5;
	stuckCrouch = true;
}
else if(stuckCrouch == true && (b1==0 && b2==0)){
	dx = 0;
	stuckCrouch = false;
}
}
#endregion

//running code animation
#region
var t1 = tilemap_get_at_pixel(tilemap,bbox_left,bbox_bottom+1) & tile_index_mask;
var t2 = tilemap_get_at_pixel(tilemap,bbox_right,bbox_bottom+1) & tile_index_mask;
if(actionState != "crouch"){
if((abs(dx)>0.5 || keyboard_check(ord("D")) || keyboard_check(ord("A")))){
	if(t1!=0 || t2!=0)
		sprite_index = spr_playerRun;
		if(actionState == "idle")
			actionState = "running";
	if(dx<0){
		
		image_xscale = -1;
		
	}
	else if(dx>0){
		
		image_xscale = 1;
	}
	if(onIce)
	{
		image_speed = .5;
	}
	else
	{
		image_speed = 1;
	}
}

else if(t1!=0 || t2!=0) {
	if(keyboard_check(vk_up)){
		if(keyboard_check(vk_right && image_xscale > 0))
			sprite_index = spr_playerIdleUpDiag;
	}
	else
	{
		sprite_index = spr_playerIdle;
		actionState = "idle";
	}
}
}
#endregion

//Shooting
#region
if(keyboard_check(vk_shift) && shotTimer == 0)	{
	instance_create_layer(bbox_right,y,"Instances",obj_projectileTest);
	shotTimer = 15;
}
if(shotTimer>0)
	shotTimer--;
if(switchCooldown == 0 && keyboard_check(ord("F"))) 
{
	if(shotType == "normal")
		shotType = "ice";
	else if(shotType == "ice")
		shotType = "normal";
	switchCooldown = 1;
}
if(!keyboard_check(ord("F")))
{
	switchCooldown = 0;
}
#endregion

//Touch Enemy
#region
if(damageTimer == 0 && (position_meeting(bbox_left, bbox_top+2, obj_enemy_parent) || position_meeting( bbox_left, bbox_bottom,obj_enemy_parent) || position_meeting( bbox_right, bbox_top+2,obj_enemy_parent) || position_meeting( bbox_right, bbox_bottom,obj_enemy_parent)))
{
	damageTimer = damageIFrames;
	global.playerHp -= 1;
}

if(damageTimer > 0)
{
	damageTimer--;
}
#endregion

//Camera Update
#region
camera_set_view_pos(view_camera[0],(x-256),(y-192));
#endregion