// Variáveis de controle
current_wave = 1;
onda_maxima = 3; // Defina aqui qual será a última wave antes do boss!
boss_spawnado = false;
enemies_to_spawn = 5; 
spawn_timer = 0;
spawn_cooldown = 60; 
inimigos_vivos_no_mapa = 0;
ultima_wave_verificada = 1;
timer_next_wave = 0; 

// Nova lista de drop de armas
lista_armas_drop = [obj_cajado_axe, obj_cajado_verde, obj_cajado_vermelho];

// Reset das estatísticas globais
global.inimigos_mortos = 0;
global.lizards_mortos = 0;
global.sapos_mortos = 0;
global.ritmos_acertados = 0;