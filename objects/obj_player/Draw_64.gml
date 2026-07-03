draw_text(20, 20, vida);
//asss

if (game_over) {
    // Pegar as dimensões exatas da janela da GUI
    var _largura = display_get_gui_width();
    var _altura = display_get_gui_height();

    // 1. Desenhar o fundo escurecido (Exemplo clássico de obj_pause)
    draw_set_alpha(0.7); // 70% de opacidade
    draw_set_color(c_black);
    draw_rectangle(0, 0, _largura, _altura, false);
    draw_set_alpha(1.0); // Resetar a opacidade para não afetar o texto

    // 2. Configurar a fonte e alinhamento
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    
    // Opcional: draw_set_font(sua_fonte_aqui); 

    // 3. Desenhar os textos no centro da tela
    draw_text(_largura / 2, _altura / 2 - 20, "GAME OVER");
    draw_text(_largura / 2, _altura / 2 + 20, "Aperte ESPACO para voltar");

    // 4. Resetar o alinhamento para não bugar outras UIs do jogo
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}