/// @description Insert description here
// You can write your code in this editor
SEQ = -1;

// Define combo variables
stateINTRO = function() {
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("Intro")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("Intro");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("Intro")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("Intro"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
}

stateFREE = function() {
    HSP = KEY_RIGHT - KEY_LEFT;
//    MOVESPEED = KEY_RUN ? RUNSPEED : WALKSPEED;
    HSP *= MOVESPEED;
    
    // Apply gravity if not grounded
    if (!place_meeting(x, y + 1, oGround)) {
        VSP += GRV; // Adjust gravity as needed
    } else {
        VSP = 0; // Reset vertical speed when grounded
    }
    
    if (KEY_JUMP) {
        VSP = -JUMPSPEED;
    }
    
    move_and_collide(HSP, VSP, oGround);
    
    if (KEY_LP) state = stateLP;
    if (KEY_LK) state = stateLK;
    if (KEY_HP) state = stateHP;
    if (KEY_HK) state = stateHK;
    if (KEY_A1) state = stateA1;
    if (KEY_A2) state = stateA2;

    #region ANIMATION
    if (HSP != 0) {
		if TEAM.ORDER[INDEX].CHAR.hasSPRITE("WALK") {
			sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("WALK");
			image_speed = 0.5; // Adjust walk animation speed
		}
		else if TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("WALK"){
			SEQ = layer_sequence_create(layer,x,y,TEAM.ORDER[INDEX].CHAR.getSEQUENCE("WALK"))
		}
    } else if (VSP != 0) {
        //	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("JUMP");
    } else {
		if TEAM.ORDER[INDEX].CHAR.hasSPRITE("IDLE") {
			sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("IDLE");
			image_speed = 1; // Adjust idle animation speed
		}
		else if TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("IDLE"){
			SEQ = layer_sequence_create(layer,x,y,TEAM.ORDER[INDEX].CHAR.getSEQUENCE("IDLE"))
		}
    }
    
    //	if (KEY_CROUCH && place_meeting(x, y + 1, oGround)) {
	//		// sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CROUCH");
    //	}
    
    //	if (KEY_BLOCK) {
    //	    //	sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("BLOCK");
    //	}
    #endregion
}

stateLP = function() { // Low Punch
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("LP")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("LP");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("LP")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("LP"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
    array_push(COMBOSEQUENCE, "LP");
}

stateLK = function() { // Low Kick
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("LK")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("LK");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("LK")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("LK"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
    array_push(COMBOSEQUENCE, "LK");
}

stateHP = function() { // Heavy Punch
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("HP")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("HP");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("HP")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("HP"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
    array_push(COMBOSEQUENCE, "HP");
}

stateHK = function() { // Heavy Kick
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("HK")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("HK");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("HK")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("HK"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
    array_push(COMBOSEQUENCE, "HK");
}

stateA1 = function() { // Assist 1
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("CALLASSIST")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CALLASSIST");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("CALLASSIST")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("CALLASSIST"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
}

stateA2 = function() { // Assist 2
    if (TEAM.ORDER[INDEX].CHAR.hasSPRITE("CALLASSIST")) {
        sprite_index = TEAM.ORDER[INDEX].CHAR.getSPRITE("CALLASSIST");
    } else if (TEAM.ORDER[INDEX].CHAR.hasSEQUENCE("CALLASSIST")) {
        if (!layer_sequence_exists(layer, SEQ)) {
            SEQ = layer_sequence_create(layer, x, y, TEAM.ORDER[INDEX].CHAR.getSEQUENCE("CALLASSIST"));
        }
        if (layer_sequence_is_finished(SEQ)) {
            state = stateFREE;
        }
    }
}

stateSWAP = function() { // Swap Character
    if (INDEX == 0) {
        TEAM.swapCharacters(0, 1);
    } else if (INDEX == 1) {
        TEAM.swapCharacters(1, 2);
    } else if (INDEX == 2) {
        TEAM.swapCharacters(2, 0);
    }
}

stateCOMBO_CHECK = function() {
    switch (TEAM.ORDER[INDEX].CHAR) {
        case CHARACTER[0]:
            break;
    }
}

state = stateFREE;
