if (estado_cena == "transicao") {
    alpha_tela += 0.01; 
    
    if (alpha_tela >= 1) {
        estado_cena = "hq";
    }
}
else if (estado_cena == "hq") {
    if (mouse_check_button_pressed(mb_left) || keyboard_check_pressed(vk_space)) {
        painel_atual++;
        
        if (painel_atual >= array_length(painel_sprites)) {
            estado_cena = "fim";
        }
    }
}
else if (estado_cena == "fim") {
    if (instance_exists(obj_player)) {
        obj_player.vitoria = true;
    }
    instance_destroy(); 
}