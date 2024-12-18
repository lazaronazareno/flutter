import 'package:flutter/material.dart';

class AdoptFilterWidget extends StatelessWidget {
  const AdoptFilterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double cardWidth = size.width * 0.2;

    return SizedBox(
      height: 130,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          buildCardWidget(cardWidth,
              icon: const Icon(Icons.pets, color: Colors.white), title: "Dog"),
          buildCardWidget(cardWidth,
              icon: const Icon(Icons.pest_control_rodent_outlined,
                  color: Colors.white),
              title: "Cat"),
          buildCardWidget(cardWidth,
              icon: const Icon(Icons.flutter_dash, color: Colors.white),
              title: "Bird"),
          buildCardWidget(cardWidth,
              icon: const Icon(Icons.bug_report_outlined, color: Colors.white),
              title: "Reptile"),
        ],
      ),
    );
  }

  Widget buildCardWidget(double width,
      {required Icon icon, required String title}) {
    return Container(
      width: width,
      height: 100,
      decoration: BoxDecoration(
        color: const Color(0xFF8fd2c1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          const SizedBox(height: 8),
          Text(title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ))
        ],
      ),
    );
  }
}
