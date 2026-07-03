// 1. Calcular o quão perto as barras estão do coração
// A fração varia entre 0.0 e 0.99. Multiplicar a distância invertida atrai as barras até ao centro.
var current_dist = max_dist * (1.0 - beat_fraction);

// 2. Cor do Coração: Muda se estiver na altura certa para apertar
var heart_color = in_window ? c_green : c_red;
draw_set_color(heart_color);

// 3. Desenhar o Coração no centro
// Se tiver um sprite de um coração (ex: spr_coracao), substitua isto por draw_sprite_ext(...)
draw_circle(ui_x, ui_y, 20 * heart_scale, false);

// 4. Desenhar as Barras laterais
draw_set_color(c_white);
// Barra da Esquerda
draw_rectangle(ui_x - current_dist - 5, ui_y - 25, ui_x - current_dist + 5, ui_y + 25, false);
// Barra da Direita
draw_rectangle(ui_x + current_dist - 5, ui_y - 25, ui_x + current_dist + 5, ui_y + 25, false);

// Opcional: Desenhar as "marcas" de limite para a tolerância
var dist_tolerancia = max_dist * tolerance;
draw_set_alpha(0.5);
draw_line(ui_x - dist_tolerancia, ui_y - 30, ui_x - dist_tolerancia, ui_y + 30);
draw_line(ui_x + dist_tolerancia, ui_y - 30, ui_x + dist_tolerancia, ui_y + 30);
draw_set_alpha(1.0);