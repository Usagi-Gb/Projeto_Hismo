if (vida <= 0 && !game_over) {
    game_over = true;
    
    // Limpa a lista para garantir que começa vazia
    lista_conquistas = []; 

    // Pega a onda atual antes de congelar o jogo!
    var _ondas = 0;
    if (instance_exists(obj_controlador_waves)) {
        _ondas = obj_controlador_waves.current_wave;
        ondas_alcancadas = _ondas; // Atualiza a variável original por segurança
		if (ondas_alcancadas-1 > global.ondas_maximas) {global.ondas_maximas = ondas_alcancadas}
		else {};
    }
    
    array_push(lista_conquistas, "Ondas Concluidas: " + string(_ondas - 1));
    array_push(lista_conquistas, "Inimigos Mortos: " + string(global.inimigos_mortos));
    
    if (_ondas >= 5) {
        array_push(lista_conquistas, "Trofeu: VETERANO DE GUERRA!");
    }
    if (global.inimigos_mortos >= 20) {
        array_push(lista_conquistas, "Trofeu: EXTERMINADOR DE MONSTROS!");
    }
    if (global.ritmos_acertados >= 15) {
        array_push(lista_conquistas, "Trofeu: MESTRE DO RITMO!");
    }
    
    //DESBLOQUEIOS DO MUSEU
    var _tam_museu = array_length(global.conquistas);

    if (global.boobs_mortos >= 1) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Bandana" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: BANDANA!"); 
                break;
            }
        }
    }
	if (global.boobs_mortos >= 3) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Jornal Marley" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: Jornal Marley"); 
                break;
            }
        }
    }
	 if (global.inimigos_mortos >= 1) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Clave de Sol" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: Clave de Sol!"); 
                break;
            }
        }
    }
	if (global.ondas_maximas >= 1) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Clave de Fa" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: Clave de Fa!"); 
                break;
            }
        }
    }
	 if (global.inimigos_mortos >= 10) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Cupcake" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: Cupcake!"); 
                break;
            }
        }
    }
	 if (global.ratos_mortos >= 1) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Bomba Bombastic" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: Bomba Bombastic!"); 
                break;
            }
        }
    }

    if (global.sapos_mortos >= 1) {
        for (var i = 0; i < _tam_museu; i++) {
            if (global.conquistas[i].nome == "Colar" && !global.conquistas[i].desbloqueado) {
                global.conquistas[i].desbloqueado = true; 
                array_push(lista_conquistas, "Item Secreto Revelado: COLAR!"); 
                break;
            }
        }
    }

    if (array_length(lista_conquistas) <= 2) {
         array_push(lista_conquistas, "Dica: Tente sobreviver mais tempo!");
    }

    var _width = surface_get_width(application_surface);
    var _height = surface_get_height(application_surface);
    gameover_surf = surface_create(_width, _height);
    surface_copy(gameover_surf, 0, 0, application_surface);
    
    instance_deactivate_all(true);
}

if (game_over) {
    if (keyboard_check_pressed(vk_space)) {
        instance_activate_all();
        if (surface_exists(gameover_surf)) {
            surface_free(gameover_surf);
        }
        room_goto(roominicial); 
    }
    exit;
}
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var _tecla_dash = keyboard_check_pressed(ord("Q"));
var _movendo = (up ^^ down || left ^^ right);

if (dash_cd_timer > 0) dash_cd_timer--;

if (ritmo_timer > 0) {
    ritmo_timer--;
    image_blend = c_aqua; 
} else {
    if (!is_dashing) image_blend = c_white; 
}
if (_tecla_dash && dash_cd_timer <= 0 && !is_dashing && _movendo) {
    is_dashing = true;
    dash_timer = dash_duration;
    dash_cd_timer = dash_cooldown;
    dash_dir = point_direction(0, 0, (right - left), (down - up));
}

if (is_dashing) {
    vel = dash_speed; 
    move_dir = dash_dir;
    image_blend = c_gray; 
    
    if (dash_timer % 2 == 0) {
        var _rastro = instance_create_layer(x, y, "Instances", obj_rastro_dash);
        _rastro.sprite_index = sprite_index;
        _rastro.image_index = image_index;
        _rastro.image_xscale = xscale;
        _rastro.image_blend = image_blend;
    }
    
    dash_timer--;
    if (dash_timer <= 0) {
        is_dashing = false;
    }
} else {
    if (_movendo) {
        move_dir = point_direction(0, 0, (right - left), (down - up));
        vel = max_vel;
		sprite_index = spr_lucas_run;
    } else {
        vel = lerp(vel, 0, 0.1); 
		sprite_index = spr_lucas_idle
    }
}

velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

depth = -bbox_bottom;
joga_arma();
efeito_dano();
olha_mouse();