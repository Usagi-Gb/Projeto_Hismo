if (vida_atual <= 0) {
    estado = estado_morto;
    room_goto(roominicial); 
    exit;
}

if (estado != estado_morto) {
    if (timer_ataque > 0) {
        timer_ataque--;
    } else {
        
        tipo_ataque = choose(0, 1);
        
        if (tipo_ataque == 0) {
            instance_create_layer(x, y, "Instances", obj_boss_onda);
            timer_ataque = 90; 
        } else {
            instance_create_layer(x, y, "Instances", obj_boss_grito);
            timer_ataque = 120; 
        }
    }
}