
/*----------------------------------------------------------------
Don't touch the lines below unless you know what you're doing.
The developer is not responsible if you modify the code above and
break it.
----------------------------------------------------------------*/

//#macro FTR_GAMESURF_SAMPLING 4 (maybe in the future...)
#macro FTR_HTML5_MODE (os_browser != browser_not_a_browser)


enum TR_WAY {
	IN = 1,
	OUT = -1,
	TWOPASS = 2,
}

enum TR_DRAW_TYPE {
	GUI_BEGIN = ev_gui_begin,
	GUI = ev_gui,
	GUI_END = ev_gui_end
}

// surfaces used for transition
global.__ftr_game_render_surface = undefined;

function __ftr_surface_copy_part_fixed(destination, x, y, source, xs, ys, ws, hs) {
	var _cw = gpu_get_colorwriteenable();
	var _be = gpu_get_blendenable();
	surface_set_target(destination);
	draw_clear_alpha(c_black, 1);
	gpu_set_colorwriteenable(true, true, true, false);
	gpu_set_blendenable(false);
	draw_surface_part(source, xs, ys, ws, hs, x, y);
	gpu_set_blendenable(_be);
	gpu_set_colorwriteenable(_cw);
	surface_reset_target();
}

function __ftr_view_get_surface(view) {
	var _w = view_wport[view];
	var _h = view_hport[view];
	var _s = surface_create(_w, _h);
	__ftr_surface_copy_part_fixed(_s, 0, 0, global.__ftr_game_render_surface ?? application_surface, view_xport[view], view_yport[view], _w, _h);
	return _s;
}

// core transition
function screen_transition(type, way, async, color=c_white, callback=undefined, speed=1, view_number=0, draw_type=TR_DRAW_TYPE.GUI_END, anim_curve=__ac_ftr_linear) {
	if (!instance_exists(__obj_ftr_transition) || async) {
		var _layer = "__TRANSITION__";
		if !layer_exists(_layer) _layer = layer_create(-9999, _layer);
		var _tr = instance_create_layer(0, 0, _layer, __obj_ftr_transition);
		with(_tr) {
			if (way == TR_WAY.IN || way == TR_WAY.TWOPASS) {
				ftr_position = 0;
				ftr_position_n = 0;
			} else {
				ftr_position = 1;
				ftr_position_n = 1;
			}
			ftr_way = way;
			ftr_draw_type = draw_type;
			ftr_view_number = view_number;
			ftr_animation_curve = anim_curve;
			if (way == TR_WAY.TWOPASS) {
				ftr_from_surface = __ftr_view_get_surface(view_number);
				ftr_from_surface_tex = surface_get_texture(ftr_from_surface);
			}
			ftr_index = type;
			ftr_callback = callback;
			ftr_color = color;
			if (speed > 0) ftr_speed = speed;
			//__ftr_exception();
		}
		return _tr;
	}
}


function __ftr_prepare_transition() {
	ftr_color_rgb = [color_get_red(ftr_color)/255, color_get_green(ftr_color)/255, color_get_blue(ftr_color)/255];
	if (ftr_sequence_index != -1) {
		if (!ftr_sequence_started) {
			ftr_sequence_id = layer_sequence_create(layer, 0, 0, ftr_sequence_index);
			ftr_sequence_started = true;
		}
		layer_sequence_headpos(ftr_sequence_id, ftr_position * layer_sequence_get_length(ftr_sequence_id));
	}
	layer_script_begin(layer, function() {
		if (event_type == ev_draw) {
			//if (!FTR_FTR_HTML5_MODE) {
				if (event_number == ftr_draw_type) {
					__ftr_render_transition();
				}
			//}
			if (event_number == 0) {
				ftr_render_current_matrix = matrix_get(matrix_world);
				var _xoffset = 0;
				if (camera_get_active() != view_camera[ftr_view_number]) _xoffset = ftr_wport*4;
				var _cam = view_camera[ftr_view_number];
				var _ww = camera_get_view_width(_cam);
				var _hh = camera_get_view_height(_cam);
				matrix_set(matrix_world, matrix_build(camera_get_view_x(_cam)+_xoffset, camera_get_view_y(_cam), 0, 0, 0, 0, _ww/ftr_sequence_width, _hh/ftr_sequence_height, 1));
				if (ftr_sequence_shader != -1) __ftr_sequence_render_shader(); // sequence shader
			}
		}
	});
	layer_script_end(layer, function() {
		if (event_type == ev_draw) {
			if (event_number == 0) {
				matrix_set(matrix_world, ftr_render_current_matrix);
				if (shader_current() != -1) shader_reset();
			}
		}
	});
}


function __ftr_render_transition() {
	draw_set_color(c_white);
	draw_set_alpha(1);
	
	if (!surface_exists(ftr_current_surface)) {
		ftr_current_surface = surface_create(ftr_wport, ftr_hport);
		ftr_from_surface = surface_create(ftr_wport, ftr_hport);
	}
	
	if (ftr_transition_draw_enable) __ftr_surface_copy_part_fixed(ftr_current_surface, 0, 0, global.__ftr_game_render_surface ?? application_surface, ftr_xport, ftr_yport, ftr_wport, ftr_hport);
	method(self, global.__ftr_transitions[ftr_index][1])();
	
	if (ftr_transition_draw_enable) {
		if (ftr_render_scaled_to_gui) {
			draw_surface_stretched(ftr_current_surface, ftr_xrender, ftr_yrender, ftr_wrender, ftr_hrender);
		} else {
			draw_surface_stretched(ftr_current_surface, ftr_xport, ftr_yport, ftr_wport, ftr_hport);
		}
	}
	if (shader_current() != -1) shader_reset();
	
	__ftr_draw_frame_correction();
}


function __ftr_draw_frame_correction() {
	if (ftr_cancheck_frame) {
		if ftr_callback != undefined ftr_show_frame = false;
	}
	if (ftr_show_frame && ftr_sequence_shader != -1) {
		__ftr_sequence_render_shader();
		draw_sprite_stretched_ext(__spr_ftr_pixel, 0, ftr_xport, ftr_yport, ftr_wport, ftr_hport, ftr_color, 1);
		//draw_primitive_begin(pr_trianglelist);
		//draw_vertex(ftr_xport, ftr_yport);
		//draw_vertex(ftr_xport, ftr_yport+ftr_hport);
		//draw_vertex(ftr_xport+ftr_wport, ftr_yport);
		//draw_primitive_end();
		if (shader_current() != -1) shader_reset();
		ftr_show_frame_n -= 1;
		if (ftr_show_frame_n <= 0) {
			ftr_show_frame = false;
			ftr_cancheck_frame = false;
		}
	}
}


// -- sequence transition shader [global] --
// there is usually no reason to change this.
function __ftr_sequence_render_shader() {
	shader_set(ftr_sequence_shader);
	shader_set_uniform_f(shader_get_uniform(ftr_sequence_shader, "pos_res"), ftr_xport, ftr_yport, ftr_wport, ftr_hport);
	shader_set_uniform_f(shader_get_uniform(ftr_sequence_shader, "progress"), ftr_position);
	shader_set_uniform_f_array(shader_get_uniform(ftr_sequence_shader, "color"), ftr_color_rgb);
	shader_set_uniform_f(shader_get_uniform(ftr_sequence_shader, "time"), ftr_time_delta);
	if (ftr_sequence_shader_tex != -1) texture_set_stage(shader_get_sampler_index(ftr_sequence_shader, "texture2"), sprite_get_texture(ftr_sequence_shader_tex, 0));
}


function __ftr_animend() {
	if (!ftr_finished) {
		if (ftr_way != TR_WAY.TWOPASS) __ftr_execute_callback();
		alarm[0] = 3;
		ftr_finished = true;
	}
}

function __ftr_tween(curve, position, channels_array, channel_index) {
	var _cv_value = 0;
	if (channel_index < array_length(channels_array)) {
		var _cv_ch = animcurve_get_channel(animcurve_get(curve), channels_array[@ channel_index])
		_cv_value = animcurve_channel_evaluate(_cv_ch, position);
	}
	return _cv_value;
}

function __ftr_draw_quad(x1, y1, x2, y2, x3, y3, x4, y4) {
	draw_primitive_begin(pr_trianglestrip);
    draw_vertex(x1, y1);
    draw_vertex(x3, y3);
    draw_vertex(x2, y2);
    draw_vertex(x4, y4);
	draw_primitive_end();
}

function __ftr_execute_callback() {
	if !is_undefined(ftr_callback) ftr_callback();
}


function screen_transition_exists(index) {
	return (index != -1 && index != undefined && instance_exists(index));
}

function screen_transition_destroy(index, forced) {
	if (!forced) {
		instance_destroy(index);
	} else {
		instance_destroy(__obj_ftr_transition);
		layer_destroy("__TRANSITION__");
	}
}

function screen_transition_is_paused(index) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_is_paused()"]); exit;}
	return index.ftr_paused;
}

function screen_transition_set_pause(index, pause) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_set_pause()"]); exit;}
	index.ftr_paused = pause;
}

function screen_transition_set_drawtype(index, draw_type) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_set_drawtype()"]); exit;}
	index.ftr_draw_type = draw_type;
}

function screen_transition_set_color(index, color) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_set_color()"]); exit;}
	index.ftr_color = color;
}

function screen_transition_set_progress(index, progress) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_set_progress()"]); exit;}
	index.ftr_position = progress;
}

function screen_transition_set_speed(index, speed) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_set_speed()"]); exit;}
	index.ftr_speed = speed;
}

function screen_transition_set_render_surface(surface_id) {
	if (surface_id == -1) {
		global.__ftr_game_render_surface = undefined;
	} else {
		if surface_exists(surface_id) {
			global.__ftr_game_render_surface = surface_id;
		} else {
			__ftr_exception(2, ["screen_transition_set_render_surface()"]);
		}
	}
}

function screen_transition_get_progress(index) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_get_progress()"]); exit;}
	return index.ftr_position;
}

function screen_transition_get_color(index) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_get_progress()"]); exit;}
	return index.ftr_color;
}

function screen_transition_get_speed(index) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_get_speed()"]); exit;}
	return index.ftr_speed;
}

function screen_transition_get_drawtype(index) {
	if !screen_transition_exists(index) {__ftr_exception(3, ["screen_transition_get_drawtype()"]); exit;}
	return index.ftr_draw_type;
}

function screen_transition_get_render_surface() {
	return global.__ftr_game_render_surface ?? application_surface;
}

function screen_transition_modify(transition_index, vars_array, values_array) {
	var _found = false;
	var _index = global.__ftr_transitions[transition_index][2];
	
	if variable_struct_exists(__tr_cf, _index) {
		var _struct_vars = variable_struct_get_names(__tr_cf[$ _index]);
		var _len_st = array_length(_struct_vars);
		var _len_vr = array_length(vars_array);
		try {
			for (var i = 0; i < _len_st; ++i) {
				for (var a = 0; a < _len_vr; ++a) {
					if (_struct_vars[i] == vars_array[a]) {
						__tr_cf[$ _index][$ vars_array[a]] = values_array[a];
						_found = true;
					}
				}
			}
		} catch(_excp) {
			__ftr_exception(1, [_excp.message]);
		}
	}
	if (!_found) {
		__ftr_exception(0, ["screen_transition_modify()"]);
		exit;
	}
}


function __ftr_exception(exception=-1, data_array=[]) {
	if (!FTR_ENABLE_EXCEPTIONS) exit;
	var _m = "";
	if (!argument_count > 0) {
		if (!view_enabled) _m = 
		"Unable to render transition. Views not enabled. (view_enabled)";
		/*if (typeof(ftr_index) != "int64") _m =
		"The transition index is not an enum entry. (TR_TYPE)";
		else if (typeof(ftr_way) != "int64") _m =
		"The transition way is not an enum entry. (TR_WAY)";
		else if (typeof(ftr_draw_type) != "int64") _m =
		"The draw type is not an enum entry. (TR_DRAW_TYPE)";
		else if (typeof(ftr_view_number) != "int64" && typeof(ftr_view_number) != "number") _m =
		"The view index is not a number. (0-7)";
		else if (ftr_callback != undefined && typeof(ftr_callback) != "method" && typeof(ftr_callback) != "number") _m =
		"Invalid callback. (Must be: undefined or method/function index)";
		else if (typeof(ftr_color) != "number") _m =
		"Invalid color.";
		else if (typeof(ftr_speed) != "number") _m =
		"Speed value is not a number (0 ~ inf)";
		else if (typeof(ftr_animation_curve) != "number") _m =
		"Invalid animation curve index.";*/
	} else {
		switch(exception) {
			case 0: _m = "Transition does not exist or entered variable cannot be modified."; break;
			case 1: _m = "The array of names and values must match."; break;
			case 2: _m = "The surface doesn't exist."; break;
			case 3: _m = "The transition does not exist."; break;
		}
		var _l = array_length(data_array);
		if (_l > 0) {
			_m += "\n";
			for (var i = 0; i < _l; ++i) {_m += string(data_array[i]) + "\n";}
		}
	}
	if (_m != "") {
		var _sep = "";
		repeat(string_length(_m)) _sep += "■";
		throw(":\n"+_sep+"\n► " +string(_m) + "\n"+_sep);
	}
}

