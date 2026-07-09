event_inherited();
vida_max = 6;
vida_atual = vida_max;

vel = 2;
velh = 0;
velv = 0;

alvo = noone;
timer_pulo = 120; 
tempo_no_ar = 45; // Fica sumido por quase 1 segundo
alvo_x = x;
alvo_y = y;

leva_dano = function(_dano){
    if (estado != estado_morto && estado != estado_subindo && estado != estado_esperando && estado != estado_caindo) {
        if (_dano == undefined) vida_atual -= 1;
        else vida_atual -= _dano;
        dano = true;
		
        if (vida_atual <= 0) {
            global.inimigos_mortos++; 
            global.sapos_mortos++;
            
            var _chance = irandom(100); 
            if (_chance <= 20) {
                instance_create_layer(x, y, "Instances", obj_cupmagic);
            }
            
            estado = estado_morto;
        }
    }
}

estado_perseguindo = function() {
    if (instance_exists(obj_player)) alvo = obj_player;
    
    if (alvo) {
        var _dir = point_direction(x, y, alvo.x, alvo.y);
        
        velh = lengthdir_x(vel, _dir);
        velv = lengthdir_y(vel, _dir);
        
        if (alvo.x != x) image_xscale = sign(alvo.x - x);
        
        timer_pulo--;
        if (timer_pulo <= 0) {
            estado = estado_subindo;
        }
    }
}

estado_subindo = function() {
    velh = 0; velv = 0; // Zera a velocidade para as paredes não atrapalharem o pulo
    y -= 15; // Sobe muito rápido
    
    var _cam_y = camera_get_view_y(view_camera[0]);
    if (y < _cam_y - 64) {
        estado = estado_esperando;
    }
}

estado_esperando = function() {
    velh = 0; velv = 0;
    tempo_no_ar--;
	
    // Deixa o sapo seguro muito acima da câmera enquanto espera
    y = camera_get_view_y(view_camera[0]) - 200; 
    
    // SOMBRA SE SEGUE O JOGADOR
    if (instance_exists(obj_player)) {
        alvo_x = obj_player.x;
        alvo_y = obj_player.y;
    }
    // Quando o tempo zera, ele trava a última posição
    if (tempo_no_ar <= 0) {
        estado = estado_caindo;
        x = alvo_x;
        y = alvo_y - 300; 
    }
}

estado_caindo = function() {
    velh = 0; velv = 0;
    y += 20; // Ele cai 20 pixels por frame
    
    if (y >= alvo_y) {
        y = alvo_y; // Crava no chão para não passar direto
        
        instance_create_layer(x, y, "Instances", obj_explosao);
        
        estado = estado_perseguindo;
        timer_pulo = 120;
        tempo_no_ar = 55;
    }
}

estado_morto = function() {
    velh = 0; velv = 0;
    image_alpha -= 0.05;
    if (image_alpha <= 0) instance_destroy();
}

estado = estado_perseguindo;