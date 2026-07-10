if (estado == estado_morto) exit; // Não leva dano se já estiver morto

vida_atual -= other.dano;
instance_destroy(other);
