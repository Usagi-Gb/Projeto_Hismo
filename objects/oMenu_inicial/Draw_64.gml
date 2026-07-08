var _largura = display_get_gui_width();
var _altura = display_get_gui_height();

// Definição do espaçamento (Aumente o valor abaixo se quiser afastar ainda mais)
var _espacamento = 15; 
var _y_inicial = _altura / 2; 

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _qtd_opcoes = array_length(opcoes);

for (var i = 0; i < _qtd_opcoes; i++) {
    var _pos_y = _y_inicial + (i * _espacamento);
    
    if (i == index_selecionado) {
        draw_set_color(c_aqua);
        draw_text_transformed(_largura / 2, _pos_y, opcoes[i], 1.2, 1.2, 0);
    } else {
        draw_set_color(c_white);
        draw_text_transformed(_largura / 2, _pos_y, opcoes[i], 1, 1, 0);
    }
}

draw_set_halign(fa_left);
draw_set_valign(fa_top);