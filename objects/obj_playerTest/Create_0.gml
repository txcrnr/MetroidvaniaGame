//player vars
move_speed = 6;
jump_force = 10;
grav = 0.25;
v_speed = 0;
dx = 0;
crouching = false;
onIce = false;
stuckCrouch = false;
spr_custom = 0;
shotTimer = 15;
switchCooldown = 0;
aimingDirection = [1,0]
shotType = "normal";
aimdirection = "straight";
turncount = 0;
damageIFrames = 60;
damageTimer = 0;

//tile info
var l = layer_get_id("Collision_Map");
tilemap = layer_tilemap_get_id(l);

//sprite info 
sprite_bbox_left = sprite_get_bbox_left(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_right = sprite_get_bbox_right(sprite_index) - sprite_get_xoffset(sprite_index);
sprite_bbox_top = sprite_get_bbox_top(sprite_index) - sprite_get_yoffset(sprite_index);
sprite_bbox_bottom = sprite_get_bbox_bottom(sprite_index) - sprite_get_yoffset(sprite_index);

hudObj = instance_create_layer(x,y,"Instances",obj_hud);