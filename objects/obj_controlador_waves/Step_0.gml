inimigos_vivos_no_mapa = 0;

with (obj_inimigo_pai) {
    if (estado != estado_morto) {
        other.inimigos_vivos_no_mapa++;
    }
}

// Controle de transicao das waves
if (enemies_to_spawn <= 0 && inimigos_vivos_no_mapa == 0 && !boss_spawnado) {
    if (timer_next_wave == 0) {
        timer_next_wave = 180; 
    }
}

if (timer_next_wave > 0) {
    timer_next_wave--;
    
    if (timer_next_wave <= 0) {
        if (current_wave < onda_maxima) {
            current_wave++;
            enemies_to_spawn = current_wave * 5; 
        } 
        else if (!boss_spawnado) {
            boss_spawnado = true;
            enemies_to_spawn = 0; 
            //TESTT
            // Salva os status do player para a transicao
            if (instance_exists(obj_player)) {
                global.player_vida_atual = obj_player.vida;
                if (obj_player.arma != noone) {
                    global.player_arma_atual = obj_player.arma.object_index;
                }
            }
            global.ondas_atuais = current_wave;
            
            room_goto(room_boss); 
        }
    }
}

// Drop de armas
if (current_wave > ultima_wave_verificada && current_wave <= onda_maxima) {
    if (ultima_wave_verificada % 2 == 0) {
        
        var _qtd_armas = array_length(lista_armas_drop);
        var _arma_escolhida = lista_armas_drop[irandom(_qtd_armas - 1)];
        
        var _drop_x = room_width / 2;
        var _drop_y = room_height / 2;
        
        if (instance_exists(obj_player)) {
            _drop_x = obj_player.x + 50;
            _drop_y = obj_player.y;
        }
        
        instance_create_layer(_drop_x, _drop_y, "Instances", _arma_escolhida);
    }
    
    ultima_wave_verificada = current_wave;
}

// Spawn dos inimigos
if (enemies_to_spawn > 0 && timer_next_wave <= 0 && !boss_spawnado) {
    spawn_timer--;
    
    if (spawn_timer <= 0) {
        var _x = irandom_range(64, room_width - 64);
        var _y = irandom_range(64, room_height - 64);
        var _pos_valida = false;
        
        if (collision_circle(_x, _y, 32, obj_block, false, true) == noone) {
            if (instance_exists(obj_player)) {
                if (point_distance(_x, _y, obj_player.x, obj_player.y) > 150) {
                    _pos_valida = true;
                }
            } else {
                _pos_valida = true;
            }
        }
        
        if (_pos_valida) {
            var _inimigo_escolhido = obj_booby; 
            
            if (current_wave >= 5) {
                var _sorteio = irandom(2); 
                if (_sorteio == 0) _inimigo_escolhido = obj_booby; 
                else if (_sorteio == 1) _inimigo_escolhido = obj_sapo;
                else _inimigo_escolhido = obj_ratao;
            }
            else if (current_wave >= 3) {
                var _sorteio = irandom(1); 
                if (_sorteio == 0) _inimigo_escolhido = obj_booby;
                else _inimigo_escolhido = obj_sapo;
            }

            instance_create_layer(_x, _y, "Instances", _inimigo_escolhido);
            
            enemies_to_spawn--;
            spawn_timer = spawn_cooldown; 
        } else {
            spawn_timer = 1; 
        }
    }
}