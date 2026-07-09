
speed *= 0.95; 


tempo_explosao--;



if (tempo_explosao > 60) {
    sprite_index = spr_bomba_apagada; 
} 

else if (tempo_explosao > 30) {
    sprite_index = spr_bomba_acesa;  
} 

else {
    sprite_index = spr_bomba_quase;   
}


if (tempo_explosao <= 0) {
    instance_create_layer(x, y, "Instances", obj_explosao);
    instance_destroy();
}