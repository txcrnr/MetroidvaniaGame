/// @description Insert description here
// You can write your code in this editor
if(abs(xDir)+abs(yDir) == 2)
{
	spd = sqrt(spdBase);
}
else
{
	spd = spdBase;
}
x += xDir * spd;
y += yDir * spd;
event_user(2);