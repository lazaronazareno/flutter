import 'package:flutter/material.dart';
import 'package:flutter_application_1/adopt_app/bloc/animal_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptListWidget extends StatelessWidget {
  const AdoptListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(top: 32, bottom: 32),
      child: BlocBuilder<AnimalBloc, AnimalState>(
        builder: (context, state) {
          if (state.pageStatus == AnimalPageStatus.loading) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFFfd762c),
              ),
            );
          } else if (state.pageStatus == AnimalPageStatus.failure) {
            return const Center(
              child: Text('Error loading animals'),
            );
          } else if (state.pageStatus == AnimalPageStatus.success) {
            return ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: state.filteredAnimals.length,
              itemBuilder: (BuildContext context, int index) {
                final animal = state.filteredAnimals[index];
                return buildCard(size,
                    animalId: animal.id,
                    name: animal.name,
                    breed: animal.breed,
                    age: animal.age,
                    isFavorite: animal.isFavorite,
                    context: context);
              },
            );
          } else {
            return const Center(
              child: Text("not data"),
            );
          }
        },
      ),
    ));
  }

  Widget buildCard(
    Size size, {
    required String animalId,
    required String name,
    required String breed,
    required int age,
    required bool isFavorite,
    required BuildContext context,
  }) {
    return Container(
      color: Colors.white,
      width: 200,
      height: size.height * 0.3,
      padding: const EdgeInsets.only(top: 16, bottom: 16),
      margin: const EdgeInsets.only(right: 8, left: 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 80,
            backgroundColor: Color(0xFF8fd2c1),
          ),
          Text(name,
              style: const TextStyle(
                color: Color(0xFF463521),
                fontWeight: FontWeight.w700,
                fontSize: 24,
              )),
          Text(breed,
              style: const TextStyle(
                color: Color(0xFF463521),
                fontWeight: FontWeight.w700,
                fontSize: 16,
              )),
          Text('$age years',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.w700,
                fontSize: 12,
              )),
          IconButton(
              onPressed: () {
                context.read<AnimalBloc>().add(ToggleFavorite(animalId));
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_border,
                size: 36,
                color: isFavorite ? Colors.red : Colors.black,
              ))
        ],
      ),
    );
  }
}
