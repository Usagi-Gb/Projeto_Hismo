var _cima = keyboard_check_pressed(vk_up) || keyboard_check_pressed(ord("W"));
var _baixo = keyboard_check_pressed(vk_down) || keyboard_check_pressed(ord("S"));
var _confirma = keyboard_check_pressed(vk_enter) || keyboard_check_pressed(vk_space);

if (_cima) {
    index_selecionado--;
    if (index_selecionado < 0) {
        index_selecionado = array_length(opcoes) - 1;
    }
}

if (_baixo) {
    index_selecionado++;
    if (index_selecionado >= array_length(opcoes)) {
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
			
            
        case 4:
            game_end(); 
            break;
    }
}