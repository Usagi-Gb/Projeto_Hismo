depth =- bbox_bottom;

var up, down, left, right;

up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

show_debug_message(arma);

if(up ^^ down || left ^^ right){
	move_dir = point_direction(0, 0, (right - left), (down - up));
	vel = max_vel;
}
else{
		vel = lerp(vel, 0, 0.1);
	}

velh = lengthdir_x(vel,move_dir);
velv = lengthdir_y(vel, move_dir);
joga_arma();
efeito_dano();
olha_mouse();