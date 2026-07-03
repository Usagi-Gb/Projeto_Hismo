// 1. Descobrir a posição exata da música e calcular as frações
var pos = audio_sound_get_track_position(music_instance); //
var current_beat = pos / sec_per_beat; //
beat_fraction = frac(current_beat); // Guardamos na variável da instância para usar no Draw GUI

// 2. Verificar se estamos dentro da Janela de Tolerância
in_window = false; //
if ((beat_fraction < tolerance) || (beat_fraction > (1.0 - tolerance))) { //
    in_window = true; //
}

// 3. Resetar a permissão de ataque e animar coração
if (!in_window) { //
    can_hit = true; //
    heart_scale = lerp(heart_scale, 1.0, 0.1); // Coração volta suavemente ao tamanho normal
} else {
    heart_scale = lerp(heart_scale, 1.5, 0.35); // Coração "bate" (aumenta) por estar na janela
}

// 4. Lidar com o Input do Jogador
var attack_key = keyboard_check_pressed(vk_space); //

if (attack_key) { //
    if (in_window && can_hit) { //
        show_debug_message("Sucesso! Ataque realizado."); //
        
        // Em vez de só mostrar a mensagem, podemos forçar o jogador a atacar
        if (instance_exists(obj_player)) {
            // Opcional: Despoletar um ataque do jogador aqui
        }
        
        can_hit = false; //
    } else {
        show_debug_message("Errou o ritmo! Sofreu dano."); //
        
        // Integração corrigida: Em vez de usar player_hp, usamos o sistema real do obj_player
        if (instance_exists(obj_player)) {
            with (obj_player) {
                toma_dano(); // Esta função já cuida da invencibilidade e subtrai a vida
            }
        }
    }
}