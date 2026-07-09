draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var _ex = device_mouse_x_to_gui(0);
var _ey = device_mouse_y_to_gui(0);
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();

var _cx = _wgui / 2;
var _cy = _hgui / 2;
var _separacao = 350;

var _tam_menu = array_length(global.conquistas);

for (var i = 0; i < _tam_menu; i++) {
    var _item = global.conquistas[i];
    
    var _dist = i - pos_filtrada;
    while (_dist > _tam_menu / 2) _dist -= _tam_menu;
    while (_dist <= -_tam_menu / 2) _dist += _tam_menu;
    
    var _abs_dist = abs(_dist);
    
    var _item_x = _cx + (_dist * _separacao);
    var _item_y = _cy - 50; // Ponto central de cada item do carrossel
    
    var _escala = lerp(1.4, 0.7, min(_abs_dist, 1));
    var _alpha = lerp(1.0, 0.3, min(_abs_dist, 1));
    
    var _sprite_para_desenhar = _item.spr_bloqueado;
    var _texto_para_desenhar = _item.desc_bloqueado;
    
    if (_item.desbloqueado) {
        _sprite_para_desenhar = _item.spr_desbloqueado;
        _texto_para_desenhar = _item.desc_desbloqueado;
    }
    
    var _box_w = 160 * _escala;
    var _box_h = 160 * _escala;
    var x1 = _item_x - _box_w / 2;
    var y1 = _item_y - _box_h / 2;
    var x2 = _item_x + _box_w / 2;
    var y2 = _item_y + _box_h / 2;
    
    if (point_in_rectangle(_ex, _ey, x1, y1, x2, y2)) {
        if (mouse_check_button_pressed(mb_left)) {
            var _diff = i - pos_atual;
            while (_diff > _tam_menu / 2) _diff -= _tam_menu;
            while (_diff <= -_tam_menu / 2) _diff += _tam_menu;

            var _novo_pos = pos_atual + _diff;
            if (_novo_pos >= _tam_menu) {
                pos_atual = _novo_pos - _tam_menu;
                pos_filtrada -= _tam_menu;
            } else if (_novo_pos < 0) {
                pos_atual = _novo_pos + _tam_menu;
                pos_filtrada += _tam_menu;
            } else {
                pos_atual = _novo_pos;
            }
        }
    }
    
    draw_set_alpha(_alpha);

    if (sprite_exists(_sprite_para_desenhar)) {
        draw_sprite_ext(_sprite_para_desenhar, 0, _item_x, _item_y, _escala, _escala, 0, c_white, _alpha);
    }
	
    draw_set_color(c_white);
    var _deslocamento_y = (128 / 2) * _escala;    
    var _titulo_y = _item_y + _deslocamento_y + 25;
    draw_text_transformed(_item_x, _titulo_y, _item.nome, _escala, _escala, 0);
    
    if (_abs_dist < 0.5) {
        var _desc_y = _titulo_y + (30 * _escala); 
        draw_text_transformed(_item_x, _desc_y, _texto_para_desenhar, 0.9, 0.9, 0);
    }
}

draw_set_alpha(1.0);

var _btn_voltar_x = _wgui / 2;
var _btn_voltar_y = _hgui - 80;

if (point_in_rectangle(_ex, _ey, _btn_voltar_x - 100, _btn_voltar_y - 30, _btn_voltar_x + 100, _btn_voltar_y + 30)) {
    esc_voltar = lerp(esc_voltar, 1.3, 0.15);
    
    if (mouse_check_button_pressed(mb_left)) {
        room_goto(roominicial);
    }
} else {
    esc_voltar = lerp(esc_voltar, 1, 0.15);
}

draw_set_color(c_white);
draw_text_transformed(_btn_voltar_x, _btn_voltar_y, "VOLTAR AO MENU", esc_voltar, esc_voltar, 0);

// Resetando os alinhamentos para evitar problemas em outras partes do código
draw_set_halign(-1);
draw_set_valign(-1);