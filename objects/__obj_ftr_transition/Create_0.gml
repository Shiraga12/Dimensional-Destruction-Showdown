
// properties
tr_speed_base = 0.02;

// core [don't touch]
#region Core
ftr_draw_type = TR_DRAW_TYPE.GUI_END;
ftr_view_number = 0; // the current view index/number to render the animation
ftr_wport = 0;
ftr_hport = 0;
ftr_xport = 0;
ftr_yport = 0;
ftr_xrender = 0;
ftr_yrender = 0;
ftr_wrender = 0;
ftr_hrender = 0;
ftr_render_scaled_to_gui = FTR_RENDER_SCALED_TO_GUI;
ftr_from_surface = -1; // old room/scene/screen
ftr_from_surface_tex = -1;
ftr_current_surface = -1; // final render/current scene
ftr_paused = false;
ftr_color = c_white;
ftr_color_rgb = [0, 0, 0];
ftr_speed = 1;
ftr_index = 0;
ftr_way = 1;
ftr_callback = undefined;
ftr_canrun_callback = true;
ftr_animation_curve = __ac_ftr_linear;
ftr_position = 0;
ftr_position_n = 0;
ftr_time_delta = 0;
ftr_finished = false;
ftr_sequence_started = false;
ftr_sequence_id = -1;
ftr_sequence_shader = -1;
ftr_sequence_shader_tex = __spr_ftr_pixel;
ftr_sequence_width = 0;
ftr_sequence_height = 0;
ftr_render_current_matrix = [];
ftr_sequence_index = -1;
ftr_cancheck_frame = true;
ftr_show_frame = true;
ftr_show_frame_n = 4;
ftr_transition_draw_enable = true;
#endregion
