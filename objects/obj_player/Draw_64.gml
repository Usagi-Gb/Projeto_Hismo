if (!game_over) {
    draw_set_alpha(1.0);
    draw_set_color(c_white);
    
    var _x_inicial = 20; // Posição X do primeiro coração
    var _y_inicial = 20; // Posição Y (altura) dos corações no topo da tela
    var _espacamento = 35; // Distância entre cada coração

    for (var i = 0; i < vida_max; i++) {
        var _pos_x = _x_inicial + (i * _espacamento);
        if (i < vida) {
            draw_sprite(spr_coracao, 0, _pos_x, _y_inicial);
        } 
        else {
            draw_sprite(spr_coracao_hit, 0, _pos_x, _y_inicial);
        }
    }
}

else {
    if (surface_exists(gameover_surf)) {
        draw_surface(gameover_surf, 0, 0);
    }
    
    var _largura = display_get_gui_width();
    var _altura = display_get_gui_height();
    
    draw_set_alpha(0.8); // Fundo bem escuro
    draw_set_color(c_black);
    draw_rectangle(0, 0, _largura, _altura, false);
    draw_set_alpha(1.0); // Reseta a transparência para os textos

    // Configurações de alinhamento para o centro
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    // Título
    draw_set_color(c_red);
    draw_text_transformed(_largura / 2, _altura / 2 - 80, "GAME OVER", 2, 2, 0); 
    
    // Título das Conquistas
    draw_set_color(c_yellow);
    draw_text(_largura / 2, _altura / 2 - 20, "Conquistas Obtidas:");
    draw_set_color(c_white);
	
    // Quantos itens/troféus o jogador ganhou nessa partida
    var _tam = array_length(lista_conquistas);

    for (var i = 0; i < _tam; i++) {
        draw_text(_largura / 2, _altura / 2 + 15 + (i * 25), "- " + lista_conquistas[i]);
    }
    draw_set_color(c_gray);
    draw_text(_largura / 2, _altura / 2 + 140, "Aperte ESPACO para voltar ao menu");
    // Reseta o alinhamento para não estragar outras interfaces
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
    draw_set_color(c_white);
	salvar_jogo();
} 