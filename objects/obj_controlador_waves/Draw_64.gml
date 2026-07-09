draw_set_color(c_white);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

draw_text(20, 45, "WAVE: " + string(current_wave));
draw_text(20, 75, "INIMIGOS RESTANTES: " + string(inimigos_vivos_no_mapa));

if (timer_next_wave > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    
    var _tempo_segundos = ceil(timer_next_wave / game_get_speed(gamespeed_fps));
    
    draw_text(display_get_gui_width() / 2, display_get_gui_height() / 4, "PROXIMA WAVE EM: " + string(_tempo_segundos));
}