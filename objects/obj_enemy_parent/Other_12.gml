/// @description Take Damage
// You can write your code in this editor
var projectileId = instance_place(x,y,obj_projectileTest);
if(projectileId != noone)
{
	instance_destroy(projectileId);
	health -= 2;
}