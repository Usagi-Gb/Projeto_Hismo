event_inherited();
vida_max = 6;
vida_atual = vida_max;

vel = 2;
// Adicionadas as variáveis que estavam faltando para a colisão!
velh = 0;
velv = 0;

alvo = noone;
timer_pulo = 120; // Pula a cada 2 segundos
tempo_no_ar = 45; // Fica sumido por quase 1 segundo
alvo_x = x;
alvo_y = y;

// --- SOBRESCREVENDO O DANO PARA IMUNIDADE NO AR ---
leva_dano = function(_dano){
    if (estado != estado_morto && estado != estado_subindo && estado != estado_esperando && estado != estado_caindo) {
        if (_dano == undefined) vida_atual -= 1;
        else vida_atual -= _dano;
        
        dano = true;
       // 3. Verifica IMEDIATAMENTE se esse tiro matou o inimigo
        if (vida_atual <= 0) {
            global.inimigos_mortos++; 
            global.lizards_mortos++; // (ou sapos_mortos dependendo do inimigo)
            
            // --- NOVO: SISTEMA DE DROP (20% DE CHANCE) ---
            var _chance = irandom(100); // Sorteia um número de 0 a 100
            if (_chance <= 20) {
                // Cria o cupmagic exatamente na posição onde o monstro morreu
                instance_create_layer(x, y, "Instances", obj_cupmagic);
            }
            
            estado = estado_morto;
        }
    }
}

// --- ESTADOS DO SAPO ---
estado_perseguindo = function() {
    if (instance_exists(obj_player)) alvo = obj_player;
    
    if (alvo) {
        var _dir = point_direction(x, y, alvo.x, alvo.y);
        
        // AGORA SIM: Passamos a velocidade para velh e velv para o Step_2 fazer a colisão com a parede
        velh = lengthdir_x(vel, _dir);
        velv = lengthdir_y(vel, _dir);
        
        // Vira o rosto do sapo para o jogador
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
    
    // A SOMBRA SE SEGUE O JOGADOR NO AR!
    if (instance_exists(obj_player)) {
        alvo_x = obj_player.x;
        alvo_y = obj_player.y;
    }
    
    // Quando o tempo zera, ele trava a última posição e se prepara para o impacto
    if (tempo_no_ar <= 0) {
        estado = estado_caindo;
        
        // O PULO DO GATO: Alinhamos ele exatamente na última coordenada salva
        x = alvo_x;
        // Colocamos ele exatos 300 pixels ACIMA dessa última coordenada
        y = alvo_y - 300; 
    }
}

estado_caindo = function() {
    velh = 0; velv = 0;
    y += 20; // Ele despenca 20 pixels por frame
    
    // Quando ele atinge o alvo_y (o chão onde o player estava)
    if (y >= alvo_y) {
        y = alvo_y; // Crava no chão para não passar direto
        
        // Explode
        instance_create_layer(x, y, "Instances", obj_explosao);
        
        // Volta a perseguir
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