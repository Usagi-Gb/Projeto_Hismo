if (vida_atual <= 0) {
    if (estado != estado_morto) {
        estado = estado_morto;
        image_alpha = 0;
        instance_create_layer(0, 0, "Instances", obj_final_hq);
        global.chefe_final_morto = true;
    }
    exit;
}

if (estado == estado_idle) {
    if (timer_ataque > 0) {
        timer_ataque--;
        if (timer_ataque == 60) sprite_index = spr_boss_idle;
    } else {
        tipo_ataque = choose(0, 1);
        
        if (tipo_ataque == 0) {
            var _onda = instance_create_layer(x, y, "Instances", obj_boss_onda);
            _onda.speed = 4;
            if (instance_exists(obj_player)) {
                _onda.direction = point_direction(x, y, obj_player.x, obj_player.y);
                if (obj_player.x >= 350) sprite_index = spr_boss_dir;
                else sprite_index = spr_boss_esq;
            }
            timer_ataque = 90;
        } else {
            estado = estado_gritando; // Usa a variável definida no Create
            ataques_restantes = choose(2, 3, 4, 5);
            timer_ataque_multiplo = 0;
            sprite_index = spr_boss_grr;
        }
    }
}

if (estado == estado_gritando) {
    sprite_index = spr_boss_grr;
    if (timer_ataque_multiplo <= 0) {
        var _num = 8;
        var _ang = 0;
        repeat(_num) {
            var _inst = instance_create_layer(x, y, "Instances", obj_boss_grito);
            _inst.direction = _ang;
            _inst.speed = 3;
            _ang += 360 / _num;
        }
        
        ataques_restantes--;
        timer_ataque_multiplo = 30;
    } else {
        timer_ataque_multiplo--;
    }
    
    if (ataques_restantes <= 0) {
        estado = estado_idle;
        timer_ataque = 90;
        sprite_index = spr_boss_idle;
    }
}