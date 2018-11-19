image_angle += rotate_speed;
if(image_angle >= 360)
	image_angle = 0;
if(rotate_slow && rotate_speed > 0 && ((0 < image_angle && image_angle < 20) || correct_angle))
{
	rotate_speed -= .001;
	correct_angle = true;
}