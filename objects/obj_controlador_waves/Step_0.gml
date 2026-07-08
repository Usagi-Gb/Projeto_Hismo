// 1. Contagem de inimigos vivos
inimigos_vivos_no_mapa = 0;

with (obj_inimigo_pai) {
    if (estado != estado_morto) {
        other.inimigos_vivos_no_mapa++;
    }
}

// 2. Timer e transição de Wave / Room do Boss
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
            
            // Vai para a sala do Boss
            room_goto(room_boss); 
        }
    }
}

// 3. Drop de Armas
if (current_wave > ultima_wave_verificada && current_wave <= onda_maxima) {
    if (ultima_wave_verificada % 2 == 0) {
        
        var _arma_no_mapa = false;
        var _qtd_armas = array_length(lista_armas_drop);
        
        for (var i = 0; i < _qtd_armas; i++) {
            if (instance_exists(lista_armas_drop[i])) {
                _arma_no_mapa = true;
                break; 
            }
        }
        
        if (!_arma_no_mapa) { 
            var _sorteio = irandom(_qtd_armas - 1);
            var _arma_escolhida = lista_armas_drop[_sorteio];
            
            if (instance_exists(obj_player)) {
                instance_create_layer(obj_player.x + 50, obj_player.y, "Instances", _arma_escolhida);
            } else {
                instance_create_layer(room_width / 2, room_height / 2, "Instances", _arma_escolhida);
            }
        }
    }
    
    ultima_wave_verificada = current_wave;
}

// 4. Lógica de Spawn Segura contra Paredes
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