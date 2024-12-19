part of 'animal_bloc.dart';

//estado de la pagina
enum AnimalPageStatus { none, loading, success, failure }

class AnimalState extends Equatable {
  final List<AnimalModel> animals;
  final List<AnimalModel> filteredAnimals;
  final List<AnimalModel> favorites;
  final AnimalPageStatus pageStatus;
  final String filter;

  const AnimalState({
    required this.animals,
    required this.filteredAnimals,
    required this.favorites,
    required this.pageStatus,
    required this.filter,
  });

  factory AnimalState.initial() {
    return AnimalState(
      animals: List.empty(),
      filteredAnimals: List.empty(),
      favorites: List.empty(),
      pageStatus: AnimalPageStatus.none,
      filter: 'dog',
    );
  }

  AnimalState copyWith({
    List<AnimalModel>? animals,
    List<AnimalModel>? favorites,
    List<AnimalModel>? filteredAnimals,
    AnimalPageStatus? pageStatus,
    String? filter,
  }) {
    return AnimalState(
      animals: animals ?? this.animals,
      filteredAnimals: filteredAnimals ?? this.filteredAnimals,
      favorites: favorites ?? this.favorites,
      pageStatus: pageStatus ?? this.pageStatus,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props =>
      [animals, filteredAnimals, favorites, pageStatus, filter];
}
