function Rhythm_Controller(){
	// Configurações da Música, esta versão é parcialmente incompatível com o código atualmente utilizado no jogo
bpm = 136;
sec_per_beat = 60 / bpm; // Duração de uma batida em segundos
music_instance = audio_play_sound(snd_sua_musica, 1, true);

// Configurações do Jogo
tolerance = 0.2; // 20% de tolerância. Quanto menor, mais difícil é acertar.
player_hp = 100;
can_hit = true;  // Flag para evitar que o jogador "spamme" o botão na mesma batida

// 1. Descobrir a posição exata da música
var pos = audio_sound_get_track_position(music_instance);

// 2. Calcular em qual batida estamos e pegar a fração
var current_beat = pos / sec_per_beat;
var beat_fraction = frac(current_beat); // Retorna algo entre 0.0 e 0.999...

// 3. Verificar se estamos dentro da Janela de Tolerância
var in_window = false;
if (beat_fraction < tolerance) || (beat_fraction > (1.0 - tolerance)) {
    in_window = true;
}

// 4. Resetar a permissão de ataque quando sairmos da janela
// Isso impede que o jogador acerte, e tente atacar de novo na mesma batida.
if (!in_window) {
    can_hit = true; 
}

// 5. Lidar com o Input do Jogador
var attack_key = keyboard_check_pressed(vk_space); // Altere para o botão desejado

if (attack_key) {
    if (in_window && can_hit) {
        // ACERTOU: Na batida e ainda não atacou nesta janela
        show_debug_message("Sucesso! Ataque realizado.");
        
        // Coloque seu código de ataque aqui (ex: mudar sprite, causar dano ao inimigo)
        
        can_hit = false; // Desativa o ataque até a próxima batida
    } else {
        // ERROU: Fora da janela, ou tentou atacar duas vezes na mesma janela
        show_debug_message("Errou o ritmo! Sofreu dano.");
        player_hp -= 10;
        
        // Coloque seu código de dano aqui (ex: piscar de vermelho, tocar som de erro)
    }
}

// Nota: Se 'attack_key' for falso (o jogador não apertar nada), 
// nenhum dos blocos de código acima é ativado, então ele não sofre punição.
}