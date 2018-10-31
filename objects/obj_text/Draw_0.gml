//Draw Textbox
draw_sprite(spr_textBoxBG, 0, x,y);


//Draw Text
draw_set_font(fnt_computer);

draw_text_ext(x+24,y+20, textDraw, stringHeight, boxWidth);