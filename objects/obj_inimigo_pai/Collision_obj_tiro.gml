if (estado == estado_morto) {
    exit; 
}
//Pega a direção da bala para o knockback
p_dir = other.direction;

var _dano_da_bala = other.dano;
instance_destroy(other);

leva_dano(_dano_da_bala);