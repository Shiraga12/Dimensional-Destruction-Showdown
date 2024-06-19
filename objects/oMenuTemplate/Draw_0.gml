/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntCartoon);
draw_set_align(0,0)
draw_text_transformed(32, 32, TITLE, 4, 4, 0);

draw_set_align(1,1);
draw_set_font(fntCredit);
for (var i = 0; i < array_length(OPTIONS); ++i) {
    var yPos = y + 24 * (i - index);
	
	var TXT;
	if i = index {
		TXT = $"> {OPTIONS[i].getNAME()}"
	}
	else {
		TXT = $"{OPTIONS[i].getNAME()}"
	}
    draw_text_transformed(x, yPos, TXT, 1.5, 1.5, 0);
}

draw_set_align(2,2);
draw_text(SCREEN_WIDTH-32,SCREEN_HEIGHT-32,OPTIONS[index].getDESCRIPTION())