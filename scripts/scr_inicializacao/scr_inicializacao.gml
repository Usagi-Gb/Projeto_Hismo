// --- GARANTIA DE ESTATÍSTICAS GLOBAIS ---
// Declaramos aqui para o jogo nunca dar erro de "not set before reading"
global.inimigos_mortos = 0;
global.lizards_mortos = 0;
global.sapos_mortos = 0;
global.ritmos_acertados = 0;
global.conquistas = [
    // ==========================================
    // ITENS ORIGINAIS
    // ==========================================
    {
        nome: "Laudo",
        desc_bloqueado: "...",
        desc_desbloqueado: "Paciente Lucas foi diagnosticado por Dr Mario Polombo como uma pessoa com distúrbio psicológico amusia...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Laudo,
        desbloqueado: true
    },
    {
        nome: "Partitura",
        desc_bloqueado: "...",
        desc_desbloqueado: "O instrumento que tocará a partitura escolhe como a partitura será escrita. O meio de notar a onde está quais notas é chamado de *CLAVE*.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: partitura,
        desbloqueado: true
    },
	{
        nome: "Acidentes",
        desc_bloqueado: "Recompensa por desbloquear *Jingle* e ambas partituras apenas Sol.",
        desc_desbloqueado: "Os acidentes são parte vital de muitas sonoridades de qualquer música que as utilize, sendo as mais comuns o sustenido e o Bmol. *Partitura com 3 notas, Sol Bmol, Sol, Sol#.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: AcidenteL_,
        desbloqueado: true
    },
	{
        nome: "Crescente",
        desc_bloqueado: "Bloqueado: Derrote o MC Perereca.",
        desc_desbloqueado: "No processo de escritura você pode conectar duas notas para criar ou uma prolongação ou, neste caso, uma dinâmica de em uma só leva crescer ou decrescer até a nota alvo.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Acidentes,
        desbloqueado: true
    },
    
    // ==========================================
    // OS 16 NOVOS ITENS DO MUSEU
    // ==========================================
    {
        nome: "Clave de Fá",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição da Clave de Fá...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Clave_Fa,
        desbloqueado: true
    },
    {
        nome: "Clave de Sol",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição da Clave de Sol...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: clava_de_sol,
        desbloqueado: true
    },
    {
        nome: "Jingle",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição do Jingle...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Jingle,
        desbloqueado: true
    },
    {
        nome: "Jornal Marley",
        desc_bloqueado: "Sofra uma derrota para um Boob Marley",
        desc_desbloqueado: "... Durante sua 4° turnê pelo Brasil, o artista audiovisual Boob Marley teve seu primeiro problema técnico durante o show na Bahia quando um de seus fãs conseguiu entrar no camarin de Boob Marley durante o show. Boob Marley, em sua metodologia peculiar, decidiu resolver o problema pessoalmente e teve que interromper seu próprio show.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: JornalCidadeMARLEY,
        desbloqueado: false
    },
    {
        nome: "Tom da Floresta",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição do Tom da Floresta...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Tom_da_Floresta,
        desbloqueado: true
    },
    {
        nome: "Oito Notas",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição das 8 notas...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: _8_notas,
        desbloqueado: true
    },
    {
        nome: "Nota Musical 1",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição da primeira nota...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: nota,
        desbloqueado: true
    },
    {
        nome: "Nota Musical 2",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição da segunda nota...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: nota2,
        desbloqueado: true
    },
    {
        nome: "Flauta",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição da Flauta...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: spr_flauta,
        desbloqueado: true
    },
    {
        nome: "Violão",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição do Violão...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: viol_o,
        desbloqueado: true
    },
    {
        nome: "Violão do Museu",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição do Violão do Museu...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: museu_viol_o,
        desbloqueado: false
    },
    {
        nome: "Ukulele",
        desc_bloqueado: "Equipe o Ukulele durante a Gameplay",
        desc_desbloqueado: "Tenho ",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: ukulele,
        desbloqueado: false
    },
    {
        nome: "Bandana",
        desc_bloqueado: "Derrote 10 Boob Marleys",
        desc_desbloqueado: "O Boob Marley permitiu que eu pegasse sua bandana como um presente durante o show por eu ser seu maior fã.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: bandana,
        desbloqueado: false
    },
    {
        nome: "Arco",
        desc_bloqueado: "...",
        desc_desbloqueado: "Descrição do Arco...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: bow,
        desbloqueado: false
    },
    {
        nome: "Colar",
        desc_bloqueado: "derrote um MC Sapão",
        desc_desbloqueado: "Apenas os maioral vão pra arte” como o MC Sapão tem um jeito com as palavras",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: collar2,
        desbloqueado: false
    },
	{
		nome: "Cupcake",
		desc_bloqueado: "Consuma um cupcake durante Gameplay",
		desc_desbloqueado: "Este Cupcake é especial, ele é o melhor Cupcake que você poderia comer em sua vida, Ele te revigora no Físico E no espírito.",
		spr_bloqueado: spr_cadeado,
		spr_desbloqueado: CupC
	},
];