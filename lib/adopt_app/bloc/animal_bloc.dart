import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/adopt_app/animal_model.dart';
import 'package:flutter_application_1/adopt_app/data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'animal_event.dart';
part 'animal_state.dart';

//siempre cambiar el import de BLOC a flutter_bloc
class AnimalBloc extends Bloc<AnimalEvent, AnimalState> {
  AnimalBloc() : super(AnimalState.initial()) {
    on<GetAnimals>(_onGetAnimals);
    on<ToggleFavorite>(_onToggleFavorite);
    on<ChangeFilter>(_onChangeFilter);
  }

  void _onGetAnimals(GetAnimals event, Emitter<AnimalState> emit) async {
    //siempre que se va a un servicio o algo asi es neceseario un loading
    emit(state.copyWith(pageStatus: AnimalPageStatus.loading));

    try {
      await Future.delayed(const Duration(seconds: 1));
      //throw Exception('Error');  para simular un error y ver el mensaje de error

      final animals = animalData.map(
        (data) {
          //en data se usa el nommpre de la propiedad del back, si cambia el nombre solo se tiene cambiar acá dentro de los corchetes.
          return AnimalModel(
            id: data["id"],
            name: data["name"],
            imageUrl: data["imageUrl"],
            age: data["age"],
            breed: data["breed"],
            type: data["type"],
          );
        },
      ).toList();

      final filteredAnimals =
          animals.where((item) => item.type == state.filter).toList();

      emit(state.copyWith(
          animals: animals,
          filteredAnimals: filteredAnimals,
          pageStatus: AnimalPageStatus.success));
    } catch (e) {
      emit(state.copyWith(pageStatus: AnimalPageStatus.failure));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<AnimalState> emit) {
    final animals = state.animals.map(
      (data) {
        if (data.id == event.animalId) {
          //aca el copywith recibe un parametro nombrado entonces tenes que pasarle el isFavorite:, si lo cambias en el modelo por un parametro no nombrado hay que sacarle el isFavorite:
          return data.copyWith(isFavorite: !data.isFavorite);
        }
        return data;
      },
    ).toList();

    final favoriteAnimals =
        animals.where((animal) => animal.isFavorite).toList();

    final filteredAnimals =
        animals.where((item) => item.type == state.filter).toList();

    emit(state.copyWith(
        //arreglo: cuando se filtraban los animales por favorito no se volvian a actualizar animals
        animals: animals,
        filteredAnimals: filteredAnimals,
        favorites: favoriteAnimals));
  }

  void _onChangeFilter(ChangeFilter event, Emitter<AnimalState> emit) {
    final filteredAnimals =
        state.animals.where((item) => item.type == event.filter).toList();
    emit(
        state.copyWith(filter: event.filter, filteredAnimals: filteredAnimals));
  }
}
