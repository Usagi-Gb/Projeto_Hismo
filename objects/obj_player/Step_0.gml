depth =- bbox_bottom;

var up, down, left, right;

// 1. Verifica se a vida zerou (substitua "vida" pela sua variável real de HP, caso seja diferente)
if (vida <= 0) {
    game_over = true;
}

// 2. Lógica de Game Over
if (game_over) {
    // Escuta a tecla Espaço
    if (keyboard_check_pressed(vk_space)) {
        // Redireciona para a sala inicial baseada na estrutura do seu repositório
        room_goto(roominicial); //
    }
var _width = surface_get_width(application_surface);
        var _height = surface_get_height(application_surface);
        
        pause_surf = surface_create(_width, _height);
        surface_copy(pause_surf, 0, 0, application_surface);
        
        instance_deactivate_all(true);
		velh = 0;
		velv = 0;
    // O 'exit' impede que o resto do código do Step (movimentação, tiros, etc.)
    // continue rodando enquanto o jogador estiver na tela de Game Over.
    exit; 
}


up = keyboard_check(ord("W"));
down = keyboard_check(ord("S"));
left = keyboard_check(ord("A"));
right = keyboard_check(ord("D"));

show_debug_message(arma);

if(up ^^ down || left ^^ right){
	move_dir = point_direction(0, 0, (right - left), (down - up));
	vel = max_vel;
}
else{
		vel = lerp(vel, 0, 0.1);
	}

velh = lengthdir_x(vel,move_dir);
velv = lengthdir_y(vel, move_dir);
joga_arma();
efeito_dano();
olha_mouse();