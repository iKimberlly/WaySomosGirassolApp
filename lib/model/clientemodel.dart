class ClienteModel {
  final String nome;
  final String email;
  final String senha;

  ClienteModel({
    required this.nome,
    required this.email,
    required this.senha,
  });

  // Converts a ClienteModel instance into a Map
  Map<String, dynamic> toMap() {
    return {
      'nome': nome,
      'email': email,
      'senha': senha,
    };
  }

  // Creates a ClienteModel instance from a Map
  factory ClienteModel.fromMap(Map<String, dynamic> map) {
    return ClienteModel(
      nome: map['nome'],
      email: map['email'],
      senha: map['senha'],
    );
  }
}
