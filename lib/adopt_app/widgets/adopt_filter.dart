import 'package:flutter/material.dart';
import 'package:flutter_application_1/adopt_app/bloc/animal_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdoptFilterWidget extends StatelessWidget {
  const AdoptFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width * 0.2;

    return SizedBox(
      height: 130,
      child: BlocBuilder<AnimalBloc, AnimalState>(
        builder: (context, state) {
          bool isSelectedDog = state.filter == "dog";
          bool isSelectedCat = state.filter == "cat";
          bool isSelectedBird = state.filter == "bird";
          bool isSelectedReptile = state.filter == "reptile";
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCardWidget(context, cardWidth,
                  icon: Icon(Icons.pets,
                      color: isSelectedDog
                          ? Colors.white
                          : const Color(0xFF8fd2c1)),
                  title: "Dog",
                  isSelected: isSelectedDog),
              buildCardWidget(context, cardWidth,
                  icon: Icon(Icons.pest_control_rodent_outlined,
                      color: isSelectedCat
                          ? Colors.white
                          : const Color(0xFF8fd2c1)),
                  title: "Cat",
                  isSelected: isSelectedCat),
              buildCardWidget(context, cardWidth,
                  icon: Icon(Icons.flutter_dash,
                      color: isSelectedBird
                          ? Colors.white
                          : const Color(0xFF8fd2c1)),
                  title: "Bird",
                  isSelected: isSelectedBird),
              buildCardWidget(context, cardWidth,
                  icon: Icon(Icons.bug_report_outlined,
                      color: isSelectedReptile
                          ? Colors.white
                          : const Color(0xFF8fd2c1)),
                  title: "Reptile",
                  isSelected: isSelectedReptile),
            ],
          );
        },
      ),
    );
  }

  Widget buildCardWidget(BuildContext context, double width,
      {required Icon icon, required String title, bool isSelected = false}) {
    return GestureDetector(
      onTap: () {
        if (!isSelected) {
          context.read<AnimalBloc>().add(ChangeFilter(title.toLowerCase()));
        }
      },
      child: Container(
        width: width,
        height: 100,
        decoration: BoxDecoration(
          color: isSelected ? const Color(0xFF8fd2c1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(height: 8),
            Text(title,
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF8fd2c1),
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ))
          ],
        ),
      ),
    );
  }
}
