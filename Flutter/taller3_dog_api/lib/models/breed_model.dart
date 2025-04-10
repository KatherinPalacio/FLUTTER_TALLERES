// Modelo para representar una raza de perro

class BreedModel {
  final String name;

  BreedModel({required this.name});

  factory BreedModel.fromMap(String name) {
    return BreedModel(name: name);
  }
}
