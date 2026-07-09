global.inimigos_mortos = 0;
global.boobs_mortos = 0;
global.sapos_mortos = 0;
global.ratos_mortos = 0;
global.ritmos_acertados = 0;
global.conquistas = [
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
        desc_desbloqueado: "O instrumento que tocará a partitura escolhe como a partitura será escrita.\n O meio de notar a onde está quais notas é chamado de *CLAVE*.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: partitura,
        desbloqueado: true
    },
{
        nome: "Acidentes",
        desc_bloqueado: "Recompensa por desbloquear e ambas partituras apenas Sol.",
        desc_desbloqueado: "Os acidentes são parte vital de muitas sonoridades de qualquer música que as utilize,\n sendo as mais comuns o sustenido e o Bmol.\n A partitura acima contém, Sol Bmol, Sol puro e Sol sustenido.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: AcidenteL_,
        desbloqueado: false
    },
	{
        nome: "Crescente",
        desc_bloqueado: "Bloqueado: Derrote o MC Perereca.",
        desc_desbloqueado: "No processo de escritura você pode conectar duas notas para criar ou uma prolongação\n ou, neste caso, uma dinâmica de em uma só leva crescer ou decrescer até a nota alvo.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Acidentes,
        desbloqueado: false
    },
	{
        nome: "Clave de Sol",
        desc_bloqueado: "Recompensa de primeira wave",
        desc_desbloqueado: "Nesta clave a nota sol estará na segunda linha.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: clava_de_sol,
        desbloqueado: false
    },
    {
        nome: "Clave de Fá",
        desc_bloqueado: "Recompensa de primeiro abate",
        desc_desbloqueado: "...já nesta clave terá um sol no espaço sobre a quarta linha.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Clave_Fa,
        desbloqueado: false
    },
    {
        nome: "Jingle",
        desc_bloqueado: "Recompensa por desbloquear Ambas as claves",
        desc_desbloqueado: "",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Jingle,
        desbloqueado: false
    },
    {
        nome: "Jornal Marley",
        desc_bloqueado: "Sofra uma derrota para um Boob Marley",
        desc_desbloqueado: "... Durante sua 4° turnê pelo Brasil, o artista audiovisual Boob Marley teve seu historico primeiro \nproblema tecnico durante o show na Bahia quando um de seus fãs conseguiu entrar no camarin de Boob Marley durante o show.\n Boob Marley, em sua metodologia peculiar, decidiu resolver o problema pessoalmente e teve que interromper seu proprio show.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: JornalCidadeMARLEY,
        desbloqueado: false
    },
	{ 
		nome: "Bomba Bombastic",
        desc_bloqueado: "Abata um MC Bombastic",
        desc_desbloqueado: "\nO mais famoso MR Bombastic bombou em todos os jeitos.\n Sua musica? Apenas bombas.\n Sua fama? Explosiva.\n Sua vida? Apenas uma explosão rapida infelizmente…",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: spr_bomba_quase,
        desbloqueado: false,
	},
    {
        nome: "Tom da Floresta",
        desc_bloqueado: "Abata o Chefe Final",
        desc_desbloqueado: "O tom que tanto o perseguiu foi apenas uma unica nota. \n\n\n Do´",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Tom_da_Floresta,
        desbloqueado: false
    },
    {
        nome: "Oito Notas",
        desc_bloqueado: "...",
        desc_desbloqueado: "O intervalo mais curto frequentemente utilizavel",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: _8_notas,
        desbloqueado: true
    },
    {
        nome: "Violão do Museu",
        desc_bloqueado: "Recompensa por o usar durante Gameplay",
        desc_desbloqueado: "",
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
        desc_desbloqueado: "Se um dia eu já tive um violino, esse violino ",
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
		spr_desbloqueado: CupC,
		desbloqueado: false
	},
];