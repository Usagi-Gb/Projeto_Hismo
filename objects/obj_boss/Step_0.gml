if (vida_atual <= 0) {
    estado = estado_morto;
    room_goto(roominicial); 
    exit;
}

if (estado != estado_morto) {
    if (timer_ataque > 0) {
        timer_ataque--;
        
        // Retorna ao sprite base apos alguns frames de ataque
        if (timer_ataque == 60) {
            sprite_index = spr_boss_idle;
        }
    } else {
        tipo_ataque = choose(0, 1);
        
        if (tipo_ataque == 0) {
            instance_create_layer(x, y, "Instances", obj_boss_onda);
            timer_ataque = 90; 
            
            // Define o sprite de onda baseado no X do player
            if (instance_exists(obj_player)) {
                if (obj_player.x >= 350) {
                    sprite_index = spr_boss_dir;
                } else {
                    sprite_index = spr_boss_esq;
                }
            }
        } else {
            instance_create_layer(x, y, "Instances", obj_boss_grito);
            timer_ataque = 120; 
            
            // Define o sprite do grito
            sprite_index = spr_boss_grr;
        }
    }
}