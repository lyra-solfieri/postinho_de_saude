class Paciente {
  int id;
  String nome;
  String email;
  String endereco;
  int cpf;
  String senha;
  String cartaoSus;
  String dataNascimento;

  Paciente({
    this.id,
    this.nome,
    this.email,
    this.cpf,
    this.senha,
    this.cartaoSus,
    this.dataNascimento,
  });

// Recebendo dados do servidor
  factory Paciente.fromMap(map) {
    return Paciente(
      id: map['uid'],
      nome: map['nome'],
      email: map['email'],
      cpf: map['cpf'],
      senha: map['senha'],
      cartaoSus: map['cartaoSus'],
      dataNascimento: map['dataNascimento'],
    );
  }
// enviando dados para o servidor
  Map<String, dynamic> toMap() {
    return {
      'uid': id,
      'name': nome,
      'email': email,
      'cpf': cpf,
      'senha': senha,
      'cartaoSus': cartaoSus,
      'dataNascimento': dataNascimento
    };
  }

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
