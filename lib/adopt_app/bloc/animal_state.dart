part of 'animal_bloc.dart';

//estado de la pagina
enum AnimalPageStatus { none, loading, success, failure }

class AnimalState extends Equatable {
  final List<AnimalModel> animals;
  final List<AnimalModel> favorites;
  final AnimalPageStatus pageStatus;
  final String filter;

  const AnimalState({
    required this.animals,
    required this.favorites,
    required this.pageStatus,
    required this.filter,
  });

  factory AnimalState.initial() {
    return AnimalState(
      animals: List.empty(),
      favorites: List.empty(),
      pageStatus: AnimalPageStatus.none,
      filter: 'dog',
    );
  }

  AnimalState copyWith({
    List<AnimalModel>? animals,
    List<AnimalModel>? favorites,
    AnimalPageStatus? pageStatus,
    String? filter,
  }) {
    return AnimalState(
      animals: animals ?? this.animals,
      favorites: favorites ?? this.favorites,
      pageStatus: pageStatus ?? this.pageStatus,
      filter: filter ?? this.filter,
    );
  }

  @override
  List<Object> get props => [animals, favorites, pageStatus, filter];
}
