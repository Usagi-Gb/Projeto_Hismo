// ===================================================
// 1. SISTEMA DE GAME OVER E SALVAMENTO DE CONQUISTAS
// ===================================================
if (vida <= 0 && !game_over) {
    game_over = true;
    
    // IMPORTANTE: Ler e salvar a conquista ANTES de congelar o jogo!
    if (instance_exists(obj_controlador_waves)) {
        ondas_alcancadas = obj_controlador_waves.current_wave;
    }
    
    // Tira a foto da tela para o fundo
    var _width = surface_get_width(application_surface);
    var _height = surface_get_height(application_surface);
    gameover_surf = surface_create(_width, _height);
    surface_copy(gameover_surf, 0, 0, application_surface);
    
    // AGORA SIM: Congela tudo (inimigos, controlador, tiros)
    instance_deactivate_all(true);
}

if (game_over) {
    if (keyboard_check_pressed(vk_space)) {
        instance_activate_all();
        if (surface_exists(gameover_surf)) {
            surface_free(gameover_surf);
        }
        room_goto(roominicial); 
    }
    exit; // Impede o player de se mover enquanto morto
}


// ===================================================
// 2. LEITURA DOS INPUTS (Dash e Movimento)
// ===================================================
var up = keyboard_check(ord("W"));
var down = keyboard_check(ord("S"));
var left = keyboard_check(ord("A"));
var right = keyboard_check(ord("D"));
var _tecla_dash = keyboard_check_pressed(vk_shift);

var _movendo = (up ^^ down || left ^^ right);


// ===================================================
// 3. TIMERS (Ritmo e Cooldown do Dash)
// ===================================================
if (dash_cd_timer > 0) dash_cd_timer--;

if (ritmo_timer > 0) {
    ritmo_timer--;
    image_blend = c_aqua; 
} else {
    if (!is_dashing) image_blend = c_white; 
}


// ===================================================
// 4. MÁQUINA DE ESTADOS: DASH VS ANDAR NORMAL
// ===================================================
if (_tecla_dash && dash_cd_timer <= 0 && !is_dashing && _movendo) {
    is_dashing = true;
    dash_timer = dash_duration;
    dash_cd_timer = dash_cooldown;
    dash_dir = point_direction(0, 0, (right - left), (down - up));
}

if (is_dashing) {
    // ESTADO DASH
    vel = dash_speed; 
    move_dir = dash_dir;
    image_blend = c_yellow; 
    
    // Rastro visual do dash (cria o fantasma)
    if (dash_timer % 2 == 0) {
        var _rastro = instance_create_layer(x, y, "Instances", obj_rastro_dash);
        _rastro.sprite_index = sprite_index;
        _rastro.image_index = image_index;
        _rastro.image_xscale = xscale;
        _rastro.image_blend = image_blend;
    }
    
    dash_timer--;
    if (dash_timer <= 0) {
        is_dashing = false;
    }
} else {
    // ESTADO MOVIMENTO NORMAL
    if (_movendo) {
        move_dir = point_direction(0, 0, (right - left), (down - up));
        vel = max_vel;
    } else {
        vel = lerp(vel, 0, 0.1); 
    }
}


// ===================================================
// 5. CÁLCULO FINAL DE VELOCIDADE E MÉTODOS ORIGINAIS
// ===================================================
velh = lengthdir_x(vel, move_dir);
velv = lengthdir_y(vel, move_dir);

depth = -bbox_bottom;
joga_arma();
efeito_dano();
olha_mouse();