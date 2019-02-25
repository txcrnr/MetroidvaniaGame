if(global.playerHp%10 == 0)
{
	batFrac = 10;
	fullBats = floor(global.playerHp/10) - 1;
}
else
{
	fullBats = floor(global.playerHp/10);
	batFrac = global.playerHp - (10*fullBats);
}

testTimer += 1;
if(testTimer > 200)
	global.playerHp = 60;


sprite_index = hudSprs[batFrac];

for(n = 0; n < batNum; n++)
{
	if(batteries[n] == noone)
	{
		batteries[n] = instance_create_layer(x,y,"Instances",obj_batFull);
		batteries[n].image_xscale = 2;
		batteries[n].image_yscale = 2;
		batteries[n].depth = -100;
	}
		
	batteries[n].x = camera_get_view_x(view_camera[0]) + 184 + (n%4 * 20);
	
	if(n > fullBats)
	{
		batteries[n].sprite_index = spr_batEmpty;
	}
	else if(n = fullBats)
	{
		if(batFrac = 10)
			batteries[n].sprite_index = spr_batFull;
		else
			batteries[n].sprite_index = spr_batMid;
	}
	else
	{
		batteries[n].sprite_index = spr_batFull;
	}
	
	if(n < 4)
		batteries[n].y = camera_get_view_y(view_camera[0]) + 4;
	else
		batteries[n].y = camera_get_view_y(view_camera[0]) + 20;
}


x = camera_get_view_x(view_camera[0]);
y = camera_get_view_y(view_camera[0]);