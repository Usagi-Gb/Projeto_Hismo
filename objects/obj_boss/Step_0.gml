if (vida_atual <= 0) {

    // A trava garante que a HQ só seja criada 1 vez
    if (estado != estado_morto) {
        estado = estado_morto;
        image_alpha = 0; 
        instance_create_layer(0, 0, "Instances", obj_final_hq);
    }
    exit; 

	global.chefe_final_morto = true;
	global.player_vida_atual = 0;
    estado = estado_morto;
    room_goto(roominicial); 
    exit;
}

if (estado != estado_morto) {
    if (timer_ataque > 0) {
        timer_ataque--;
        
        if (timer_ataque == 60) {
            sprite_index = spr_boss_idle;
        }
    } else {
        tipo_ataque = choose(0, 1);
        
        if (tipo_ataque == 0) {
            instance_create_layer(x, y, "Instances", obj_boss_onda);
            timer_ataque = 90; 
            
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
            sprite_index = spr_boss_grr;
        }
    }
}