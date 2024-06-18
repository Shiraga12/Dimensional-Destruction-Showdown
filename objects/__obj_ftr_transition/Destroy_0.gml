
// clean up
if surface_exists(ftr_from_surface) surface_free(ftr_from_surface);
if surface_exists(ftr_current_surface) surface_free(ftr_current_surface);
if (ftr_sequence_started) layer_sequence_destroy(ftr_sequence_id);
