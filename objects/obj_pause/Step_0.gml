if (keyboard_check_pressed(ord("P"))) {
    paused = !paused;

    if (paused) {
        var _width = surface_get_width(application_surface);
        var _height = surface_get_height(application_surface);
        
        pause_surf = surface_create(_width, _height);
        surface_copy(pause_surf, 0, 0, application_surface);
        
        instance_deactivate_all(true);
    } else {
        instance_activate_all();
        
        if (surface_exists(pause_surf)) {
            surface_free(pause_surf);
        }
    }
}