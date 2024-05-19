/// @description Insert description here
// DRAW Event - oCreditRoll

draw_set_halign(fa_center)
draw_set_valign(fa_middle)
draw_set_color(c_white)
// Loop through the CREDIT array
for (var i = 0; i < array_length(CREDIT); i++) {
    var credit = CREDIT[i];
    var text = credit.getOCCUPATION() + ":\n";

    // Check if the credit is an array or a string
    if (is_array(credit.getNAMES())) {
        // If it's an array, concatenate each item with a comma
        text += string(credit.getNAMES()[0]);
        for (var j = 1; j < array_length(credit.getNAMES()); j++) {
            text += ", " + string(credit.getNAMES()[j]);
        }
    } else {
        // If it's a string, just add it
        text += string(credit.getNAMES());
    }

    // Draw the credit text on the screen
    draw_text(room_width/2, (room_height/2)+60*i, text);
}