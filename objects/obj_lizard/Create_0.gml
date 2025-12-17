event_inherited();
vida_max = 3;
vida_atual = vida_max;
//test4
estado = noone;
tempo_estado = room_speed * 10;
timer_estado = 0;

tempo_dano = room_speed / 4;
timer_dano = tempo_dano;

sat = 0;

destino_x = x;
destino_y = y;
velh = 0;
velv = 0;
vel = 1;
//test
//test2
tempo_morte = room_speed;

alvo = noone;
alvo_dir = 0;
duracao_ataque = 0.5;
tempo_ataque = duracao_ataque;

dano_timer = 0;
tempo_dano = room_speed/8;

sprite = sprite_index;
xscale = 1;
yscale = 1;

muda_estado = function(_estado){
	tempo_estado--;
	timer_estado = irandom(tempo_estado);
	
	if(timer_estado == tempo_estado or tempo_estado <= 0){
		estado = _estado[irandom(array_length(_estado)-1)];
		tempo_estado = room_speed * 10;
	}
}
desenha_sprite = function(){
	if(dano){
		shader_set(sh_branco);
		draw_sprite_ext(sprite, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
		shader_reset();
	}
	else{
		draw_sprite_ext(sprite, image_index, x, y, xscale, yscale, image_angle, image_blend, image_alpha);
	}
}

desenha_sombra = function(){
	draw_sprite_ext(spr_sombra, 0, x, y, .2, .2, 0, c_white, .25);
}

estado_parado = function(){
	sprite = spr_lizard_idle
	image_blend = c_white;
	velh = 0;
	velv = 0;
	
	alvo = campo_visao(larg_visao, sprite_height * alt_visao, xscale);
	if (alvo){
		estado = estado_persegue;
	}
	
	muda_estado([estado_passeando, estado_parado]);
}

estado_passeando = function(){
	sprite = spr_lizard_run;
	var _dist = point_distance(x, y, destino_x, destino_y);
	if (_dist <100){
	destino_x = random(room_width);
	destino_y = random(room_height);
	}
	var _dir = point_direction(x, y, destino_x, destino_y);
	if(velh != 0){
		xscale = sign(velh);
	}
	
	velh = lengthdir_x(vel, _dir);
	velv = lengthdir_y(vel, _dir);
	
	alvo = campo_visao(larg_visao, sprite_height * alt_visao, xscale);
	if (alvo){
		estado = estado_persegue;
	}
	
	
	muda_estado([estado_parado, estado_passeando]);
}

campo_visao = function(_largura, _altura, _xscale){
	var _x1, _x2, _y1, _y2;
	_x1 = x;
	_y1 = y + _altura / 2 - sprite_height / 2;
	_x2 = _x1 + _largura * _xscale ;
	_y2 = _y1 - _altura ;
	
	var _alvo = collision_rectangle(_x1, _y1, _x2, _y2, obj_player, 0, 1);
	return _alvo;
}

estado_persegue = function(){
	sprite = spr_lizard_run;
	if(instance_exists(alvo)){
		var _dir = point_direction(x, y, alvo.x, alvo.y);
		velh = lengthdir_x(vel, _dir);
		velv = lengthdir_y(vel, _dir);
		
		var _dist = point_distance(x, y, alvo.x, alvo.y);
		if(_dist < larg_visao / 2) estado = estado_prepara_ataque;
		if(_dist > larg_visao * 2) alvo = noone;
		
	}
	else{
		muda_estado([estado_parado, estado_passeando]);
	}
}
estado_prepara_ataque = function(){
	
	if(sat < 1){
		sat += (delta_time / 2000000);
	}
	image_speed = sat;
	
	sprite = spr_lizard_idle;
	velh = 0;
	velv = 0;
	
	image_blend = make_color_hsv(255, sat * 255, 255);
	
	if(sat > 1){
		estado = estado_ataque;
		alvo_dir = point_direction(x, y, alvo.x, alvo.y);
		sat = 0;
		image_speed = 1;
	}
}

estado_ataque = function(){
	tempo_ataque -= delta_time / 1000000;
	image_blend = c_white;
	velh = lengthdir_x(vel * 4, alvo_dir);
	velv = lengthdir_y(vel * 4, alvo_dir);
	
	if(tempo_ataque <= 0){
		estado = estado_parado;
		tempo_ataque = duracao_ataque;
	}
}
estado_dano = function(){
	timer_dano --;
	velh = lengthdir_x(1, p_dir);
	velv = lengthdir_y(1, p_dir);
	
	if(timer_dano <= 0){
		if(vida_atual<= 0){
			estado = estado_morto;
		}
		else{
			estado = estado_parado;
			timer_dano = tempo_dano;
		}
	}
}
estado_morto = function(){
	//tempo_morte --;
	image_alpha -= .01
	image_speed = 0;
	velh = 0;
	velv = 0;
	//image_blend = c_dkgray;
	if(image_alpha <= 0) instance_destroy();
}

leva_dano = function(_dano){
		if(estado != estado_morto){
		estado = estado_dano;
		if (_dano == undefined) vida_atual -= 1
		else vida_atual -= _dano;
		dano = true;
	}
}

estado = estado_parado;