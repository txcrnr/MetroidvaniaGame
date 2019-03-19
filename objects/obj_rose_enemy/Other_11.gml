/// @description Attack
// You can write your code in this editor
attackCooldown++;
plrID = collision_rectangle(bbox_left-128,bbox_top-128,bbox_right+128,bbox_bottom+128,obj_playerTest,false,true);
if(attackCooldown >= attackTimer && plrID != noone)
{
	image_index = 0;
	image_speed = 1;
	
	//Left
	thorn1 = instance_create_layer(x,(y+bbox_bottom)/2,"Instances",obj_thorn);
	thorn1.xDir = -1;
	thorn1.yDir = 0;
	
	//Top Left
	thorn2 = instance_create_layer(x,y,"Instances",obj_thorn);
	thorn2.xDir = -1;
	thorn2.yDir = -1;
	thorn2.image_angle = -45;
	
	//Top
	thorn3 = instance_create_layer((x+bbox_right)/2,y,"Instances",obj_thorn);
	thorn3.xDir = 0;
	thorn3.yDir = -1;
	thorn3.image_angle = -90;
	
	//Top Right
	thorn4 = instance_create_layer(bbox_right,y,"Instances",obj_thorn);
	thorn4.xDir = 1;
	thorn4.yDir = -1;
	thorn4.image_angle = -135;
	
	//Right
	thorn5 = instance_create_layer(bbox_right,(y+bbox_bottom)/2,"Instances",obj_thorn);
	thorn5.xDir = 1;
	thorn5.yDir = 0;
	thorn5.image_angle = 180;
	
	//Bottom Right
	thorn6 = instance_create_layer(bbox_right,bbox_bottom,"Instances",obj_thorn);
	thorn6.xDir = 1;
	thorn6.yDir = 1;
	thorn6.image_angle = 135;
	
	//Bottom
	thorn7 = instance_create_layer((x+bbox_right)/2,bbox_bottom,"Instances",obj_thorn);
	thorn7.xDir = 0;
	thorn7.yDir = 1;
	thorn7.image_angle = 90;
	
	//Bottom Left
	thorn8 = instance_create_layer(x,bbox_bottom,"Instances",obj_thorn);
	thorn8.xDir = -1;
	thorn8.yDir = 1;
	thorn8.image_angle = 45;
	
	attackCooldown = 0;
	plrID = noone;
}