///scr_changeText(textObj, boxLen, newText, waitForInput)
textObj = argument0;
boxLen = argument1;
newText = argument2;
waitForInput = argument3;
textArray[1] = "";
textArray[2] = "";
textArray[3] = "";
textNum = 1;
lastSpace = 1;
testText = "";


for (n = 1; n<=string_length(newText); n++;)
{
	 
	if(string_char_at(newText, n) = " ")
	{
		if(string_width(testText) >= 2 * sprite_get_width(spr_textBoxBG) - 48)
		{
			textArray[textNum] = string_copy(testText,1,lastSpace-1);
			textNum +=1;
			n = lastSpace;
			testText = "";
		}
		lastSpace = n;
	}
		testText = testText + string_char_at(newText, n);
}

textArray[textNum] = string_copy(testText,1,1000);

text1 = " " + textArray[1] + "\n" + textArray[2] + "\n" + textArray[3];

with(textObj){
	timer = 0;
	textDraw = "";
	textCount = 0;	
	//text = other.newText;
	text = other.text1;
	inputWait = other.waitForInput;
}