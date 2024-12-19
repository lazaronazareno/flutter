class AnimalModel {
  final String id;
  final String name;
  final String imageUrl;
  final int age;
  final String breed;
  final String type;
  final bool isFavorite;

  const AnimalModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.age,
    required this.breed,
    required this.type,
    this.isFavorite = false,
  });

  //es un parametro nombrado
  AnimalModel copyWith({bool? isFavorite}) {
    return AnimalModel(
      id: id,
      name: name,
      imageUrl: imageUrl,
      age: age,
      breed: breed,
      type: type,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }
}
