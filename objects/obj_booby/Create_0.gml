 event_inherited();
vida_max = 3;
vida_atual = vida_max;
//test45
estado = noone;
tempo_estado = game_get_speed(gamespeed_fps) * 10;
timer_estado = 0;

tempo_dano = game_get_speed(gamespeed_fps) / 4;
timer_dano = tempo_dano;
//ssss	
sat = 0;

destino_x = x;
destino_y = y;
velh = 0;
velv = 0;
vel = 1;
//test
//test2
tempo_morte = game_get_speed(gamespeed_fps);

alvo = noone;
alvo_dir = 0;
duracao_ataque = 0.5;
tempo_ataque = duracao_ataque;

dano_timer = 0;
tempo_dano = game_get_speed(gamespeed_fps)/8;

sprite = sprite_index;
xscale = 1;
yscale = 1;

muda_estado = function(_estado){
	tempo_estado--;
	timer_estado = irandom(tempo_estado);
	
	if(timer_estado == tempo_estado or tempo_estado <= 0){
		estado = _estado[irandom(array_length(_estado)-1)];
		tempo_estado = game_get_speed(gamespeed_fps) * 10;
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
    sprite = spr_booby_idle;
    sprite_index = spr_booby_idle;
    velh = 0;
    velv = 0;
    
    if (instance_exists(obj_player)) {
        estado = estado_persegue; 
    }
}


estado_passeando = function(){
    if (instance_exists(obj_player)) {
        estado = estado_persegue; 
    }
}


estado_persegue = function(){
   sprite = spr_booby_run;
    sprite_index = spr_booby_run;
    
    if (instance_exists(obj_player)) {
        alvo = obj_player; 
        
      
        mp_potential_step_object(alvo.x, alvo.y, vel, obj_block);
        
       
        velh = 0; 
        velv = 0;
        

        if (alvo.x != x) xscale = sign(alvo.x - x);
        

        var _dist = point_distance(x, y, alvo.x, alvo.y);
        
       
        if (_dist < 40) { 
            estado = estado_prepara_ataque;
        }
    }
    else {
        estado = estado_parado; 
    }
}
estado_prepara_ataque = function(){
	
	if(sat <= 1){
		sat += (delta_time / 2000000); 
	}
	image_speed = sat;
	
	sprite = spr_booby_idle;
	velh = 0;
	velv = 0;
	
	image_blend = make_color_hsv(140, sat * 255, 255);
	
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

	if(image_alpha <= 0) instance_destroy();
}

leva_dano = function(_dano){
    // Só toma dano se ainda não estiver morto
    if (estado != estado_morto) {
        
        // Aplica o dano 
        if (_dano == undefined) vida_atual -= 1;
        else vida_atual -= _dano;
        
        //Ativa a variável que faz o inimigo piscar de branco
        dano = true;
        
       
        // 3. Verifica se esse tiro matou o inimigo
        if (vida_atual <= 0) {
            global.inimigos_mortos++; 
            global.boobs_mortos++; 
            
            // SISTEMA DE DROP 
            var _chance = irandom(100); 
            if (_chance <= 33) {
               
                instance_create_layer(x, y, "Instances", obj_cupmagic);
            }
            
            estado = estado_morto;
        }
        else if (estado != estado_ataque && estado != estado_prepara_ataque) {
            estado = estado_dano;
        }
    }
}
estado = estado_parado;