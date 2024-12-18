import 'package:equatable/equatable.dart';
import 'package:flutter_application_1/adopt_app/animal_model.dart';
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
      await Future.delayed(const Duration(seconds: 4));
      //throw Exception('Error');  para simular un error y ver el mensaje de error
      emit(state.copyWith(pageStatus: AnimalPageStatus.success));
    } catch (e) {
      emit(state.copyWith(pageStatus: AnimalPageStatus.failure));
    }
  }

  void _onToggleFavorite(ToggleFavorite event, Emitter<AnimalState> emit) {}
  void _onChangeFilter(ChangeFilter event, Emitter<AnimalState> emit) {}
}
