var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _confirma = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

// Verifica o mouse
var _rato_mexeu = (_mx != mx_anterior) || (_my != my_anterior);
mx_anterior = _mx;
my_anterior = _my;

var _largura = display_get_gui_width();
var _altura = display_get_gui_height();
var _espacamento = 30; // Tem de ser igual ao espaçamento do Draw
var _y_inicial = _altura / 2;
var _qtd_opcoes = array_length(opcoes);

if (_rato_mexeu || mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < _qtd_opcoes; i++) {
        var _pos_y = _y_inicial + (i * _espacamento);
        
        // Cria uma "caixa imaginária" (hitbox) à volta do texto
        var _x1 = (_largura / 2) - 150;
        var _x2 = (_largura / 2) + 150;
        var _y1 = _pos_y - 30;
        var _y2 = _pos_y + 30;
        
        // Se o ponteiro do mouse estiver dentro dessa caixa:
        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            index_selecionado = i; // Seleciona a opção tocada
            // Se clicar com o botão esquerdo, confirma a opção
            if (mouse_check_button_pressed(mb_left)) {
                _confirma = true;
            }
        }
    }
}

if (_cima) {
    index_selecionado--;
    if (index_selecionado < 0) {
        index_selecionado = _qtd_opcoes - 1;
    }
}

if (_baixo) {
    index_selecionado++;
    if (index_selecionado >= _qtd_opcoes) {
        index_selecionado = 0;
    }
}

if (_confirma) {
    switch (index_selecionado) {
        case 0:
            room_goto(roomjogo); 
            break;
            
        case 1:
            room_goto(roommuseu); 
            break;
		
		case 2:
            room_goto(roomsobre); 
            break;
            
        case 3:
            game_end(); 
            break;
    }
}