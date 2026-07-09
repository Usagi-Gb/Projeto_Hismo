var _largura = display_get_gui_width();
var _altura = display_get_gui_height();
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_set_color(c_white);

var _ex = device_mouse_x_to_gui(0);
var _ey = device_mouse_y_to_gui(0);
var _wgui = display_get_gui_width();
var _hgui = display_get_gui_height();
// Fundo escuro
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, _largura, _altura, false);
draw_set_alpha(1.0);

// Alinhamento de Texto centralizado
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// Desenhar o Título
draw_set_color(c_yellow);
draw_text_transformed(_largura / 2, 50, titulo, 2, 2, 0);

// Desenhar os Controles
draw_set_color(c_aqua);
draw_text(_largura / 2, 110, "CONTROLES:");
draw_set_color(c_white);
draw_text(_largura / 2, 180, texto_controles);

// Desenhar as Mecânicas
draw_set_color(c_aqua);
draw_text(_largura / 2, 280, "--- MECANICAS DO JOGO ---");
draw_set_color(c_white);
draw_text(_largura / 2, 400, texto_mecanicas);

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

// 6. Reseta o alinhamento para não bugar outros menus do jogo
draw_set_halign(fa_left);
draw_set_valign(fa_top);