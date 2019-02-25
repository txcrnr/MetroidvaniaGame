eventNumber = 0;
waitTimer = 0;
sat = instance_create_layer(266, 200, "Instances", obj_satellite);
planet = instance_create_layer(512, 64, "Instances", obj_planet);
ast = instance_create_layer(1056, 598, "Instances", obj_asteroid);
textOverlay = instance_create_layer(256, 576, "Instances", obj_text);
textB = instance_create_layer(256, 576, "Instances", obj_textBox);
defaultLen =  (2 * sprite_get_width(spr_textBoxBG) - 48);

#region //Initialization of screen objs

with(sat)
{
	image_xscale = 2.5;
	image_yscale = 3;
	image_angle = -45;
	depth = -15
	image_speed = 0;
}

with(ast)
{
	image_xscale = .75;
	image_yscale = .75;
	image_angle = 0;
	depth = -20
}

with(planet)
{
	image_xscale = 3;
	image_yscale = 3;
	image_angle = 0;
	depth = -10;
}

with(textB)
{
	image_xscale = 4;
	image_yscale = 4;
	image_speed = 0;
}

with(textOverlay)
{
	image_xscale = 2;
	image_yscale = 2;
}
#endregion


scr_changeText(textOverlay,defaultLen, "", false);

