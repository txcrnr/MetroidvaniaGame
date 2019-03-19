/// @description Damage Player
// You can write your code in this editor
plrID = collision_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,obj_playerTest,false,false)
if(plrID != noone)
{
	if(plrID.damageTimer == 0)
	{
		with(plrID)
		{
			event_user(0);
		}
		instance_destroy();
	}
	plrID = noone;
}