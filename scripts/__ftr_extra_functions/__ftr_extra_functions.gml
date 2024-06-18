
function print() {
	if (argument_count > 0) {
		var _log = "";
		for (var i = 0; i < argument_count; i += 1;) {
			_log += string(argument[i]);
			if (argument_count > 1) _log += " | ";
		}
		show_debug_message(_log);
	}
}

function choose_array(array) {
	return array[@ irandom_range(0, array_length(array)-1)];
}

function room_to_gui_convert(x1, y1, camera, gui_width, gui_height, normalize) {
	var px = (x1-camera_get_view_x(camera)) * (gui_width/camera_get_view_width(camera));
	var py = (y1-camera_get_view_y(camera)) * (gui_height/camera_get_view_height(camera));
	return normalize ? {x : px/gui_width, y : py/gui_height} : {x : px, y : py};
}

function room_to_gui_convert_ext(x1, y1, camera, angle, gui_width, gui_height, normalize) {
	var cw = camera_get_view_width(camera);
	var ch = camera_get_view_height(camera);
	var vcenter_x = camera_get_view_x(camera) + (cw / 2);
	var vcenter_y = camera_get_view_y(camera) + (ch / 2);
	var zoom = gui_width/cw;
	var wcenter_dis = point_distance(vcenter_x, vcenter_y, x1, y1) * zoom;
	var wcenter_dir = point_direction(vcenter_x, vcenter_y, x1, y1) + angle;
	var px = (gui_width/2) + lengthdir_x(wcenter_dis, wcenter_dir);
	var py = (gui_height/2) + lengthdir_y(wcenter_dis, wcenter_dir);
	return normalize ? {x : px/gui_width, y : py/gui_height} : {x : px, y : py};
}

function gui_to_room_convert_ext(x1, y1, camera, angle, gui_width, gui_height, normalize) {
	var cx = camera_get_view_x(camera);
	var cy = camera_get_view_y(camera);
	var cw = camera_get_view_width(camera);
	var ch = camera_get_view_height(camera);
	var vcenter_x = gui_width / 2;
	var vcenter_y = gui_height / 2;
	var zoom = gui_width/cw;
	var wcenter_dis = point_distance(vcenter_x, vcenter_y, x1, y1) / zoom;
	var wcenter_dir = point_direction(vcenter_x, vcenter_y, x1, y1) - angle;
	var px = cx + (cw/2) + lengthdir_x(wcenter_dis, wcenter_dir);
	var py = cy + (ch/2) + lengthdir_y(wcenter_dis, wcenter_dir);
	return normalize ? {x : px/gui_width, y : py/gui_height} : {x : px, y : py};
}

function point_direction_radians(x1, y1, x2, y2) {
	var dir = degtorad(-point_direction(x1, y1, x2, y2));
	return {x : cos(dir), y : sin(dir)};
}

function point_direction_radians_simple(x1, y1, x2, y2) {
	var dir = arctan2(y2-y1, x2-x1);
	return {x : cos(dir), y : sin(dir)};
}

// the tween() function is __ftr_tween()
