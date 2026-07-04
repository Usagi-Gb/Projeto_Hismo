image_alpha -= 0.05; // Vai desaparecendo aos poucos
if (image_alpha <= 0) {
    instance_destroy(); // Se apaga da memória quando some totalmente
}	