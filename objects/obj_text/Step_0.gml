timer += 1;
stringHeight = string_height(text);
if(timer > 3){
	textCount += 1;
	textDraw = string_copy(text,1,textCount);
	timer = 0;
}