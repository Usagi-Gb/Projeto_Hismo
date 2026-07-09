if (instance_exists(obj_final_hq)) exit;
// Calcular o quão perto as barras estão do coração
//Multiplicar a distância invertida atrai as barras até ao centro.
var current_dist = max_dist * (1.0 - beat_fraction);

// Cor do Coração: Muda se estiver na altura certa para apertar
var heart_color = in_window ? c_fuchsia : c_red ;
draw_set_color(heart_color);

// Desenhar o Coração no centro
draw_sprite_ext(heart, 0, ui_x, ui_y, heart_scale, heart_scale, 0, heart_color, 1);
draw_set_color(c_white);
// Barra da Esquerda
draw_rectangle(ui_x - current_dist - 5, ui_y - 25, ui_x - current_dist + 5, ui_y + 25, false);
// Barra da Direita
draw_rectangle(ui_x + current_dist - 5, ui_y - 25, ui_x + current_dist + 5, ui_y + 25, false);

//Desenhar os limite
var dist_tolerancia = max_dist * tolerance;
draw_set_alpha(0.5);
draw_line(ui_x - dist_tolerancia, ui_y - 30, ui_x - dist_tolerancia, ui_y + 30);
draw_line(ui_x + dist_tolerancia, ui_y - 30, ui_x + dist_tolerancia, ui_y + 30);
draw_set_alpha(1.0);