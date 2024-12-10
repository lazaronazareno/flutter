import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/entradas_de_datos/widgets/my_checkbox.dart';

class InDatos extends StatefulWidget {
  const InDatos({super.key});

  @override
  State<InDatos> createState() => _InDatosState();
}

class _InDatosState extends State<InDatos> {
  bool _checkboxValue = false;
  final int _radioValue = 1;
  bool _switchValue = false;

  final _formKey = GlobalKey<FormState>();

  void handleChange(String type, bool value) {
    setState(() {
      if (type == 'checkbox') {
        _checkboxValue = value;
      } else if (type == 'switch') {
        _switchValue = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Entradas de datos"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "* Nombre",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Campo Obligatorio. Por favor, ingrese un nombre";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              CheckboxListTile(
                value: _checkboxValue,
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
                title: const Text("Acepto los términos y condiciones"),
              ),
              const SizedBox(height: 40),
              /* MyCheckbox(
                onChanged: (bool? value) {
                  setState(() {
                    _checkboxValue = value!;
                  });
                },
                checkboxValue: _checkboxValue,
              ), */
              /* const TextField(
                  decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              )),
              const MyCheckbox(),
              Radio<int>(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  }),
              Radio<int>(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (int? value) {
                    setState(() {
                      _radioValue = value!;
                    });
                  }),
              Switch(
                  value: _switchValue,
                  onChanged: (bool value) {
                    handleChange('switch', value);
                  }), */

              ElevatedButton(
                  onPressed: _checkboxValue
                      ? () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.pop(context);
                          }
                        }
                      : null,
                  child: const Text("Enviar"))
            ],
          ),
        ),
      ),
    );
  }
}
