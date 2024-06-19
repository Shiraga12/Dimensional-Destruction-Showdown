/// @description Insert description here
// You can write your code in this editor
var KEY_UP		= max(KEY_PRESSED(vk_up),		GAMEPAD_PRESSED(0,gp_padu),		-GAMEPAD_AXIS(0,gp_axislh),	0)
var KEY_DOWN	= max(KEY_PRESSED(vk_down),		GAMEPAD_PRESSED(0,gp_padd),		GAMEPAD_AXIS(0,gp_axislh),	0)
var KEY_CONFIRM	= max(KEY_PRESSED(ord("Z")),	GAMEPAD_PRESSED(0,gp_face1),	0)
var KEY_BACK	= max(KEY_PRESSED(ord("X")),	GAMEPAD_PRESSED(0,gp_face2),	0)

if KEY_UP {
	index--
}
if KEY_DOWN {
	index++
}
if KEY_CONFIRM {
	OPTIONS[index].trigger()
}

index = clamp(index,	0,	array_length(OPTIONS)-1)
