// ====================================================
// 1. HUD NORMAL (Enquanto o jogador está vivo)
// ====================================================
if (!game_over) {
    // Garante que a vida seja desenhada na cor branca e no canto esquerdo
    draw_set_alpha(1.0);
    draw_set_color(c_white);
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    
    // Desenha a sua variável de vida original
    draw_text(20, 20, vida);
}

// ====================================================
// 2. TELA DE GAME OVER (Quando a vida chega a zero)
// ====================================================
else {
    // 1. Desenha a foto do jogo congelado no fundo
    if (surface_exists(gameover_surf)) {
        draw_surface(gameover_surf, 0, 0);
    }
    
    // 2. Desenha a camada escura por cima
    var _largura = display_get_gui_width();
    var _altura = display_get_gui_height();
    
    draw_set_alpha(0.8); // Fundo bem escuro
    draw_set_color(c_black);
    draw_rectangle(0, 0, _largura, _altura, false);
    draw_set_alpha(1.0); // Reseta a transparência para os textos

    // 3. Configurações de alinhamento para o centro
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // 4. Desenhar o Título
    draw_set_color(c_red);
    draw_text_transformed(_largura / 2, _altura / 2 - 80, "GAME OVER", 2, 2, 0); 
    
    // 5. Desenhar as Conquistas
    draw_set_color(c_yellow);
    draw_text(_largura / 2, _altura / 2 - 20, "Conquistas Obtidas:");
    draw_set_color(c_white);
    
    draw_text(_largura / 2, _altura / 2 + 10, "- Ondas Sobrevividas: " + string(ondas_alcancadas));

    // 6. Instrução para voltar
    draw_set_color(c_gray);
    draw_text(_largura / 2, _altura / 2 + 80, "Aperte ESPACO para voltar ao menu");

    // 7. Reseta o alinhamento para não estragar outras interfaces
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
}