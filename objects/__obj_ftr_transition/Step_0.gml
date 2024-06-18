
// prepare render
ftr_xport = view_xport[ftr_view_number];
ftr_yport = view_yport[ftr_view_number];
ftr_wport = view_wport[ftr_view_number];
ftr_hport = view_hport[ftr_view_number];
if (ftr_render_scaled_to_gui) {
	ftr_xrender = 0;
	ftr_yrender = 0;
	ftr_wrender = display_get_gui_width();
	ftr_hrender = display_get_gui_height();
} else {
	ftr_xrender = ftr_xport;
	ftr_yrender = ftr_yport;
	ftr_wrender = ftr_wport;
	ftr_hrender = ftr_hport;
}

ftr_time_delta = current_time * tr_speed_base/10;
__ftr_prepare_transition();

// run callback
if (ftr_paused) exit;
if (ftr_way == TR_WAY.TWOPASS) {
	if (ftr_canrun_callback) {
		__ftr_execute_callback();
		ftr_canrun_callback = false;
	}
}
var _way = ftr_way;
if (ftr_way == TR_WAY.IN || ftr_way == TR_WAY.TWOPASS) {
	if (ftr_position == 1) __ftr_animend();
	_way = 1;
} else if (ftr_way == TR_WAY.OUT) {
	if (ftr_position == 0) __ftr_animend();
	_way = -1;
}

// run animation
ftr_position = __ftr_tween(ftr_animation_curve, ftr_position_n, [0], 0);
ftr_position_n = clamp(ftr_position_n, 0, 1);
ftr_position_n += (tr_speed_base * ftr_speed) * _way;
