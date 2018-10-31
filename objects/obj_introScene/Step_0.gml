#region //satellite move
with(sat)
{
	other.moveTime++;
	if(other.moveTime >= other.moveWait)
	{
		x += other.satX;
		y += other.satY;
		other.moveTime = 0;
	}
}
#endregion

waitTimer--;
if(waitTimer<=0)
{
	eventNumber += 1;
	switch(eventNumber)
	{
		case 1:
			#region //asteroid settings
			with(ast)
			{
				x_speed = -1;
				y_speed = -0.5;
				rotation = 1.25;
			}
			waitTimer = 700;
			break;
			#endregion
		default:
			break;
		case 2:
			#region //explosion creation
			for(z = 1; z<=70; z++)
			{
				xpl[z] = instance_create_layer((obj_satellite.x + irandom(64) - 32), (obj_satellite.y + irandom(64) + 96), "Instances", obj_explosion);
				//xpl[z] = instance_create_layer(256, 64, "Instances", obj_explosion);
				with(xpl[z])
				{	
					depth = -500;
					image_xscale = 2;
					image_yscale = image_xscale;
					parentObj = other.sat;
					countdown = 5 * other.z;
				}
			}
			waitTimer = 30;
			break;
			#endregion
		case 3:
			#region //Mini Asteroids
			sat.image_speed = 1;
			sat.image_index = 1;
			sat.rotate_speed = .1;
			astFrag1 = instance_create_layer(ast.x, ast.y, "Instances", obj_asteroid);
			astFrag1.image_xscale = 0.3;
			astFrag1.image_yscale = 0.3;
			astFrag1.depth = -12;
			with(astFrag1){
				x_speed = -1;
				y_speed = -1;
				rotation = 1.5
			}
			astFrag2 = instance_create_layer(ast.x, ast.y, "Instances", obj_asteroid);
			astFrag2.image_xscale = 0.35;
			astFrag2.image_yscale = 0.35;
			astFrag2.depth = -12;
			with(astFrag2){
				x_speed = -.5;
				y_speed = -1;
				rotation = .5
			}
			astFrag3 = instance_create_layer(ast.x, ast.y, "Instances", obj_asteroid);
			astFrag3.image_xscale = 0.25;
			astFrag3.depth = -12;
			astFrag3.image_yscale = 0.25;
			with(astFrag3){
				x_speed = -.75;
				y_speed = -.75;
				rotation = -3
			}
			instance_destroy(ast);
			waitTimer = 1;
			break;
			#endregion
	}
}