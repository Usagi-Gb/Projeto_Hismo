if (instance_exists(obj_player)) {
    var _dir = point_direction(obj_player.x, obj_player.y, mouse_x, mouse_y);
    x = obj_player.x + lengthdir_x(30, _dir);
    y = obj_player.y + lengthdir_y(30, _dir);
    
    image_angle = _dir;
    
    if (_dir > 90 && _dir < 270) {
        image_yscale = -1;
    } else {
        image_yscale = 1;
    }
}	