class Veiculo {
  final String id;
  final String nome;
  final String modelo;
  final String ano;
  final String placa;

  Veiculo({
    required this.id,
    required this.nome,
    required this.modelo,
    required this.ano,
    required this.placa,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nome': nome,
      'modelo': modelo,
      'ano': ano,
      'placa': placa,
    };
  }

  factory Veiculo.fromMap(Map<String, dynamic> map) {
    return Veiculo(
      id: map['id'] ?? '',
      nome: map['nome'] ?? '',
      modelo: map['modelo'] ?? '',
      ano: map['ano'] ?? '',
      placa: map['placa'] ?? '',
    );
  }
}
