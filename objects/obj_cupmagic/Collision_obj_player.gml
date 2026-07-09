if (other.vida < other.vida_max) {
    other.vida += 1; // Regenera 1 coração
    // Um efeito sonoro de cura  se tiver
    // audio_play_sound(snd_cura, 1, false);
    instance_destroy(); 
}