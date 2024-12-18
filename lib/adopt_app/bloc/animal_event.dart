part of 'animal_bloc.dart';

sealed class AnimalEvent extends Equatable {
  const AnimalEvent();

  @override
  List<Object> get props => [];
}

class GetAnimals extends AnimalEvent {}

class ToggleFavorite extends AnimalEvent {
  final String animalId;

  const ToggleFavorite(this.animalId);
}

class ChangeFilter extends AnimalEvent {
  final String filter;

  const ChangeFilter(this.filter);
}
