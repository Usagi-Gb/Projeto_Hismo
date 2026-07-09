if (file_exists("save_hismo.json")) {
    opcoes = ["CONTINUAR", "NOVO JOGO", "MUSEU", "SOBRE", "SAIR"];
} else {
    opcoes = ["NOVO JOGO", "MUSEU", "SOBRE", "SAIR"];
}

index_selecionado = 0;

mx_anterior = device_mouse_x_to_gui(0);
my_anterior = device_mouse_y_to_gui(0);