// Verifica se a vida atual do player é MENOR que a vida máxima
if (other.vida < other.vida_max) {
    other.vida += 1; // Regenera 1 coração
    
    // Opcional: Adicione um efeito sonoro de cura aqui se tiver!
    // audio_play_sound(snd_cura, 1, false);
    
    instance_destroy(); // O item é consumido e some do mapa
}