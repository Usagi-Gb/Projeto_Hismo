current_wave = 1;
enemies_to_spawn = 5; 
spawn_cooldown = game_get_speed(gamespeed_fps) * 1.5; 
spawn_timer = spawn_cooldown;

wave_ready = true; 
timer_next_wave = -1;
// --- GARANTIA DE ESTATÍSTICAS GLOBAIS ---
// Declaramos aqui para o jogo nunca dar erro de "not set before reading"
global.inimigos_mortos = 0;
global.lizards_mortos = 0;
global.sapos_mortos = 0;
global.ritmos_acertados = 0;

inimigos_vivos_no_mapa = 0;
ultima_wave_verificada = 1;
lista_armas_drop = [obj_cajado_axe,obj_cajado_verde,obj_cajado_vermelho];