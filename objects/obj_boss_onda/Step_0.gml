// A onda cresce de tamanho continuamente
image_xscale += 0.05;
image_yscale += 0.05;

// Fica transparente aos poucos para sumir naturalmente
image_alpha -= 0.02;

// Se ficar invisível, se destrói para liberar memória
if (image_alpha <= 0) {
    instance_destroy();
}