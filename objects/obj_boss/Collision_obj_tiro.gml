// Se o boss já estiver morto, a bala passa reto
if (estado == estado_morto) {
    exit;
}

// Subtrai a vida do Boss com base no dano da bala
vida_atual -= other.dano;

// Destrói a bala ao bater no Boss
instance_destroy(other);