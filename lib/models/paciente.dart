class Paciente {
  final int id;
  final String nome;
  final int cpf;
  final String senha;
  final String cartaoSus;
  final String dataNascimento;
  /*
  static final columns = [
    'id',
    'nome',
    'cpf',
    'senha',
    'cartaoSus',
    'dataNascimento'
  ];
  */

  Paciente({
    this.id,
    this.nome,
    this.cpf,
    this.senha,
    this.cartaoSus,
    this.dataNascimento,
  });

  Paciente fromJson(json) {
    return Paciente(
      id: json['id'],
      nome: json['nome'],
      cpf: json['cpf'],
      senha: json['senha'],
      cartaoSus: json['cataoSus'],
      dataNascimento: json['dataNascimento'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'cpf': cpf,
      'senha': senha,
      'cartaoSus': cartaoSus,
      'dataNascimento': dataNascimento,
    };
  }
}
