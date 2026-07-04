// 1. SISTEMA DE VIDA E GAME OVER
if (vida <= 0) { game_over = true; }

if (game_over) {
    if (keyboard_check_pressed(vk_space)) { room_goto(roominicial); }
    exit; 
}

// 2. LEITURA DOS INPUTS
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var _tecla_dash = keyboard_check_pressed(ord("Q"));

var _movendo = (up ^^ down || left ^^ right);

// 3. GERENCIAMENTO DE TIMERS (Dash e Ritmo)
if (dash_cd_timer > 0) dash_cd_timer--;

if (ritmo_timer > 0) {
    ritmo_timer--;
    image_blend = c_aqua; // Indicador visual do acerto de ritmo
} else {
    if (!is_dashing) {
        image_blend = c_white; 
    }
}

// 4. INICIAR O DASH
if (_tecla_dash && dash_cd_timer <= 0 && !is_dashing && _movendo) {
    is_dashing = true;
    dash_timer = dash_duration;
    dash_cd_timer = dash_cooldown;
    dash_dir = point_direction(0, 0, (right - left), (down - up));
}

// 5. MÁQUINA DE ESTADOS: DASH VS MOVIMENTO NORMAL
if (is_dashing) {
    // ESTADO: DASH
    vel = dash_speed; // Como o movimento não é mais dobrado, o valor '7' será uma distância normal agora
    move_dir = dash_dir;
    image_blend = c_yellow;
	dano = true;
	
    if (dash_timer % 2 == 0) {
        var _rastro = instance_create_layer(x, y, "Instances", obj_rastro_dash);
        _rastro.sprite_index = sprite_index; // Copia a animação atual
        _rastro.image_index = image_index;   // Copia o frame exato do passo
        _rastro.image_xscale = xscale;       // Vira para o mesmo lado do mouse
        _rastro.image_blend = image_blend;   // Copia o brilho (amarelo ou ciano)
    }
    dash_timer--;
    if (dash_timer <= 0) {
        is_dashing = false;
		if (alarm[0] <= 0) {
            dano = false;			
            image_alpha = 1;
        }
    }
} else {
    // ESTADO: MOVIMENTO NORMAL
    if (_movendo) {
        move_dir = point_direction(0, 0, (right - left), (down - up));
        vel = max_vel;
    } else {
        vel = lerp(vel, 0, 0.1); 
    }
}

// 6. CÁLCULO DA VELOCIDADE
velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

// NOTA: Retirámos a colisão daqui! O seu "Step_2.gml" (End Step) fará a colisão e moverá o player em segurança.

// 7. MÉTODOS ORIGINAIS
depth = -bbox_bottom;
joga_arma();
efeito_dano();
olha_mouse();