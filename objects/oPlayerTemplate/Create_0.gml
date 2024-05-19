/// @description Insert description here
// You can write your code in this editor
// Define combo variables
stateINTRO			=	function()	{
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("Intro")
}
stateFREE			=	function()	{
	HSP = KEY_RIGHT - KEY_LEFT
	if KEY_RUN {
		MOVESPEED = RUNSPEED
	}
	else {
		MOVESPEED = WALKSPEED
	}
	HSP *= MOVESPEED
	
	// Apply gravity if not grounded
	if (!place_meeting(x, y + 1, oGround)) {
		VSP += GRV; // Adjust gravity as needed
	} else {
		VSP = 0; // Reset vertical speed when grounded
	}
	
	if KEY_JUMP {
		VSP = -JUMPSPEED
	}
	
	move_and_collide(HSP, VSP, oGround);
	
	if KEY_LP	{
		state = stateLP
	}
	if KEY_LK	{
		state = stateLK
	}
	if KEY_HP	{
		state = stateHP
	}
	if KEY_HK	{
		state = stateHK
	}
	if KEY_A1	{
		state = stateA1
	}
	if KEY_A2	{
		state = stateA2
	}

	#region ANIMATION
		if (HSP != 0) {
			sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("WALK");
			image_speed = 0.5; // Adjust walk animation speed
			// Add other animation conditions for walking
		} else {
			if (VSP != 0) {
				sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("JUMP");
				// Add other animation conditions for jumping
			} else {
				sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("IDLE");
				// Add other animation conditions for idle state
			}
		}
		if (KEY_CROUCH && place_meeting(x, y + 1, oGround)) {
			sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CROUCH");
		}
		
		// NEED Help here!
		//	if (KEY_BLOCK) {
		//		sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("BLOCK");
		//	}
	#endregion
}
stateLP				=	function()	{	// Low Punch
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("LP")
	array_push(COMBOSEQUENCE,"LP")
}
stateLK				=	function()	{	//	Low Kick
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("LK")	
	array_push(COMBOSEQUENCE,"LK")
}
stateHP				=	function()	{	// Heavy Punch
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("HP")
	array_push(COMBOSEQUENCE,"HP")
}
stateHK				=	function()	{	//	Heavy Kick
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("HK")	
	array_push(COMBOSEQUENCE,"HK")
}
stateA1				=	function()	{	//	Assist 1
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CALLASSIST")
}
stateA2				=	function()	{	//	Assist 2
	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CALLASSIST")
}
stateSWAP			=	function()	{	// Swap Character
	if INDEX == 0	{
		TEAM.swapCharacters(0,	1)
	}
	else if INDEX == 1	{
		TEAM.swapCharacters(1,	2)
	}
	else if INDEX == 2	{
		TEAM.swapCharacters(2,	0)
	}
}
stateCOMBO_CHECK	=	function()	{
	switch(TEAM.ORDER[INDEX].CHAR) {
		case CHARACTER[0]:
			break;
	}
}

state = stateINTRO