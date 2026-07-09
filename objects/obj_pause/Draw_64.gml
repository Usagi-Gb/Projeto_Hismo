if (paused) {
    if (surface_exists(pause_surf)) {
        draw_surface(pause_surf, 0, 0);
    }
    
    draw_set_color(c_black);
    draw_set_alpha(0.6);
    draw_rectangle(0, 0, display_get_gui_width(), display_get_gui_height(), false);
    
    draw_set_alpha(1.0);
    draw_set_font(fmenu_inicial); 
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);

    var _ex = device_mouse_x_to_gui(0);
    var _ey = device_mouse_y_to_gui(0);
    var _wgui = display_get_gui_width();
    var _hgui = display_get_gui_height();

    var _tam_menu = array_length(opcoes_pause);
    
    for (var i = 0; i < _tam_menu; i++) {
              
        var _espacamento = string_height("I") * 1.8;
        var _wstr = string_width(opcoes_pause[i]);
        var _hstr = string_height(opcoes_pause[i]);
     
        var x1 = _wgui / 2 - _wstr / 2;
        var y1 = _hgui / 2 - _hstr / 2 + (_espacamento * i);
        var x2 = _wgui / 2 + _wstr / 2;
        var y2 = _hgui / 2 + _hstr / 2 + (_espacamento * i);

        if (point_in_rectangle(_ex, _ey, x1, y1, x2, y2)) {
            esc[i] = lerp(esc[i], 1.4, 0.15); // Aproxima o texto 
            draw_set_color(c_white);          // Garante que o texto mude de cor e não puxe o preto do fundo
            
            // Verifica o clique do mouse
            if (mouse_check_button_pressed(mb_left)) {
                switch (i) {
                    case 0: 
                        paused = false;
                        instance_activate_all();
                        if (surface_exists(pause_surf)) {
                            surface_free(pause_surf);
                        }
                        break;
                        
                    case 1:
                        instance_activate_all();
                        if (surface_exists(pause_surf)) {
                            surface_free(pause_surf);
                        }
                        paused = false;
                        room_goto(roominicial);
                        break;
                }
            }
        } else {
            esc[i] = lerp(esc[i], 1, 0.15);  // Retorna ao tamanho normal
            draw_set_color(c_white);          
        }

        draw_text_transformed(_wgui / 2, _hgui / 2 + (_espacamento * i), opcoes_pause[i], esc[i], esc[i], 0);
    }

    draw_set_font(-1);
    draw_set_halign(-1);
    draw_set_valign(-1);
}