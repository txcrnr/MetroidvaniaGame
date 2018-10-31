if(countdown > -150){
	countdown--;
}
else{
	instance_destroy(id);	
}
if(countdown < 0){
	object_set_visible(id, true);
	image_speed = 1;
}
offsetX = lastX - parentObj.x;
lastX = parentObj.x;
offsetY = lastY - parentObj.y;
lastY = parentObj.y;
x -= offsetX;
y -= offsetY;
