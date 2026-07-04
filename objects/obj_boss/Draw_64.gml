// Pega o tamanho real da tela
var _largura_tela = surface_get_width(application_surface);

// Configurações da barra de vida
var _largura_barra = 400; // Tamanho da barra
var _altura_barra = 20; // Grossura da barra
var _x1 = (_largura_tela / 2) - (_largura_barra / 2);
var _y1 = 30; // Distância do topo da tela
var _x2 = (_largura_tela / 2) + (_largura_barra / 2);
var _y2 = _y1 + _altura_barra;

// Calcula a porcentagem da vida (0 a 100)
var _porcentagem = (vida_atual / vida_max) * 100;

// 1. Desenha a borda preta
draw_set_color(c_black);
draw_rectangle(_x1 - 4, _y1 - 4, _x2 + 4, _y2 + 4, false);

// 2. Desenha a barra de vida (Fundo cinza, Vida vermelha)
draw_healthbar(_x1, _y1, _x2, _y2, _porcentagem, c_dkgray, c_red, c_red, 0, true, false);

// 3. Desenha o nome do Boss
draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_largura_tela / 2, _y1 - 25, "O GRANDE MESTRE"); // Troque pelo nome do seu Boss
draw_set_halign(fa_left); // Reseta o alinhamento do texto para não bugar outras partes do jogo