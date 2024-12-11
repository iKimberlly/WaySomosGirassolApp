class PsiModel {
  String nome;
  String crp;
  String email;
  String especialidades;
  String dias;
  String horario;

  PsiModel({
    required this.nome,
    required this.crp,
    required this.email,
    required this.especialidades,
    required this.dias,
    required this.horario,
  });

  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'crp': crp,
      'email': email,
      'especialidades': especialidades,
      'dias': dias,
      'horario': horario,
    };
  }

  factory PsiModel.fromMap(Map<String, dynamic> map) {
    return PsiModel(
      nome: map['nome'],
      crp: map['crp'],
      email: map['email'],
      especialidades: map['especialidades'],
      dias: map['dias'],
      horario: map['horario']
    );
  }
}
