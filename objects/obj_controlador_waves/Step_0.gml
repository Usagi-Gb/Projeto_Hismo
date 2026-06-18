if (enemies_to_spawn > 0 && wave_ready) {
    spawn_timer--;
    
    if (spawn_timer <= 0) {
        var _x = random_range(32, room_width - 32);
        var _y = random_range(32, room_height - 32);
        
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
if (current_wave >= 1) {
    if (global.conquistas[0].desbloqueado == false) {
        global.conquistas[0].desbloqueado = true;
    }
}

if (current_wave > 2) {
    if (global.conquistas[1].desbloqueado == false) {
        global.conquistas[1].desbloqueado = true;
    }
}