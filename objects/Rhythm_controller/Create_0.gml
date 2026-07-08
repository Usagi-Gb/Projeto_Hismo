// --- CONFIGURAÇÕES DA MÚSICA ---
bpm = 66; //
sec_per_beat = 60 / bpm; // Duração de uma batida em segundos

//Fecha a trilha que estiver tocando para evitar duplicidade.
audio_stop_all();

// Começa a tocar a música. Lembre-se de substituir 'snd_sua_musica' pelo nome real do seu som!
music_instance = audio_play_sound(HismoStagio1, 1, true); //

// --- CONFIGURAÇÕES DO JOGO ---
tolerance = 0.2; // 20% de tolerância para acertar
can_hit = true;  // Flag para evitar que o jogador "spamme" o botão

// --- CONFIGURAÇÕES DA UI (INTERFACE) ---
// Posição central na parte inferior do ecrã
ui_x = display_get_gui_width() / 2;
ui_y = display_get_gui_height() - 60;
heart_scale = 1.0; // Tamanho base do coração
max_dist = 300;    // Distância de onde as barras começam a aproximar-se