if (enemies_to_spawn > 0 && wave_ready) {
    spawn_timer--;
    if (spawn_timer <= 0) {
        // Pega a posição X e Y atual do visor
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);
        
        // Tamanho do visor
        var _cam_w = 480;
        var _cam_h = 270;
        
        var _x = 0;
        var _y = 0;
        var _margem = 32; 
        
        // --- NOVA LÓGICA DE VERIFICAÇÃO ---
        var _pos_valida = false;
        var _tentativas = 0;
        
        // Tenta achar uma posição válida até 10 vezes para evitar travamentos
        while (!_pos_valida && _tentativas < 10) {
            var _lado = irandom(3);
            switch (_lado) {
                case 0: // Cima
                    _x = random_range(_cam_x - _margem, _cam_x + _cam_w + _margem);
                    _y = _cam_y - _margem;
                    break;
                case 1: // Baixo
                    _x = random_range(_cam_x - _margem, _cam_x + _cam_w + _margem);
                    _y = _cam_y + _cam_h + _margem;
                    break;
                case 2: // Esquerda
                    _x = _cam_x - _margem;
                    _y = random_range(_cam_y - _margem, _cam_y + _cam_h + _margem);
                    break;
                case 3: // Direita
                    _x = _cam_x + _cam_w + _margem;
                    _y = random_range(_cam_y - _margem, _cam_y + _cam_h + _margem);
                    break;
            }
            
            // Verifica se a área escolhida NÃO colide com as paredes (obj_block)
            // '16' é o raio da verificação. Aumente se o obj_lizard for maior.
            if (collision_circle(_x, _y, 16, obj_block, false, true) == noone) {
                _pos_valida = true; // Achamos um lugar seguro!
            }
            
            _tentativas++;
        }
        
       // Só cria o inimigo se encontrou uma posição livre
        if (_pos_valida) {
            
            // Variável que vai guardar qual inimigo será criado nesta rodada
            var _inimigo_escolhido = obj_booby; // Padrão: Usa o Booby (substituto do Lizard)
            
            if (current_wave >= 5) {
                // Wave 5 em diante: 1/3 de chance para cada um (Lizard/Booby, Sapo, Ratão)
                var _sorteio = irandom(2); // Sorteia entre 0, 1 e 2
                
                if (_sorteio == 0) _inimigo_escolhido = obj_booby; // Ou obj_lizard se não tiver apagado
                else if (_sorteio == 1) _inimigo_escolhido = obj_sapo;
                else _inimigo_escolhido = obj_ratao;
            }
            else if (current_wave >= 3) {
                // Wave 3 e 4: Metade Booby, Metade Sapo
                var _sorteio = irandom(1); // Sorteia entre 0 e 1
                
                if (_sorteio == 0) _inimigo_escolhido = obj_booby;
                else _inimigo_escolhido = obj_sapo;
            }
            // (Se for wave 1 ou 2, o código simplesmente ignora os IFs e usa a variável padrão obj_booby)

            // Cria o inimigo sorteado!
            instance_create_layer(_x, _y, "Instances", _inimigo_escolhido);
            
            enemies_to_spawn--;
            spawn_timer = spawn_cooldown; 
        } else {
            spawn_timer = 1; 
        } 
        }
    }

// ... Resto do seu código do Step abaixo (timer_next_wave, conquistas, etc.)
if (enemies_to_spawn == 0 && instance_number(obj_booby) == 0 && timer_next_wave == -1) {
    timer_next_wave = game_get_speed(gamespeed_fps) * 4;
    wave_ready = false;
}

if (timer_next_wave > 0) {
    timer_next_wave--;
    if (timer_next_wave <= 0) {
        current_wave++;
        enemies_to_spawn = current_wave * 5;
        wave_ready = true;
        timer_next_wave = -1; 
    }
}


// --- Sistema de Conquistas ---
if (current_wave >= 1) {
    if (global.conquistas[0].desbloqueado == false) {
        global.conquistas[0].desbloqueado = true;
    }
}

if (current_wave = 2) {
    if (global.conquistas[1].desbloqueado == false) {
        global.conquistas[1].desbloqueado = true;
    }
}