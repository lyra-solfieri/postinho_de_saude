class MedicamentosModel {
  //int id;
  String quantidade;
  String nome;
  //String bula;
  //String imcn;
  //DateTime data_validade;
  //String categoria;

  MedicamentosModel({
    //this.id,
    this.quantidade,
    this.nome,
    // this.bula,
    //this.imcn,
    // this.categoria,
    //this.data_validade
  });

  factory MedicamentosModel.fromJson(Map<String, dynamic> json) {
    return MedicamentosModel(
      nome: json['nome'],
      quantidade: json['quantidade'],
    );
  }
}
