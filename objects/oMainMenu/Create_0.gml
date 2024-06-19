/// @description Insert description here
// You can write your code in this editor

event_inherited()

array_push(OPTIONS, new OptionData("Story Mode",		"Experience the storyline.",	function() {
    // Implement story mode functionality
}));
array_push(OPTIONS, new OptionData("Versus Mode",		"Challenge other players.",		function() {
    // Implement versus mode functionality
}));
array_push(OPTIONS, new OptionData("Tutorial",			"Learn how to play.",			function() {
    // Implement tutorial mode functionality
}));
array_push(OPTIONS, new OptionData("Training",			"Practice your skills.",		function() {
    // Implement training mode functionality
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
