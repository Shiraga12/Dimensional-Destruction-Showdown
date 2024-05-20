/// @description Insert description here
// You can write your code in this editor
if ALPHA_TOGGLE == true {
	image_alpha += 0.01
}
if ALPHA_TOGGLE == false {
	image_alpha -= 0.01
}

image_alpha = clamp(image_alpha,	0,	1)