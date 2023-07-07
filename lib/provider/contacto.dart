import 'package:flutter/material.dart';

class ContactoFormProvider extends ChangeNotifier {
  String nombre = '';
  String email = '';
  String message = '';
  bool _enableForm = true;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isValiForm() {
    bool v = formKey.currentState?.validate() ?? false;

    return v;
  }

  bool get enableForm => _enableForm;

  set enableForm(bool value) {
    _enableForm = value;
    notifyListeners();
  }

  bool getValidation(String validation, String? value) {
    String pattern = '';
    switch (validation) {
      case "name":
        pattern = r'^(?=.*[a-zA-ZáéíóúÁÉÍÓÚüÜ])[\sa-zA-ZáéíóúÁÉÍÓÚüÜ]+$';
        nombre = value!;

        break;
      case "email":
        pattern =
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
        email = value!;

        break;
      case "message":
        pattern = r'^(?!\s*$).+$';
        message = value!;
        break;
    }

    RegExp regExp = RegExp(pattern);

    return regExp.hasMatch(value!);
  }

  getCamposForm() => [
        {
          "name": "Nombre",
          "validation": "name",
          "message": "Nombre invalido",
          "keyboardType": TextInputType.name
        },
        {
          "name": "Correo",
          "validation": "email",
          "message": "Correo invalido",
          "keyboardType": TextInputType.emailAddress
        },
        {
          "name": "Mensaje",
          "validation": "message",
          "message": "Mensaje vacio",
          "maxline": 10,
          "keyboardType": TextInputType.multiline
        }
      ];
}
