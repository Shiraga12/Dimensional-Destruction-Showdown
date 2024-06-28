/// @description This script handles the player's state, animation updates, and movement/collision logic
// STEP Event - oPlayerTemplate

// Update the state
state();

// Update the position of any active sequences
for (var i = 0; i < array_length(SEQ); i++) {
    if (layer_sequence_exists(layer, SEQ[i])) {
        layer_sequence_x(SEQ[i], x);
        layer_sequence_y(SEQ[i], y);
    }
}

// Handle movement and collision
move_and_collide(HSP, VSP, oGround);
