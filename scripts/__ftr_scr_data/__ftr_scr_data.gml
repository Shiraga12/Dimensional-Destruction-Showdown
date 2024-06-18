
/*------------------------------------------------
Transitions configs, Textures and Uniforms.
Used to manipulate the shaders.
------------------------------------------------*/

// transitions configs
// when modifying these values, keep in mind values from -1/0 to 1 (some)
global.__tr_configs = {
	halftone : {
		squares : [20, 10],
		directionn : [1.0, 0.5],
		smoothness : 0.4,
		smooth_edges : 0.03,
		invert : false,
	},
	halftone_twopass : {
		squares : [20, 10],
		directionn : [1.0, 0.5],
		smoothness : 0.4,
		smooth_edges : 0.03,
		invert : false,
	},
	
	doom : {
		bars : 100,
		amplitude : 2,
		frequency : 0.1,
		drip_scale : 0.5,
		noise : 0.1,
		scale : 0.5,
	},
	doom_twopass : {
		bars : 100,
		amplitude : 2,
		frequency : 0.1,
		drip_scale : 0.5,
		noise : 0.1,
		scale : 0.5,
	},
	
	zwave : {
		fade_delay : 0.5,
		bar_height : 1,
		bar_dist : 2,
		wave_freq : 2,
		wave_amp : 0.07,
		wave_spd : 2,
	},
	zwave_twopass : {
		fade_delay : 0.5,
		bar_height : 1,
		bar_dist : 2,
		wave_freq : 2,
		wave_amp : 0.07,
		wave_spd : 2,
	},
	
	crosswarp : {
		directionn : [0.5, 0.5],
		smoothness : 0.6,
	},
	crosswarp_twopass : {
		directionn : [-0.5, -0.5],
		smoothness : 0.4,
	},
	
	pixelize : {
		squares_max : 20,
		steps : 50,
	},
	pixelize_twopass : {
		squares_max : 20,
		steps : 50,
	},
	
	zoom : {
		zoom_factor : 1.5,	
	},
	zoom_twopass : {
		zoom_factor : 1.5,	
	},
	
	zoomblur : {
		center : [0.5, 0.5],
		strength : 20,
	},
	zoomblur_twopass : {
		center : [0.5, 0.5],
		strength : 20,
	},
	
	swirl : {
		center : [0.5, 0.5],
		strength : 20,
		swirl : 6,
	},
	swirl_twopass : {
		center : [0.5, 0.5],
		strength : 20,
		swirl : 6,
	},
	
	circle : {
		center : [0.5, 0.5],
		inner : 0.05,
		invert : false,
	},
	circle_twopass : {
		center : [0.5, 0.5],
		inner : 0.05,
		invert : false,
	},
	
	luma : {
		inner : 0,
	},
	luma_twopass : {
		inner : 0,
	},
	
	blur : {
		amount : 10,
	},
	blur_twopass : {
		amount : 10,
	},
	
	frost : {
		color : [0.33, 0.46, 0.73],
		multiplier : 1.8,
		inner : 0.22,
	},
	frost_twopass : {
		color : [0.33, 0.46, 0.73],
		multiplier : 1.8,
		inner : 0.22,
	},
	
	sqrot : {
		smooth_edges : 0,
		angle_max : 720,
	},
	sqrot_twopass : {
		smooth_edges : 0,
		angle_max : 720,
	},
	
	masksprite : {
		center : [0.5, 0.5],
		scale_max : 2,
	},
	masksprite_twopass : {
		center : [0.5, 0.5],
		scale_max : 2,
	},
	
	dither_luma : {
		inner : 0.1,
	},
	dither_luma_twopass : {
		inner : 0.1,
	},
	
	dither_circle : {
		center : [0.5, 0.5],
		inner : 0.05,
	},
	dither_circle_twopass : {
		center : [0.5, 0.5],
		inner : 0.05,
	},
}


// textures used in transitions shaders
global.__tr_textures = {
	luma : {
		square_tex : sprite_get_texture(__spr_ftr_luma_256x256, 0),
		swirl_tex : sprite_get_texture(__spr_ftr_luma_256x256, 1),
	},
	
	dither : {
		bayer_tex : sprite_get_texture(__spr_ftr_bayer_matrix_8x8, 0),
	},
	
	masksprite : {
		logo_tex : sprite_get_texture(__spr_ftr_mask_0, 0),
		logo_w : sprite_get_width(__spr_ftr_mask_0),
		logo_h : sprite_get_height(__spr_ftr_mask_0),
	}
}


global.__tr_shader_uniforms = {
	// -- shader transitions --
	fade : {
		progress : shader_get_uniform(__ftr_sh_fade, "progress"),
		color : shader_get_uniform(__ftr_sh_fade, "color"),
	},
	fade_twopass : {
		progress : shader_get_uniform(__ftr_sh_fade_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_fade_twopass, "color"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_fade_twopass, "texture2"),
	},
	
	halftone : {
		pos_res : shader_get_uniform(__ftr_sh_halftone, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_halftone, "progress"),
		color : shader_get_uniform(__ftr_sh_halftone, "color"),
		directionn : shader_get_uniform(__ftr_sh_halftone, "direction"),
		smoothness : shader_get_uniform(__ftr_sh_halftone, "smoothness"),
		smooth_edges : shader_get_uniform(__ftr_sh_halftone, "smooth_edges"),
		squares : shader_get_uniform(__ftr_sh_halftone, "squares"),
		invert : shader_get_uniform(__ftr_sh_halftone, "invert"),
	},
	halftone_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_halftone_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_halftone_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_halftone_twopass, "color"),
		directionn : shader_get_uniform(__ftr_sh_halftone_twopass, "direction"),
		smoothness : shader_get_uniform(__ftr_sh_halftone_twopass, "smoothness"),
		smooth_edges : shader_get_uniform(__ftr_sh_halftone_twopass, "smooth_edges"),
		squares : shader_get_uniform(__ftr_sh_halftone_twopass, "squares"),
		invert : shader_get_uniform(__ftr_sh_halftone_twopass, "invert"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_halftone_twopass, "texture2"),
	},
	
	zwave : {
		pos_res : shader_get_uniform(__ftr_sh_zwave, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_zwave, "progress"),
		color : shader_get_uniform(__ftr_sh_zwave, "color"),
		fade_delay : shader_get_uniform(__ftr_sh_zwave, "fade_delay"),
		bar_height : shader_get_uniform(__ftr_sh_zwave, "bar_height"),
		bar_dist : shader_get_uniform(__ftr_sh_zwave, "bar_dist"),
		wave_freq : shader_get_uniform(__ftr_sh_zwave, "wave_freq"),
		wave_amp : shader_get_uniform(__ftr_sh_zwave, "wave_amp"),
		wave_spd : shader_get_uniform(__ftr_sh_zwave, "wave_spd"),
	},
	zwave_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_zwave_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_zwave_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_zwave_twopass, "color"),
		fade_delay : shader_get_uniform(__ftr_sh_zwave_twopass, "fade_delay"),
		bar_height : shader_get_uniform(__ftr_sh_zwave_twopass, "bar_height"),
		bar_dist : shader_get_uniform(__ftr_sh_zwave_twopass, "bar_dist"),
		wave_freq : shader_get_uniform(__ftr_sh_zwave_twopass, "wave_freq"),
		wave_amp : shader_get_uniform(__ftr_sh_zwave_twopass, "wave_amp"),
		wave_spd : shader_get_uniform(__ftr_sh_zwave_twopass, "wave_spd"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_zwave_twopass, "texture2"),
	},
	
	crosswarp : {
		progress : shader_get_uniform(__ftr_sh_crosswarp, "progress"),
		color : shader_get_uniform(__ftr_sh_crosswarp, "color"),
		directionn : shader_get_uniform(__ftr_sh_crosswarp, "direction"),
		smoothness : shader_get_uniform(__ftr_sh_crosswarp, "smoothness"),
	},
	crosswarp_twopass : {
		progress : shader_get_uniform(__ftr_sh_crosswarp_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_crosswarp_twopass, "color"),
		directionn : shader_get_uniform(__ftr_sh_crosswarp_twopass, "direction"),
		smoothness : shader_get_uniform(__ftr_sh_crosswarp_twopass, "smoothness"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_crosswarp_twopass, "texture2"),
	},
	
	crossfade : {
		progress : shader_get_uniform(__ftr_sh_crossfade, "progress"),
		color : shader_get_uniform(__ftr_sh_crossfade, "color"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_crossfade, "texture2"),
	},
	crossfade_twopass : {
		progress : shader_get_uniform(__ftr_sh_crossfade_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_crossfade_twopass, "color"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_crossfade_twopass, "texture2"),
	},
	
	pixelize : {
		pos_res : shader_get_uniform(__ftr_sh_pixelize, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_pixelize, "progress"),
		color : shader_get_uniform(__ftr_sh_pixelize, "color"),
		squares_max : shader_get_uniform(__ftr_sh_pixelize, "squares_max"),
		steps : shader_get_uniform(__ftr_sh_pixelize, "steps"),
	},
	pixelize_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_pixelize_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_pixelize_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_pixelize_twopass, "color"),
		squares_max : shader_get_uniform(__ftr_sh_pixelize_twopass, "squares_max"),
		steps : shader_get_uniform(__ftr_sh_pixelize_twopass, "steps"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_pixelize_twopass, "texture2"),
	},
	
	zoom : {
		progress : shader_get_uniform(__ftr_sh_zoom, "progress"),
		color : shader_get_uniform(__ftr_sh_zoom, "color"),
		zoom_factor : shader_get_uniform(__ftr_sh_zoom, "zoom_factor"),
	},
	zoom_twopass : {
		progress : shader_get_uniform(__ftr_sh_zoom_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_zoom_twopass, "color"),
		zoom_factor : shader_get_uniform(__ftr_sh_zoom_twopass, "zoom_factor"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_zoom_twopass, "texture2"),
	},
	
	zoomblur : {
		progress : shader_get_uniform(__ftr_sh_zoomblur, "progress"),
		color : shader_get_uniform(__ftr_sh_zoomblur, "color"),
		center : shader_get_uniform(__ftr_sh_zoomblur, "center"),
		strength : shader_get_uniform(__ftr_sh_zoomblur, "strength"),
	},
	zoomblur_twopass : {
		progress : shader_get_uniform(__ftr_sh_zoomblur_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_zoomblur_twopass, "color"),
		center : shader_get_uniform(__ftr_sh_zoomblur_twopass, "center"),
		strength : shader_get_uniform(__ftr_sh_zoomblur_twopass, "strength"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_zoomblur_twopass, "texture2"),
	},
	
	swirl : {
		progress : shader_get_uniform(__ftr_sh_swirl, "progress"),
		color : shader_get_uniform(__ftr_sh_swirl, "color"),
		center : shader_get_uniform(__ftr_sh_swirl, "center"),
		strength : shader_get_uniform(__ftr_sh_swirl, "strength"),
		swirl : shader_get_uniform(__ftr_sh_swirl, "swirl"),
	},
	swirl_twopass : {
		progress : shader_get_uniform(__ftr_sh_swirl_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_swirl_twopass, "color"),
		center : shader_get_uniform(__ftr_sh_swirl_twopass, "center"),
		strength : shader_get_uniform(__ftr_sh_swirl_twopass, "strength"),
		swirl : shader_get_uniform(__ftr_sh_swirl_twopass, "swirl"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_swirl_twopass, "texture2"),
	},
	
	wrap : {
		progress : shader_get_uniform(__ftr_sh_wrap, "progress"),
		color : shader_get_uniform(__ftr_sh_wrap, "color"),
		dir : shader_get_uniform(__ftr_sh_wrap, "direction"),
	},
	wrap_twopass : {
		progress : shader_get_uniform(__ftr_sh_wrap_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_wrap_twopass, "color"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_wrap_twopass, "texture2"),
		dir : shader_get_uniform(__ftr_sh_wrap_twopass, "direction"),
	},
	
	circle : {
		pos_res : shader_get_uniform(__ftr_sh_circle, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_circle, "progress"),
		color : shader_get_uniform(__ftr_sh_circle, "color"),
		inner : shader_get_uniform(__ftr_sh_circle, "inner"),
		center : shader_get_uniform(__ftr_sh_circle, "center"),
		invert : shader_get_uniform(__ftr_sh_circle, "invert"),
	},
	circle_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_circle_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_circle_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_circle_twopass, "color"),
		inner : shader_get_uniform(__ftr_sh_circle_twopass, "inner"),
		center : shader_get_uniform(__ftr_sh_circle_twopass, "center"),
		invert : shader_get_uniform(__ftr_sh_circle_twopass, "invert"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_circle_twopass, "texture2"),
	},
	
	luma : {
		progress : shader_get_uniform(__ftr_sh_luma, "progress"),
		color : shader_get_uniform(__ftr_sh_luma, "color"),
		inner : shader_get_uniform(__ftr_sh_luma, "inner"),
		sample_luma_tex : shader_get_sampler_index(__ftr_sh_luma, "luma_tex"),
	},
	luma_twopass : {
		progress : shader_get_uniform(__ftr_sh_luma_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_luma_twopass, "color"),
		inner : shader_get_uniform(__ftr_sh_luma_twopass, "inner"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_luma_twopass, "texture2"),
		sample_luma_tex : shader_get_sampler_index(__ftr_sh_luma_twopass, "luma_tex"),
	},
	
	blur : {
		progress : shader_get_uniform(__ftr_sh_blur, "progress"),
		color : shader_get_uniform(__ftr_sh_blur, "color"),
		amount : shader_get_uniform(__ftr_sh_blur, "amount"),
	},
	blur_twopass : {
		progress : shader_get_uniform(__ftr_sh_blur_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_blur_twopass, "color"),
		amount : shader_get_uniform(__ftr_sh_blur_twopass, "amount"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_blur_twopass, "texture2"),
	},
	
	frost : {
		progress : shader_get_uniform(__ftr_sh_frost, "progress"),
		color : shader_get_uniform(__ftr_sh_frost, "color"),
		color_frost : shader_get_uniform(__ftr_sh_frost, "color_frost"),
		multiplier : shader_get_uniform(__ftr_sh_frost, "frost_multiplier"),
		inner : shader_get_uniform(__ftr_sh_frost, "inner"),
	},
	frost_twopass : {
		progress : shader_get_uniform(__ftr_sh_frost_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_frost_twopass, "color"),
		color_frost : shader_get_uniform(__ftr_sh_frost_twopass, "color_frost"),
		multiplier : shader_get_uniform(__ftr_sh_frost_twopass, "frost_multiplier"),
		inner : shader_get_uniform(__ftr_sh_frost_twopass, "inner"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_frost_twopass, "texture2"),
	},
	
	sqrot : {
		pos_res : shader_get_uniform(__ftr_sh_sqrot, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_sqrot, "progress"),
		color : shader_get_uniform(__ftr_sh_sqrot, "color"),
		invert : shader_get_uniform(__ftr_sh_sqrot, "invert"),
		smooth_edges : shader_get_uniform(__ftr_sh_sqrot, "smooth_edges"),
		angle_max : shader_get_uniform(__ftr_sh_sqrot, "angle_max"),
	},
	sqrot_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_sqrot_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_sqrot_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_sqrot_twopass, "color"),
		invert : shader_get_uniform(__ftr_sh_sqrot_twopass, "invert"),
		smooth_edges : shader_get_uniform(__ftr_sh_sqrot_twopass, "smooth_edges"),
		angle_max : shader_get_uniform(__ftr_sh_sqrot_twopass, "angle_max"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_sqrot_twopass, "texture2"),
	},
	
	masksprite : {
		pos_res : shader_get_uniform(__ftr_sh_masksprite, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_masksprite, "progress"),
		color : shader_get_uniform(__ftr_sh_masksprite, "color"),
		invert : shader_get_uniform(__ftr_sh_masksprite, "invert"),
		center : shader_get_uniform(__ftr_sh_masksprite, "center"),
		scale_max : shader_get_uniform(__ftr_sh_masksprite, "scale_max"),
		mask_tex : shader_get_sampler_index(__ftr_sh_masksprite, "mask_tex"),
		mask_res : shader_get_uniform(__ftr_sh_masksprite, "mask_res"),
	},
	masksprite_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_masksprite_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_masksprite_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_masksprite_twopass, "color"),
		invert : shader_get_uniform(__ftr_sh_masksprite_twopass, "invert"),
		center : shader_get_uniform(__ftr_sh_masksprite_twopass, "center"),
		scale_max : shader_get_uniform(__ftr_sh_masksprite_twopass, "scale_max"),
		mask_tex : shader_get_sampler_index(__ftr_sh_masksprite_twopass, "mask_tex"),
		mask_res : shader_get_uniform(__ftr_sh_masksprite_twopass, "mask_res"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_masksprite_twopass, "texture2"),
	},
	
	doom : {
		progress : shader_get_uniform(__ftr_sh_doom, "progress"),
		color : shader_get_uniform(__ftr_sh_doom, "color"),
		bars : shader_get_uniform(__ftr_sh_doom, "bars"),
		amplitude : shader_get_uniform(__ftr_sh_doom, "amplitude"),
		frequency : shader_get_uniform(__ftr_sh_doom, "frequency"),
		drip_scale : shader_get_uniform(__ftr_sh_doom, "drip_scale"),
		noise : shader_get_uniform(__ftr_sh_doom, "noise"),
		scale : shader_get_uniform(__ftr_sh_doom, "scale"),
	},
	doom_twopass : {
		progress : shader_get_uniform(__ftr_sh_doom_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_doom_twopass, "color"),
		bars : shader_get_uniform(__ftr_sh_doom_twopass, "bars"),
		amplitude : shader_get_uniform(__ftr_sh_doom_twopass, "amplitude"),
		frequency : shader_get_uniform(__ftr_sh_doom_twopass, "frequency"),
		drip_scale : shader_get_uniform(__ftr_sh_doom_twopass, "drip_scale"),
		noise : shader_get_uniform(__ftr_sh_doom_twopass, "noise"),
		scale : shader_get_uniform(__ftr_sh_doom_twopass, "scale"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_doom_twopass, "texture2"),
	},
	
	dither_luma : {
		pos_res : shader_get_uniform(__ftr_sh_dither_luma, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_dither_luma, "progress"),
		color : shader_get_uniform(__ftr_sh_dither_luma, "color"),
		inner : shader_get_uniform(__ftr_sh_dither_luma, "inner"),
		sample_luma_tex : shader_get_sampler_index(__ftr_sh_dither_luma, "luma_tex"),
		sample_bayer_tex : shader_get_sampler_index(__ftr_sh_dither_luma, "bayer_tex"),
	},
	dither_luma_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_dither_luma_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_dither_luma_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_dither_luma_twopass, "color"),
		inner : shader_get_uniform(__ftr_sh_dither_luma_twopass, "inner"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_dither_luma_twopass, "texture2"),
		sample_luma_tex : shader_get_sampler_index(__ftr_sh_dither_luma_twopass, "luma_tex"),
		sample_bayer_tex : shader_get_sampler_index(__ftr_sh_dither_luma_twopass, "bayer_tex"),
	},
	
	dither_circle : {
		pos_res : shader_get_uniform(__ftr_sh_dither_circle, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_dither_circle, "progress"),
		color : shader_get_uniform(__ftr_sh_dither_circle, "color"),
		inner : shader_get_uniform(__ftr_sh_dither_circle, "inner"),
		center : shader_get_uniform(__ftr_sh_dither_circle, "center"),
		sample_bayer_tex : shader_get_sampler_index(__ftr_sh_dither_circle, "bayer_tex"),
	},
	dither_circle_twopass : {
		pos_res : shader_get_uniform(__ftr_sh_dither_circle_twopass, "pos_res"),
		progress : shader_get_uniform(__ftr_sh_dither_circle_twopass, "progress"),
		color : shader_get_uniform(__ftr_sh_dither_circle_twopass, "color"),
		inner : shader_get_uniform(__ftr_sh_dither_circle_twopass, "inner"),
		center : shader_get_uniform(__ftr_sh_dither_circle_twopass, "center"),
		sample_tex2 : shader_get_sampler_index(__ftr_sh_dither_circle_twopass, "texture2"),
		sample_bayer_tex : shader_get_sampler_index(__ftr_sh_dither_circle_twopass, "bayer_tex"),
	},
}

#macro __tr_cf global.__tr_configs
#macro __tr_tx global.__tr_textures
#macro __tr_su global.__tr_shader_uniforms
