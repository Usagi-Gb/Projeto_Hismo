if (paused) {
    // Desenha o fundo do jogo congelado
    if (surface_exists(pause_surf)) {
        draw_surface(pause_surf, 0, 0);
    }
    
    // Desenha a camada escura
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    // 3. Configurações de texto
    draw_set_alpha(1.0);
    // draw_set_font(fmenu_inicial); // Descomente esta linha se quiser usar a sua fonte personalizada
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle); // Corrigido de halign para valign

    var _ex = device_mouse_x_to_gui(0);
    var _ey = device_mouse_y_to_gui(0);
    var _wgui = display_get_gui_width();
    var _hgui = display_get_gui_height();

    var _tam_menu = array_length(opcoes_pause);
    
    for (var i = 0; i < _tam_menu; i++) {
        // Criamos um espaçamento um pouco maior (multiplicado por 1.8) 
        // para que os textos não batam um no outro quando crescerem pelo lerp
        var _espacamento = string_height("I") * 1.8;
        var _wstr = string_width(opcoes_pause[i]);
        var _hstr = string_height(opcoes_pause[i]);

        // Define os limites da caixa de colisão do texto atual
        var x1 = _wgui / 2 - _wstr / 2;
        var y1 = _hgui / 2 - _hstr / 2 + (_espacamento * i);
        var x2 = _wgui / 2 + _wstr / 2;
        var y2 = _hgui / 2 + _hstr / 2 + (_espacamento * i);

        // Verifica se o mouse está sobre o texto atual
        if (point_in_rectangle(_ex, _ey, x1, y1, x2, y2)) {
            esc[i] = lerp(esc[i], 1.4, 0.15); // Aproxima o texto (escala aumenta para 1.4)
            draw_set_color(c_white);          // CORREÇÃO: Garante que o texto mude de cor e não puxe o preto do fundo
            
            // Verifica o clique do mouse
            if (mouse_check_button_pressed(mb_left)) {
                switch (i) {
                    case 0: // Caso clique em "VOLTAR AO JOGO"
                        paused = false;
                        instance_activate_all();
                        if (surface_exists(pause_surf)) {
                            surface_free(pause_surf);
                        }
                        break;
                        
                    case 1: // Caso clique em "SAIR PARA O MENU"
                        instance_activate_all();
                        if (surface_exists(pause_surf)) {
                            surface_free(pause_surf);
                        }
                        paused = false;
                        room_goto(roominicial); // Retorna para a primeira room do jogo (Menu)
                        break;
                }
            }
        } else {
            esc[i] = lerp(esc[i], 1, 0.15);  // Retorna ao tamanho normal (escala 1)
            draw_set_color(c_white);          // Define como branco quando o mouse não está em cima
        }

        draw_text_transformed(_wgui / 2, _hgui / 2 + (_espacamento * i), opcoes_pause[i], esc[i], esc[i], 0);
    }

    draw_set_font(-1);
    draw_set_halign(-1);
    draw_set_valign(-1);
}