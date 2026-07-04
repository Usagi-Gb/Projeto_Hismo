// 1. A bomba vai freando no chão
speed *= 0.95; 

// 2. O tempo vai diminuindo
tempo_explosao--;

// 3. --- SISTEMA DE TROCA DE SPRITE ---
// Se faltar MAIS de 60 frames (fase inicial)
if (tempo_explosao > 60) {
    sprite_index = spr_bomba_apagada; // Coloque aqui o nome do sprite apagado
} 
// Se faltar ENTRE 60 e 30 frames (fase do meio)
else if (tempo_explosao > 30) {
    sprite_index = spr_bomba_acesa;   // Coloque aqui o nome do sprite aceso
} 
// Se faltar MENOS de 30 frames (fase final)
else {
    sprite_index = spr_bomba_quase;   // Coloque aqui o nome do sprite quase explodindo
}

// 4. A explosão acontece quando o tempo zera
if (tempo_explosao <= 0) {
    instance_create_layer(x, y, "Instances", obj_explosao);
    instance_destroy();
}