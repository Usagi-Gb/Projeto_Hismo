image_xscale = 0.2;
image_yscale = 0.2;
image_alpha = 1;
speed = 5;

if (instance_exists(obj_player)) {
    direction = point_direction(x, y, obj_player.x, obj_player.y);
} else {
    direction = 270;
}

image_angle = direction;