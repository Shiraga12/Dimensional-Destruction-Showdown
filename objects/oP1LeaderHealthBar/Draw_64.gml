/// @description Insert description here
// You can write your code in this editor
var LEADER = T1.ORDER[0]
draw_sprite_stretched(sprite_index,0,	32,	32,	sprite_width * (MAX_HEALTH /LEADER.HP),	64)
draw_set_align(0,1)
draw_text(32,48,LEADER.CHAR.NAME)