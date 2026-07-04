// Se ele estiver esperando no ar ou caindo, desenha um aviso no chão para o player desviar!
if (estado == estado_esperando || estado == estado_caindo) {
    draw_sprite_ext(spr_sombra, 0, alvo_x, alvo_y, 0.5, 0.5, 0, c_red, 0.5);
}

// Desenha o Sapo normalmente se ele não estiver no céu
if (estado != estado_esperando) {
    if (dano) {
        shader_set(sh_branco);
        draw_self();
        shader_reset();
        dano = false; // Tira o brilho no próximo frame
    } else {
        draw_self();
    }
}