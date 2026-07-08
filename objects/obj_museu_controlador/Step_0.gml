var _tam = array_length(global.conquistas);
if (keyboard_check_pressed(vk_space) || keyboard_check_pressed(vk_escape)) {
    room_goto(roominicial); 
}

if (_tam > 0) {
    if (keyboard_check_pressed(ord("D")) || keyboard_check_pressed(vk_right)) {
        pos_atual++;
        if (pos_atual >= _tam) {
            pos_atual = 0;
            pos_filtrada -= _tam;
        }
    }

    if (keyboard_check_pressed(ord("A")) || keyboard_check_pressed(vk_left)) {
        pos_atual--;
        if (pos_atual < 0) {
            pos_atual = _tam - 1;
            pos_filtrada += _tam;
        }
    }
}

pos_filtrada = lerp(pos_filtrada, pos_atual, 0.15);