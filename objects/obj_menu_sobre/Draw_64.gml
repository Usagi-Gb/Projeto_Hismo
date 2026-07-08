var _largura = display_get_gui_width();
var _altura = display_get_gui_height();

// 1. Fundo escuro (opcional, caso a sua room não tenha fundo)
draw_set_alpha(0.8);
draw_set_color(c_black);
draw_rectangle(0, 0, _largura, _altura, false);
draw_set_alpha(1.0);

// 2. Alinhamento de Texto centralizado
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

// 3. Desenhar o Título
draw_set_color(c_yellow);
draw_text_transformed(_largura / 2, 50, titulo, 2, 2, 0);

// 4. Desenhar os Controles
draw_set_color(c_aqua);
draw_text(_largura / 2, 120, "CONTROLES:");
draw_set_color(c_white);
draw_text(_largura / 2, 170, texto_controles);

// 5. Desenhar as Mecânicas
draw_set_color(c_aqua);
draw_text(_largura / 2, 250, "--- MECANICAS DO JOGO ---");
draw_set_color(c_white);
draw_text(_largura / 2, 370, texto_mecanicas);

// 6. Reseta o alinhamento para não bugar outros menus do jogo
draw_set_halign(fa_left);
draw_set_valign(fa_top);