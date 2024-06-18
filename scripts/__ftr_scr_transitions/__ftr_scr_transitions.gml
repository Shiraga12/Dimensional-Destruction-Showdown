
/*---------------------------------------------------------
Everything you need to create and edit existing transitions
is here in this script.
---------------------------------------------------------*/



// Transitions Enums
/*They are used to identify which transition you will use.
Each name is a integer number internally.*/
enum TR_TYPE {
	// [shaders]
	FADE,
	FADE_TWOPASS,
	HALFTONE,
	HALFTONE_TWOPASS,
	ZWAVE,
	ZWAVE_TWOPASS,
	CROSSWARP,
	CROSSWARP_TWOPASS,
	CROSSFADE,
	CROSSFADE_TWOPASS,
	PIXELIZE,
	PIXELIZE_TWOPASS,
	ZOOM,
	ZOOM_TWOPASS,
	ZOOMBLUR,
	ZOOMBLUR_TWOPASS,
	SWIRL,
	SWIRL_TWOPASS,
	WRAP_L,
	WRAP_L_TWOPASS,
	WRAP_R,
	WRAP_R_TWOPASS,
	WRAP_U,
	WRAP_U_TWOPASS,
	WRAP_D,
	WRAP_D_TWOPASS,
	CIRCLE,
	CIRCLE_TWOPASS,
	LUMA_SQUARE,
	LUMA_SQUARE_TWOPASS,
	LUMA_SWIRL,
	LUMA_SWIRL_TWOPASS,
	BLUR,
	BLUR_TWOPASS,
	FROST,
	FROST_TWOPASS,
	SQROT,
	SQROT_TWOPASS,
	MASK_SPRITE,
	MASK_SPRITE_TWOPASS,
	DOOM,
	DOOM_TWOPASS,
	DITHER_CIRCLE,
	DITHER_CIRCLE_TWOPASS,
	DITHER_LUMA_SQUARE,
	DITHER_LUMA_SQUARE_TWOPASS,
	DITHER_LUMA_SWIRL,
	DITHER_LUMA_SWIRL_TWOPASS,
	// [sequences]
	WIPE_DIAGONAL,
	WIPE_HORIZONTAL,
	WIPE_VERTICAL,
	WIPE_TRIANGLE,
	// [gml]
	SMW2YI,
	// [unused]
	_SIZE
}


#region Setup Transitions

/*-------------------------------------------------------------------------------------
This area is used to create the transitions functions (shaders, sequences or GML),
they will be executed as used (TR_TYPE.IN/OUT/TWOPASS).
Unless you disable automatic draw of the transition, they are performed before drawing.
-------------------------------------------------------------------------------------*/

#region Transitions Functions
function __tr_fade() { // fade only IN or OUT once (while progress goes from 0 to 1)
	shader_set(__ftr_sh_fade);
	shader_set_uniform_f(__tr_su.fade.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.fade.color, ftr_color_rgb);
}
function __tr_fade_twopass() { // fade IN and OUT together (while progress goes from 0 to 1)
	shader_set(__ftr_sh_fade_twopass);
	shader_set_uniform_f(__tr_su.fade_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.fade_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.fade_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_halftone() {
	shader_set(__ftr_sh_halftone);
	shader_set_uniform_f(__tr_su.halftone.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.halftone.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.halftone.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.halftone.squares, __tr_cf.halftone.squares);
	shader_set_uniform_f_array(__tr_su.halftone.directionn, __tr_cf.halftone.directionn);
	shader_set_uniform_f(__tr_su.halftone.smoothness, __tr_cf.halftone.smoothness);
	shader_set_uniform_f(__tr_su.halftone.smooth_edges, __tr_cf.halftone.smooth_edges);
	shader_set_uniform_f(__tr_su.halftone.invert, __tr_cf.halftone.invert);
}
function __tr_halftone_twopass() {
	shader_set(__ftr_sh_halftone_twopass);
	shader_set_uniform_f(__tr_su.halftone_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.halftone_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.halftone_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.halftone_twopass.squares, __tr_cf.halftone_twopass.squares); //integer e float problem
	shader_set_uniform_f_array(__tr_su.halftone_twopass.directionn, __tr_cf.halftone_twopass.directionn);
	shader_set_uniform_f(__tr_su.halftone_twopass.smoothness, __tr_cf.halftone_twopass.smoothness);
	shader_set_uniform_f(__tr_su.halftone_twopass.smooth_edges, __tr_cf.halftone_twopass.smooth_edges);
	shader_set_uniform_f(__tr_su.halftone_twopass.invert, __tr_cf.halftone_twopass.invert);
	texture_set_stage(__tr_su.halftone_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_zwave() {
	shader_set(__ftr_sh_zwave);
	shader_set_uniform_f(__tr_su.zwave.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.zwave.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zwave.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.zwave.fade_delay, __tr_cf.zwave.fade_delay);
	shader_set_uniform_f(__tr_su.zwave.bar_height, __tr_cf.zwave.bar_height);
	shader_set_uniform_f(__tr_su.zwave.bar_dist, __tr_cf.zwave.bar_dist);
	shader_set_uniform_f(__tr_su.zwave.wave_freq, __tr_cf.zwave.wave_freq);
	shader_set_uniform_f(__tr_su.zwave.wave_amp, __tr_cf.zwave.wave_amp);
	shader_set_uniform_f(__tr_su.zwave.wave_spd, __tr_cf.zwave.wave_spd);
}
function __tr_zwave_twopass() {
	shader_set(__ftr_sh_zwave_twopass);
	shader_set_uniform_f(__tr_su.zwave_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zwave_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.zwave_twopass.fade_delay, __tr_cf.zwave_twopass.fade_delay);
	shader_set_uniform_f(__tr_su.zwave_twopass.bar_height, __tr_cf.zwave_twopass.bar_height);
	shader_set_uniform_f(__tr_su.zwave_twopass.bar_dist, __tr_cf.zwave_twopass.bar_dist);
	shader_set_uniform_f(__tr_su.zwave_twopass.wave_freq, __tr_cf.zwave_twopass.wave_freq);
	shader_set_uniform_f(__tr_su.zwave_twopass.wave_amp, __tr_cf.zwave_twopass.wave_amp);
	shader_set_uniform_f(__tr_su.zwave_twopass.wave_spd, __tr_cf.zwave_twopass.wave_spd);
	texture_set_stage(__tr_su.zwave_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_crosswarp() {
	shader_set(__ftr_sh_crosswarp);
	shader_set_uniform_f(__tr_su.crosswarp.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.crosswarp.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.crosswarp.directionn, __tr_cf.crosswarp.directionn);
	shader_set_uniform_f(__tr_su.crosswarp.smoothness, __tr_cf.crosswarp.smoothness);
}
function __tr_crosswarp_twopass() {
	shader_set(__ftr_sh_crosswarp_twopass);
	shader_set_uniform_f(__tr_su.crosswarp_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.crosswarp_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.crosswarp_twopass.directionn, __tr_cf.crosswarp_twopass.directionn);
	shader_set_uniform_f(__tr_su.crosswarp_twopass.smoothness, __tr_cf.crosswarp_twopass.smoothness);
	texture_set_stage(__tr_su.crosswarp_twopass.sample_tex2, ftr_from_surface_tex);
	
}

function __tr_crossfade() {
	shader_set(__ftr_sh_crossfade);
	shader_set_uniform_f(__tr_su.crossfade.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.crossfade.color, ftr_color_rgb);
	texture_set_stage(__tr_su.crossfade.sample_tex2, ftr_from_surface_tex);
}
function __tr_crossfade_twopass() {
	shader_set(__ftr_sh_crossfade_twopass);
	shader_set_uniform_f(__tr_su.crossfade_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.crossfade_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.crossfade_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_pixelize() {
	shader_set(__ftr_sh_pixelize);
	shader_set_uniform_f(__tr_su.pixelize.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.pixelize.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.pixelize.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.pixelize.squares_max, __tr_cf.pixelize.squares_max);
	shader_set_uniform_f(__tr_su.pixelize.steps, __tr_cf.pixelize.steps);
}
function __tr_pixelize_twopass() {
	shader_set(__ftr_sh_pixelize_twopass);
	shader_set_uniform_f(__tr_su.pixelize_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.pixelize_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.pixelize_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.pixelize_twopass.squares_max, __tr_cf.pixelize_twopass.squares_max);
	shader_set_uniform_f(__tr_su.pixelize_twopass.steps, __tr_cf.pixelize_twopass.steps);
	texture_set_stage(__tr_su.pixelize_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_zoom() {
	shader_set(__ftr_sh_zoom);
	shader_set_uniform_f(__tr_su.zoom.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zoom.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.zoom.zoom_factor, __tr_cf.zoom.zoom_factor);
}
function __tr_zoom_twopass() {
	shader_set(__ftr_sh_zoom_twopass);
	shader_set_uniform_f(__tr_su.zoom_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zoom_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.zoom_twopass.zoom_factor, __tr_cf.zoom_twopass.zoom_factor);
	texture_set_stage(__tr_su.zoom_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_zoomblur() {
	shader_set(__ftr_sh_zoomblur);
	shader_set_uniform_f(__tr_su.zoomblur.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zoomblur.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.zoomblur.center, __tr_cf.zoomblur.center);
	shader_set_uniform_f(__tr_su.zoomblur.strength, __tr_cf.zoomblur.strength);
}
function __tr_zoomblur_twopass() {
	shader_set(__ftr_sh_zoomblur_twopass);
	shader_set_uniform_f(__tr_su.zoomblur_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.zoomblur_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.zoomblur_twopass.center, __tr_cf.zoomblur_twopass.center);
	shader_set_uniform_f(__tr_su.zoomblur_twopass.strength, __tr_cf.zoomblur_twopass.strength);
	texture_set_stage(__tr_su.zoomblur_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_swirl() {
	shader_set(__ftr_sh_swirl);
	shader_set_uniform_f(__tr_su.swirl.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.swirl.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.swirl.center, __tr_cf.swirl.center);
	shader_set_uniform_f(__tr_su.swirl.strength, __tr_cf.swirl.strength);
	shader_set_uniform_f(__tr_su.swirl.swirl, __tr_cf.swirl.swirl);
}
function __tr_swirl_twopass() {
	shader_set(__ftr_sh_swirl_twopass);
	shader_set_uniform_f(__tr_su.swirl_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.swirl_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.swirl_twopass.center, __tr_cf.swirl_twopass.center);
	shader_set_uniform_f(__tr_su.swirl_twopass.strength, __tr_cf.swirl_twopass.strength);
	shader_set_uniform_f(__tr_su.swirl_twopass.swirl, __tr_cf.swirl_twopass.swirl);
	texture_set_stage(__tr_su.swirl_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_wipe_l() {
	shader_set(__ftr_sh_wrap);
	shader_set_uniform_f(__tr_su.wrap.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.wrap.dir, -1, 0);
}
function __tr_wipe_l_twopass() {
	shader_set(__ftr_sh_wrap_twopass);
	shader_set_uniform_f(__tr_su.wrap_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.wrap_twopass.sample_tex2, ftr_from_surface_tex);
	shader_set_uniform_f(__tr_su.wrap_twopass.dir, -1, 0);
}

function __tr_wipe_r() {
	shader_set(__ftr_sh_wrap);
	shader_set_uniform_f(__tr_su.wrap.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.wrap.dir, 1, 0);
}
function __tr_wipe_r_twopass() {
	shader_set(__ftr_sh_wrap_twopass);
	shader_set_uniform_f(__tr_su.wrap_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.wrap_twopass.sample_tex2, ftr_from_surface_tex);
	shader_set_uniform_f(__tr_su.wrap_twopass.dir, 1, 0);
}

function __tr_wipe_u() {
	shader_set(__ftr_sh_wrap);
	shader_set_uniform_f(__tr_su.wrap.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.wrap.dir, 0, 1);
}
function __tr_wipe_u_twopass() {
	shader_set(__ftr_sh_wrap_twopass);
	shader_set_uniform_f(__tr_su.wrap_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.wrap_twopass.sample_tex2, ftr_from_surface_tex);
	shader_set_uniform_f(__tr_su.wrap_twopass.dir, 0, 1);
}

function __tr_wipe_d() {
	shader_set(__ftr_sh_wrap);
	shader_set_uniform_f(__tr_su.wrap.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.wrap.dir, 0, -1);
}
function __tr_wipe_d_twopass() {
	shader_set(__ftr_sh_wrap_twopass);
	shader_set_uniform_f(__tr_su.wrap_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.wrap_twopass.color, ftr_color_rgb);
	texture_set_stage(__tr_su.wrap_twopass.sample_tex2, ftr_from_surface_tex);
	shader_set_uniform_f(__tr_su.wrap_twopass.dir, 0, -1);
}

function __tr_circle() {
	shader_set(__ftr_sh_circle);
	shader_set_uniform_f(__tr_su.circle.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.circle.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.circle.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.circle.center, __tr_cf.circle.center);
	shader_set_uniform_f(__tr_su.circle.inner, __tr_cf.circle.inner);
	shader_set_uniform_f(__tr_su.circle.invert, __tr_cf.circle.invert);
}
function __tr_circle_twopass() {
	shader_set(__ftr_sh_circle_twopass);
	shader_set_uniform_f(__tr_su.circle_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.circle_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.circle_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.circle_twopass.center, __tr_cf.circle_twopass.center);
	shader_set_uniform_f(__tr_su.circle_twopass.inner, __tr_cf.circle_twopass.inner);
	shader_set_uniform_f(__tr_su.circle_twopass.invert, __tr_cf.circle_twopass.invert);
	texture_set_stage(__tr_su.circle_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_luma_square() {
	shader_set(__ftr_sh_luma);
	shader_set_uniform_f(__tr_su.luma.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.luma.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.luma.inner, __tr_cf.luma.inner);
	texture_set_stage(__tr_su.luma.sample_luma_tex, __tr_tx.luma.square_tex);
}
function __tr_luma_square_twopass() {
	shader_set(__ftr_sh_luma_twopass);
	shader_set_uniform_f(__tr_su.luma_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.luma_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.luma_twopass.inner, __tr_cf.luma_twopass.inner);
	texture_set_stage(__tr_su.luma_twopass.sample_tex2, ftr_from_surface_tex);
	texture_set_stage(__tr_su.luma_twopass.sample_luma_tex, __tr_tx.luma.square_tex);
}

function __tr_luma_swirl() {
	shader_set(__ftr_sh_luma);
	shader_set_uniform_f(__tr_su.luma.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.luma.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.luma.inner, __tr_cf.luma.inner);
	texture_set_stage(__tr_su.luma.sample_luma_tex, __tr_tx.luma.swirl_tex);
}
function __tr_luma_swirl_twopass() {
	shader_set(__ftr_sh_luma_twopass);
	shader_set_uniform_f(__tr_su.luma_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.luma_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.luma_twopass.inner, __tr_cf.luma_twopass.inner);
	texture_set_stage(__tr_su.luma_twopass.sample_tex2, ftr_from_surface_tex);
	texture_set_stage(__tr_su.luma_twopass.sample_luma_tex, __tr_tx.luma.swirl_tex);
}

function __tr_blur() {
	shader_set(__ftr_sh_blur);
	shader_set_uniform_f(__tr_su.blur.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.blur.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.blur.amount, __tr_cf.blur.amount);
}
function __tr_blur_twopass() {
	shader_set(__ftr_sh_blur_twopass);
	shader_set_uniform_f(__tr_su.blur_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.blur_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.blur_twopass.amount, __tr_cf.blur_twopass.amount);
	texture_set_stage(__tr_su.blur_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_frost() {
	shader_set(__ftr_sh_frost);
	shader_set_uniform_f(__tr_su.frost.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.frost.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.frost.color_frost, __tr_cf.frost.color);
	shader_set_uniform_f(__tr_su.frost.multiplier, __tr_cf.frost.multiplier);
	shader_set_uniform_f(__tr_su.frost.inner, __tr_cf.frost.inner);
}
function __tr_frost_twopass() {
	shader_set(__ftr_sh_frost_twopass);
	shader_set_uniform_f(__tr_su.frost_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.frost_twopass.color, ftr_color_rgb);
	shader_set_uniform_f_array(__tr_su.frost_twopass.color_frost, __tr_cf.frost_twopass.color);
	shader_set_uniform_f(__tr_su.frost_twopass.multiplier, __tr_cf.frost_twopass.multiplier);
	shader_set_uniform_f(__tr_su.frost_twopass.inner, __tr_cf.frost_twopass.inner);
	texture_set_stage(__tr_su.frost_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_sqrot() {
	shader_set(__ftr_sh_sqrot);
	shader_set_uniform_f(__tr_su.sqrot.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.sqrot.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.sqrot.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.sqrot.invert, false);
	shader_set_uniform_f(__tr_su.sqrot.smooth_edges, __tr_cf.sqrot.smooth_edges);
	shader_set_uniform_f(__tr_su.sqrot.angle_max, __tr_cf.sqrot.angle_max);
}
function __tr_sqrot_twopass() {
	shader_set(__ftr_sh_sqrot_twopass);
	shader_set_uniform_f(__tr_su.sqrot_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.sqrot_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.sqrot_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.sqrot_twopass.invert, false);
	shader_set_uniform_f(__tr_su.sqrot_twopass.smooth_edges, __tr_cf.sqrot_twopass.smooth_edges);
	shader_set_uniform_f(__tr_su.sqrot_twopass.angle_max, __tr_cf.sqrot_twopass.angle_max);
	texture_set_stage(__tr_su.sqrot_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_masksprite() {
	shader_set(__ftr_sh_masksprite);
	shader_set_uniform_f(__tr_su.masksprite.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.masksprite.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.masksprite.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.masksprite.invert, false);
	shader_set_uniform_f_array(__tr_su.masksprite.center, __tr_cf.masksprite.center);
	shader_set_uniform_f(__tr_su.masksprite.scale_max, __tr_cf.masksprite.scale_max);
	shader_set_uniform_f(__tr_su.masksprite.mask_res, __tr_tx.masksprite.logo_w, __tr_tx.masksprite.logo_h);
	texture_set_stage(__tr_su.masksprite.mask_tex, __tr_tx.masksprite.logo_tex); 
}
function __tr_masksprite_twopass() {
	shader_set(__ftr_sh_masksprite_twopass);
	shader_set_uniform_f(__tr_su.masksprite_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.masksprite_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.masksprite_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.masksprite_twopass.invert, false);
	shader_set_uniform_f_array(__tr_su.masksprite_twopass.center, __tr_cf.masksprite_twopass.center);
	shader_set_uniform_f(__tr_su.masksprite_twopass.scale_max, __tr_cf.masksprite_twopass.scale_max);
	shader_set_uniform_f(__tr_su.masksprite_twopass.mask_res, __tr_tx.masksprite.logo_w, __tr_tx.masksprite.logo_h);
	texture_set_stage(__tr_su.masksprite_twopass.mask_tex, __tr_tx.masksprite.logo_tex);
	texture_set_stage(__tr_su.masksprite_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_doom() {
	shader_set(__ftr_sh_doom);
	shader_set_uniform_f(__tr_su.doom.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.doom.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.doom.bars, __tr_cf.doom.bars);
	shader_set_uniform_f(__tr_su.doom.amplitude, __tr_cf.doom.amplitude);
	shader_set_uniform_f(__tr_su.doom.frequency, __tr_cf.doom.frequency);
	shader_set_uniform_f(__tr_su.doom.drip_scale, __tr_cf.doom.drip_scale);
	shader_set_uniform_f(__tr_su.doom.noise, __tr_cf.doom.noise);
	shader_set_uniform_f(__tr_su.doom.scale, __tr_cf.doom.scale);
}
function __tr_doom_twopass() {
	shader_set(__ftr_sh_doom_twopass);
	shader_set_uniform_f(__tr_su.doom_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.doom_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.doom_twopass.bars, __tr_cf.doom_twopass.bars);
	shader_set_uniform_f(__tr_su.doom_twopass.amplitude, __tr_cf.doom_twopass.amplitude);
	shader_set_uniform_f(__tr_su.doom_twopass.frequency, __tr_cf.doom_twopass.frequency);
	shader_set_uniform_f(__tr_su.doom_twopass.drip_scale, __tr_cf.doom_twopass.drip_scale);
	shader_set_uniform_f(__tr_su.doom_twopass.noise, __tr_cf.doom_twopass.noise);
	shader_set_uniform_f(__tr_su.doom_twopass.scale, __tr_cf.doom_twopass.scale);
	texture_set_stage(__tr_su.doom_twopass.sample_tex2, ftr_from_surface_tex);
}

function __tr_dither_circle() {
	shader_set(__ftr_sh_dither_circle);
	shader_set_uniform_f(__tr_su.dither_circle.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_circle.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_circle.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_circle.inner, __tr_cf.dither_circle.inner);
	shader_set_uniform_f_array(__tr_su.dither_circle.center, __tr_cf.dither_circle.center);
	texture_set_stage(__tr_su.dither_circle.sample_bayer_tex, __tr_tx.dither.bayer_tex);
}
function __tr_dither_circle_twopass() {
	shader_set(__ftr_sh_dither_circle_twopass);
	shader_set_uniform_f(__tr_su.dither_circle_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_circle_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_circle_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_circle_twopass.inner, __tr_cf.dither_circle_twopass.inner);
	shader_set_uniform_f_array(__tr_su.dither_circle_twopass.center, __tr_cf.dither_circle_twopass.center);
	texture_set_stage(__tr_su.dither_circle_twopass.sample_tex2, ftr_from_surface_tex);
	texture_set_stage(__tr_su.dither_circle_twopass.sample_bayer_tex, __tr_tx.dither.bayer_tex);
}

function __tr_dither_luma_square() {
	shader_set(__ftr_sh_dither_luma);
	shader_set_uniform_f(__tr_su.dither_luma.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_luma.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_luma.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_luma.inner, __tr_cf.dither_luma.inner);
	texture_set_stage(__tr_su.dither_luma.sample_bayer_tex, __tr_tx.dither.bayer_tex);
	texture_set_stage(__tr_su.dither_luma.sample_luma_tex, __tr_tx.luma.square_tex);
}
function __tr_dither_luma_square_twopass() {
	shader_set(__ftr_sh_dither_luma_twopass);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_luma_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.inner, __tr_cf.dither_luma_twopass.inner);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_tex2, ftr_from_surface_tex);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_bayer_tex, __tr_tx.dither.bayer_tex);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_luma_tex, __tr_tx.luma.square_tex);
}

function __tr_dither_luma_swirl() {
	shader_set(__ftr_sh_dither_luma);
	shader_set_uniform_f(__tr_su.dither_luma.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_luma.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_luma.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_luma.inner, __tr_cf.dither_luma.inner);
	texture_set_stage(__tr_su.dither_luma.sample_bayer_tex, __tr_tx.dither.bayer_tex);
	texture_set_stage(__tr_su.dither_luma.sample_luma_tex, __tr_tx.luma.swirl_tex);
}
function __tr_dither_luma_swirl_twopass() {
	shader_set(__ftr_sh_dither_luma_twopass);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.pos_res, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.progress, ftr_position);
	shader_set_uniform_f_array(__tr_su.dither_luma_twopass.color, ftr_color_rgb);
	shader_set_uniform_f(__tr_su.dither_luma_twopass.inner, __tr_cf.dither_luma_twopass.inner);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_tex2, ftr_from_surface_tex);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_bayer_tex, __tr_tx.dither.bayer_tex);
	texture_set_stage(__tr_su.dither_luma_twopass.sample_luma_tex, __tr_tx.luma.swirl_tex);
}

function __tr_wipe_diagonal() {
	ftr_sequence_index = __ftr_sq_wipe_diagonal;
	ftr_sequence_shader = __ftr_sh_sequence_example;
	ftr_sequence_shader_tex = -1;
	ftr_sequence_width = 480;
	ftr_sequence_height = 270;
}

function __tr_wipe_horizontal() {
	ftr_sequence_index = __ftr_sq_wipe_horizontal;
	ftr_sequence_shader = __ftr_sh_colorize;
	ftr_sequence_shader_tex = -1;
	ftr_sequence_width = 480;
	ftr_sequence_height = 270;
}

function __tr_wipe_vertical() {
	ftr_sequence_index = __ftr_sq_wipe_vertical;
	ftr_sequence_shader = __ftr_sh_colorize;
	ftr_sequence_shader_tex = -1;
	ftr_sequence_width = 480;
	ftr_sequence_height = 270;
}

function __tr_wipe_triangle() {
	ftr_sequence_index = __ftr_sq_wipe_triangle;
	ftr_sequence_shader = __ftr_sh_colorize;
	ftr_sequence_shader_tex = -1;
	ftr_sequence_width = 480;
	ftr_sequence_height = 270;
}

function __tr_smw2yi() {
	ftr_transition_draw_enable = false;
	var p = ftr_position;
	var ww2 = ftr_wrender/2;
	var hh2 = ftr_hrender/2;
	var xx = 0; var yy = 0;
	if surface_exists(ftr_current_surface) {
		shader_set(__ftr_sh_colorize);
		shader_set_uniform_f_array(shader_get_uniform(__ftr_sh_colorize, "color"), ftr_color_rgb);
		surface_set_target(ftr_current_surface);
		draw_clear_alpha(c_black, 0);
		__ftr_draw_quad(ww2, yy, xx, yy, ww2*p, hh2*p, xx, hh2);
		__ftr_draw_quad(ww2, yy, ftr_wrender, yy, ftr_wrender-(ww2*p), hh2*p, ftr_wrender, hh2);
		__ftr_draw_quad(xx, hh2, ww2*p, ftr_hrender-(hh2*p), xx, ftr_hrender, ww2, ftr_hrender);
		__ftr_draw_quad(ftr_wrender, hh2,ftr_wrender, ftr_hrender,ftr_wrender-(ww2*p), ftr_hrender-(hh2*p), ww2, ftr_hrender);
		shader_reset();
		surface_reset_target();
		draw_surface_stretched(ftr_current_surface, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
	}
}
#endregion


#region Transitions List

/*--------------------------------------------------------------------------
Here you need to assign the type with the function.
When associating the function, do NOT include the parentheses () at the end.
This list MUST be in the order of the TR_TYPE enum.
--------------------------------------------------------------------------*/

global.__ftr_transitions = [
	//[INDEX,       INSTANCE,                NAME],
	[TR_TYPE.FADE, __tr_fade, "fade"],
	[TR_TYPE.FADE_TWOPASS, __tr_fade_twopass, "fade_twopass"],
	[TR_TYPE.HALFTONE, __tr_halftone, "halftone"],
	[TR_TYPE.HALFTONE_TWOPASS, __tr_halftone_twopass, "halftone_twopass"],
	[TR_TYPE.ZWAVE, __tr_zwave, "zwave"],
	[TR_TYPE.ZWAVE_TWOPASS, __tr_zwave_twopass, "zwave_twopass"],
	[TR_TYPE.CROSSWARP, __tr_crosswarp, "crosswarp"],
	[TR_TYPE.CROSSWARP_TWOPASS, __tr_crosswarp_twopass, "crosswarp_twopass"],
	[TR_TYPE.CROSSFADE, __tr_crossfade, "crossfade"],
	[TR_TYPE.CROSSFADE_TWOPASS, __tr_crossfade_twopass, "crossfade_twopass"],
	[TR_TYPE.PIXELIZE, __tr_pixelize, "pixelize"],
	[TR_TYPE.PIXELIZE_TWOPASS, __tr_pixelize_twopass, "pixelize_twopass"],
	[TR_TYPE.ZOOM, __tr_zoom, "zoom"],
	[TR_TYPE.ZOOM_TWOPASS, __tr_zoom_twopass, "zoom_twopass"],
	[TR_TYPE.ZOOMBLUR, __tr_zoomblur, "zoomblur"],
	[TR_TYPE.ZOOMBLUR_TWOPASS, __tr_zoomblur_twopass, "zoomblur_twopass"],
	[TR_TYPE.SWIRL, __tr_swirl, "swirl"],
	[TR_TYPE.SWIRL_TWOPASS, __tr_swirl_twopass, "swirl_twopass"],
	[TR_TYPE.WRAP_L, __tr_wipe_l, "wipe_l"],
	[TR_TYPE.WRAP_L_TWOPASS, __tr_wipe_l_twopass, "wipe_l_twopass"],
	[TR_TYPE.WRAP_R, __tr_wipe_r, "wipe_r"],
	[TR_TYPE.WRAP_R_TWOPASS, __tr_wipe_r_twopass, "wipe_r_twopass"],
	[TR_TYPE.WRAP_U, __tr_wipe_u, ""],
	[TR_TYPE.WRAP_U_TWOPASS, __tr_wipe_u_twopass, "wipe_u_twopass"],
	[TR_TYPE.WRAP_D, __tr_wipe_d, ""],
	[TR_TYPE.WRAP_D_TWOPASS, __tr_wipe_d_twopass, "wipe_d_twopass"],
	[TR_TYPE.CIRCLE, __tr_circle, "circle"],
	[TR_TYPE.CIRCLE_TWOPASS, __tr_circle_twopass, "circle_twopass"],
	[TR_TYPE.LUMA_SQUARE, __tr_luma_square, "luma_square"],
	[TR_TYPE.LUMA_SQUARE_TWOPASS, __tr_luma_square_twopass, "luma_square_twopass"],
	[TR_TYPE.LUMA_SWIRL, __tr_luma_swirl, "luma_swirl"],
	[TR_TYPE.LUMA_SWIRL_TWOPASS, __tr_luma_swirl_twopass, "luma_swirl_twopass"],
	[TR_TYPE.BLUR, __tr_blur, "blur"],
	[TR_TYPE.BLUR_TWOPASS, __tr_blur_twopass, "blur_twopass"],
	[TR_TYPE.FROST, __tr_frost, "frost"],
	[TR_TYPE.FROST_TWOPASS, __tr_frost_twopass, "frost_twopass"],
	[TR_TYPE.SQROT, __tr_sqrot, "sqrot"],
	[TR_TYPE.SQROT_TWOPASS, __tr_sqrot_twopass, "sqrot_twopass"],
	[TR_TYPE.MASK_SPRITE, __tr_masksprite, "masksprite"],
	[TR_TYPE.MASK_SPRITE_TWOPASS, __tr_masksprite_twopass, "masksprite_twopass"],
	[TR_TYPE.DOOM, __tr_doom, "doom"],
	[TR_TYPE.DOOM_TWOPASS, __tr_doom_twopass, "doom_twopass"],
	[TR_TYPE.DITHER_CIRCLE, __tr_dither_circle, "dither_circle"],
	[TR_TYPE.DITHER_CIRCLE_TWOPASS, __tr_dither_circle_twopass, "dither_circle_twopass"],
	[TR_TYPE.DITHER_LUMA_SQUARE, __tr_dither_luma_square, "dither_luma"],
	[TR_TYPE.DITHER_LUMA_SQUARE_TWOPASS, __tr_dither_luma_square_twopass, "dither_luma_twopass"],
	[TR_TYPE.DITHER_LUMA_SWIRL, __tr_dither_luma_swirl, "dither_luma"],
	[TR_TYPE.DITHER_LUMA_SWIRL_TWOPASS, __tr_dither_luma_swirl_twopass, "dither_luma_twopass"],
	[TR_TYPE.WIPE_DIAGONAL, __tr_wipe_diagonal, "wipe_diagonal"],
	[TR_TYPE.WIPE_HORIZONTAL, __tr_wipe_horizontal, "wipe_horizontal"],
	[TR_TYPE.WIPE_VERTICAL, __tr_wipe_vertical, "wipe_vertical"],
	[TR_TYPE.WIPE_TRIANGLE, __tr_wipe_triangle, "wipe_triangle"],
	[TR_TYPE.SMW2YI, __tr_smw2yi, "smw2yi"],
];
#endregion


#endregion

