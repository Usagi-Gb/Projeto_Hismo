event_inherited();
vida_max = 4;
vida_atual = vida_max;

vel = 2;
alvo = noone;
timer_pulo = 120; // Pula a cada 2 segundos
tempo_no_ar = 45; // Fica sumido por quase 1 segundo
alvo_x = x;
alvo_y = y;

// --- SOBRESCREVENDO O DANO PARA IMUNIDADE NO AR ---
leva_dano = function(_dano){
    // Só toma dano se NÃO estiver morto e NÃO estiver pulando
    if (estado != estado_morto && estado != estado_subindo && estado != estado_esperando && estado != estado_caindo) {
        if (_dano == undefined) vida_atual -= 1;
        else vida_atual -= _dano;
        
        dano = true;
        if (vida_atual <= 0) estado = estado_morto;
        // Nota: O sapo não tem 'estado_dano' para não interromper a lógica do pulo
    }
}

// --- ESTADOS DO SAPO ---
estado_perseguindo = function() {
    // Acha o player
    if (instance_exists(obj_player)) alvo = obj_player;
    
    if (alvo) {
        var _dir = point_direction(x, y, alvo.x, alvo.y);
        x += lengthdir_x(vel, _dir);
        y += lengthdir_y(vel, _dir);
        
        timer_pulo--;
        if (timer_pulo <= 0) {
            estado = estado_subindo;
        }
    }
}

estado_subindo = function() {
    y -= 15; // Sobe muito rápido
    
    // Pega a altura da câmera
    var _cam_y = camera_get_view_y(view_camera[0]);
    
    if (y < _cam_y - 64) {
        estado = estado_esperando;
        
        // Trava a mira onde o jogador está AGORA
        if (instance_exists(obj_player)) {
            alvo_x = obj_player.x;
            alvo_y = obj_player.y;
        }
    }
}

estado_esperando = function() {
    tempo_no_ar--;
    
    // Teleporta secretamente o X dele para cima da cabeça do jogador
    x = alvo_x;
    
    if (tempo_no_ar <= 0) {
        estado = estado_caindo;
    }
}

estado_caindo = function() {
    y += 20; // Cai com muita força
    
    if (y >= alvo_y) {
        y = alvo_y; // Crava no chão
        
        // Cria o dano em área (explosão)
        instance_create_layer(x, y, "Instances", obj_explosao);
        
        // Reseta tudo e volta a perseguir
        estado = estado_perseguindo;
        timer_pulo = 120;
        tempo_no_ar = 45;
    }
}

estado_morto = function() {
    image_alpha -= 0.05;
    if (image_alpha <= 0) instance_destroy();
}

estado = estado_perseguindo;