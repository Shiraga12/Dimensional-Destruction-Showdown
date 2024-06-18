// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function gotoTitleScreen(){
	screen_transition(TR_TYPE.CROSSFADE,TR_WAY.IN,false,c_white,function() {
		room_goto(rmTitleScreen)
	})
}