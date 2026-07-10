if (instance_exists(obj_final_hq)) exit;

if (!game_over) {
    draw_set_alpha(1.0);
    draw_set_color(c_white);
    
    var _x_inicial = 20;
    var _y_inicial = 20;
    var _espacamento = 35;

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
    
    draw_set_alpha(0.8);
    draw_set_color(c_black);
    draw_rectangle(0, 0, _largura, _altura, false);
    draw_set_alpha(1.0);

    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _texto_titulo = vitoria ? "VITÓRIA!" : "GAME OVER";
    var _cor_titulo = vitoria ? c_yellow : c_red;
    
    draw_set_color(_cor_titulo);
    draw_text_transformed(_largura / 2, _altura / 2 - 80, _texto_titulo, 2, 2, 0);
    
    draw_set_color(c_yellow);
    draw_text(_largura / 2, _altura / 2 - 20, "Conquistas Obtidas:");
    draw_set_color(c_white);
    
    var _tam = array_length(lista_conquistas);
    for (var i = 0; i < _tam; i++) {
        draw_text(_largura / 2, _altura / 2 + 15 + (i * 25), "- " + lista_conquistas[i]);
    }
    
    draw_set_color(c_white);
    draw_text(_largura / 2, _altura /2 + (_tam * 30), "Aperte ESPACO para voltar ao menu");
    
    draw_set_halign(fa_left);
    draw_set_valign(fa_top);
}