import 'package:flutter/material.dart';

class MyCheckbox extends StatelessWidget {
  final bool checkboxValue;
  final Function(bool?)? onChanged;

  const MyCheckbox(
      {super.key, required this.onChanged, required this.checkboxValue});

  @override
  Widget build(BuildContext context) {
    return Checkbox(value: checkboxValue, onChanged: onChanged);
  }
}
