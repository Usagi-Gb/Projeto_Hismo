// Esta lógica garante que, se o ângulo for para a esquerda (90 a 270), 
// ele inverta o sprite verticalmente para ele não ficar de cabeça para baixo.
if (image_angle > 90 && image_angle < 270) {
    image_yscale = -1;
} else {
    image_yscale = 1;
}