image_xscale = 0.5;
image_yscale = 0.5;

atirar = false;
delay_pega = 0;
delay_tiro = 0;
pai = noone;
dano_arma = 1;

// --- NOVO: Variável de Dano Base da Arma ---
// Este valor será passado para o tiro. As armas filhas podem mudar este número!
dano_arma = 1; 

atirando = function(){
	delay_tiro--;
	if(atirar){
		
		if(delay_tiro <= 0){
				delay_tiro = espera_tiro * game_get_speed(gamespeed_fps);
				var _x = lengthdir_x(sprite_width /2, image_angle );
				var _y = lengthdir_y(sprite_width /2, image_angle );
				var _tiro = instance_create_layer(x + _x, y + _y, layer, tiro);
				_tiro.speed = velocidade;
				_tiro.direction = image_angle + random_range(-imprecisao, imprecisao);
			 
			// --- LÓGICA DE DANO DINÂMICO ---
			var _dano_final = dano_arma; // Começa valendo o dano da arma atual
			
			if (pai != noone && instance_exists(pai)) {
			    if (pai.object_index == obj_player) {
			        // Se o player estiver no ritmo, multiplicamos o dano da arma por 2!
			        if (pai.ritmo_timer > 0) {
			            _dano_final = dano_arma * 2; 
			            
			            // Feedback visual do tiro forte
			            _tiro.image_blend = c_aqua; 
			            _tiro.image_xscale = 0.7; 
			            _tiro.image_yscale = 0.7;
			        }
			    }
			}
			
			// Passa o valor calculado para a bala recém-criada
			_tiro.dano = _dano_final;
			 
			if(pai){
				var _velh = lengthdir_x(knokback, image_angle);
				var _velv = lengthdir_y(knokback, image_angle);
				pai.velh-=  _velh;
				pai.velv-= _velv;
			}
			
		}
	}
}

quica_parede = function(){
	if (place_meeting(x + hspeed, y, obj_block)) hspeed *= -1;
	if (place_meeting(x, y + vspeed, obj_block)) vspeed *= -1;
}