// Conta o tempo e destrói quando chegar a zero
if (life_timer > 0) {
    life_timer--;
} else {
    instance_destroy();
}