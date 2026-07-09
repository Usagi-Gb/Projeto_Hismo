var _largura = display_get_gui_width();
var _altura = display_get_gui_height();

if (estado_cena == "transicao") {
    // Desenha uma tela que fica branca gradualmente
    draw_set_color(c_white);
    draw_set_alpha(alpha_tela);
    draw_rectangle(0, 0, _largura, _altura, false);
    draw_set_alpha(1); // Reseta a transparência
}
else if (estado_cena == "hq") {
    // Fundo totalmente branco para a leitura
    draw_set_color(c_white);
    draw_rectangle(0, 0, _largura, _altura, false);
    
    // Desenha o quadro atual da HQ no centro da tela
    var _sprite_atual = painel_sprites[painel_atual];
    draw_sprite(_sprite_atual, 0, _largura / 2, _altura / 2);
    
    // Pequeno texto no canto inferior
    draw_set_color(c_black);
    draw_set_halign(fa_center);
    draw_text(_largura / 2, _altura - 50, "Clique para avançar...");
    draw_set_halign(fa_left);
}