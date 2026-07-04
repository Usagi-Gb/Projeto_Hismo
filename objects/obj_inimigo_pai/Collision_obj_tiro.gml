// 1. Pega a direção da bala para o knockback
p_dir = other.direction;

// 2. Salva o dano da bala
var _dano_da_bala = other.dano;

// 3. Destrói a bala
instance_destroy(other);

// 4. Aplica o dano lido
leva_dano(_dano_da_bala);