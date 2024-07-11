/// @description Insert description here
// You can write your code in this editor
var LEADER = TEAM.ORDER[0]
draw_sprite_stretched(sLeaderHealthBarInside,0,	1301.999,	32,	(94*-6.5851) * (MAX_HEALTH /LEADER.HP),	64)
draw_set_align(2,1)
draw_text(1301.999,48,LEADER.CHAR.NAME)