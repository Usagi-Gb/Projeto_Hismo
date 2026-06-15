current_wave = 1;
enemies_to_spawn = 5; 
spawn_cooldown = game_get_speed(gamespeed_fps) * 1.5; 
spawn_timer = spawn_cooldown;

wave_ready = true; 
timer_next_wave = -1;