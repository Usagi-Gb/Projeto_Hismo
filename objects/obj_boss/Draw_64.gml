if (instance_exists(obj_final_hq)) exit;

var _largura_tela = surface_get_width(application_surface);
var _largura_barra = 400;
var _altura_barra = 20; 
var _x1 = (_largura_tela / 2) - (_largura_barra / 2);
var _y1 = 30; 
var _x2 = (_largura_tela / 2) + (_largura_barra / 2);
var _y2 = _y1 + _altura_barra;

var _porcentagem = (vida_atual / vida_max) * 100;

draw_set_color(c_black);
draw_rectangle(_x1 - 4, _y1 - 4, _x2 + 4, _y2 + 4, false);

draw_healthbar(_x1, _y1, _x2, _y2, _porcentagem, c_dkgray, c_red, c_red, 0, true, false);

draw_set_color(c_white);
draw_set_halign(fa_center);
draw_text(_largura_tela / 2, _y1 - 25, "O Rei da Floresta"); 
draw_set_halign(fa_left);