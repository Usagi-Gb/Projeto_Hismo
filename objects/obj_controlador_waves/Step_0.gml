if (enemies_to_spawn > 0 && wave_ready) {
    spawn_timer--;
    
    if (spawn_timer <= 0) {
        // Pega a posição X e Y atual do visor
        var _cam_x = camera_get_view_x(view_camera[0]);
        var _cam_y = camera_get_view_y(view_camera[0]);
        
        // Tamanho do visor que você especificou
        var _cam_w = 480; 
        var _cam_h = 270;
        
        var _x = 0;
        var _y = 0;
        
        // Uma margem de pixels para garantir que eles nasçam totalmente fora da tela
        // (Aumente esse valor se o sprite do obj_lizard for muito grande)
        var _margem = 32; 
        
        // Sorteia um número de 0 a 3 para escolher de qual lado o bicho vai vir
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
        
        instance_create_layer(_x, _y, "Instances", obj_lizard);
        
        enemies_to_spawn--;
        spawn_timer = spawn_cooldown; 
    }
}

if (enemies_to_spawn == 0 && instance_number(obj_lizard) == 0 && timer_next_wave == -1) {
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