/// @description Insert description here
// You can write your code in this editor
draw_set_font(fntCredit);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(OPTIONS); ++i) {
    var yPos = SCREEN_HEIGHT_HALF + 24 * (i - index);
    draw_text_transformed(SCREEN_WIDTH_HALF, yPos, OPTIONS[i].NAME, 2, 2, 0);
}
