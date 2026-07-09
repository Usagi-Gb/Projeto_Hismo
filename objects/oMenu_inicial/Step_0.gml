var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _confirma = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

var _mx = device_mouse_x_to_gui(0);
var _my = device_mouse_y_to_gui(0);

var _mouse_mexeu = (_mx != mx_anterior) || (_my != my_anterior);
mx_anterior = _mx;
my_anterior = _my;

var _largura = display_get_gui_width();
var _altura = display_get_gui_height();
var _espacamento = 30; 
var _y_inicial = _altura / 2;
var _qtd_opcoes = array_length(opcoes);

if (_mouse_mexeu || mouse_check_button_pressed(mb_left)) {
    for (var i = 0; i < _qtd_opcoes; i++) {
        var _pos_y = _y_inicial + (i * _espacamento);
        var _x1 = (_largura / 2) - 150;
        var _x2 = (_largura / 2) + 150;
        var _y1 = _pos_y - 30;
        var _y2 = _pos_y + 30;
        
        if (point_in_rectangle(_mx, _my, _x1, _y1, _x2, _y2)) {
            index_selecionado = i;
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
    var _escolha = opcoes[index_selecionado];
    
    switch (_escolha) {
        case "CONTINUAR":
            room_goto(roomjogo); 
            break;
            
        case "NOVO JOGO":
            deletar_save();
            room_goto(roomjogo); 
            break;
            
        case "MUSEU":
            room_goto(roommuseu); 
            break;
            
        case "SOBRE":
            room_goto(roomsobre); 
            break;
            
        case "SAIR":
            game_end(); 
            break;
    }
}