global.inimigos_mortos = 0;
global.boobs_mortos = 0;
global.sapos_mortos = 0;
global.ratos_mortos = 0;
global.ritmos_acertados = 0;
global.ondas_maximas = 0;
global.conquistas = [
    {
        nome: "Laudo",
        desc_bloqueado: "...",
        desc_desbloqueado: "Paciente Lucas foi diagnosticado por Dr Mario Polombo como uma pessoa com disturbio psicologico amusia...",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Laudo,
        desbloqueado: true
    },
    {
        nome: "Partitura",
        desc_bloqueado: "...",
        desc_desbloqueado: "O instrumento que tocara a partitura escolhe como a partitura sera escrita.\n O meio de notar a onde está quais notas tem o nome de *CLAVE*.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: partitura,
        desbloqueado: true
    },
{
        nome: "Acidentes",
        desc_bloqueado: "Recompensa por desbloquear e ambas partituras de Clave.",//precisa conferir se 
        desc_desbloqueado: "Os acidentes são parte vital de muitas sonoridades de qualquer musica que as utilize,\n sendo as mais comuns o sustenido e o Bmol.\n A partitura acima contem, Sol Bmol, Sol puro e Sol sustenido.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: AcidenteL_,
        desbloqueado: false
    },
	{
        nome: "Crescente", // precisa conferir 
        desc_bloqueado: "Bloqueado: Derrote o MC Perereca.",
        desc_desbloqueado: "No processo de escritura voce pode conectar duas notas para criar ou uma prolongaçao\n ou, neste caso, uma dinamica de em uma so leva crescer ou decrescer ate a nota alvo.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: Acidentes,
        desbloqueado: false
    },
	{
        nome: "Clave de Sol",
        desc_bloqueado: "Recompensa de primeiro abate",
        desc_desbloqueado: "Nesta clave a nota sol estara na segunda linha.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: clava_de_sol,
        desbloqueado: false
    },
    {
        nome: "Clave de Fa",
        desc_bloqueado: "Recompensa de primeira wave",
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
        desc_bloqueado: "Derrote 3 Boob Marley",
        desc_desbloqueado: "... Durante sua 4° turne pelo Brasil, o artista audiovisual Boob Marley teve seu historico primeiro \nproblema tecnico durante o show na Bahia quando um de seus fas conseguiu entrar no camarin de Boob Marley durante o show.\n Boob Marley, em sua metodologia peculiar, decidiu resolver o problema pessoalmente e teve que interromper seu proprio show.",
        spr_bloqueado: spr_cadeado,
        spr_desbloqueado: JornalCidadeMARLEY,
        desbloqueado: false
    },
	{ 
		nome: "Bomba Bombastic",
        desc_bloqueado: "Abata um MC Bombastic",
        desc_desbloqueado: "\nO mais famoso MR Bombastic bombou em todos os jeitos.\n Sua musica? Apenas bombas.\n Sua fama? Explosiva.\n Sua vida? Apenas uma explosao rapida infelizmente…",
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
        desc_desbloqueado: "O intervalo mais curto que e frequentemente utilizado",
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
        desc_bloqueado: "Derrote um Boob Marley",
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
		desc_bloqueado: "Elimine 10 inimigos",
		desc_desbloqueado: "Este Cupcake é especial, ele e o melhor Cupcake que você poderia comer em sua vida, Ele te revigora no Fisico E no espirito.",
		spr_bloqueado: spr_cadeado,
		spr_desbloqueado: CupC,
		desbloqueado: false
	},
];

function salvar_jogo() {
    var _dados_save = {
        inimigos: global.inimigos_mortos,
        boobs: global.boobs_mortos,
        sapos: global.sapos_mortos,
        ratos: global.ratos_mortos,
        ritmos: global.ritmos_acertados,
        conquistas_status: [] 
    };

    var _tam = array_length(global.conquistas);
    for (var i = 0; i < _tam; i++) {
        array_push(_dados_save.conquistas_status, global.conquistas[i].desbloqueado);
    }

    var _json_string = json_stringify(_dados_save);
    var _pasta = file_text_open_write("save_hismo.json");
    file_text_write_string(_pasta, _json_string);
    file_text_close(_pasta);
}

function carregar_jogo() {
    if (file_exists("save_hismo.json")) {
        var _pasta = file_text_open_read("save_hismo.json");
        var _json_string = file_text_read_string(_pasta);
        file_text_close(_pasta);

        var _dados_save = json_parse(_json_string);

        global.inimigos_mortos = _dados_save.inimigos;
        global.boobs_mortos = _dados_save.boobs;
        global.sapos_mortos = _dados_save.sapos;
        global.ratos_mortos = _dados_save.ratos;
        global.ritmos_acertados = _dados_save.ritmos;

        var _tam = array_length(global.conquistas);
        for (var i = 0; i < _tam; i++) {
            if (i < array_length(_dados_save.conquistas_status)) {
                global.conquistas[i].desbloqueado = _dados_save.conquistas_status[i];
            }
        }
    }
}

function deletar_save() {
    if (file_exists("save_hismo.json")) {
        file_delete("save_hismo.json");
    }
    
    global.inimigos_mortos = 0;
    global.boobs_mortos = 0;
    global.sapos_mortos = 0;
    global.ratos_mortos = 0;
    global.ritmos_acertados = 0;
    
    var _tam = array_length(global.conquistas);
    for (var i = 0; i < _tam; i++) {
        var _nome = global.conquistas[i].nome;
        
        if (_nome == "Laudo" || _nome == "Partitura" || _nome == "Oito Notas") {
            global.conquistas[i].desbloqueado = true;
        } else {
            global.conquistas[i].desbloqueado = false;
        }
    }
}


carregar_jogo();