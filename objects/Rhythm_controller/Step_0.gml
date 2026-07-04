// 1. Descobrir a posição exata da música e calcular a fração
var pos = audio_sound_get_track_position(music_instance);
var current_beat = pos / sec_per_beat;
beat_fraction = frac(current_beat);

// 2. Verificar se estamos dentro da Janela de Tolerância
in_window = false;
if ((beat_fraction < tolerance) || (beat_fraction > (1.0 - tolerance))) {
    in_window = true;
}

// 3. Resetar a permissão de ataque e animar o coração da UI
if (!in_window) {
    can_hit = true;
    heart_scale = lerp(heart_scale, 1.0, 0.1); // Coração normal
} else {
    heart_scale = lerp(heart_scale, 1.4, 0.3); // Coração bate
}

// 4. Lidar com o Input do Jogador (tecla de acertar o ritmo)
var attack_key = keyboard_check_pressed(vk_space); 

if (attack_key) {
    if (in_window && can_hit) {
        show_debug_message("Sucesso! Acertou o ritmo.");
        
        // ---> A INTEGRAÇÃO COM O PLAYER ACONTECE AQUI <---
        if (instance_exists(obj_player)) {
            // Diz ao player para manter o brilho azul (c_aqua) por 45 frames
            obj_player.ritmo_timer = 45; 
        }
        
        can_hit = false; // Impede que o jogador clique várias vezes na mesma batida
    } else {
        show_debug_message("Errou o ritmo! Sofreu dano.");
        
        // Pune o jogador caso ele clique fora do ritmo
        if (instance_exists(obj_player)) {
            with (obj_player) {
                toma_dano(); // Aplica o hit normal com imunidade temporária
            }
        }
    }
}