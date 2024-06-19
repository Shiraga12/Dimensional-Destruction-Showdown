/// @description Insert description here
// You can write your code in this editor

event_inherited()

array_push(OPTIONS, new OptionData("Story Mode (Coming soon!... hopefully!)",		"Experience the storyline.",	function() {
    // Implement story mode functionality
}));
array_push(OPTIONS, new OptionData("Versus Mode",		"Challenge other players.",		function() {
    // Implement versus mode functionality
}));
array_push(OPTIONS, new OptionData("Tutorial",			"Learn how to play.",			function() {
    // Implement tutorial mode functionality
}));
array_push(OPTIONS, new OptionData("Training",			"Practice your skills.",		function() {
    T1.CONTROLS = 1
	T1.setCHARACTER(0,3)
	T1.setCHARACTER(1,3)
	T1.setCHARACTER(2,3)
	
    T2.CONTROLS = 0
	T2.setCHARACTER(0,3)
	T2.setCHARACTER(1,3)
	T2.setCHARACTER(2,3)
	room_goto(rmTestingRoom)
}));
array_push(OPTIONS, new OptionData("Encyclopedia Mode", "Read up on game lore.",		function() {
    // Implement encyclopedia functionality
}));
array_push(OPTIONS, new OptionData("Settings",			"Adjust game settings.",		function() {
	
}));
array_push(OPTIONS, new OptionData("Quit to Desktop",	"Return to the desktop.",		function() {
    screen_transition(TR_TYPE.CROSSFADE,TR_WAY.IN,false,c_black,function() {
		game_end()
	})
}));
