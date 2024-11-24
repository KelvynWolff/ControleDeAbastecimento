class Vehicle {
  final String id;
  final String name;
  final String model;
  final String year;
  final String placa;

  Vehicle({
    required this.id,
    required this.name,
    required this.model,
    required this.year,
    required this.placa,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'model': model,
      'year': year,
      'placa': placa,
    };
  }

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      model: map['model'] ?? '',
      year: map['year'] ?? '',
      placa: map['plate'] ?? '',
    );
  }
}
