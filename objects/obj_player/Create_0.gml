velh = 0;
velv = 0;
max_vel = 3;
vel = 0;
move_dir = 0;
game_over = false;
gameover_surf = -1; 
ondas_alcancadas = 0;

arma = noone;

dano = false;
vida_max = 3;
vida = vida_max;
tempo_inv = game_get_speed(gamespeed_fps) * 2;

// --- Variáveis do Dash ---
is_dashing = false;
dash_speed = 8;       // Velocidade durante o dash
dash_duration = 15;   // Quantos frames o dash vai durar
dash_timer = 0;       // Cronómetro do dash
dash_cooldown = 60;   // Tempo de espera para usar de novo (ex: 60 frames = 1 seg)
dash_cd_timer = 0;
dash_dir = 0;         // Direção para onde o dash vai;
ritmo_timer = 0;
olha_mouse = function(){
	xscale = mouse_x - x != 0 ? sign(mouse_x - x) : 1;
}

efeito_dano = function(){
	static _valor = -0.05;
	
	if(!dano) return;
	if(image_alpha <= 0) _valor *= -1;
	if(image_alpha > 1) _valor *= -1;
	image_alpha += _valor;
}

toma_dano = function(){
	toma_dano = function(){
    // ADICIONAMOS "|| is_dashing" AQUI! 
    // Se ele já está a tomar dano OU está a dar dash, ele ignora o golpe completamente!
    if(dano || is_dashing) return; 
		
    vida--;
    dano = true;
    alarm[0] = tempo_inv;
}
}

usa_arma = function(){
	if (arma){
		var _fire = mouse_check_button(mb_left);
		arma.atirar = _fire;
		var _dir = point_direction(x, y, mouse_x, mouse_y);
		var _x = x +lengthdir_x(sprite_width /2, _dir);
		var _y = y +lengthdir_y(sprite_height /2, _dir);
		arma.x = _x;
		arma.y = _y;
		arma.image_angle = _dir;
	}
}

joga_arma = function(){
	if (arma){
		var _joga = keyboard_check_released(ord("G"));
		var _col;
		with(arma){
			_col = place_meeting(x, y, obj_block);
		}
		if (_joga && !_col){
			arma.speed = 3;
			arma.direction = arma.image_angle;
			arma.atirar = false;
			arma.pai = noone;
			arma.delay_pega = game_get_speed(gamespeed_fps) * 2;
			arma = noone;
		}
	}
}
