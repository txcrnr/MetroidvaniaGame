image_xscale = 2;
image_yscale = 2;
batNum = 8;
batteries[0] = noone;
fullBats = 3;
batFrac = 7;

testTimer = 0;

global.playerHp = fullBats*10 + batFrac;

for(n = 0; n < 8; n++)
{
	batteries[n] = noone;
}

hudSprs[0] = spr_en;
hudSprs[1] = spr_en1;
hudSprs[2] = spr_en2;
hudSprs[3] = spr_en3;
hudSprs[4] = spr_en4;
hudSprs[5] = spr_en5;
hudSprs[6] = spr_en6;
hudSprs[7] = spr_en7;
hudSprs[8] = spr_en8;
hudSprs[9] = spr_en9;
hudSprs[10] = spr_en10;